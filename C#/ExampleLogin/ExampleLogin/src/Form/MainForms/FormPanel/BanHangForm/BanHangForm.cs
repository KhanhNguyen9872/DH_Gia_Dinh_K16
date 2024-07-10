using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class BanHangForm : Form
    {
        private SQLToolBox connSQL;

        public BanHangForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
        }

        private void cbMaNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            SqlCommand cmd = null;
            cmd = new SqlCommand("select TenNV from NhanVien where (MaNV = @MaNV);");
            cmd.Parameters.AddWithValue("@MaNV", cbMaNhanVien.Text);
            tbTenNhanVien.Text = this.connSQL.Select(cmd).Row(0).Column(0);
        }

        private void BanHangForm_Load(object sender, EventArgs e)
        {
            this.loadData();
            this.deactivate();
            this.wipeDataGrid();
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            SQLTable table = null;

            cbMaNhanVien.Items.Clear();
            table = this.connSQL.Select("Select MaNV from NhanVien;");
            for (int i = 0; i < table.Count; i++)
            {
                cbMaNhanVien.Items.Add(table.Row(i).Column(0));
            }

            cbMaKhachHang.Items.Clear();
            table = this.connSQL.Select("Select MaKH from KhachHang;");
            for (int i = 0; i < table.Count; i++)
            {
                cbMaKhachHang.Items.Add(table.Row(i).Column(0));
            }

            cbMaNhanVien.SelectedIndex = -1;
            cbMaKhachHang.SelectedIndex = -1;
            tbTenKhachHang.Text = "";
            tbTenNhanVien.Text = "";

        }

        private void deactivate()
        {
            tbNoiNhan.Text = "";
            labelTongThanhTien.Text = "";
            labelTongLinhKien.Text = "";
            cbMaKhachHang.Enabled = false;
            cbMaNhanVien.Enabled = false;
            ngayGiaoHang.Enabled = false;
            tbNoiNhan.Enabled = false;

            btnLamMoi.Enabled = false;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnThanhToan.Enabled = false;

            dataGridView1.Enabled = false;
        }

        private void activate()
        {
            tbNoiNhan.Text = "";
            labelTongThanhTien.Text = "0 VND";
            labelTongLinhKien.Text = "0 linh kiện";
            ngayDatHang.Text = DateTime.Today.ToString();
            cbMaKhachHang.Enabled = true;
            cbMaNhanVien.Enabled = true;
            ngayGiaoHang.Enabled = true;
            tbNoiNhan.Enabled = true;

            btnLamMoi.Enabled = true;
            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnThanhToan.Enabled = true;

            dataGridView1.Enabled = true;
        }

        private void wipeDataGrid()
        {
            dataGridView1.Rows.Clear();
        }

        private void cbMaKhachHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            SqlCommand cmd = null;
            cmd = new SqlCommand("select TenKH from KhachHang where (MaKH = @MaKH);");
            cmd.Parameters.AddWithValue("@MaKH", cbMaKhachHang.Text);
            tbTenKhachHang.Text = this.connSQL.Select(cmd).Row(0).Column(0);
        }

        private void btnTaoMoi_Click(object sender, EventArgs e)
        {
            this.loadData();
            this.activate();
            this.wipeDataGrid();
            this.generateMaDonHang();
            this.reloadTongThanhTien();
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            this.loadData();
            this.generateMaDonHang();
        }

        private void generateMaDonHang()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            SQLTable table = this.connSQL.Select("select MAX(MaDH) as MaDH from DonDatHang;");
            if (table.Count > 0)
            {
                string maMH = table.Row(0).Column(0);
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

        private void btnThem_Click(object sender, EventArgs e)
        {
            ThemLinhKienForm fm = new ThemLinhKienForm(this.connSQL);
            fm.ShowDialog();
            if (fm.Success)
            {
                this.addRow(dataGridView1, fm);
                this.reloadTongThanhTien();
                this.reloadButton();
            }
        }

        private void addRow(DataGridView dataGridView, ThemLinhKienForm fm)
        {
            int stt = 0;

            foreach (DataGridViewRow r in dataGridView1.Rows)
            {
                if (r.Cells[0].Value != null && int.TryParse(r.Cells[0].Value.ToString(), out int id))
                {
                    if (id > stt)
                    {
                        stt = id;
                    }
                }
            }
            stt = stt + 1;

            DataGridViewRow row = new DataGridViewRow();

            string[] rowData = {
                stt.ToString(),
                fm.getMaLinhKien(),
                fm.getTenLinhKien(),
                fm.getMaLoai(),
                fm.getDonGia(),
                fm.getSoLuong().ToString(),
                fm.getBaoHanh().ToString(),
                fm.getKhuyenMai().ToString(),
                fm.getThanhTien()
            };

            row.CreateCells(dataGridView1, rowData);

            dataGridView1.Rows.Add(row);
        }

        private void updateRow(DataGridView dataGridView, ThemLinhKienForm fm, int index)
        {
            DataGridViewRow row = dataGridView1.Rows[index];

            int count = 1;
            foreach(string s in new List<string>() {
                fm.getMaLinhKien(),
                fm.getTenLinhKien(),
                fm.getMaLoai(),
                fm.getDonGia(),
                fm.getSoLuong().ToString(),
                fm.getBaoHanh().ToString(),
                fm.getKhuyenMai().ToString(),
                fm.getThanhTien()
            })
            {
                row.Cells[count].Value = s;
                count = count + 1;
            }
        }

        private void removeRow(DataGridView dataGridView, int index)
        {
            dataGridView1.Rows.RemoveAt(index);
        }

        private void reloadTongThanhTien()
        {
            int count = 0;
            int total = 0;

            int columnIndex = dataGridView1.ColumnCount - 1;

            foreach (DataGridViewRow r in dataGridView1.Rows)
            {
                if (r.Cells[columnIndex].Value != null && int.TryParse(r.Cells[columnIndex].Value.ToString(), out int i))
                {
                    total = total + i;
                    count = count + 1;
                }
            }

            labelTongThanhTien.Text = total.ToString() + " VND";
            labelTongLinhKien.Text = count.ToString() + " linh kiện";
        }
        
        private void btnSua_Click(object sender, EventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if (dataGridView1.Rows.Count == index)
            {
                return;
            }

            ThemLinhKienForm fm = new ThemLinhKienForm(this.connSQL);
            fm.Show();
            fm.Hide();

            DataGridViewRow row = dataGridView1.Rows[index];

            fm.setLoai(row.Cells[3].Value.ToString());
            fm.setMaLinhKien(row.Cells[1].Value.ToString());
            fm.setDonGia(row.Cells[4].Value.ToString());
            fm.setSoLuong(Convert.ToInt32(row.Cells[5].Value.ToString()));
            fm.setBaoHanh(Convert.ToInt32(row.Cells[6].Value.ToString()));
            fm.setKhuyenMai(Convert.ToInt32(row.Cells[7].Value.ToString()));
            fm.setThanhTien(row.Cells[8].Value.ToString());

            fm.ShowDialog();
            if (fm.Success)
            {
                this.updateRow(dataGridView1, fm, index);
                this.reloadTongThanhTien();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if (dataGridView1.Rows.Count == index)
            {
                return;
            }
            if (MessageBox.Show("Bạn có muốn xóa linh kiện STT " + dataGridView1.Rows[index].Cells[0].Value.ToString() + " không?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.removeRow(dataGridView1, index);
                this.reloadTongThanhTien();
                this.reloadButton();
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            this.reloadButton();
        }

        private void reloadButton()
        {
            if (dataGridView1.Rows.Count > 1)
            {
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
            }
            else
            {
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
            }
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
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

            SqlCommand cmd = new SqlCommand("insert into DonDatHang (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan) values (@MaDH, @MaKH, @MaNV, @NgayDatHang, @NgayGiaoHang, @NoiNhan);");
            cmd.Parameters.AddWithValue("@MaDH", maDH);
            cmd.Parameters.AddWithValue("@MaKH", maKH);
            cmd.Parameters.AddWithValue("@MaNV", maNV);
            cmd.Parameters.AddWithValue("@NgayDatHang", NgayDatHang);
            cmd.Parameters.AddWithValue("@NgayGiaoHang", NgayGiaoHang);
            cmd.Parameters.AddWithValue("@NoiNhan", noiNhan);

            if (this.connSQL.Execute(cmd))
            {
                bool check = true;
                for (int i = 0; i < dataGridView1.Rows.Count - 1; i++)
                {
                    DataGridViewRow row = dataGridView1.Rows[i];

                    string maLK = row.Cells[1].Value.ToString();
                    int SoLuong = Convert.ToInt32(row.Cells[5].Value.ToString());
                    int BaoHanh = Convert.ToInt32(row.Cells[6].Value.ToString());
                    int KhuyenMai = Convert.ToInt32(row.Cells[7].Value.ToString());
                    string TongTien = row.Cells[8].Value.ToString();

                    cmd = new SqlCommand("insert into ChiTietDatHang (MaDH, MaLK, SoLuong, BaoHanh, KhuyenMai, TongTien) values (@MaDH, @MaLK, @SoLuong, @BaoHanh, @KhuyenMai, @TongTien);");
                    cmd.Parameters.AddWithValue("@MaDH", maDH);
                    cmd.Parameters.AddWithValue("@MaLK", maLK);
                    cmd.Parameters.AddWithValue("@SoLuong", SoLuong);
                    cmd.Parameters.AddWithValue("@BaoHanh", BaoHanh);
                    cmd.Parameters.AddWithValue("@KhuyenMai", KhuyenMai);
                    cmd.Parameters.AddWithValue("@TongTien", TongTien);

                    if (!this.connSQL.Execute(cmd)) {
                        check = false;
                        break;
                    }
                }

                if (check)
                {
                    MessageBox.Show("Thanh toán thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.btnTaoMoi_Click(sender, e);
                    return;
                }
            }

            MessageBox.Show("Thanh toán thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }
}
