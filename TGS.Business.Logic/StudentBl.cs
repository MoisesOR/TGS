using System;
using System.Collections.Generic;
using TGS.Common.Logic.Models;
using TGS.DAO.DataAccess;
using TGS.DAO.DataAccess.Interfaces;

namespace TGS.Business.Logic
{
    public class StudentBl : IStudentBl
    {
        private DataBaseDao databaseDao = new DataBaseDao();

        public Student Create(Student student)
        {
            //try
            //{
            //    return this.databaseDao.Add(student);
            //}
            //catch (Exception e)
            //{
            //    throw;
            //}
            throw new NotImplementedException();
        }

        public List<Student> CreateMore(List<Student> student)
        {
            //try
            //{
            //    return this.databaseDao.AddMore(student);
            //}
            //catch (Exception e)
            //{
            //    throw;
            //}
            throw new NotImplementedException();
        }

        public int DeleteById(int id)
        {
            //try
            //{
            //    return this.databaseDao.DeleteById(id);
            //}
            //catch (Exception e)
            //{
            //    throw;
            //}
            throw new NotImplementedException();
        }

        public List<Student> Read()
        {
            //try
            //{
            //    List<Student> student = this.databaseDao.ReadAll();
            //    return student;
            //}
            //catch (Exception e)
            //{
            //    throw;
            //}
            throw new NotImplementedException();
        }

        public Student ReadById(int id)
        {
            //try
            //{
            //    Student student = this.databaseDao.ReadById(id);
            //    return student;
            //}
            //catch (Exception e)
            //{
            //    throw;
            //}
            throw new NotImplementedException();
        }
    }
}
