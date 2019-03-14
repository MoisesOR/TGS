using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using TGS.Business.Logic;
using TGS.Common.Logic.Models;

namespace TGS.Business.Facade.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GenreController : ControllerBase
    {
        public GenreBl genreBl = new GenreBl();

        // GET: api/genre
        [HttpGet]
        public List<Genre> GetAllAlbums()
        {
            return genreBl.Read();
        }

        // GET: req/genre/1/
        [Route("req/{startid}")]
        [HttpGet]
        public List<Genre> GetGenres(int startid)
        {
            return genreBl.GetGenres(startid);
        }

        // POST: api/genre
        [HttpPost]
        public string PostGenre([FromBody] List<Genre> genre)
        {
            int genresCreated = genreBl.Create(genre);
            if (genresCreated != 0)
            {
                return genresCreated + " Object created!";
            }
            return "No object created";
        }

        // DELETE: api/genre/5
        [HttpDelete("{id}")]
        public string DeleteGenreItem(int id)
        {
            int genreExist = genreBl.DeleteById(id);
            if (genreExist != 0)
            {
                return "Object deleted!";
            }
            return "Object not found.";
        }
    }
}