using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class RegisterForm : Form
    {
        private Captcha captcha = null;
        public RegisterForm()
        {
            InitializeComponent();
            this.captcha = new Captcha();
            this.lbCaptcha.Text = this.captcha.getString();
            this.tbCaptcha.Text = "";
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
                this.lbCaptcha.Text = this.captcha.getString();
                this.tbCaptcha.Text = "";
            }
            else
            {
                
                if (password == confirmPass)
                {
                    if (Convert.ToInt32(captchaResult) == this.captcha.getResult())
                    {
                        MessageBox.Show("Register successfully!", "Successfully", MessageBoxButtons.OK);
                        this.Close();
                    } else
                    {
                        MessageBox.Show("Captcha Error!", "ERROR", MessageBoxButtons.OK);
                        this.captcha.renew();
                        this.lbCaptcha.Text = this.captcha.getString();
                        this.tbCaptcha.Text = "";
                    }
                }
                else
                {
                    MessageBox.Show("Confirm password not same!", "WARNING", MessageBoxButtons.OK);
                    this.captcha.renew();
                    this.lbCaptcha.Text = this.captcha.getString();
                    this.tbCaptcha.Text = "";
                }
            }
        }
    }
}
