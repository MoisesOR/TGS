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
        private AlbumDao albumDao = new AlbumDao();

        public int Create(List<Album> album)
        {
            try
            {
                return this.albumDao.AddMore(album);
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
                return this.albumDao.DeleteById(id);
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
                return this.albumDao.ReadAll();
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
                return this.albumDao.ReadById(id);
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
                return this.albumDao.UpdateAlbum(album, id);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public bool CheckAlbumName(string album)
        {
            bool exist = false;
            Console.WriteLine("Album Name: {0}, en la base de datos: {1}", album, albumDao.ReadAlbumByName(album));
            if (albumDao.ReadAlbumByName(album).Name == album)
            {
                exist = true;
            }
            return exist;
        }

        public int GetAlbumId(string album)
        {
            return albumDao.ReadAlbumByName(album).Id;
        }
    }
}
