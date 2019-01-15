using System;
using System.Collections.Generic;
using System.Text;
using TGS.Common.Logic.Models;

namespace TGS.Business.Logic
{
    public interface IAlbumBl
    {
        List<Album> Read();
        Album ReadById(int id);
        int DeleteById(int id);
        List<Album> Create(List<Album> album);
    }
}
