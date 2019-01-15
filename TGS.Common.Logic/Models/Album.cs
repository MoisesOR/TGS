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

        //public List<string> GetGenre()
        //{
        //    return Genre;
        //}

        //public void SetGenre(string value)
        //{
        //    var genres = value.Split(",");
        //    foreach (var item in genres)
        //    {
        //        item.Trim();
        //    }
        //    Genre = new List<string>(genres);
        //}

        //public List<string> GetSubgenre()
        //{
        //    return Subgenre;
        //}

        //public void SetSubgenre(string value)
        //{
        //    var subgens = value.Split(",");
        //    foreach (var item in subgens)
        //    {
        //        item.Trim();
        //    }
        //    Subgenre = new List<string>(subgens);          
        //}
    }
}
