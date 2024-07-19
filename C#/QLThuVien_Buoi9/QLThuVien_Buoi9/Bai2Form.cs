using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;

namespace QLThuVien_Buoi9
{
    public partial class Bai2Form : Form
    {
        private SQLToolBox connSQL;
        private string tableName = "SACH";
        private ReportForm reportForm;
        private CrystalReport2 crystalReport2;

        public Bai2Form(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.reportForm = new ReportForm();
            this.crystalReport2 = new CrystalReport2();
            this.connSQL = connSQL;
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            this.crystalReport2.SetDataSource((DataTable)dataGridView1.DataSource);
            this.reportForm.crystalReportViewer1.ReportSource = crystalReport2;
            this.reportForm.ShowDialog();
        }

        private void trigger(object sender, EventArgs e)
        {
            this.reloadData();
        }

        private void reloadData()
        {
            string str = "select * from " + this.tableName + "";
            string tenTacGia = cbTenTacGia.Text;
            string namXuatBan = cbNamXuatBan.Text;
            string nhaXuatBan = cbNhaXuatBan.Text;

            bool i = false;

            foreach (string s in new List<string>() { tenTacGia, namXuatBan, nhaXuatBan })
            {
                if (!string.IsNullOrEmpty(s))
                {
                    str = str + " where ";
                    break;
                }
            }

            if (!string.IsNullOrEmpty(tenTacGia))
            {
                i = true;
                str = str + "TacGia = N'" + tenTacGia + "'";
            }

            if (!string.IsNullOrEmpty(namXuatBan))
            {
                if (i == true)
                {
                    str = str + " AND ";
                }
                else
                {
                    i = true;
                }
                str = str + "NamXuatBan = N'" + namXuatBan + "'";
            }

            if (!string.IsNullOrEmpty(nhaXuatBan))
            {
                if (i == true)
                {
                    str = str + " AND ";
                }
                else
                {
                    i = true;
                }
                str = str + "NhaXuatBan = N'" + nhaXuatBan + "'";
            }

            dataGridView1.DataSource = this.connSQL.Select(str).getDataTable();
        }

        private bool inComboBox(ComboBox cb, string v)
        {
            foreach (string s in cb.Items)
            {
                if (s.Equals(v))
                {
                    return true;
                }
            }
            return false;
        }

        private void Bai2Form_Load(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            foreach (ComboBox cb in new List<ComboBox>() { cbTenTacGia, cbNamXuatBan, cbNhaXuatBan })
            {
                cb.Items.Clear();
                cb.Items.Add("");
            }
            cbTenTacGia.SelectedIndex = 0;

            SQLTable table = this.connSQL.Select("select TacGia, NamXuatBan, NhaXuatBan from " + this.tableName + ";");

            string data;
            for (int i = 0; i < table.Count; i++)
            {
                data = table.Row(i).Column("TacGia");
                if (!inComboBox(cbTenTacGia, data))
                {
                    cbTenTacGia.Items.Add(data);
                }

                data = table.Row(i).Column("NamXuatBan");
                if (!inComboBox(cbNamXuatBan, data))
                {
                    cbNamXuatBan.Items.Add(data);
                }

                data = table.Row(i).Column("NhaXuatBan");
                if (!inComboBox(cbNhaXuatBan, data))
                {
                    cbNhaXuatBan.Items.Add(data);
                }
            }
        }
    }
}
