using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class DonHangForm : Form
    {
        private Thread threadSearch = null;
        private DataTable dtOld = null;
        private SQLToolBox connSQL;
        private string tableName = "DonDatHang";
        private bool isSelected = false;

        public DonHangForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
        }

        private void HoaDonForm_Load(object sender, EventArgs e)
        {
            this.loadData();
            this.wipeInput();
            this.generateMaDonHang();
        }

        private void generateMaDonHang()
        {
            if (dataGridView1.Rows.Count > 0)
            {
                string maMH = dataGridView1.Rows[dataGridView1.Rows.Count - 2].Cells[dataGridView1.Columns[0].Name].Value.ToString();
                if ((maMH.Length >= 5) && (maMH.StartsWith("DH")))
                {
                    try
                    {
                        int num = Convert.ToInt32(maMH.Substring(2, maMH.Length - 2)) + 1;
                        maMH = "DH";
                        if (num <= 9)
                        {
                            maMH = maMH + "00";
                        }
                        else if (num <= 99)
                        {
                            maMH = maMH + "0";
                        }
                        maMH = maMH + num.ToString();
                        tbMaDonHang.Text = maMH;
                        tbMaDonHang.ReadOnly = true;
                    }
                    catch (Exception ex)
                    {
                        tbMaDonHang.Text = "";
                        tbMaDonHang.ReadOnly = false;
                    }

                }
                else
                {
                    tbMaDonHang.Text = "";
                    tbMaDonHang.ReadOnly = false;
                }
            }
            else
            {
                tbMaDonHang.Text = "DH000";
                tbMaDonHang.ReadOnly = true;
            }
        }

        private void wipeInput()
        {
            ngayDatHang.Value = DateTime.Today;
            ngayGiaoHang.Value = DateTime.Today;
            tbNoiNhan.Text = "";

            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
        }

        private void loadData()
        {
            if (!this.connSQL.State())this.connSQL.Connect();

            tbTimKiem.Text = "";
            if (cbLoc.Items.Count > 0)
            {
                cbLoc.SelectedIndex = 0;
            }
            cbUpLowCase.Checked = false;

            SQLTable table = null;

            // load maNhanVien
            cbMaNhanVien.Items.Clear();
            table = this.connSQL.Select("select MaNV from NhanVien;");
            for (int i = 0; i < table.Count; i++)
            {
                cbMaNhanVien.Items.Add(table.Row(i).Column(0));
            }
            if (cbMaNhanVien.Items.Count > 0)
            {
                cbMaNhanVien.SelectedIndex = 0;
            }

            // load maKhachHang
            cbMaKhachHang.Items.Clear();
            table = this.connSQL.Select("select MaKH from KhachHang;");
            for (int i = 0; i < table.Count; i++)
            {
                cbMaKhachHang.Items.Add(table.Row(i).Column(0));
            }
            if (cbMaKhachHang.Items.Count > 0)
            {
                cbMaKhachHang.SelectedIndex = 0;
            }

            // load datagridview
            table = this.connSQL.Select("select * from " + this.tableName + ";");
            Library.setDataSource(dataGridView1, table.getDataTable());

            // search
            cbLoc.Items.Clear();
            cbLoc.Items.Add("");
            for (int i = 0; i < table.Row(0).Count; i++)
            {
                cbLoc.Items.Add(table.Row(0).ColumnName(i));
            }
        }

        private void search()
        {
            this.search(false);
        }

        private void search(bool noWait)
        {
            this.dtOld = Library.searchGridData(dataGridView1, this.dtOld, tbTimKiem, cbLoc, noWait, cbUpLowCase.Checked);
        }

        private void tbTimKiem_TextChanged_1(object sender, EventArgs e)
        {
            this.threadSearch = Library.abortThread(this.threadSearch);

            this.threadSearch = new Thread(new ThreadStart(search));
            this.threadSearch.Start();
            GC.Collect(0);
        }

        private void tbTimKiem_TextChanged(object sender, EventArgs e)
        {
            this.threadSearch = Library.abortThread(this.threadSearch);

            this.threadSearch = new Thread(new ThreadStart(search));
            this.threadSearch.Start();
            GC.Collect(0);
        }

        private void cbLoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tbTimKiem.Text.Length == 0)
            {
                return;
            }
            this.threadSearch = Library.abortThread(this.threadSearch);
            this.search(true);
        }

        private void cbUpLowCase_CheckedChanged(object sender, EventArgs e)
        {
            this.cbLoc_SelectedIndexChanged(sender, e);
        }

        private void tbTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Return)
            {
                this.threadSearch = Library.abortThread(this.threadSearch);
                this.search(true);
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            this.HoaDonForm_Load(sender, e);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if ((dataGridView1.Rows.Count - 1) == index)
            {
                this.wipeInput();
                this.generateMaDonHang();
                this.isSelected = false;
            }
            else
            {
                if (!this.connSQL.State())
                {
                    this.connSQL.Connect();
                }

                tbMaDonHang.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
                cbMaKhachHang.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
                cbMaNhanVien.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();
                ngayDatHang.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
                ngayGiaoHang.Text = dataGridView1.Rows[index].Cells[4].Value.ToString();
                tbNoiNhan.Text = dataGridView1.Rows[index].Cells[5].Value.ToString();

                SqlCommand cmd = null;
                cmd = new SqlCommand("select TenKH from KhachHang where (MaKH = @MaKH);");
                cmd.Parameters.AddWithValue("@MaKH", cbMaKhachHang.Text);
                tbTenKhachHang.Text = this.connSQL.Select(cmd).Row(0).Column(0);

                cmd = new SqlCommand("select TenNV from NhanVien where (MaNV = @MaNV);");
                cmd.Parameters.AddWithValue("@MaNV", cbMaNhanVien.Text);
                tbTenNhanVien.Text = this.connSQL.Select(cmd).Row(0).Column(0);

                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnSua.Enabled = true;
                this.isSelected = true;
            }
        }

        private void cbMaKhachHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            if (!string.IsNullOrEmpty(cbMaKhachHang.Text))
            {
                SqlCommand cmd = new SqlCommand("select TenKH from KhachHang where (MaKH = @MaKH);");
                cmd.Parameters.AddWithValue("@MaKH", cbMaKhachHang.Text);
                SQLTable table = this.connSQL.Select(cmd);
                tbTenKhachHang.Text = table.Row(0).Column(0);
            }
        }

        private void cbMaNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            if (!string.IsNullOrEmpty(cbMaNhanVien.Text))
            {
                SqlCommand cmd = new SqlCommand("select TenNV from NhanVien where (MaNV = @MaNV);");
                cmd.Parameters.AddWithValue("@MaNV", cbMaNhanVien.Text);
                SQLTable table = this.connSQL.Select(cmd);
                tbTenNhanVien.Text = table.Row(0).Column(0);
            }
        }

        private void btnThongTinDonHang_Click(object sender, EventArgs e)
        {
            if (!this.isSelected)
            {
                MessageBox.Show("Bạn chưa chọn đơn hàng nào!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            ThongTinDonHangForm fm = new ThongTinDonHangForm(this.connSQL, tbMaDonHang.Text);
            fm.ShowDialog();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maDH = tbMaDonHang.Text;
            string maKH = cbMaKhachHang.Text;
            string maNV = cbMaNhanVien.Text;
            string NgayDatHang = ngayDatHang.Text;
            string NgayGiaoHang = ngayGiaoHang.Text;
            string noiNhan = tbNoiNhan.Text;

            foreach (string s in new List<string>() { maDH, maKH, maNV, NgayDatHang, NgayGiaoHang, noiNhan })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            SqlCommand cmd = new SqlCommand("INSERT INTO " + this.tableName + " (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan) VALUES (@MaDH, @MaKH, @MaNV, @NgayDatHang, @NgayGiaoHang, @NoiNhan);");
            cmd.Parameters.AddWithValue("@MaDH", maDH);
            cmd.Parameters.AddWithValue("@MaKH", maKH);
            cmd.Parameters.AddWithValue("@MaNV", maNV);
            cmd.Parameters.AddWithValue("@NgayDatHang", NgayDatHang);
            cmd.Parameters.AddWithValue("@NgayGiaoHang", NgayGiaoHang);
            cmd.Parameters.AddWithValue("@NoiNhan", noiNhan);

            if (this.connSQL.Execute(cmd))
            {
                this.HoaDonForm_Load(sender, e);
                MessageBox.Show("Thêm đơn hàng thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Thêm đơn hàng thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maDH = tbMaDonHang.Text;
            string maKH = cbMaKhachHang.Text;
            string maNV = cbMaNhanVien.Text;
            string NgayDatHang = ngayDatHang.Text;
            string NgayGiaoHang = ngayGiaoHang.Text;
            string noiNhan = tbNoiNhan.Text;

            foreach (string s in new List<string>() { maDH, maKH, maNV, NgayDatHang, NgayGiaoHang, noiNhan })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            SqlCommand cmd = new SqlCommand("UPDATE " + this.tableName + " SET MaKH = @MaKH, MaNV = @MaNV, NgayDatHang = @NgayDatHang, NgayGiaoHang = @NgayGiaoHang, NoiNhan = @NoiNhan WHERE (MaDH = @MaDH);");
            cmd.Parameters.AddWithValue("@MaDH", maDH);
            cmd.Parameters.AddWithValue("@MaKH", maKH);
            cmd.Parameters.AddWithValue("@MaNV", maNV);
            cmd.Parameters.AddWithValue("@NgayDatHang", NgayDatHang);
            cmd.Parameters.AddWithValue("@NgayGiaoHang", NgayGiaoHang);
            cmd.Parameters.AddWithValue("@NoiNhan", noiNhan);

            if (this.connSQL.Execute(cmd))
            {
                this.HoaDonForm_Load(sender, e);
                MessageBox.Show("Sửa đơn hàng thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa đơn hàng thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State())this.connSQL.Connect();

            string maDH = tbMaDonHang.Text;
            if (MessageBox.Show("Bạn có muốn xóa đơn hàng [" + maDH + "] không?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            SqlCommand cmd = new SqlCommand("DELETE FROM " + this.tableName + " WHERE (MaDH = @MaDH);");
            cmd.Parameters.AddWithValue("@MaDH", maDH);

            if (this.connSQL.Execute(cmd))
            {
                this.HoaDonForm_Load(sender, e);
                MessageBox.Show("Xóa đơn hàng thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa đơn hàng thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
