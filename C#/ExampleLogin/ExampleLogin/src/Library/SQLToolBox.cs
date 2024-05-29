using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Text.RegularExpressions;

namespace ExampleLogin.src.Library
{
    public class SQLToolBox
    {
        private SqlConnection conn = null;
        private String server;
        private String db;
        private String username;
        private String password;

        public SQLToolBox(String server, String db, String user, String passwd)
        {
            this.server = server;
            this.db = db;
            this.username = user;
            this.password = passwd;
        }

        public void connect()
        {
            this.conn = new SqlConnection("Data Source=" + this.server + ";Initial Catalog=" + this.db + ";User ID=" + this.username + ";Password=" + this.password + ";Encrypt=false;TrustServerCertificate=true;MultipleActiveResultSets=true;Trusted_Connection=yes;");
            this.conn.Open();
        }

        public void close()
        {
            this.conn.Close();
        }

        public bool execute(String query)
        {
            SqlCommand cmd = new SqlCommand(query, this.conn);
            int rows = 0;
            try
            {
                rows = cmd.ExecuteNonQuery();
            } catch (Exception e)
            {
                Trace.WriteLine(e.StackTrace);
                return false;
            }
            
            if (rows > 0)
            {
                return true;
            }
            return false;
        }

        private List<string> getSelectKey(String query)
        {
            string pattern = @"SELECT\s+(.*?)\s+FROM";
            List<string> columnNames = new List<string>();
            Regex regex = new Regex(pattern, RegexOptions.IgnoreCase);

            Match match = regex.Match(query);

            if (match.Success)
            {
                string columnsPart = match.Groups[1].Value;

                string[] columns = columnsPart.Split(',');

                foreach (var column in columns)
                {
                    columnNames.Add(column.Trim());
                }
            }
            return columnNames;
        }

        public List<Dictionary<string, string>> select(String query)
        {
            List<string> get = this.getSelectKey(query);

            SqlCommand cmd = new SqlCommand(query, this.conn);
            SqlDataReader reader = cmd.ExecuteReader();
            List<Dictionary<string, string>> data = new List<Dictionary<string, string>>();
            Dictionary<string, string> value = new Dictionary<string, string>();
            try
            {
                while (reader.Read())
                {
                    value = new Dictionary<string, string>();
                    foreach (String s in get)
                    {
                        value.Add(s, reader[s].ToString());
                    }
                    data.Add(value);
                }
            }
            finally
            {
                reader.Close();
            }
            GC.Collect(0);
            return data;
        }
    }
}
