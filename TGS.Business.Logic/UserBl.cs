using System;
using System.Security.Cryptography;
using System.Text;
using TGS.Common.Logic.Models;
using TGS.DAO.DataAccess;

namespace TGS.Business.Logic
{
    public class UserBl
    {
        private UserDao userDao = new UserDao();
        private bool exist = false;
        private bool isOK;

        public bool ReadByUser(User user)
        {
            try
            {
                var psswEnc = Sha256encrypt(user.UserPassword);
                var psswBBDD = userDao.ReadUser(user).UserPassword;

                if (psswEnc == psswBBDD)
                {
                    isOK = true;
                }
                else
                {
                    isOK = false;
                }
                return isOK;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public bool ReadByUserName(string userName)
        {
            try
            {
                var allUsers = userDao.ReadAll();

                foreach (var user in allUsers)
                {
                    if (user == userName)
                    {
                        exist = true;
                        break;
                    }
                }
                return exist;
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public int AddUser(User user)
        {
            try
            {
                var pssw = Sha256encrypt(user.UserPassword);
                user.UserPassword = pssw;
                return this.userDao.AddUser(user);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public string Sha256encrypt(string phrase)
        {
            UTF8Encoding encoder = new UTF8Encoding();
            SHA256Managed sha256hasher = new SHA256Managed();
            byte[] hashedDataBytes = sha256hasher.ComputeHash(encoder.GetBytes(phrase));
            return Convert.ToBase64String(hashedDataBytes);
        }

        public bool CheckUser(string userName)
        {
            bool exist = false;
            if (userDao.ReadByName(userName) == userName)
            {
                exist = true;
            }
            return exist;
        }

        public bool CheckIfUserDeleted(string userName)
        {
            bool deleted = false;
            if (userDao.DeleteByName(userName) == 1)
            {
                deleted = true;
            }
            return deleted;
        }
    }
}