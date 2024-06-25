using ExampleLogin.src.Library;
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
        private SQLToolBox connSQL = null;

        public LoginForm()
        {
            InitializeComponent();
            // String server = "DESKTOP-UI9AO8H";
            String db = "Nhom1";
            // String user = "root";
            // String passwd = "root";
            this.connSQL = new SQLToolBox(db);
            this.connSQL.Connect();
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
                SQLTable data = this.connSQL.Select("SELECT username, password FROM account;");
                for(int i = 0; i < data.Count; i++)
                {
                    if ((username.Equals(data.Row(i).Column("username"))) && (password.Equals(data.Row(i).Column("password"))))
                    {
                        Form main = new MainForm(this.connSQL, username);
                        this.Hide();
                        main.ShowDialog();
                        this.Close();
                        Application.Exit();
                    }
                }                
                MessageBox.Show("Incorrect username or password!");
            }
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
    }
}
