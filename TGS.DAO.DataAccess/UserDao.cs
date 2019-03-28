using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TGS.Common.Logic.Configuration;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess
{
    public class UserDao
    {
        private string Conexion { get; set; }

        public UserDao()
        {
            this.Conexion = Configurations.ReadDataBaseConnection();
        }

        public User ReadUser(User user)
        {
            User newUser = new User();
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = "select * from dbo.UserList a where a.[User]=@User";
                    command.Parameters.AddWithValue("@User", user.UserName);

                    connection.Open();
                    SqlDataReader myReader = command.ExecuteReader();
                    while (myReader.Read())
                    {
                        newUser.Id = Convert.ToInt32(myReader["Id"]);
                        newUser.UserName = myReader["User"].ToString();
                        newUser.UserPassword = myReader["Password"].ToString();
                    }
                }
            }
            return newUser;
        }

        public int AddUser(User user)
        {
            int rowsAffected = 0;
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = @"INSERT into dbo.UserList ([User], Password)
                                            VALUES (@User, @Passwd)";
                    command.Parameters.AddWithValue("@User", user.UserName);
                    command.Parameters.AddWithValue("@Passwd", user.UserPassword);

                    connection.Open();
                    int recordsAffected = command.ExecuteNonQuery();
                    rowsAffected = recordsAffected + rowsAffected;
                }
            }
            return rowsAffected;
        }

        public List<string> ReadAll()
        {
            List<string> users = new List<string>();
            using (
                SqlConnection connection = new SqlConnection(this.Conexion))
            {
                connection.Open();
                using (SqlCommand myCommand = new SqlCommand("select [User] from dbo.UserList", connection))
                {
                    SqlDataReader myReader = myCommand.ExecuteReader();
                    while (myReader.Read())
                    {
                        users.Add(myReader["User"].ToString());
                    }
                }
            }
            return users;
        }
    }
}