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
    public partial class AboutForm : Form
    {
        public AboutForm()
        {
            InitializeComponent();
        }

        private void labelKhanh_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://fb.me/khanh10a1");
        }

        private void labelThang_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://fb.me/sin.shinnosuke.7");
        }

        private void labelHao_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://fb.com/profile.php?id=100021878348576");
        }

        private void labelThinh_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://fb.com/profile.php?id=100044800832586");
        }
    }
}
