using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
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
            if (tbTimKiem.Text.Length == 0)
            {
                dataGridView1.DataSource = dtOld;
                dtOld = null;
                return dtOld;
            }

            if (dtOld == null)
            {
                dtOld = (DataTable)dataGridView1.DataSource;
            }

            DataTable newDt = new DataTable();
            PleaseWaitForm pleaseWaitForm = null;
            string nameColumn = cbTimKiem.Text;
            string userInput = tbTimKiem.Text;
            string data;

            dataGridView1.DataSource = dtOld;

            // add column name to newDt
            for (int i = 0; i < dataGridView1.ColumnCount; i++)
            {
                newDt.Columns.Add(dataGridView1.Columns[i].Name);
            }

            // add Row data to newDt
            int dataLength = dataGridView1.RowCount - 1;
            if (dataLength > 10000)
            {
                pleaseWaitForm = new PleaseWaitForm();
                pleaseWaitForm.Show();
                Application.DoEvents();
            }

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

            if (pleaseWaitForm != null)
            {
                pleaseWaitForm.Close();
            }

            return dtOld;
        }
    }
}
