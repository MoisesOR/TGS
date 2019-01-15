using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess.Interfaces
{
    public interface ICreate
    {
        Student Add(Student student);
    }
}
