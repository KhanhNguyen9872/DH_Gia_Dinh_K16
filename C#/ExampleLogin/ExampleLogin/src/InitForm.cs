using System;
using System.Threading;
using System.Windows.Forms;

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
            LoginForm main = new LoginForm();
            update(45);

            set("Loading form....");
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
