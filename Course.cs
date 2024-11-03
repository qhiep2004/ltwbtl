using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    public class Course
    {
        public int CourseID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Duration { get; set; }
        public int LecturesCount { get; set; }
        public double Rating { get; set; }
        public string Level { get; set; }
        public string Category { get; set; }
        public string ImageURL { get; set; }
    }

}