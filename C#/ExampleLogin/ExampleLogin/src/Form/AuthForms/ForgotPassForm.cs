using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class ForgotPassForm : Form
    {
        private Captcha captcha = null;
        private SQLToolBox connSQL = null;

        public ForgotPassForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
            this.captcha = new Captcha(this.lbCaptcha, this.tbCaptcha);
            this.captcha.renew();
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = this.tbUsername.Text;
            string numberPhone = this.tbSDT.Text;
            string email = this.tbEmail.Text;
            string captchaResult = this.tbCaptcha.Text;
            if (string.IsNullOrEmpty(username) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(captchaResult)
                )
            {
                MessageBox.Show("?? Bạn đã quên thứ gì đó đúng không ??", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                this.captcha.renew();
            } else
            {
                if (this.captcha.verify(Convert.ToInt32(captchaResult)))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM account WHERE username = @username, sdt = @sdt, email = @email;");
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@sdt", numberPhone);
                    cmd.Parameters.AddWithValue("@email", email);
                    SQLTable data = this.connSQL.Select(cmd);
                    for(int i = 0; i < data.Count; i++)
                    {
                        if (username.Equals(data.Row(i).Column("username")) &&
                            numberPhone.Equals(data.Row(i).Column("sdt")) &&
                            email.Equals(data.Row(i).Column("email"))
                            )
                        {
                            MessageBox.Show("Mật khẩu của bạn là '" + data.Row(i).Column("password") + "'", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.Close();
                            return;
                        }
                    }
                    MessageBox.Show("Thông tin không chính xác", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                } else
                {
                    MessageBox.Show("Xác thực sai!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.captcha.renew();
                }
            }
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
