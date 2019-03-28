using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TGS.Common.Logic.Models;
using TGS.DAO.DataAccess;

namespace TGS.Business.Logic
{
    public class GroupBl
    {
        private GroupDao groupDao = new GroupDao();

        public int Create(List<Group> groups)
        {
            try
            {
                foreach (var group in groups)
                {
                    if (group.EndYear == 0) { group.EndYear =  DateTime.Now.Year; }
                    if (group.Description == null) { group.Description = ""; }
                    if (group.City == null) { group.City = ""; }
                    if (group.UrlWiki == null) { group.UrlWiki = ""; }
                }

                return this.groupDao.AddMore(groups);
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
                return this.groupDao.DeleteById(id);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public List<Group> GetGroups(int startid)
        {
            var groups = Read();
            List<Group> groupsreq =
                (from groups1 in groups
                 select groups1).Skip(startid).Take(20).ToList();

            return groupsreq;
        }

        public List<Group> Read()
        {
            try
            {
                return groupDao.ReadAll();
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public Group ReadById(int id)
        {
            try
            {
                return this.groupDao.ReadById(id);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public int UpdateGroup(Group group, int id)
        {
            try
            {
                if (group.EndYear == null || group.EndYear == 0) { group.EndYear = DateTime.Now.Year; }
                if (group.Description == null) { group.Description = ""; }
                if (group.City == null) { group.City = ""; }
                if (group.UrlWiki == null) { group.UrlWiki = ""; }
                return this.groupDao.UpdateGroup(group, id);
            }
            catch (Exception e)
            {
                throw;
            }
        }
    }
}
