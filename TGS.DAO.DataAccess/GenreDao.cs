using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using TGS.Common.Logic.Configuration;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess
{
    public class GenreDao
    {
        private string Conexion { get; set; }

        public GenreDao()
        {
            this.Conexion = Configurations.ReadDataBaseConnection();
        }

        public List<Genre> ReadAll()
        {
            List<Genre> albums = new List<Genre>();
            using (
                SqlConnection connection = new SqlConnection(this.Conexion))
            {
                connection.Open();
                using (SqlCommand myCommand = new SqlCommand("select * from dbo.GenreList", connection))
                {
                    SqlDataReader myReader = myCommand.ExecuteReader();
                    while (myReader.Read())
                    {
                        Genre genre = new Genre();
                        genre.Id = Convert.ToInt32(myReader["Id"]);
                        genre.Name = myReader["Genre"].ToString();

                        albums.Add(genre);
                    }
                }
            }
            return albums;
        }

        public int AddMore(List<Genre> genre)
        {
            int rowsAffected = 0;
            for (int i = 0; i < genre.Count; i++)
            {
                using (SqlConnection connection = new SqlConnection(this.Conexion))
                {
                    using (SqlCommand command = new SqlCommand())
                    {
                        command.Connection = connection;
                        command.CommandType = CommandType.Text;
                        command.CommandText = @"INSERT into dbo.GenreList (Genre)
                                            VALUES (@Name)";
                        command.Parameters.AddWithValue("@Album", genre[i].Name);

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
            Genre albumInsertado = new Genre();
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = @"DELETE from dbo.GenreList 
                                            WHERE Id = @Id";
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();
                    int recordsAffected = command.ExecuteNonQuery();
                    return recordsAffected;
                }
            }
        }

        public int UpdateGenre(Genre genre, int id)
        {
            Genre genreUpdated = new Genre();
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = @"update dbo.GenreList
                                            set Genre = @Name
                                            where Id=@Id";
                    command.Parameters.AddWithValue("@Album", genre.Name);
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();
                    int recordsAffected = command.ExecuteNonQuery();
                    return recordsAffected;
                }
            }
        }
    }
}
