using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TGS.Business.Logic;
using TGS.Common.Logic.Models;

namespace TGS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : Controller
    {
        public StudentBl studentBl = new StudentBl();

        // GET: api/student
        [HttpGet]
        public List<Student> GetAllStudents()
        {
            return studentBl.Read();
        }

        // GET: api/student/5
        [HttpGet("{id}")]
        public Student GetStudent(int id)
        {
            return studentBl.ReadById(id);
        }

        // POST: api/student
        [HttpPost]
        public string PostMoreStudent([FromBody] List<Student> students)
        {
            studentBl.CreateMore(students);
            return "OK";
        }

        // DELETE: api/Todo/5
        [HttpDelete("{id}")]
        public string DeleteTodoItem(int id)
        {
            studentBl.DeleteById(id);
            return "Object deleted!";
        }
    }
}
