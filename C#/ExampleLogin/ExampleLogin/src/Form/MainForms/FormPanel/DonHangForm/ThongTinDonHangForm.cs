using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class ThongTinDonHangForm : Form
    {
        private SQLToolBox connSQL;
        private string tableName = "ChiTietDatHang";
        private string MaDH;

        public ThongTinDonHangForm(SQLToolBox connSQL, string MaDH)
        {
            InitializeComponent();
            numSoLuong.TextChanged += new EventHandler(numSoLuong_TextChanged);

            this.connSQL = connSQL;
            this.MaDH = MaDH;

            this.Text = "Thông tin đơn hàng (" + this.MaDH + ")";
            this.tbMaDonHang.Text = this.MaDH;
        }

        private void ThongTinDonHangForm_Load(object sender, EventArgs e)
        {
            this.loadData();
            this.wipeInput();
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            SqlCommand cmd = null;
            SQLTable table = null;

            // load maLinhKien
            cbMaLinhKien.Items.Clear();
            table = this.connSQL.Select("select MaLK from LinhKien;");
            for(int i = 0; i < table.Count; i++)
            {
                cbMaLinhKien.Items.Add(table.Row(i).Column(0));
            }

            // load dataGridView
            cmd = new SqlCommand("select * from " + this.tableName + " where (MaDH = @MaDH);");
            cmd.Parameters.AddWithValue("@MaDH", this.MaDH);
            table = this.connSQL.Select(cmd);
            table.removeColumn("MaDH");

            Library.setDataSource(dataGridView1, table.getDataTable());
        }

        public void wipeInput()
        {
            cbMaLinhKien.SelectedIndex = -1;
            tbTenLinhKien.Text = "";
            numSoLuong.Value = 0;
            tbTongTien.Text = "0";

            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if ((dataGridView1.Rows.Count - 1) == index)
            {
                this.wipeInput();
            }
            else
            {
                if (!this.connSQL.State())this.connSQL.Connect();
                cbMaLinhKien.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
                numSoLuong.Value = Convert.ToInt32(dataGridView1.Rows[index].Cells[1].Value.ToString());

                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnSua.Enabled = true;
            }
        }

        private void cbMaLinhKien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cbMaLinhKien.Text))
            {
                return;
            }
            SqlCommand cmd = new SqlCommand("select TenLK from LinhKien where (MaLK = @MaLK);");
            cmd.Parameters.AddWithValue("@MaLK", cbMaLinhKien.Text);
            tbTenLinhKien.Text = this.connSQL.Select(cmd).Row(0).Column(0);
        }

        private void numSoLuong_ValueChanged(object sender, EventArgs e)
        {
            if (cbMaLinhKien.SelectedIndex == -1)
            {
                return;
            }
            SqlCommand cmd = null;
            cmd = new SqlCommand("select Gia, KhuyenMai from LinhKien where (MaLK = @MaLK);");
            cmd.Parameters.AddWithValue("@MaLK", cbMaLinhKien.Text);
            SQLTable table = this.connSQL.Select(cmd);
            tbTongTien.Text = (((Convert.ToInt32(table.Row(0).Column(0)) * numSoLuong.Value) / 100) * (100 - Convert.ToInt32(table.Row(0).Column(1)))).ToString();
        }

        private void numSoLuong_TextChanged(object sender, EventArgs e)
        {
            this.numSoLuong_ValueChanged(sender, e);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maLK = cbMaLinhKien.Text;
            string soLuong = numSoLuong.Text;

            foreach (string s in new List<string>() { maLK, soLuong })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            SqlCommand cmd = new SqlCommand("INSERT INTO " + this.tableName + " (MaDH, MaLK, SoLuong) VALUES (@MaDH, @MaLK, @SoLuong);");
            cmd.Parameters.AddWithValue("@MaDH", this.MaDH);
            cmd.Parameters.AddWithValue("@MaLK", maLK);
            cmd.Parameters.AddWithValue("@SoLuong", soLuong);

            if (this.connSQL.Execute(cmd))
            {
                this.ThongTinDonHangForm_Load(sender, e);
            }
            else
            {
                MessageBox.Show("Thêm linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maLK = cbMaLinhKien.Text;
            string soLuong = numSoLuong.Text;

            foreach (string s in new List<string>() { maLK, soLuong })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            SqlCommand cmd = new SqlCommand("UPDATE " + this.tableName + " SET MaLK = @MaLK, SoLuong = @SoLuong WHERE (MaDH = @MaDH);");
            cmd.Parameters.AddWithValue("@MaDH", this.MaDH);
            cmd.Parameters.AddWithValue("@MaLK", maLK);
            cmd.Parameters.AddWithValue("@SoLuong", soLuong);

            if (this.connSQL.Execute(cmd))
            {
                this.ThongTinDonHangForm_Load(sender, e);
            }
            else
            {
                MessageBox.Show("Sửa linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maLK = cbMaLinhKien.Text;
            if (MessageBox.Show("Bạn có muốn xóa linh kiện [" + maLK + "] không?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            SqlCommand cmd = new SqlCommand("DELETE FROM " + this.tableName + " WHERE (MaDH = @MaDH and maLK = @maLK);");
            cmd.Parameters.AddWithValue("@MaDH", this.MaDH);
            cmd.Parameters.AddWithValue("@maLK", maLK);

            if (this.connSQL.Execute(cmd))
            {
                this.ThongTinDonHangForm_Load(sender, e);
            }
            else
            {
                MessageBox.Show("Xóa linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            this.ThongTinDonHangForm_Load(sender, e);
        }

        private void btnTinhTongTien_Click(object sender, EventArgs e)
        {
            long tongTien = 0;
            SqlCommand cmd = new SqlCommand("select * from " + this.tableName + " where (MaDH = @MaDH);");
            cmd.Parameters.AddWithValue("@MaDH", this.MaDH);
            SQLTable table = this.connSQL.Select(cmd);
            table.removeColumn("MaDH");

            SQLTable tmp = null;
            for(int i = 0; i < table.Count; i++)
            {
                cmd = new SqlCommand("select Gia, KhuyenMai from LinhKien where (MaLK = @MaLK);");
                cmd.Parameters.AddWithValue("@MaLK", table.Row(i).Column("MaLK"));
                tmp = this.connSQL.Select(cmd);
                tongTien = tongTien + (long)((Convert.ToInt32(tmp.Row(0).Column(0)) * Convert.ToInt32(table.Row(i).Column("SoLuong"))) / 100) * (100 - Convert.ToInt32(tmp.Row(0).Column(1)));
            }

            MessageBox.Show("Tổng số tiền đơn hàng (" + this.MaDH + "): " + tongTien.ToString() + " VND", "Tổng tiền đơn hàng", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
