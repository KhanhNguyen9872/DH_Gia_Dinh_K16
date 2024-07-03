using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class LoaiHangHoaForm : Form
    {
        private SQLToolBox connSQL = null;
        private MainForm mainForm = null;

        public LoaiHangHoaForm(SQLToolBox connSQL, MainForm mainForm)
        {
            InitializeComponent();
            this.connSQL = connSQL;
            this.mainForm = mainForm;
        }

        private void pictureBoxBack_Click(object sender, EventArgs e)
        {
            mainForm.backToOldForm(this);
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            this.LoaiHangHoaForm_Load(sender, e);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if ((dataGridView1.Rows.Count - 1) == index)
            {
                this.wipeButton();
            }
            else
            {
                List<TextBox> list = new List<TextBox>() { tbMaLoai, tbTenLoai, tbNgayTao, tbThayDoiGanNhat };
                for(int i = 0; i < list.Count; i++)
                {
                    try
                    {
                        list[i].Text = dataGridView1.Rows[index].Cells[i].Value.ToString();
                    } catch (Exception ex)
                    {
                        break;
                    }
                }

                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnSua.Enabled = true;
            }
        }

        private void LoaiHangHoaForm_Load(object sender, EventArgs e)
        {
            this.loadData();
            this.wipeButton();
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            SQLTable table = this.connSQL.Select("select * from LoaiMatHang;");
            dataGridView1.DataSource = table.getDataTable();
        }

        private void wipeButton()
        {
            this.tbMaLoai.Text = "";
            this.tbTenLoai.Text = "";
            this.tbNgayTao.Text = "";
            this.tbThayDoiGanNhat.Text = "";

            this.btnThem.Enabled = true;
            this.btnSua.Enabled = false;
            this.btnXoa.Enabled = false;
        }
    }
}
