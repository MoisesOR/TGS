using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TGS.Common.Logic.Models;
using TGS.DAO.DataAccess;

namespace TGS.Business.Logic
{
    public class GenreBl
    {
        private GenreDao genreDao = new GenreDao();

        public int Create(List<Genre> genre)
        {
            try
            {
                return this.genreDao.AddMore(genre);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public int DeleteById(int id)
        {
            try
            {
                return this.genreDao.DeleteById(id);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public List<Genre> GetGenres(int startid)
        {
            var genres = this.Read();
            List<Genre> genresreq =
                (from genre in genres
                 select genre).Skip(startid).Take(20).ToList();

            return genresreq;
        }

        public List<Genre> Read()
        {
            try
            {
                return this.genreDao.ReadAll();
            }
            catch (Exception e)
            {
                throw;
            }
        }
    }
}
