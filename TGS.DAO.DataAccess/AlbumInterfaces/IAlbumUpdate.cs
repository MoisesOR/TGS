﻿using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess.Interfaces2
{
    public interface IAlbumUpdate
    {
        int UpdateAlbum(Album Album, int id);
    }
}
