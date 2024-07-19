using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class LoginForm : Form
    {
        private SQLToolBox connSQL;
        private bool noAskExit = false;

        public LoginForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.Hide();
            this.connSQL = connSQL;
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            this.exitApp();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = this.tbUsername.Text;
            string password = this.tbPassword.Text;
            foreach (string s in new List<string>() { username, password })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            SqlCommand cmd = new SqlCommand("SELECT username, password, lock FROM account WHERE (username = @username and password = @password);");
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            SQLTable data = this.connSQL.Select(cmd);
            for(int i = 0; i < data.Count; i++)
            {
                if ((username.Equals(data.Row(i).Column("username"))) && (password.Equals(data.Row(i).Column("password"))))
                {
                    if (data.Row(i).Column("lock").Equals("True"))
                    {
                        MessageBox.Show("Tài khoản đã bị khóa!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                    this.connSQL.Close();
                    Form main = new MainForm(this, this.connSQL, username);
                    this.Hide();
                    main.ShowDialog();
                    this.connSQL.Connect();
                    return;
                }
            }
            MessageBox.Show("Sai tên tài khoản hoặc mật khẩu!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            if (this.noAskExit)
            {
                return true;
            }
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
