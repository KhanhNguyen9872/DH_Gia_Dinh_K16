using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin.src.Library
{
    public class SQLToolBox
    {
        private SqlConnection conn = null;
        // private String server;
        private String db;
        private String dataSource;
        private String datacmd;

        // private PleaseWaitForm fm = new PleaseWaitForm();
        // private String username;
        // private String password;

        public SQLToolBox(String dataSource, String db)
        {
            this.dataSource = "Data Source=" + dataSource + ";";
            this.db = db;
            this.datacmd = this.dataSource + "Initial Catalog=" + this.db + ";Encrypt=false;TrustServerCertificate=true;MultipleActiveResultSets=true;Trusted_Connection=yes;";
        }

        public SQLToolBox(String dataSource, String db, String user, String password)
        {
            this.dataSource = "Data Source=" + dataSource + ";";
            this.db = db;
            this.datacmd = this.dataSource + "Initial Catalog=" + this.db + ";Encrypt=false;TrustServerCertificate=true;MultipleActiveResultSets=true;User ID=" + user + ";Password=" + password + ";Trusted_Connection=yes;";
        }


        public bool State()
        {
            if (this.conn != null && this.conn.State == ConnectionState.Open)
            {
                return true;
            }
            return false;
        }

        public void Connect()
        {
            this.conn = new SqlConnection(this.datacmd);
            if (this.conn.State == ConnectionState.Closed)
            {
                try
                {
                    // this.fm.Show();
                    Application.DoEvents();
                    
                    this.conn.Open();
                    GC.Collect(0);
                    // this.fm.Hide();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Server đang bảo trì, vui lòng thử lại sau!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    Library.killPid(Library.getPid());
                }
            }
        }

        public void Close()
        {
            if (this.conn != null && this.conn.State == ConnectionState.Open) {
                this.conn.Close();
            }
        }

        public bool Execute(String query)
        {
            SqlCommand cmd = new SqlCommand(query);
            return this.Execute(cmd);
        }

        public bool Execute(SqlCommand cmd)
        {
            cmd.Connection = this.conn;
            int rows = 0;
            try
            {
                rows = cmd.ExecuteNonQuery();
            } catch (Exception e)
            {
                MessageBox.Show(e.ToString(), "SQL Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            
            if (rows > 0)
            {
                return true;
            }
            return false;
        }

        public SQLTable Select(String query)
        {
            SqlCommand cmd = new SqlCommand(query);
            return this.Select(cmd);
        }

        public SQLTable Select(SqlCommand cmd)
        {
            cmd.Connection = this.conn;
            SqlDataReader reader = cmd.ExecuteReader();
            List<Dictionary<string, string>> data = new List<Dictionary<string, string>>();
            Dictionary<string, string> value = new Dictionary<string, string>();
            try
            {
                while (reader.Read())
                {
                    value = new Dictionary<string, string>();
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        string s = reader.GetName(i);
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

        public DataTable getDataTable()
        {
            DataTable dt = new DataTable();
            this.Fill(dt);
            return dt;
        }

        public void renameColumn(string oldColumnName, string newColumnName)
        {
            if (this.data.Count > 0)
            {
                List<Dictionary<string, string>> newData = new List<Dictionary<string, string>>();
                Dictionary<string, string> row = null;
                string key;

                for (int i = 0; i < this.data.Count; i++)
                {
                    row = new Dictionary<string, string>();
                    foreach(var s in this.data[i])
                    {
                        key = s.Key;
                        if (key.Equals(oldColumnName))
                        {
                            key = newColumnName;
                        }
                        row.Add(key, s.Value);
                    }
                    newData.Add(row);
                }

                this.data = newData;
            }
        }

        public void addColumn(string columnName, string defaultValue)
        {
            if (this.data.Count > 0)
            {
                foreach(var s in this.data)
                {
                    s.Add(columnName, defaultValue);
                }
            }
        }

        public void removeColumn(string columnName)
        {
            if (this.data.Count > 0)
            {
                int index = 0;
                foreach (var s in this.data[0])
                {
                    if (columnName == s.Key)
                    {
                        break;
                    }
                    index++;
                }

                this.removeColumn(index);
            }
        }

        public void removeColumn(int index)
        {
            if (this.data.Count > 0)
            {
                List<Dictionary<string, string>> newData = new List<Dictionary<string, string>>();
                Dictionary<string, string> column = null;
                int i;

                foreach (Dictionary<string, string> s in this.data)
                {
                    column = new Dictionary<string, string>();
                    i = -1;
                    foreach (string key in s.Keys)
                    {
                        i++;
                        if (i == index)
                        {
                            continue;
                        }
                        column[key] = s[key];
                    }
                    newData.Add(column);
                }

                this.data = newData;
            }
        }

        public void Fill(DataTable dt)
        {
            if (this.data.Count > 0)
            {
                foreach (var s in this.data[0])
                {
                    dt.Columns.Add(s.Key);
                }

                foreach (Dictionary<string, string> item in this.data)
                {
                    DataRow row = dt.NewRow();
                    foreach (string key in item.Keys)
                    {
                        row[key] = item[key];
                    }

                    dt.Rows.Add(row);
                }
            }
        }

        public SQLRow Row(int index)
        {
            if (this.data.Count > 0)
            {
                return new SQLRow(this.data[index]);
            }
            return null;
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
            this.key = key;
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

        public string ColumnName(int index)
        {
            int i = 0;
            foreach(var s in this.data)
            {
                if (i == index)
                {
                    return s.Key;
                }

                i = i + 1;
            }
            return null;
        }

        public string Column(string key)
        {
            return this.data[key];
        }

        public void setValueColumn(string key, string value)
        {
            this.data[key] = value;
        }

        public string Column(int index)
        {
            int count = 0;
            foreach (var s in this.data)
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
}
