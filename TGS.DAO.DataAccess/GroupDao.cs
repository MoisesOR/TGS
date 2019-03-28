using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TGS.Common.Logic.Configuration;
using TGS.Common.Logic.Models;

namespace TGS.DAO.DataAccess
{
    public class GroupDao
    {
        private string Conexion { get; set; }

        public GroupDao()
        {
            this.Conexion = Configurations.ReadDataBaseConnection();
        }

        public List<Group> ReadAll()
        {
            List<Group> groups = new List<Group>();
            using (
                SqlConnection connection = new SqlConnection(this.Conexion))
            {
                connection.Open();
                using (SqlCommand myCommand = new SqlCommand("select * from dbo.GroupList", connection))
                {
                    SqlDataReader myReader = myCommand.ExecuteReader();
                    while (myReader.Read())
                    {
                        Group group = new Group();
                        group.Id = Convert.ToInt32(myReader["Id"]);
                        group.GroupName = myReader["Group"].ToString();
                        group.StartYear = Convert.ToInt32(myReader["StartYear"]);
                        if(myReader["EndYear"] == null || myReader["EndYear"] == DBNull.Value)
                        {
                            var actualYear = DateTime.Now.Year;
                            group.EndYear = actualYear;
                        }
                        else
                        {
                            group.EndYear = Convert.ToInt32(myReader["EndYear"]);
                        }
                        group.Description = myReader["Description"].ToString();
                        group.UrlWiki = myReader["UrlWiki"].ToString();
                        group.Country = myReader["Country"].ToString();
                        group.City = myReader["City"].ToString();

                        groups.Add(group);
                    }
                }
            }
            return groups;
        }

        public Group ReadById(int id)
        {
            Group group = new Group();
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = "select * from dbo.GroupList a where a.Id=@Id";
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();
                    SqlDataReader myReader = command.ExecuteReader();
                    while (myReader.Read())
                    {
                        group.Id = Convert.ToInt32(myReader["Id"]);
                        group.GroupName = myReader["Group"].ToString();
                        group.StartYear = Convert.ToInt32(myReader["StartYear"]);
                        if (myReader["EndYear"] == null || myReader["EndYear"] == DBNull.Value)
                        {
                            var actualYear = DateTime.Now.Year;
                            group.EndYear = actualYear;
                        }
                        else
                        {
                            group.EndYear = Convert.ToInt32(myReader["EndYear"]);
                        }
                        group.Description = myReader["Description"].ToString();
                        group.UrlWiki = myReader["UrlWiki"].ToString();
                        group.Country = myReader["Country"].ToString();
                        group.City = myReader["City"].ToString();
                    }
                }
            }
            return group;
        }
        
        public int AddMore(List<Group> group)
        {
            int rowsAffected = 0;
            for (int i = 0; i < group.Count; i++)
            {
                using (SqlConnection connection = new SqlConnection(this.Conexion))
                {
                    using (SqlCommand command = new SqlCommand())
                    {
                        command.Connection = connection;
                        command.CommandType = CommandType.Text;
                        command.CommandText = @"INSERT into dbo.GroupList ([Group], StartYear, EndYear, Description, UrlWiki, Country, City) 
                                                VALUES (@Group, @StartYear, @EndYear, @Description, @UrlWiki, @Country, @City)";
                        command.Parameters.AddWithValue("@Group", group[i].GroupName);
                        command.Parameters.AddWithValue("@StartYear", group[i].StartYear);
                        command.Parameters.AddWithValue("@EndYear", group[i].EndYear);
                        command.Parameters.AddWithValue("@Description", group[i].Description);
                        command.Parameters.AddWithValue("@UrlWiki", group[i].UrlWiki);
                        command.Parameters.AddWithValue("@Country", group[i].Country);
                        command.Parameters.AddWithValue("@City", group[i].City);

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
                    command.CommandText = @"DELETE from dbo.GroupList 
                                            WHERE Id = @Id";
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();
                    int recordsAffected = command.ExecuteNonQuery();
                    return recordsAffected;
                }
            }
        }
        
        public int UpdateGroup(Group group, int id)
        {
            Group groupUpdated = new Group();
            using (SqlConnection connection = new SqlConnection(this.Conexion))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText = @"update dbo.GroupList 
                                            set [Group]=@Group, StartYear=@StartYear, EndYear=@EndYear, Description=@Description, UrlWiki=@UrlWiki, Country=@Country, City=@City 
                                            where Id=@Id";
                    command.Parameters.AddWithValue("@Group", group.GroupName);
                    command.Parameters.AddWithValue("@StartYear", group.StartYear);
                    command.Parameters.AddWithValue("@EndYear", group.EndYear);
                    command.Parameters.AddWithValue("@Description", group.Description);
                    command.Parameters.AddWithValue("@UrlWiki", group.UrlWiki);
                    command.Parameters.AddWithValue("@Country", group.Country);
                    command.Parameters.AddWithValue("@City", group.City);
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();
                    int recordsAffected = command.ExecuteNonQuery();
                    return recordsAffected;
                }
            }
        }

    }
}
