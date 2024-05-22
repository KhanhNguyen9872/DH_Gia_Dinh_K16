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
        public RegisterForm()
        {
            InitializeComponent();
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
            if (string.IsNullOrEmpty(username) || 
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(password) || 
                string.IsNullOrEmpty(confirmPass)
                )
            {
                MessageBox.Show("?? Did you forget anything ??", "ERROR", MessageBoxButtons.OK);
            }
            else
            {
                if (password == confirmPass)
                {
                    MessageBox.Show("Register successfully!", "Successfully", MessageBoxButtons.OK);
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Confirm password not same!", "WARNING", MessageBoxButtons.OK);
                }
            }
        }
    }
}
