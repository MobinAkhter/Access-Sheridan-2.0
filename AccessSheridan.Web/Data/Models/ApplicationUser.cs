using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace AccessSheridan.Models
{

    public class ApplicationUser : IdentityUser
    {
        public ApplicationUser() : base() {
           
        }

        //public int Id { get; set; }
        public string FirstNames { get; set; }
        public string LastName { get; set; }
        //public string UserName { get; set; }
        //public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        public DateTime DateofBirth { get; set; }
        public string Mobile { get; set; }
        //public string Email { get; set; }

        public ICollection<ApplicationUserRole> UserRoles { get; set; }
    }
    
}
