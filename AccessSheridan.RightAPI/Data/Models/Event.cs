using AccessSheridan.Data.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace AccessSheridan.Data.Models
{
    public class Event
    {
        public int EventID { get; set; }
        public string Subject { get; set; }
        public string Description { get; set; }
        public System.DateTime Start { get; set; }
        public Nullable<System.DateTime> End { get; set; }
        public string ThemeColor { get; set; }
        public bool IsFullDay { get; set; }

        [ForeignKey("UserId")]
        public string UserId { get; set; }
        public virtual ApplicationUser User { get; set; }

        public int? ProgramsId { get; set; }
        public virtual Programs Program { get; set; }

        public int? CoursesId { get; set; }
        public virtual Courses Course { get; set; }

    }
}
