using System;
using System.Collections.Generic;
using System.Text;

namespace TGS.Common.Logic.Models
{
    public class Album
    {
        public int Id { get; set; }
        public int Year { get; set; }
        public string Name { get; set; }
        public string Artist { get; set; }
        public string Genre { get; set; }
        public string Subgenre { get; set; }
    }
}
