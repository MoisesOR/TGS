using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;
using TGS.DAO.DataAccess;

namespace TGS.Business.Logic
{
    public class AlbumBl : IAlbumBl
    {
        private DataBaseDao databaseDao = new DataBaseDao();

        public List<Album> Create(List<Album> album)
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
    }
}
