using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess.Interfaces
{
    public interface IRead
    {
        List<Album> ReadAll();
        Album ReadById(int id);
    }
}
