using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using TGS.Business.Logic;
using TGS.Common.Logic.Models;
using System.Linq;

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
        public Album GetAlbum(int id)
        {
            return albumBl.ReadById(id);
        }

        // GET: api/album/1/
        [Route("req/{startid}")]
        [HttpGet]
        public List<Album> GetAlbums(int startid)
        {
            return albumBl.GetAlbums(startid);
        }

        // POST: api/album
        [HttpPost]
        public string PostMoreAlbums([FromBody] List<Album> albums)
        {
            int albumsCreated = albumBl.Create(albums);
            if (albumsCreated != 0)
            {
                return albumsCreated + " Object created!";
            }
            return "No object created";
        }

        // DELETE: api/album/5
        [HttpDelete("{id}")]
        public string DeleteAlbumItem(int id)
        {
            int albumExist = albumBl.DeleteById(id);
            if (albumExist != 0)
            {
                return "Object deleted!";
            }
            return "Object not found.";
        }

        // UPDATE: api/album/5
        [HttpPost("{id}")]
        public string UpdateAlbum([FromBody]Album album, int id)
        {
            int albumUpdated = albumBl.UpdateAlbum(album, id);
            if (albumUpdated != 0)
            {
                return "Object update!";
            }
            return "Object not found.";
        }
    }
}