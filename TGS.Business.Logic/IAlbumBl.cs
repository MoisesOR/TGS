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
        int Create(List<Album> album);
        int UpdateAlbum(Album album, int id);
        List<Album> GetAlbums(int startid);
    }
}
