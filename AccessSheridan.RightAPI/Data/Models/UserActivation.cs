using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace AccessSheridan.Data.Models
{

    [Table("CustomerActivation")]
    public class UserActivation
    {

        [Key]
        public string UserID { get; set; }
        public Guid Activation { get; set; }

    }
}
