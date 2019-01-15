using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TGS.Common.Logic.Configuration;
using TGS.Common.Logic.Models;
using TGS.DAO.DataAccess.Interfaces2;

namespace TGS.DAO.DataAccess
{
    public class DataBaseDao : IAlbumRead, IAlbumCreate
    {
        private string Conexion { get; set; }

        public DataBaseDao()
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
        public List<Album> AddMore(List<Album> album)
        {
            List<Album> albumAdded = new List<Album>();

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
                    }
                }
            }
            return albumAdded;
        }

        public int DeleteById(int id)
        {
            Album albumInsertado = new Album();
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

        //public List<Student> AddMore(List<Student> student)
        //{
        //    List<Student> studentAdded = new List<Student>();

        //    for (int i = 0; i < student.Count; i++)
        //    {
        //        using (SqlConnection connection = new SqlConnection(this.Conexion))
        //        {
        //            using (SqlCommand command = new SqlCommand())
        //            {
        //                command.Connection = connection;
        //                command.CommandType = CommandType.Text;
        //                command.CommandText = @"INSERT into dbo.Students (Name, LastName, Dni, BirthDate, Age, CreationDate)
        //                                    VALUES (@name, @lastName, @dni, @birthDate, @age, @creationDate)";
        //                command.Parameters.AddWithValue("@name", student[i].Name);
        //                command.Parameters.AddWithValue("@lastName", student[i].LastName);
        //                command.Parameters.AddWithValue("@dni", student[i].Dni);
        //                command.Parameters.AddWithValue("@birthDate", student[i].BirthDate);
        //                command.Parameters.AddWithValue("@age", student[i].Age);
        //                command.Parameters.AddWithValue("@creationDate", DateTime.Today);

        //                connection.Open();
        //                int recordsAffected = command.ExecuteNonQuery();
        //            }
        //        }
        //    }
        //    return studentAdded;
        //}

        //public int DeleteById(int id)
        //{
        //    Student alumnoInsertado = new Student();
        //    using (SqlConnection connection = new SqlConnection(this.Conexion))
        //    {
        //        using (SqlCommand command = new SqlCommand())
        //        {
        //            command.Connection = connection;
        //            command.CommandType = CommandType.Text;
        //            command.CommandText = @"DELETE from dbo.Students 
        //                                    WHERE Id = @Id";
        //            command.Parameters.AddWithValue("@Id", id);

        //            connection.Open();
        //            int recordsAffected = command.ExecuteNonQuery();
        //            return recordsAffected;
        //        }
        //    }
        //}

        //public List<Student> ReadAll()
        //{
        //    List<Student> students = new List<Student>();
        //    using (

        //        SqlConnection connection = new SqlConnection(this.Conexion))
        //    {
        //        connection.Open();
        //        using (SqlCommand myCommand = new SqlCommand("select * from dbo.Students", connection))
        //        {
        //            SqlDataReader myReader = myCommand.ExecuteReader();
        //            while (myReader.Read())
        //            {
        //                Student student = new Student();
        //                student.Id = Convert.ToInt32(myReader["Id"]);
        //                student.Name = myReader["Name"].ToString();
        //                student.LastName = myReader["LastName"].ToString();
        //                student.Dni = myReader["Dni"].ToString();
        //                student.BirthDate = Convert.ToDateTime(myReader["BirthDate"]);
        //                student.Age = Convert.ToInt32(myReader["Age"]);
        //                student.CreationDate = Convert.ToDateTime(myReader["CreationDate"]);
        //                students.Add(student);
        //            }
        //        }
        //    }
        //    return students;
        //}

        //public Student ReadById(int id)
        //{
        //    Student student = new Student();
        //    using (SqlConnection connection = new SqlConnection(this.Conexion))
        //    {
        //        using (SqlCommand command = new SqlCommand())
        //        {
        //            command.Connection = connection;
        //            command.CommandType = CommandType.Text;
        //            command.CommandText = "select * from dbo.Students a where a.Id=@Id";
        //            command.Parameters.AddWithValue("@Id", id);

        //            connection.Open();
        //            SqlDataReader myReader = command.ExecuteReader();
        //            while (myReader.Read())
        //            {
        //                student.Id = Convert.ToInt32(myReader["Id"]);
        //                student.Name = myReader["Name"].ToString();
        //                student.LastName = myReader["LastName"].ToString();
        //                student.Dni = myReader["Dni"].ToString();
        //                student.BirthDate = Convert.ToDateTime(myReader["BirthDate"]);
        //                student.Age = Convert.ToInt32(myReader["Age"]);
        //                student.CreationDate = Convert.ToDateTime(myReader["CreationDate"]);
        //            }
        //        }
        //    }
        //    return student;
        //}
    }
}
