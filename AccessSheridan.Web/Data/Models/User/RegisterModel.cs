using AccessSheridan.Data.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace AccessSheridan.Web.Data.Models.User
{
    public class RegisterModel
    {
        [Required]
        public int ProgramsId { get; set; }

        public IList<Programs> Programs { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public string Mobile { get; set; }

        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
    }
}
