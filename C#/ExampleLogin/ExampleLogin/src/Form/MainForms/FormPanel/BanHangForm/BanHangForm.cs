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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;

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
            Library.setComboBox(cbTenNhanVien, this.connSQL.Select(cmd).Row(0).Column(0));
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
            cbTenNhanVien.Items.Clear();
            table = this.connSQL.Select("Select MaNV, TenNV from NhanVien;");
            for (int i = 0; i < table.Count; i++)
            {
                cbMaNhanVien.Items.Add(table.Row(i).Column(0));
                cbTenNhanVien.Items.Add(table.Row(i).Column(1));
            }

            cbMaKhachHang.Items.Clear();
            cbTenKhachHang.Items.Clear();
            table = this.connSQL.Select("Select MaKH, TenKH from KhachHang;");
            for (int i = 0; i < table.Count; i++)
            {
                cbMaKhachHang.Items.Add(table.Row(i).Column(0));
                cbTenKhachHang.Items.Add(table.Row(i).Column(1));
            }

            cbMaNhanVien.SelectedIndex = -1;
            cbMaKhachHang.SelectedIndex = -1;
            cbTenNhanVien.SelectedIndex = -1;
            cbTenKhachHang.SelectedIndex = -1;
        }

        private void deactivate()
        {
            tbNoiNhan.Text = "";
            labelTongThanhTien.Text = "";
            labelTongLinhKien.Text = "";
            cbMaKhachHang.Enabled = false;
            cbTenKhachHang.Enabled = false;
            cbMaNhanVien.Enabled = false;
            cbTenNhanVien.Enabled = false;
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
            cbTenKhachHang.Enabled = true;
            cbMaNhanVien.Enabled = true;
            cbTenNhanVien.Enabled = true;
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
            Library.setComboBox(cbTenKhachHang, this.connSQL.Select(cmd).Row(0).Column(0));
        }

        private void btnTaoMoi_Click(object sender, EventArgs e)
        {
            if (dataGridView1.Enabled)
            {
                if (MessageBox.Show("Bạn có muốn tạo đơn hàng mới không?\nĐơn hàng hiện tại sẽ bị hủy bỏ!", "TẠO ĐƠN HÀNG MỚI", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
                {
                    return;
                }
            }
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
            List<long> lst = this.getTotalMoney(); 

            labelTongThanhTien.Text = lst[0].ToString() + " VND";
            labelTongLinhKien.Text = lst[1].ToString() + " linh kiện";
        }

        private List<long> getTotalMoney() {
            int count = 0;
            long total = 0;

            int columnIndex = dataGridView1.ColumnCount - 1;

            foreach (DataGridViewRow r in dataGridView1.Rows)
            {
                if (r.Cells[columnIndex].Value != null && int.TryParse(r.Cells[columnIndex].Value.ToString(), out int i))
                {
                    total = total + i;
                    count = count + 1;
                }
            }

            return new List<long>() { total, count };
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

            ChoosePTThanhToanForm fm = new ChoosePTThanhToanForm(this.connSQL);
            fm.ShowDialog();
            string maPttt = "";

            if(fm.isSuccess)
            {
                maPttt = fm.getPhuongThucThanhToan();
            } else
            {
                return;
            }

            long tongThanhTien = this.getTotalMoney()[0];

            SqlCommand cmd = new SqlCommand("insert into DonDatHang (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan, TongTien) values (@MaDH, @MaKH, @MaNV, @NgayDatHang, @NgayGiaoHang, @NoiNhan, @TongTien);");
            cmd.Parameters.AddWithValue("@MaDH", maDH);
            cmd.Parameters.AddWithValue("@MaKH", maKH);
            cmd.Parameters.AddWithValue("@MaNV", maNV);
            cmd.Parameters.AddWithValue("@NgayDatHang", NgayDatHang);
            cmd.Parameters.AddWithValue("@NgayGiaoHang", NgayGiaoHang);
            cmd.Parameters.AddWithValue("@NoiNhan", noiNhan);
            cmd.Parameters.AddWithValue("@TongTien", tongThanhTien);

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

                    cmd = new SqlCommand("insert into ChiTietDatHang (MaDH, MaLK, SoLuong, BaoHanh, KhuyenMai, ThanhTien) values (@MaDH, @MaLK, @SoLuong, @BaoHanh, @KhuyenMai, @ThanhTien);");
                    cmd.Parameters.AddWithValue("@MaDH", maDH);
                    cmd.Parameters.AddWithValue("@MaLK", maLK);
                    cmd.Parameters.AddWithValue("@SoLuong", SoLuong);
                    cmd.Parameters.AddWithValue("@BaoHanh", BaoHanh);
                    cmd.Parameters.AddWithValue("@KhuyenMai", KhuyenMai);
                    cmd.Parameters.AddWithValue("@ThanhTien", TongTien);

                    if (!this.connSQL.Execute(cmd)) {
                        check = false;
                        break;
                    }
                }

                if (check)
                {
                    cmd = new SqlCommand("insert into ThongTinThanhToan (MaDH, TinhTrang, MaPhuongThuc) VALUES (@MaDH, 0, @MaPhuongThuc);");
                    cmd.Parameters.AddWithValue("@MaDH", maDH);
                    cmd.Parameters.AddWithValue("@MaPhuongThuc", maPttt);

                    if(this.connSQL.Execute(cmd))
                    {
                        ThanhToanDHForm fmm = new ThanhToanDHForm(this.connSQL, maDH, maPttt, tongThanhTien);
                        fmm.ShowDialog();
                        dataGridView1.Enabled = false;
                        this.btnTaoMoi_Click(sender, e);
                    } else
                    {
                        MessageBox.Show("Đã xảy ra lỗi khi thêm thông tin thanh toán", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    return;
                }
            }

            MessageBox.Show("Thanh toán thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void cbTenNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            SqlCommand cmd = null;
            cmd = new SqlCommand("select MaNV from NhanVien where (TenNV = @TenNV);");
            cmd.Parameters.AddWithValue("@TenNV", cbTenNhanVien.Text);
            Library.setComboBox(cbMaNhanVien, this.connSQL.Select(cmd).Row(0).Column(0));
        }

        private void cbTenKhachHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            SqlCommand cmd = null;
            cmd = new SqlCommand("select MaKH from KhachHang where (TenKH = @TenKH);");
            cmd.Parameters.AddWithValue("@TenKH", cbTenKhachHang.Text);
            Library.setComboBox(cbMaKhachHang, this.connSQL.Select(cmd).Row(0).Column(0));
        }
    }
}
