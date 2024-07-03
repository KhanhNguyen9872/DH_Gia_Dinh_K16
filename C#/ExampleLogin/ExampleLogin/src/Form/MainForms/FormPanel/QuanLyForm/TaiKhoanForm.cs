using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class TaiKhoanForm : Form
    {
        private SQLToolBox connSQL;
        private DataTable dtOld;
        private Thread threadSearch = null;
        private string tableName = "account";

        public TaiKhoanForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
            tbMatKhau.PasswordChar = '*';
        }

        private void loadData()
        {
            this.connSQL.Connect();
            SQLTable s = this.connSQL.Select("Select * from account;");
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
            this.btnSua.Enabled = false;
            this.btnXoa.Enabled = false;
            this.tbTenTaiKhoan.Focus();
        }

        private void wipeButton()
        {
            foreach (TextBox s in new List<TextBox>() { tbTenTaiKhoan, tbMatKhau, tbSDT, tbEmail })
            {
                s.Text = "";
            }

            this.cbQuyenHan.SelectedIndex = 0;
            this.cbTrangThaiTaiKhoan.SelectedIndex = 0;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if ((dataGridView1.Rows.Count - 1) == index)
            {
                tbTenTaiKhoan.ReadOnly = false;
                btnThem.Enabled = true;
                btnXoa.Enabled = false;
                btnSua.Enabled = false;
                this.wipeButton();
            }
            else
            {
                List<TextBox> list = new List<TextBox>() { tbTenTaiKhoan, tbMatKhau, tbSDT, tbEmail };
                for(int i = 0; i < list.Count; i++)
                {
                    list[i].Text = dataGridView1.Rows[index].Cells[i].Value.ToString();
                }

                int type = Convert.ToInt32(dataGridView1.Rows[index].Cells[4].Value);
                if (type == 0)
                {
                    cbQuyenHan.SelectedIndex = 0;
                } else if (type == 1)
                {
                    cbQuyenHan.SelectedIndex = 1;
                } else if (type == -1)
                {
                    cbQuyenHan.Text = "Quản trị";
                }

                if (dataGridView1.Rows[index].Cells[5].Value.ToString().Equals("True"))
                {
                    cbTrangThaiTaiKhoan.SelectedIndex = 1;
                } else
                {
                    cbTrangThaiTaiKhoan.SelectedIndex = 0;
                }
                tbTenTaiKhoan.ReadOnly = true;
                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnSua.Enabled = true;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            this.connSQL.Connect();
            string username = tbTenTaiKhoan.Text;
            string password = tbMatKhau.Text;
            string numberPhone = tbSDT.Text;
            string email = tbEmail.Text;
            string quyenhan = cbQuyenHan.SelectedIndex.ToString();
            string trangthaiStr = cbTrangThaiTaiKhoan.Text;
            int trangthai = 0;
            foreach (string s in new List<string>() { username, password, numberPhone, email, quyenhan, trangthaiStr })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            if (trangthaiStr.Equals("Mở khóa"))
            {
                trangthai = 0;
            } else if (trangthaiStr.Equals("Bị khóa"))
            {
                trangthai = 1;
            }

            SqlCommand cmd = new SqlCommand("INSERT INTO " + this.tableName + " (username, password, sdt, email, type, lock) VALUES (@username, @password, @sdt, @email, @type, @lock);");
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@sdt", numberPhone);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@type", quyenhan);
            cmd.Parameters.AddWithValue("@lock", trangthai.ToString());

            if (this.connSQL.Execute(cmd))
            {
                this.QuanLyForm_Load(sender, e);
                MessageBox.Show("Thêm tài khoản thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Thêm tài khoản thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            this.connSQL.Close();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (this.dataGridView1.Rows.Count == 2)
            {
                MessageBox.Show("Chỉ có một tài khoản!\nKhông thể xóa tài khoản này!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            string username = tbTenTaiKhoan.Text;
            if (MessageBox.Show("Bạn có muốn xóa tài khoản [" + username + "] không?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            this.connSQL.Connect();

            SqlCommand cmd = new SqlCommand("DELETE FROM " + this.tableName + " WHERE (username = @username);");
            cmd.Parameters.AddWithValue("@username", username);

            if (this.connSQL.Execute(cmd))
            {
                MessageBox.Show("Xóa tài khoản thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa tài khoản thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            this.QuanLyForm_Load(sender, e);
            
            this.connSQL.Close();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            this.connSQL.Connect();
            string username = tbTenTaiKhoan.Text;
            string password = tbMatKhau.Text;
            string numberPhone = tbSDT.Text;
            string email = tbEmail.Text;
            string quyenhan = cbQuyenHan.SelectedIndex.ToString();
            string trangthaiStr = cbTrangThaiTaiKhoan.Text;
            int trangthai = 0;
            foreach (string s in new List<string>(){ username, password, numberPhone, email, trangthaiStr })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }
            if (trangthaiStr.Equals("Mở khóa"))
            {
                trangthai = 0;
            }
            else if (trangthaiStr.Equals("Bị khóa"))
            {
                trangthai = 1;
            }

            SqlCommand cmd = new SqlCommand("UPDATE " + this.tableName + " set password = @password, sdt = @sdt, email = @email, type = @type, lock = @lock WHERE (username = @username);");
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@sdt", numberPhone);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@type", quyenhan);
            cmd.Parameters.AddWithValue("@lock", trangthai.ToString());

            if (this.connSQL.Execute(cmd))
            {
                this.QuanLyForm_Load(sender, e);
                MessageBox.Show("Sửa tài khoản thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa tài khoản thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            this.connSQL.Close();
        }

        private void cbHienMatKhau_CheckedChanged(object sender, EventArgs e)
        {
            if (cbHienMatKhau.Checked)
            {
                tbMatKhau.PasswordChar = '\0';
            }
            else
            {
                tbMatKhau.PasswordChar = '*';
            }
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
