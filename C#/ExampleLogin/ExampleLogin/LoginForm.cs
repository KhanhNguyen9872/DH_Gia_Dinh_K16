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
        public LoginForm()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do you want to exit?", "Confirm", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = this.tbUsername.Text;
            string password = this.tbPassword.Text;
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("?? Did you forget anything ??", "ERROR", MessageBoxButtons.OK);
            } else
            {
                if ((username.Equals("root")) && (password.Equals("root")))
                {
                    MessageBox.Show("Welcome " + username + "!\nClose this window to start program!", "Successfully", MessageBoxButtons.OK);
                    Form main = new MainForm();
                    this.Hide();
                    main.ShowDialog();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Incorrect username or password!");
                }
            }
        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            Form main = new RegisterForm();
            this.Hide();
            main.ShowDialog();
            this.Show();
        }

        private void lkForgotPass_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Form main = new ForgotPassForm();
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
    }
}
