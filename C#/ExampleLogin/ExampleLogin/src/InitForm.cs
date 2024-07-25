using ExampleLogin.src.Library;
using System;
using System.Threading;
using System.Windows.Forms;
using System.Configuration;

namespace ExampleLogin
{
    public partial class InitForm : Form
    {
        public InitForm()
        {
            InitializeComponent();
        }

        private void load()
        {
            this.TopMost = true;
            set("Preparing....");
            update(10);
            
            update(25);
            set("Connecting to server....");

            String connect = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
            String server = ConfigurationManager.ConnectionStrings["server"].ConnectionString;
            String db = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            String user = ConfigurationManager.ConnectionStrings["user"].ConnectionString;
            String passwd = ConfigurationManager.ConnectionStrings["passwd"].ConnectionString;
            String encrypt = ConfigurationManager.ConnectionStrings["encrypt"].ConnectionString;

            SQLToolBox connSQL;
            if (string.IsNullOrEmpty(connect))
            {
                if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(passwd))
                {
                    connSQL = new SQLToolBox(server, db, encrypt);
                }
                else
                {
                    connSQL = new SQLToolBox(server, db, user, passwd, encrypt);
                }
            } else
            {
                connSQL = new SQLToolBox(connect);
            }
            
            connSQL.Connect();
            update(45);
            
            set("Loading form....");
            LoginForm main = new LoginForm(connSQL);
            update(65);
            update(85);

            set("Almost there....");
            update(95);

            update(100);

            this.Hide();
            main.Show();
        }

        private void set(string text)
        {
            this.tbStatus.Text = text;
            this.tbStatus.Refresh();
        }

        private void update(int progress)
        {
            int oldValue = this.progressBar1.Value;
            if (oldValue == 0)
            {
                oldValue = 1;
            }
            for(int i = oldValue; i <= progress; i++)
            {
                this.progressBar1.Value = i;
                this.progressBar1.Value = i - 1;
                this.progressBar1.Refresh();
                Thread.Sleep(25);
            }
            
            if (this.progressBar1.Value == this.progressBar1.Maximum)
            {
                Thread.Sleep(300);
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            this.timer1.Enabled = false;
            this.load();
            
        }
    }
}
