using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
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

        public User ReadUser(string userName)
        {
            User user = new User();
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = "select * from dbo.UserList a where a.UserName=@User";
                    command.Parameters.AddWithValue("@User", userName);

                    connection.Open();
                    SqlDataReader myReader = command.ExecuteReader();
                    while (myReader.Read())
                    {
                        user.Id = Convert.ToInt32(myReader["Id"]);
                        user.UserName = myReader["UserName"].ToString();
                        user.UserPassword = myReader["Password"].ToString();
                        user.Question = myReader["Question"].ToString();
                        user.Answer = myReader["Answer"].ToString();
                    }
                }
            }
            return user;
        }


    }
}
