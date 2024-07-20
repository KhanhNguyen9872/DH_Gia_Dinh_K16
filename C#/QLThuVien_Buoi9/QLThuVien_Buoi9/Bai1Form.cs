using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace QLThuVien_Buoi9
{
    public partial class Bai1Form : Form
    {
        private SQLToolBox connSQL;
        private string tableName = "DOCGIA";
        private ReportForm reportForm;
        private CrystalReport1 crystalReport1;

        public Bai1Form(SQLToolBox connSQL)
        {
            InitializeComponent();
            reportForm = new ReportForm();
            crystalReport1 = new CrystalReport1();
            this.connSQL = connSQL;
        }

        private void reloadData()
        {
            string str = "select * from " + this.tableName + "";
            string maDocGia = cbMaDocGia.Text;
            string tenDocGia = cbTenDocGia.Text;

            if (!string.IsNullOrEmpty(maDocGia))
            {
                str = str + " where MaDocGia = '" + maDocGia + "'";
            }

            SQLTable table = this.connSQL.Select(str);
            if (table.Count > 0)
            {
                btnSubmit.Enabled = true;
            }
            else
            {
                btnSubmit.Enabled = false;
            }

            dataGridView1.DataSource = table.getDataTable();
        }

        private void Bai1Form_Load(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            foreach (ComboBox cb in new List<ComboBox>() { cbMaDocGia, cbTenDocGia })
            {
                cb.Items.Clear();
                cb.Items.Add("");
            }
            cbMaDocGia.SelectedIndex = 0;

            SQLTable table = this.connSQL.Select("select MaDocGia, HoTenDocGia from " + this.tableName + ";");

            string data;
            for (int i = 0; i < table.Count; i++)
            {
                this.addComboBox(cbMaDocGia, table, i, "MaDocGia");
                this.addComboBox(cbTenDocGia, table, i, "HoTenDocGia");
            }
        }

        private void addComboBox(ComboBox cb, SQLTable table, int indexRow, string nameColumn)
        {
            string data = table.Row(indexRow).Column(nameColumn);
            if (!this.inComboBox(cb, data))
            {
                cb.Items.Add(data);
            }
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

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            this.crystalReport1.SetDataSource((DataTable)dataGridView1.DataSource);
            this.reportForm.crystalReportViewer1.ReportSource = this.crystalReport1;
            this.reportForm.ShowDialog();
        }

        private void cbMaDocGia_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            if (cbMaDocGia.SelectedIndex == 0)
            {
                cbTenDocGia.SelectedIndex = 0;
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select HoTenDocGia from " + this.tableName + " where (MaDocGia = @MaDocGia);");
                cmd.Parameters.AddWithValue("@MaDocGia", cbMaDocGia.Text);
                Lib.setComboBox(cbTenDocGia, this.connSQL.Select(cmd).Row(0).Column(0));
            }

            this.reloadData();
        }

        private void cbTenDocGia_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            if (cbTenDocGia.SelectedIndex == 0)
            {
                cbMaDocGia.SelectedIndex = 0;
                return;
            }

            SqlCommand cmd = new SqlCommand("select MaDocGia from " + this.tableName + " where (HoTenDocGia = @HoTenDocGia);");
            cmd.Parameters.AddWithValue("@HoTenDocGia", cbTenDocGia.Text);
            Lib.setComboBox(cbMaDocGia, this.connSQL.Select(cmd).Row(0).Column(0));
        }
    }
}
