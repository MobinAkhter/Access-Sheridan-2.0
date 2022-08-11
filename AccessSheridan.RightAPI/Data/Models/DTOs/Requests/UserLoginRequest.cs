using System;
using System.Collections.Generic;
using System.Text;

namespace AccessSheridan.Data.Models.User
{
    public class UserLoginRequest
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
