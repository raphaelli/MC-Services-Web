using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace MCServicesWeb.Models
{
    public class UsersInfoModels
    {
        public int UsersId { get; set; }

        public int UsersLevel { get; set; }

        public string UsersName { get; set; }

        public string UsersPwd { get; set; }

        public int UsersSex { get; set; }

        public DateTime UsersBirthday { get; set; }

        public SqlMoney UsersCash { get; set; }

        public string UsersAvator { get; set; }

        public int UsersWhite { get; set; }

        public int UsersDel { get; set; }

    }

    public class UsersDBContext : DbContext
    {
        public DbSet<UsersInfoModels> UsersInfo { get; set; }
    }
}