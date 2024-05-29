using ExampleLogin.src.Library;
using System;
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
            string email = this.tbEmail.Text;
            string password = this.tbPassword.Text;
            string confirmPass = this.tbConfirmPass.Text;
            string captchaResult = this.tbCaptcha.Text;
            if (string.IsNullOrEmpty(username) || 
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(password) || 
                string.IsNullOrEmpty(confirmPass) ||
                string.IsNullOrEmpty(captchaResult)
                )
            {
                MessageBox.Show("?? Did you forget anything ??", "ERROR", MessageBoxButtons.OK);
                this.captcha.renew();
            }
            else
            {
                if (password == confirmPass)
                {
                    if (this.captcha.verify(Convert.ToInt32(captchaResult)))
                    {
                        if (connSQL.execute("INSERT INTO account (username, password, email) VALUES ('" + username + "', '" + password + "', '" + email + "')"))
                        {
                            MessageBox.Show("Register successfully!", "Successfully", MessageBoxButtons.OK);
                            this.Close();
                        } else
                        {
                            MessageBox.Show("Register failed! Username or email already exists!", "Failed", MessageBoxButtons.OK);
                        }
                    } else
                    {
                        MessageBox.Show("Captcha Error!", "ERROR", MessageBoxButtons.OK);
                        this.captcha.renew();
                    }
                }
                else
                {
                    MessageBox.Show("Confirm password not same!", "WARNING", MessageBoxButtons.OK);
                    this.captcha.renew();
                }
            }
        }
    }
}
