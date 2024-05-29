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
        // private String server;
        private String db;
        // private String username;
        // private String password;

        public SQLToolBox(String db)
        {
            // this.server = server;
            this.db = db;
            // this.username = user;
            // this.password = passwd;
        }

        public void connect()
        {
            this.conn = new SqlConnection("Initial Catalog=" + this.db + ";Encrypt=false;TrustServerCertificate=true;MultipleActiveResultSets=true;Trusted_Connection=yes;");
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
                string[] columns = match.Groups[1].Value.Split(',');

                foreach (string column in columns)
                {
                    columnNames.Add(column.Trim());
                }
            }
            return columnNames;
        }

        public SQLTable select(String query)
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
            return new SQLTable(data);
        }
    }

    public class SQLTable
    {
        private List<Dictionary<string, string>> data;
        public int Count;

        public SQLTable(List<Dictionary<string, string>> data)
        {
            this.data = data;
            this.Count = data.Count;
        }

        public SQLRow Row(int index)
        {
            return new SQLRow(this.data[index]);
        }

        public SQLColumn Column(string key)
        {
            List<string> data = new List<string>();
            for(int i = 0; i < this.data.Count; i++)
            {
                data.Add(this.data[i][key]);
            }
            return new SQLColumn(key, data);
        }

        public SQLColumn Column(int index)
        {
            int count = 0;
            foreach(var s in this.data[0])
            {
                if (count == index)
                {
                    return this.Column(s.Key);
                }
                count++;
            }
            return null;
        }
    }

    public class SQLColumn
    {
        private List<string> data;
        private string key;
        public int Count;

        public SQLColumn(string key, List<string> data)
        {
            this.data = data;
            this.Count = data.Count;
        }

        public string Row(int index)
        {
            return this.data[index];
        }

        public string GetName()
        {
            return this.key;
        }
    }

    public class SQLRow
    {
        private Dictionary<string, string> data;
        public int Count;

        public SQLRow(Dictionary<string, string> data)
        {
            this.data = data;
            this.Count = data.Count;
        }

        public string Column(string key)
        {
            return this.data[key];
        }

        public string Column(int index)
        {
            int count = 0;
            foreach (var s in this.data)
            {
                if (count == index)
                {
                    return s.Value;
                }
                count++;
            }
            return null;
        }
    }
}
