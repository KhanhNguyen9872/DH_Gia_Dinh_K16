using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class ChangePasswordForm : Form
    {
        private Captcha captcha;
        private SQLToolBox connSQL;

        public ChangePasswordForm(SQLToolBox connSQL, string username)
        {
            InitializeComponent();
            this.tbUsername.Text = username;
            this.connSQL = connSQL;
            this.captcha = new Captcha(lbCaptcha, tbCaptcha);
            this.captcha.renew();
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void ChangePasswordForm_Load(object sender, EventArgs e)
        {
            this.tbOldPassword.Focus();
        }

        private void cbShowOldPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowOldPassword.Checked)
            {
                tbOldPassword.PasswordChar = '\0';
            }
            else
            {
                tbOldPassword.PasswordChar = '*';
            }
        }

        private void cbShowNewPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowNewPassword.Checked)
            {
                tbNewPassword.PasswordChar = '\0';
                tbReNewPassword.PasswordChar = '\0';
            }
            else
            {
                tbNewPassword.PasswordChar = '*';
                tbReNewPassword.PasswordChar = '*';
            }
        }

        private void wipeInput()
        {
            tbOldPassword.Text = "";
            tbNewPassword.Text = "";
            tbReNewPassword.Text = "";
            tbCaptcha.Text = "";
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            string oldPassword = tbOldPassword.Text;
            string newPassword = tbNewPassword.Text;
            string reNewPassword = tbReNewPassword.Text;

            foreach(string s in new List<string>() { oldPassword, newPassword, reNewPassword })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Thông tin không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.captcha.renew();
                    return;
                }
            }

            if (newPassword.Equals(reNewPassword))
            {
                try
                {
                    if (this.captcha.verify(Convert.ToInt32(tbCaptcha.Text)))
                    {
                        if (!this.connSQL.State()) this.connSQL.Connect();

                        SqlCommand cmd = new SqlCommand("select password from account where (username = @username);");
                        cmd.Parameters.AddWithValue("@username", tbUsername.Text);

                        string password = this.connSQL.Select(cmd).Row(0).Column(0);

                        if (oldPassword.Equals(password))
                        {
                            cmd = new SqlCommand("update account set password = @password where (username = @username);");
                            cmd.Parameters.AddWithValue("@password", newPassword);
                            cmd.Parameters.AddWithValue("@username", tbUsername.Text);

                            if (this.connSQL.Execute(cmd))
                            {
                                MessageBox.Show("Đã thay đổi mật khẩu!\nĐăng nhập lại sẽ có hiệu lực!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                this.btnQuit_Click(sender, e);
                                return;
                            }
                            else
                            {
                                MessageBox.Show("Thay đổi mật khẩu thất bại!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                        }
                        else
                        {
                            MessageBox.Show("Mật khẩu cũ không chính xác!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Xác minh sai!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                } catch (Exception ex)
                {
                    MessageBox.Show("Xác minh sai!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            } else
            {
                MessageBox.Show("Hai mật khẩu mới không trùng nhau!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            this.wipeInput();
            this.captcha.renew();
        }
    }
}
