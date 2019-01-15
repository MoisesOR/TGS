using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TGS.Common.Logic.Configuration
{
    public static class Configurations
    {
        public static string ReadDataBaseConnection()
        {
            return Environment.GetEnvironmentVariable("BBDDConection", EnvironmentVariableTarget.User);
        }
    }
}
