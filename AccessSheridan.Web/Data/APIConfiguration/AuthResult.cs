using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccessSheridan.Data.APIConfiguration
{
    public class AuthResult
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public List<string> Roles { get; set; }
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public bool Success { get; set; }
        public List<string> Errors { get; set; }
    }
}
