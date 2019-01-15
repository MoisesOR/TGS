using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using TGS.Business.Logic;
using TGS.Common.Logic.Models;

namespace TGS.Business.Facade.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AlbumController : ControllerBase
    {
        public AlbumBl albumBl = new AlbumBl();

        // GET: api/album
        [HttpGet]
        public List<Album> GetAllAlbums()
        {
            return albumBl.Read();
        }

        // GET: api/album/5
        [HttpGet("{id}")]
        public Album GetStudent(int id)
        {
            return albumBl.ReadById(id);
        }

        // POST: api/album
        [HttpPost]
        public string PostMoreAlbums([FromBody] List<Album> albums)
        {
            albumBl.Create(albums);
            return "OK";
        }

        // DELETE: api/album/5
        [HttpDelete("{id}")]
        public string DeleteTodoItem(int id)
        {
            Album albumExist = albumBl.ReadById(id);
            if (albumExist.Name != null || albumExist.Genre != null)
            {
                albumBl.DeleteById(id);
                return "Object deleted!";
            }
            return "Object not found.";
        }
    }
}