﻿using ExampleLogin.src.Library;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class ThanhToanDHForm : Form
    {
        private SQLToolBox connSQL;
        private string MaDH;
        private long tongTien = 0;
        private string maPttt;
        public bool isSuccess = false;

        public ThanhToanDHForm(SQLToolBox connSQL, string MaDH, string maPttt, long tongTien)
        {
            InitializeComponent();
            this.connSQL = connSQL;
            this.MaDH = MaDH;
            this.tongTien = tongTien;
            this.maPttt = maPttt;
        }

        private void ThanhToanDHForm_Load(object sender, EventArgs e)
        {
            this.Text = "Thanh toán | Mã: " + this.MaDH;
            this.tbMaDH.Text = this.MaDH;
            this.tbTongTien.Text = this.tongTien.ToString();

            this.loadData();
            if (this.maPttt != null)
            {
                this.tbMaPhuongThuc.Text = this.maPttt;
            };
            this.tbNoiDung.Text = "Thanh toan don hang " + this.MaDH + " ngay " + DateTime.Now.ToString("dd/MM/yyyy");
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            SQLTable table = this.connSQL.Select("Select LoaiThanhToan from PhuongThucThanhToan;");
            cbPhuongThuc.Items.Clear();
            for(int i = 0; i < table.Count; i++)
            {
                cbPhuongThuc.Items.Add(table.Row(i).Column(0));
            }

            SqlCommand cmd = new SqlCommand("select LoaiThanhToan from PhuongThucThanhToan where (MaPhuongThuc = @MaPhuongThuc);");
            cmd.Parameters.AddWithValue("@MaPhuongThuc", this.maPttt);    

            Library.setComboBox(cbPhuongThuc, this.connSQL.Select(cmd).Row(0).Column(0));
        }

        private void cbPhuongThuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbPhuongThuc.SelectedIndex == -1)
            {
                return;
            }

            SqlCommand cmd = new SqlCommand("select MaPhuongThuc, SoTaiKhoan from PhuongThucThanhToan where (LoaiThanhToan = @LoaiThanhToan);");
            cmd.Parameters.AddWithValue("@LoaiThanhToan", cbPhuongThuc.Text);

            SQLTable table = this.connSQL.Select(cmd);
            tbMaPhuongThuc.Text = table.Row(0).Column(0);
            tbSoTaiKhoan.Text = table.Row(0).Column(1);
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            SqlCommand cmd = new SqlCommand("update ThongTinThanhToan set TinhTrang = 1 where (MaDH = @MaDH)");
            cmd.Parameters.AddWithValue("@MaDH", this.MaDH);
            if (this.connSQL.Execute(cmd))
            {
                MessageBox.Show("Thanh toán thành công", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.isSuccess = true;
                this.Close();
            } else
            {
                MessageBox.Show("Thanh toán thất bại", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}