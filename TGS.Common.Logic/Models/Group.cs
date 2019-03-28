using System;
using System.Collections.Generic;
using System.Text;

namespace TGS.Common.Logic.Models
{
    public class Group
    {
        public int Id { get; set; }
        public string GroupName { get; set; }
        public int StartYear { get; set; }
        public int EndYear { get; set; }
        public string Description { get; set; }
        public string UrlWiki { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
    }
}
