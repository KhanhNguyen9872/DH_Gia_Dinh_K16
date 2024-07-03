using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExampleLogin.src.Library
{
    public class Library
    {
        public static void killPid(int pid)
        {
            Process.GetProcessById(pid).Kill();
        }

        public static int getPid()
        {
            return Process.GetCurrentProcess().Id;
        }

        public static void setDataSource(DataGridView dataGridView, DataTable dataTable)
        {
            dataGridView.DataSource = dataTable;
            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        public static DataTable searchGridData(DataGridView dataGridView1, DataTable dtOld, TextBox tbTimKiem, ComboBox cbTimKiem)
        {
            return Library.searchGridData(dataGridView1, dtOld, tbTimKiem, cbTimKiem, false, false);
        }

        public static DataTable searchGridData(DataGridView dataGridView1, DataTable dtOld, TextBox tbTimKiem, ComboBox cbTimKiem, bool noWait)
        {
            return Library.searchGridData(dataGridView1, dtOld, tbTimKiem, cbTimKiem, noWait, false);
        }

        public static DataTable searchGridData(DataGridView dataGridView1, DataTable dtOld, TextBox tbTimKiem, ComboBox cbTimKiem, bool noWait, bool upLowCase)
        {
            if (tbTimKiem.Text.Length == 0)
            {
                dataGridView1.DataSource = dtOld;
                return null;
            }

            if (!noWait)
            {
                Thread.Sleep(1200);
            }

            PleaseWaitForm pleaseWaitForm = new PleaseWaitForm("Đang tìm kiếm...");
            DataTable newDt = new DataTable();
            string nameColumn = cbTimKiem.Text;
            string userInput = tbTimKiem.Text;
            string data;

            tbTimKiem.ReadOnly = true;
            pleaseWaitForm.Show();
            Application.DoEvents();

            if (dtOld == null)
            {
                dtOld = (DataTable)dataGridView1.DataSource;
            }

            dataGridView1.DataSource = dtOld;

            // add column name to newDt
            for (int i = 0; i < dataGridView1.ColumnCount; i++)
            {
                newDt.Columns.Add(dataGridView1.Columns[i].Name);
            }

            // add Row data to newDt
            int dataLength = dataGridView1.RowCount - 1;

            List<string> listColumns = new List<string>();
            for (int i = 0; i < dataLength; i++)
            {
                if (string.IsNullOrEmpty(nameColumn))
                {
                    foreach (string s in cbTimKiem.Items)
                    {
                        if (string.IsNullOrEmpty(s))
                        {
                            continue;
                        }
                        listColumns.Add(s);
                    }
                }
                else
                {
                    listColumns.Add(nameColumn);
                }

                foreach (string s in listColumns)
                {
                    data = dataGridView1.Rows[i].Cells[s].Value.ToString();
                    if (!upLowCase)
                    {
                        data = data.ToLower();
                        userInput = userInput.ToLower();
                    }
                    if (data.Contains(userInput))
                    {
                        DataRow row = newDt.NewRow();
                        DataGridViewRow r = dataGridView1.Rows[i];

                        for (int j = 0; j < dataGridView1.Columns.Count; j++)
                        {
                            row[j] = r.Cells[j].Value;
                        }

                        newDt.Rows.Add(row);
                        break;
                    }
                }
            }

            Library.setDataSource(dataGridView1, newDt);

            tbTimKiem.ReadOnly = false;

            pleaseWaitForm.Close();

            return dtOld;
        }

        public static bool checkAccount(SQLToolBox connSQL, string accountName)
        {
            bool b = false;
            connSQL.Connect();

            SqlCommand cmd = new SqlCommand("select type from account where (username = @username);");
            cmd.Parameters.AddWithValue("@username", accountName);

            SQLTable table = connSQL.Select(cmd);
            int type = Convert.ToInt32(table.Row(0).Column(0));
            if ((type == 1) || (type == -1))
            {
                b = true;
            }

            connSQL.Close();
            return b;
        }

        /*
        public static string getFullNameUser(SQLToolBox connSQL, string user)
        {
            string fullName = null;
            connSQL.Connect();
            SqlCommand cmd = new SqlCommand("select ");
            SQLTable table = connSQL.Select(cmd);
            return fullName;
        }
        */

        public static Thread abortThread(Thread thread)
        {
            if (thread != null)
            {
                thread.Abort();
            }
            return null;
        }

        public static Process PriorProcess()
        {
            // https://stackoverflow.com/questions/184084/how-to-force-c-sharp-net-app-to-run-only-one-instance-in-windows
            
            Process curr = Process.GetCurrentProcess();
            Process[] procs = Process.GetProcessesByName(curr.ProcessName);
            foreach (Process p in procs)
            {
                if ((p.Id != curr.Id) &&
                    (p.MainModule.FileName == curr.MainModule.FileName))
                    return p;
            }
            return null;
        }
    }
}
