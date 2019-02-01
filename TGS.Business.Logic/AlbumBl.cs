using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TGS.Common.Logic.Models;
using TGS.DAO.DataAccess;

namespace TGS.Business.Logic
{
    public class AlbumBl : IAlbumBl
    {
        private DataBaseDao databaseDao = new DataBaseDao();

        public int Create(List<Album> album)
        {
            try
            {
                return this.databaseDao.AddMore(album);
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
                return this.databaseDao.DeleteById(id);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public List<Album> GetAlbums(int startid)
        {
            var albums = Read();
            List<Album> albumsreq =
                (from album in albums
                select album).Skip(startid).Take(20).ToList();

            return albumsreq;
        }

        public List<Album> Read()
        {
            try
            {
                return this.databaseDao.ReadAll();
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public Album ReadById(int id)
        {
            try
            {
                return this.databaseDao.ReadById(id);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public int UpdateAlbum(Album album, int id)
        {
            try
            {
                return this.databaseDao.UpdateAlbum(album, id);
            }
            catch (Exception e)
            {
                throw;
            }
        }
    }
}
