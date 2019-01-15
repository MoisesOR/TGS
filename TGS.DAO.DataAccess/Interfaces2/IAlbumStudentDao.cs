using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess.Interfaces2
{
    public interface IAlbumStudentDao
    {
        List<Album> ReadAll();
        Album ReadById(int id);
        Album DeleteById(int id);
    }
}
