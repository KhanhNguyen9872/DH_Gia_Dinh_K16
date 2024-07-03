using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class NhanVienForm : Form
    {
        private SQLToolBox connSQL;
        private string tableName = "NhanVien";
        private DataTable dtOld;
        private Thread threadSearch = null;
        

        public NhanVienForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
        }

        private void loadData()
        {
            this.connSQL.Connect();
            SQLTable s = this.connSQL.Select("Select * from " + this.tableName + ";");
            this.connSQL.Close();

            Library.setDataSource(dataGridView1, s.getDataTable());            
            cbTimKiem.Items.Clear();
            cbTimKiem.Items.Add("");

            if (s.Count > 0)
            {
                for (int i = 0; i < s.Row(0).Count; i++)
                {
                    cbTimKiem.Items.Add(s.Row(0).ColumnName(i));
                }

            }

            cbTimKiem.SelectedIndex = 0;
            GC.Collect(0);
        }

        private void QuanLyForm_Load(object sender, EventArgs e)
        {
            this.loadData();

            this.wipeButton();
            this.btnThem.Enabled = true;
            this.btnSua.Enabled = false;
            this.btnXoa.Enabled = false;
            this.tbTenNhanVien.Focus();

            this.generateMaKhachHang();
        }

        private void generateMaKhachHang()
        {
            if (dataGridView1.Rows.Count > 0)
            {
                string maNhanVien = dataGridView1.Rows[dataGridView1.Rows.Count - 2].Cells[dataGridView1.Columns[0].Name].Value.ToString();
                if ((maNhanVien.Length >= 5) && (maNhanVien.StartsWith("NV")))
                {
                    try
                    {
                        int num = Convert.ToInt32(maNhanVien.Substring(2, maNhanVien.Length - 2)) + 1;
                        maNhanVien = "NV";
                        if (num <= 9)
                        {
                            maNhanVien = maNhanVien + "00";
                        }
                        else if (num <= 99)
                        {
                            maNhanVien = maNhanVien + "0";
                        }
                        maNhanVien = maNhanVien + num.ToString();
                        tbMaNhanVien.Text = maNhanVien;
                        tbMaNhanVien.ReadOnly = true;
                    }
                    catch (Exception ex)
                    {
                        tbMaNhanVien.Text = "";
                        tbMaNhanVien.ReadOnly = false;
                    }

                }
                else
                {
                    tbMaNhanVien.Text = "";
                    tbMaNhanVien.ReadOnly = false;
                }
            }
            else
            {
                tbMaNhanVien.Text = "NV000";
                tbMaNhanVien.ReadOnly = true;
            }
        }

        private void wipeButton()
        {
            foreach(TextBox s in new List<TextBox>() { tbMaNhanVien, tbTenNhanVien, tbDiaChi, tbSDT, tbEmail }) {
                s.Text = "";
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if ((dataGridView1.Rows.Count - 1) == index)
            {
                btnThem.Enabled = true;
                btnXoa.Enabled = false;
                btnSua.Enabled = false;
                this.wipeButton();
                this.generateMaKhachHang();
            }
            else
            {
                List<TextBox> list = new List<TextBox>() { tbMaNhanVien, tbTenNhanVien, tbDiaChi, tbSDT, tbEmail };
                for (int i = 0; i < list.Count; i++)
                {
                    list[i].Text = dataGridView1.Rows[index].Cells[i].Value.ToString();
                }

                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnSua.Enabled = true;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            this.connSQL.Connect();
            string maNhanVien = tbMaNhanVien.Text;
            string tenNhanVien = tbTenNhanVien.Text;
            string diaChi = tbDiaChi.Text;
            string sdt = tbSDT.Text;
            string email = tbEmail.Text;
                
            foreach (string s in new List<string>() { maNhanVien, tenNhanVien, diaChi, sdt, email })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            SqlCommand cmd = new SqlCommand("INSERT INTO " + this.tableName + " (MaNV, TenNV, DiaChi, SDT, Email) VALUES (@MaNV, @TenNV, @DiaChi, @SDT, @Email);");
            cmd.Parameters.AddWithValue("@MaNV", maNhanVien);
            cmd.Parameters.AddWithValue("@TenNV", tenNhanVien);
            cmd.Parameters.AddWithValue("@DiaChi", diaChi);
            cmd.Parameters.AddWithValue("@SDT", sdt);
            cmd.Parameters.AddWithValue("@Email", email);

            if (this.connSQL.Execute(cmd))
            {
                this.QuanLyForm_Load(sender, e);
                MessageBox.Show("Thêm nhân viên thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Thêm khách hàng thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            this.connSQL.Close();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string maNV = tbMaNhanVien.Text;
            if (MessageBox.Show("Bạn có muốn xóa nhân viên [" + maNV + "] không?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            this.connSQL.Connect();

            SqlCommand cmd = new SqlCommand("DELETE FROM " + this.tableName + " WHERE (MaNV = @MaNV);");
            cmd.Parameters.AddWithValue("@MaNV", maNV);

            if (this.connSQL.Execute(cmd))
            {
                MessageBox.Show("Xóa nhân viên thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa nhân viên thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            this.QuanLyForm_Load(sender, e);
            this.connSQL.Close();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            this.connSQL.Connect();
            string maNhanVien = tbMaNhanVien.Text;
            string tenNhanVien = tbTenNhanVien.Text;
            string diaChi = tbDiaChi.Text;
            string sdt = tbSDT.Text;
            string email = tbEmail.Text;

            foreach (string s in new List<string>() { maNhanVien, tenNhanVien, diaChi, sdt, email })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }


            SqlCommand cmd = new SqlCommand("UPDATE " + this.tableName + " set TenNV = @TenNV, DiaChi = @DiaChi, SDT = @SDT, Email = @Email WHERE (MaNV = @MaNV);");
            cmd.Parameters.AddWithValue("@MaNV", maNhanVien);
            cmd.Parameters.AddWithValue("@TenNV", tenNhanVien);
            cmd.Parameters.AddWithValue("@DiaChi", diaChi);
            cmd.Parameters.AddWithValue("@SDT", sdt);
            cmd.Parameters.AddWithValue("@Email", email);

            if (this.connSQL.Execute(cmd))
            {
                this.QuanLyForm_Load(sender, e);
                MessageBox.Show("Sửa nhân viên thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa nhân viên thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            this.connSQL.Close();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            tbTimKiem.Text = "";
            this.tbTimKiem_TextChanged(sender, e);
            this.loadData();
        }

        private void tbTimKiem_TextChanged(object sender, EventArgs e)
        {
            this.threadSearch = Library.abortThread(this.threadSearch);

            this.threadSearch = new Thread(new ThreadStart(search));
            this.threadSearch.Start();
            GC.Collect(0);
        }

        private void search()
        {
            this.search(false);
        }

        private void search(bool noWait)
        {
            this.dtOld = Library.searchGridData(dataGridView1, this.dtOld, tbTimKiem, cbTimKiem, noWait, cbUpLowCase.Checked);
        }

        private void cbTimKiem_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tbTimKiem.Text.Length == 0)
            {
                return;
            }
            this.threadSearch = Library.abortThread(this.threadSearch);
            this.search(true);

            // this.tbTimKiem_TextChanged(sender, e);
        }

        private void tbTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Return)
            {
                if (tbTimKiem.Text.Length == 0)
                {
                    return;
                }
                this.threadSearch = Library.abortThread(this.threadSearch);
                this.search(true);
            }
        }

        private void cbUpLowCase_CheckedChanged(object sender, EventArgs e)
        {
            this.cbTimKiem_SelectedIndexChanged(sender, e);
        }
    }
}
