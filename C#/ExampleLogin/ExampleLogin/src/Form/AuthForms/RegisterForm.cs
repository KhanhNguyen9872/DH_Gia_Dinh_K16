using ExampleLogin.src.Library;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class RegisterForm : Form
    {
        private Captcha captcha = null;
        private SQLToolBox connSQL = null;

        public RegisterForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
            this.captcha = new Captcha(lbCaptcha, tbCaptcha);
            this.captcha.renew();
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            string username = this.tbUsername.Text;
            string numberPhone = this.tbSDT.Text;
            string email = this.tbEmail.Text;
            string password = this.tbPassword.Text;
            string confirmPass = this.tbConfirmPass.Text;
            string captchaResult = this.tbCaptcha.Text;
            if (string.IsNullOrEmpty(username) || 
                string.IsNullOrEmpty(numberPhone) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(password) || 
                string.IsNullOrEmpty(confirmPass) ||
                string.IsNullOrEmpty(captchaResult)
                )
            {
                MessageBox.Show("?? Bạn đã quên thứ gì đó đúng không ??", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                this.captcha.renew();
            }
            else
            {
                if (password == confirmPass)
                {
                    if (this.captcha.verify(Convert.ToInt32(captchaResult)))
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO account (username, password, sdt, email) VALUES (@username, @password, @sdt, @email)");
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@sdt", numberPhone);
                        cmd.Parameters.AddWithValue("@email", email);
                        if (connSQL.Execute(cmd))
                        {
                            MessageBox.Show("Đăng ký thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.Close();
                        } else
                        {
                            MessageBox.Show("Đăng ký thất bại!\nTài khoản hoặc email đã tồn tại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    } else
                    {
                        MessageBox.Show("Xác thực sai!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        this.captcha.renew();
                    }
                }
                else
                {
                    MessageBox.Show("Nhập lại mật khẩu không trùng với nhau!", "CẢNH BÁO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.captcha.renew();
                }
            }
        }
    }
}
