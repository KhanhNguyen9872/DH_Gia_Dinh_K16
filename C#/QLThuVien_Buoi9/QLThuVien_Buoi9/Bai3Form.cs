using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace QLThuVien_Buoi9
{
    public partial class Bai3Form : Form
    {
        private SQLToolBox connSQL;
        private ReportForm reportForm;
        private CrystalReport3 crystalReport3;

        public Bai3Form(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.reportForm = new ReportForm();
            this.crystalReport3 = new CrystalReport3();
            this.connSQL = connSQL;
        }

        private void reloadData()
        {
            string str = "select distinct SACH.*,DOCGIA.MaDocGia, DOCGIA.HoTenDocGia from CHITIETPHIEUMUON  left join SACH on SACH.MaSach = CHITIETPHIEUMUON.MaSach  left join PHIEUMUONSACH on PHIEUMUONSACH.MaPhieuMuon = CHITIETPHIEUMUON.MaPhieuMuon  left join DOCGIA on DOCGIA.MaDocGia = PHIEUMUONSACH.MaDocGia ";
            string maDocGia = cbMaDocGia.Text;
            string tenDocGia = cbTenDocGia.Text;

            bool i = false;

            if (!string.IsNullOrEmpty(maDocGia))
            {
                i = true;
                str = str + " where DOCGIA.MaDocGia = '" + maDocGia + "'";
            }

            if (!i)
            {
                dataGridView1.DataSource = new DataTable();
                return;
            }

            SQLTable table = this.connSQL.Select(str);
            if (table.Count > 0)
            {
                table.removeColumn("NgayNhap");
            }
            else
            {
                btnSubmit.Enabled = false;
            }
            dataGridView1.DataSource = table.getDataTable();
        }

        private void Bai3Form_Load(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            foreach (ComboBox cb in new List<ComboBox>() { cbMaDocGia, cbTenDocGia })
            {
                cb.Items.Clear();
                cb.Items.Add("");
            }
            cbMaDocGia.SelectedIndex = 0;

            SQLTable table = this.connSQL.Select("select MaDocGia, HoTenDocGia from DOCGIA;");

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
            this.crystalReport3.SetDataSource((DataTable)dataGridView1.DataSource);
            this.reportForm.crystalReportViewer1.ReportSource = this.crystalReport3;
            this.reportForm.ShowDialog();
        }

        private void cbMaDocGia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbMaDocGia.SelectedIndex == 0)
            {
                cbTenDocGia.SelectedIndex = 0;
                btnSubmit.Enabled = false;
            } else
            {
                btnSubmit.Enabled = true;
                SqlCommand cmd = new SqlCommand("select HoTenDocGia from DOCGIA where (MaDocGia = @MaDocGia);");
                cmd.Parameters.AddWithValue("@MaDocGia", cbMaDocGia.Text);
                Lib.setComboBox(cbTenDocGia, this.connSQL.Select(cmd).Row(0).Column(0));
            }
            
            this.reloadData();
        }

        private void cbTenDocGia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTenDocGia.SelectedIndex == 0)
            {
                cbMaDocGia.SelectedIndex = 0;
                return;
            }

            SqlCommand cmd = new SqlCommand("select MaDocGia from DOCGIA where (HoTenDocGia = @HoTenDocGia);");
            cmd.Parameters.AddWithValue("@HoTenDocGia", cbTenDocGia.Text);
            Lib.setComboBox(cbMaDocGia, this.connSQL.Select(cmd).Row(0).Column(0));
        }
    }
}
