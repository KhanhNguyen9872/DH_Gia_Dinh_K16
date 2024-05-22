using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace ExampleLogin
{
    public partial class ForgotPassForm : Form
    {
        private Captcha captcha = null;
        public ForgotPassForm()
        {
            InitializeComponent();
            this.captcha = new Captcha();
            this.lbCaptcha.Text = this.captcha.getString();
            this.tbCaptcha.Text = "";
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
                this.lbCaptcha.Text = this.captcha.getString();
                this.tbCaptcha.Text = "";
            } else
            {
                if (Convert.ToInt32(captchaResult) == this.captcha.getResult())
                {
                    string password = "";
                    MessageBox.Show("Your password is " + password, "Successfully", MessageBoxButtons.OK);
                    this.Close();
                } else
                {
                    MessageBox.Show("Captcha Error!", "ERROR", MessageBoxButtons.OK);
                    this.captcha.renew();
                    this.lbCaptcha.Text = this.captcha.getString();
                    this.tbCaptcha.Text = "";
                }
            }
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
