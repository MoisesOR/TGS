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
    public class UserController : ControllerBase
    {
        public UserBl userBl = new UserBl();

        // GET: api/user/Antonio
        [HttpGet("{userName}")]
        public bool GetUser(string userName)
        {
            return userBl.ReadByUserName(userName);
        }

        // POST: api/user/login
        [HttpPost]
        [Route("login")]
        public bool GetUser([FromBody] User user)
        {
            return userBl.ReadByUser(user);
        }

        // POST: api/user
        [HttpPost]
        public string PostMoreAlbums([FromBody] User user)
        {
            int usersCreated = userBl.AddUser(user);
            if (usersCreated != 0)
            {
                return usersCreated + " Object created!";
            }
            return "No object created";
        }
    }
}