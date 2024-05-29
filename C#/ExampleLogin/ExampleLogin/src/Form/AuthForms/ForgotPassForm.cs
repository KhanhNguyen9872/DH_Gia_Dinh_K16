using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
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
            string email = this.tbEmail.Text;
            string captchaResult = this.tbCaptcha.Text;
            if (string.IsNullOrEmpty(username) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(captchaResult)
                )
            {
                MessageBox.Show("?? Did you forget anything ??", "ERROR", MessageBoxButtons.OK);
                this.captcha.renew();
            } else
            {
                if (this.captcha.verify(Convert.ToInt32(captchaResult)))
                {
                    SQLTable data = this.connSQL.Select("SELECT username, password, email FROM account WHERE username='" + username + "' AND email='" + email + "';");
                    for(int i = 0; i < data.Count; i++)
                    {
                        if (username.Equals(data.Row(i).Column("username")) && email.Equals(data.Row(i).Column("email")))
                        {
                            MessageBox.Show("Your password is '" + data.Row(i).Column("password") + "'", "Successfully", MessageBoxButtons.OK);
                            this.Close();
                            return;
                        }
                    }
                    MessageBox.Show("Wrong info", "ERROR", MessageBoxButtons.OK);
                } else
                {
                    MessageBox.Show("Captcha Error!", "ERROR", MessageBoxButtons.OK);
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
