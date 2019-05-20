using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TGS.Common.Logic.Configuration;
using TGS.Common.Logic.Models;
using TGS.DAO.DataAccess.Interfaces2;

namespace TGS.DAO.DataAccess
{
    public class AlbumDao : IAlbumRead, IAlbumCreate, IAlbumDelete, IAlbumUpdate
    {
        private string Conexion { get; set; }

        public AlbumDao()
        {
            this.Conexion = Configurations.ReadDataBaseConnection();
        }

        public List<Album> ReadAll()
        {
            List<Album> albums = new List<Album>();
            using (
                SqlConnection connection = new SqlConnection(this.Conexion))
            {
                connection.Open();
                //select * from dbo.AlbumList order by Id desc
                using (SqlCommand myCommand = new SqlCommand("select * from dbo.AlbumList", connection))
                {
                    SqlDataReader myReader = myCommand.ExecuteReader();
                    while (myReader.Read())
                    {
                        Album album = new Album();
                        album.Id = Convert.ToInt32(myReader["Id"]);
                        album.Year = Convert.ToInt32(myReader["Year"]);
                        album.Name = myReader["Album"].ToString();
                        album.Artist = myReader["Artist"].ToString();
                        album.Genre = myReader["Genre"].ToString();
                        album.Subgenre = myReader["Subgenre"].ToString();

                        albums.Add(album);
                    }
                }
            }
            return albums;
        } 

        public Album ReadById(int id)
        {
            Album album = new Album();
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = "select * from dbo.AlbumList a where a.Id=@Id";
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();
                    SqlDataReader myReader = command.ExecuteReader();
                    while (myReader.Read())
                    {
                        album.Id = Convert.ToInt32(myReader["Id"]);
                        album.Name = myReader["Album"].ToString();
                        album.Year = Convert.ToInt32(myReader["Year"]);
                        album.Artist = myReader["Artist"].ToString();
                        album.Genre = myReader["Genre"].ToString();
                        album.Subgenre = myReader["Subgenre"].ToString();
                    }
                }
            }
            return album;
        }
        public int AddMore(List<Album> album)
        {
            int rowsAffected = 0;
            for (int i = 0; i < album.Count; i++)
            {
                using (SqlConnection connection = new SqlConnection(this.Conexion))
                {
                    using (SqlCommand command = new SqlCommand())
                    {
                        command.Connection = connection;
                        command.CommandType = CommandType.Text;
                        command.CommandText = @"INSERT into dbo.AlbumList (Year, Album, Artist, Genre, Subgenre)
                                            VALUES (@Year, @Album, @Artist, @Genre, @Subgenre)";
                        command.Parameters.AddWithValue("@Year", album[i].Year);
                        command.Parameters.AddWithValue("@Album", album[i].Name);
                        command.Parameters.AddWithValue("@Artist", album[i].Artist);
                        command.Parameters.AddWithValue("@Genre", album[i].Genre);
                        command.Parameters.AddWithValue("@Subgenre", album[i].Subgenre);

                        connection.Open();
                        int recordsAffected = command.ExecuteNonQuery();
                        rowsAffected = recordsAffected + rowsAffected;
                    }
                }
            }
            return rowsAffected;
        }

        public int DeleteById(int id)
        {
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = @"DELETE from dbo.Albumlist 
                                            WHERE Id = @Id";
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();
                    int recordsAffected = command.ExecuteNonQuery();
                    return recordsAffected;
                }
            }
        }

        public int UpdateAlbum(Album album, int id)
        {
            Album albumUpdated = new Album();
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = @"update dbo.AlbumList
                                            set Year=@Year,
                                            Album=@Album,
                                            Artist=@Artist,
                                            Genre=@Genre,
                                            Subgenre=@Subgenre
                                            where Id=@Id";
                    command.Parameters.AddWithValue("@Year", album.Year);
                    command.Parameters.AddWithValue("@Album", album.Name);
                    command.Parameters.AddWithValue("@Artist", album.Artist);
                    command.Parameters.AddWithValue("@Genre", album.Genre);
                    command.Parameters.AddWithValue("@Subgenre", album.Subgenre);
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();
                    int recordsAffected = command.ExecuteNonQuery();
                    return recordsAffected;
                }
            }
        }
        
    }
}
