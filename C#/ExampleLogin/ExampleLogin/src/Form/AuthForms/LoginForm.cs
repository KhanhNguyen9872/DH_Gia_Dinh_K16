using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class LoginForm : Form
    {
        private SQLToolBox connSQL = null;

        public LoginForm()
        {
            InitializeComponent();
            String server = "DESKTOP-UI9AO8H";
            String db = "Nhom1";
            // String user = "root";
            // String passwd = "root";
            this.connSQL = new SQLToolBox(server, db);
            this.connSQL.Connect();
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            this.exitApp();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = this.tbUsername.Text;
            string password = this.tbPassword.Text;
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("?? Bạn đã quên thứ gì đó đúng không ??", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            } else
            {
                SQLTable data = this.connSQL.Select("SELECT username, password FROM account;");
                for(int i = 0; i < data.Count; i++)
                {
                    if ((username.Equals(data.Row(i).Column("username"))) && (password.Equals(data.Row(i).Column("password"))))
                    {
                        this.connSQL.Close();
                        Form main = new MainForm(this.connSQL, username);
                        this.Hide();
                        main.ShowDialog();
                        this.Close();
                        Application.Exit();
                    }
                }                
                MessageBox.Show("Sai tên tài khoản hoặc mật khẩu!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            Form main = new RegisterForm(this.connSQL);
            this.Hide();
            main.ShowDialog();
            this.Show();
        }

        private void lkForgotPass_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Form main = new ForgotPassForm(this.connSQL);
            this.Hide();
            main.ShowDialog();
            this.Show();
        }

        private void cbShowHide_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowHide.Checked)
            {
                tbPassword.PasswordChar = '\0';
            } else
            {
                tbPassword.PasswordChar = '*';
            }
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {
            this.tbUsername.Text = "root";
            this.tbPassword.Text = "root";
        }

        private bool exitApp()
        {
            if (MessageBox.Show("Bạn có muốn thoát không?", "THOÁT CHƯƠNG TRÌNH", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                Library.killPid(Library.getPid());
            }
            return false;
        }

        private void LoginForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (!this.exitApp())
            {
                e.Cancel = true;
            }
        }
    }
}
