using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess.Interfaces
{
    public interface IUpdate
    {
        Student UpdateName(string name, string guid);
    }
}
