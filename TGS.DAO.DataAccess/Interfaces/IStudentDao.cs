using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess.Interfaces
{
    public interface IStudentDao
    {
        List<Student> ReadAll();
        Student ReadById(int id);
        Student DeleteById(int id);
    }
}
