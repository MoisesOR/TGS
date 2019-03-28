using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TGS.Business.Logic;
using TGS.Common.Logic.Models;

namespace TGS.Business.Facade.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GroupController : ControllerBase
    {
        public GroupBl groupBl = new GroupBl();

        // GET: api/group
        [HttpGet]
        public List<Group> GetAllAlbums()
        {
            return groupBl.Read();
        }
        
        // GET: api/group/5
        [HttpGet("{id}")]
        public Group GetGroup(int id)
        {
            return groupBl.ReadById(id);
        }

        // GET: api/group/1/
        [Route("req/{startid}")]
        [HttpGet]
        public List<Group> Getgroups(int startid)
        {
            return groupBl.GetGroups(startid);
        }
        
        // POST: api/group
        [HttpPost]
        public string PostMoreGroups([FromBody] List<Group> groups)
        {
            int groupsCreated = groupBl.Create(groups);
            if (groupsCreated != 0)
            {
                return groupsCreated + " Object created!";
            }
            return "No object created";
        }

        // DELETE: api/group/5
        [HttpDelete("{id}")]
        public string DeleteGroupItem(int id)
        {
            int groupExist = groupBl.DeleteById(id);
            if (groupExist != 0)
            {
                return "Object deleted!";
            }
            return "Object not found.";
        }

        // UPDATE: api/group/update/5
        [Route("update/{startid}")]
        [HttpPost]
        public string UpdateGroup([FromBody]Group group, int startid)
        {
            int groupUpdated = groupBl.UpdateGroup(group, startid);
            if (groupUpdated != 0)
            {
                return "Object update!";
            }
            return "Object not found.";
        }
    }
}