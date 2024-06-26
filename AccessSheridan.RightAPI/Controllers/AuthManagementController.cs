﻿using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Collections.Generic;

using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

//using Microsoft.IdentityModel.Tokens;
using AccessSheridan.Data.Models;
using AccessSheridan.Data.Models.DTOs.Responses;
using AccessSheridan.Data.Models.User;
using AccessSheridan.Data.Services.Infrastructure;
using AccessSheridan.Data.APIConfiguration;

using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using AccessSheridan.Data.Models.DTOs.Tokens;
using AccessSheridan.RightAPI.Data.Models.DTOs.Tokens;
using AccessSheridan.Data.Models.DTOs.Requests;
using AccessSheridan.RightAPI.Data.Models.User;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Authorization;
using AccessSheridan.RightAPI.FiltersData;

namespace AccessSheridan.RightAPI.Controllers
{
    
    [Route("api/[controller]")] //  api/authmanagement
    [ApiController]
    public class AuthManagementController : ControllerBase
    {

        private readonly IRefreshToken _refreshToken;
        private readonly UserManager<ApplicationUser> _userManager;
        //private IHostingEnvironment _environment;
        private readonly JwtConfig _jwtConfig;

        private readonly TokenValidationParameters _tokenValidationParams;
        public object SecurityAlgorithms { get;  set; }

        public AuthManagementController( UserManager<ApplicationUser> user,
            IOptionsMonitor<JwtConfig> optionsMonitor,TokenValidationParameters tokenValidationParameters, IRefreshToken refreshToken)
        {
            //_environment = environment;
            _userManager = user;
            _jwtConfig = optionsMonitor.CurrentValue;
            _tokenValidationParams = tokenValidationParameters;
            _refreshToken = refreshToken;
        }

        [Authorize]
        [HttpGet("GetGames")]
        public ActionResult<IEnumerable<string>> GetGames()
        {
            return new string[] {"value1", "value2", "value3", "value4", "value5", "value6" };
            //return Ok(_gameResipory.GetAll().ToList());
        }

        [HttpPost]
        [Route("Register")]
        //[EnableCors("AllowOrigin")]
        public async Task<IActionResult> Register([FromBody] UserRegistrationDTO user)
        {
            if (ModelState.IsValid)
            {
                // We can utilise the model
                var existingUser = await _userManager.FindByEmailAsync(user.Email);

                if (existingUser != null)
                {
                    return BadRequest(new RegistrationResponse()
                    {
                        Errors = new List<string>() {
                                "Email already is taken"
                            },
                        Success = false
                    });
                }
                var newUser = new ApplicationUser()
                {
                    Email = user.Email,
                    UserName = user.Username,
                    FirstNames = user.FirstName,
                    LastName = user.LastName,
                    Mobile = user.Mobile,
                    ProgramsId = 1
                };

                var isCreated = await _userManager.CreateAsync(newUser, user.Password);
                if (isCreated.Succeeded)
                {
                    var jwtToken = await GenerateJwtToken(newUser);

                    return Ok(jwtToken);
                }
                else
                {
                    return BadRequest(new RegistrationResponse()
                    {
                        Errors = isCreated.Errors.Select(x => x.Description).ToList(),
                        Success = false
                    });
                }
            }

            return BadRequest(new RegistrationResponse()
            {
                Errors = new List<string>() {
                        "Invalid payload"
                    },
                Success = false
            });
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] UserLoginRequest user)
        {
            if (ModelState.IsValid)
            {
                var existingUser = await _userManager.FindByEmailAsync(user.Email);

                if (existingUser == null)
                {
                    return BadRequest(new RegistrationResponse()
                    {
                        Errors = new List<string>() {
                                "Invalid login request"
                            },
                        Success = false
                    });
                }

                var isCorrect = await _userManager.CheckPasswordAsync(existingUser, user.Password);

                if (!isCorrect)
                {
                    return BadRequest(new RegistrationResponse()
                    {
                        Errors = new List<string>() {
                                "Invalid login request"
                            },
                        Success = false
                    });
                }
                

                var jwtToken = await GenerateJwtToken(existingUser);

                return Ok(jwtToken);
            }

            return BadRequest(new RegistrationResponse()
            {
                Errors = new List<string>() {
                        "Invalid payload"
                    },
                Success = false
            });
        }

        // POST api/Account/ChangePassword
        [Route("ChangePassword")]
        public async Task<IActionResult> ChangePassword(PasswordChangeRequest model)
        {
            var existingUser = await _userManager.FindByEmailAsync(model.Email);

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _userManager.ChangePasswordAsync(existingUser, model.CurrentPassword,
                model.NewPassword);

            if (!result.Succeeded)
            {
                return BadRequest(new RegistrationResponse()
                {
                    Errors = new List<string>() {
                                result.Errors.ToString()
                            },
                    Success = false
                }); ;
            }
            return Ok();
        }

        // POST api/Account/Logout
        [Route("Logout")]
        public async Task<IActionResult> Logout()
        {
            //await _userManager.SignOutAsync();
            return Ok();
        }

        private async Task<AuthResult> GenerateJwtToken(ApplicationUser user)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();

            var key = Encoding.ASCII.GetBytes(_jwtConfig.Secret);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim("Id", user.Id),
                    new Claim(JwtRegisteredClaimNames.Email, user.Email),
                    new Claim(JwtRegisteredClaimNames.Sub, user.Email),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
                }),
                Expires = DateTime.UtcNow.AddMinutes(10),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), 
                Microsoft.IdentityModel.Tokens.SecurityAlgorithms.HmacSha256
                //SecurityAlgorithms.HmacSha256Signature
                )
            };

            var token = jwtTokenHandler.CreateToken(tokenDescriptor);
            var jwtToken = jwtTokenHandler.WriteToken(token);

            var refreshToken = new RefreshToken()
            { 
                JwtID = token.Id,IsRevoked =false, IsUsed = false, UserID = user.Id, 
                AddedDate = DateTime.UtcNow, ExpiryDate = DateTime.UtcNow.AddMonths(6),
                Token = RandomString(35) + Guid.NewGuid()

            };
            _refreshToken.Insert(refreshToken);
            _refreshToken.Save();
            if (user.UserRoles == null)
            {
                user.UserRoles = new List<ApplicationUserRole>();
            }
            return new AuthResult() {
                Token = jwtToken, Success = true, RefreshToken = refreshToken.Token,
                UserName = user.UserName,
                Roles = user.UserRoles.Select(x => x.Role.Name).ToList(),
                UserId = user.Id
            };
        }

        [HttpPost]
        [Route("RefreshToken")]
        public async Task<ActionResult> RefreshToken([FromBody] TokenRequest tokenRequest)
        {
            if(ModelState.IsValid)
            {
                var result = await  VerifyAndGenerateToken(tokenRequest);

                if (result == null)
                {
                    return BadRequest(new RegistrationResponse()
                    {
                        Errors = new List<string>()
                        {
                            "Invalid token"
                        },
                        Success = false
                    });
                }

                return Ok(result);
            }
            return BadRequest(new RegistrationResponse()
            {
                Errors = new List<string>()
                {
                    "Invalid payload"
                },
                Success = false
            });
        }

        private async Task<AuthResult> VerifyAndGenerateToken(TokenRequest tokenRequest)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
            try
            {
                //VALIDATION 1
                var tokenInverification = jwtTokenHandler.ValidateToken(tokenRequest.Token, _tokenValidationParams, out var validatedToken);

                //VALIDATION 2
                if (validatedToken is JwtSecurityToken jwtSecurityToken)
                {
                    var result = jwtSecurityToken.Header.Alg.Equals(Microsoft.IdentityModel.Tokens.SecurityAlgorithms.HmacSha256, StringComparison.InvariantCulture);
                    if (result == false)
                    {
                        return null;
                    }
                }

                //VALIDATION 3
                var utcExpiryDate = long.Parse(tokenInverification.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Exp).Value);
                var expiryDate = unixTimeStampToDateTime(utcExpiryDate);
                if (expiryDate > DateTime.UtcNow)
                {
                    return new AuthResult()
                    {
                        Success=false,
                        Errors= new List<string>()
                        {
                            "Token not yet expired"
                        }
                    };
                }

                //VALIDATION 4
                var getRefreshToken =  _refreshToken.GetAll();
                var storedToken = getRefreshToken.FirstOrDefault(x => x.Token == tokenRequest.RequestToken);
                if (storedToken == null)
                {
                    return new AuthResult()
                    {
                        Success = false,
                        Errors = new List<string>()
                        {
                            "Token not exist"
                        }
                    };
                }

                //VALIDATION 5
                if (storedToken.IsUsed)
                {
                    return new AuthResult()
                    {
                        Success = false,
                        Errors = new List<string>()
                        {
                            "Token has been used"
                        }
                    };
                }

                //VALIDATION 6
                if (storedToken.IsRevoked)
                {
                    return new AuthResult()
                    {
                        Success = false,
                        Errors = new List<string>()
                        {
                            "Token has been revoked"
                        }
                    };
                }

                //VALIDATION 7
                var jti = tokenInverification.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Jti).Value;
                if (storedToken.JwtID != jti)
                {
                    return new AuthResult()
                    {
                        Success = false,
                        Errors = new List<string>()
                        {
                            "Token doesn't match"
                        }
                    };
                }

                //UPDATE CURRENT TOKEN

                storedToken.IsUsed = true;
                _refreshToken.Update(storedToken);
                _refreshToken.Save();

                var dbUser = await _userManager.FindByIdAsync(storedToken.UserID);
                return await GenerateJwtToken(dbUser);
            }
            catch (Exception ex)
            {

                return null;
            }
        }

        private DateTime unixTimeStampToDateTime(long unixTimeStamp)
        {
            var dateTimeVal = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            //
            dateTimeVal = dateTimeVal.AddSeconds(unixTimeStamp).ToLocalTime();
            return dateTimeVal;
        }

        private string RandomString(int lenght)
        {
            var random = new Random();
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var res = new string(Enumerable.Repeat(chars, lenght)
                .Select(x => x[random.Next(x.Length)]).ToArray());
            return res;

        }
    }
}
