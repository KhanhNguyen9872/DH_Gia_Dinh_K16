using Microsoft.VisualBasic.ApplicationServices;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Windows.Forms;

namespace WinFormsApp2
{
    public partial class Login : Form
    {
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-UI9AO8H;Initial Catalog=QLCongty;Integrated Security=True;Encrypt=False");
        DataTable dt = new DataTable();

        public Login()
        {
            InitializeComponent();
        }

        private void reloadData()
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Account;";

            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;

            dt.Clear();
            adapter.Fill(dt);

            dataGridView1.DataSource = dt;
        }

        private void Form1_Load(object sender, EventArgs e)
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

        private void resetButton()
        {
            txtUsername.Enabled = true;
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtType.Text = "";
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                string user = txtUsername.Text;
                string pass = txtPassword.Text;
                string type = txtType.Text;
                if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(pass) || string.IsNullOrEmpty(type))
                {
                    return;
                }
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Insert into Account values (@user, @pass, @type)";
                cmd.Parameters.AddWithValue("@user", user);
                cmd.Parameters.AddWithValue("@pass", pass);
                cmd.Parameters.AddWithValue("@type", type);
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

        private void btnDelete_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                string user = txtUsername.Text;
                if (string.IsNullOrEmpty(user))
                {
                    return;
                }
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Delete from Account where (username = @user)";
                cmd.Parameters.AddWithValue("@user", user);

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

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                string user = txtUsername.Text;
                string password = txtPassword.Text;
                if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(password))
                {
                    return;
                }
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "select username from Account where (username = @user AND password = @password)";
                cmd.Parameters.AddWithValue("@user", user);
                cmd.Parameters.AddWithValue("@password", password);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                cmd.ExecuteNonQuery();

                if (dt.Rows.Count == 1)
                {
                    conn.Close();
                    QLNhanVien fm = new QLNhanVien(this.conn);
                    this.Hide();
                    fm.Show();
                }
                else
                {
                    MessageBox.Show("Đăng nhập thất bại!");
                }
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
            txtUsername.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
            txtPassword.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
            txtType.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();
            txtUsername.Enabled = false;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            conn.Open();
            try
            {
                string user = txtUsername.Text;
                string pass = txtPassword.Text;
                string type = txtType.Text;
                if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(pass) || string.IsNullOrEmpty(type))
                {
                    return;
                }
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update Account set password = @pass, type = @type where (username = @user);";
                cmd.Parameters.AddWithValue("@user", user);
                cmd.Parameters.AddWithValue("@pass", pass);
                cmd.Parameters.AddWithValue("@type", type);
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

        private void cbShowPass_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowPass.Checked)
            {
                txtPassword.PasswordChar = '\0';
            }
            else
            {
                txtPassword.PasswordChar = '*';
            }
        }

        private void Login_FormClosing(object sender, FormClosingEventArgs e)
        {
            Process.GetProcessById(Process.GetCurrentProcess().Id).Kill();
        }
        

    }
}
