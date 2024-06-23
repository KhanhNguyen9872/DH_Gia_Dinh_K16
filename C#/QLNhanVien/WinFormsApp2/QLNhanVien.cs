using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinFormsApp2
{
    public partial class QLNhanVien : Form
    {
        SqlConnection conn;
        DataTable dt = new DataTable();

        public QLNhanVien(SqlConnection conn)
        {
            InitializeComponent();
            this.conn = conn;
        }

        private void reloadData()
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from ThongTinNhanVien;";

            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;

            dt.Clear();
            adapter.Fill(dt);

            dataGridView1.DataSource = dt;
        }

        private void resetButton()
        {
            txtMaNV.Enabled = true;
            txtMaNV.Text = "";
            txtName.Text = "";
            cbGioiTinh.Text = "";
            dateTimePicker1.ResetText();
            txtChucVu.Text = "";
            txtTienLuong.Text = "";
        }

        private void QLNhanVien_Load(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                this.reloadData();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            txtMaNV.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
            txtName.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
            dateTimePicker1.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();
            cbGioiTinh.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
            txtChucVu.Text = dataGridView1.Rows[index].Cells[4].Value.ToString();
            txtTienLuong.Text = dataGridView1.Rows[index].Cells[5].Value.ToString();
            txtMaNV.Enabled = false;
        }

        private void QLNhanVien_FormClosing(object sender, FormClosingEventArgs e)
        {
            Process.GetProcessById(Process.GetCurrentProcess().Id).Kill();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát không?", "Thoát", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                string maNV = txtMaNV.Text;
                string name = txtName.Text;
                string ngaySinh = dateTimePicker1.Text;
                string gioiTinh = cbGioiTinh.Text;
                string chucVu = txtChucVu.Text;
                string tienLuong = txtTienLuong.Text;

                if (string.IsNullOrEmpty(maNV) || string.IsNullOrEmpty(name) || string.IsNullOrEmpty(gioiTinh) || string.IsNullOrEmpty(chucVu) || string.IsNullOrEmpty(tienLuong))
                {
                    return;
                }
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Insert into ThongTinNhanVien values (@manv, @tennv, @ngaysinh, @gioitinh, @chucvu, @tienluong)";
                cmd.Parameters.AddWithValue("@manv", maNV);
                cmd.Parameters.AddWithValue("@tennv", name);
                cmd.Parameters.AddWithValue("@ngaysinh", ngaySinh);
                cmd.Parameters.AddWithValue("@gioitinh", gioiTinh);
                cmd.Parameters.AddWithValue("@chucvu", chucVu);
                cmd.Parameters.AddWithValue("@tienluong", tienLuong);

                cmd.ExecuteNonQuery();
                this.reloadData();
                this.resetButton();
                MessageBox.Show("Đã thêm thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                string manv = txtMaNV.Text;
                if (string.IsNullOrEmpty(manv))
                {
                    return;
                }
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Delete from ThongTinNhanVien where (manv = @manv)";
                cmd.Parameters.AddWithValue("@manv", manv);

                cmd.ExecuteNonQuery();
                this.reloadData();
                this.resetButton();
                MessageBox.Show("Đã xóa thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                string maNV = txtMaNV.Text;
                string name = txtName.Text;
                string ngaySinh = dateTimePicker1.Text;
                string gioiTinh = cbGioiTinh.Text;
                string chucVu = txtChucVu.Text;
                string tienLuong = txtTienLuong.Text;

                if (string.IsNullOrEmpty(maNV) || string.IsNullOrEmpty(name) || string.IsNullOrEmpty(gioiTinh) || string.IsNullOrEmpty(chucVu) || string.IsNullOrEmpty(tienLuong))
                {
                    return;
                }
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update ThongTinNhanVien set TenNV = @tennv, NgaySinh = @ngaysinh, GioiTinh = @gioitinh, ChucVu = @chucvu, TienLuong = @tienluong where (MaNV = @manv);";
                cmd.Parameters.AddWithValue("@manv", maNV);
                cmd.Parameters.AddWithValue("@tennv", name);
                cmd.Parameters.AddWithValue("@ngaysinh", ngaySinh);
                cmd.Parameters.AddWithValue("@gioitinh", gioiTinh);
                cmd.Parameters.AddWithValue("@chucvu", chucVu);
                cmd.Parameters.AddWithValue("@tienluong", tienLuong);
                cmd.ExecuteNonQuery();
                this.reloadData();
                this.resetButton();
                MessageBox.Show("Đã sửa thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
