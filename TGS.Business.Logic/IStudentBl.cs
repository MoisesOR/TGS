using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;

namespace TGS.Business.Logic
{
    public interface IStudentBl
    {
        List<Student> Read();
        Student ReadById(int id);
        int DeleteById(int id);
        Student Create(Student student);
    }
}
