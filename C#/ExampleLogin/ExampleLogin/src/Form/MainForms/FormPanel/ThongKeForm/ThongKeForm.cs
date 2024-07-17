using ExampleLogin.src.Library;
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
    public partial class ThongKeForm : Form
    {
        public ThongKeForm(SQLToolBox connSQL)
        {
            InitializeComponent();

            ThongKeDoanhThuForm fm = new ThongKeDoanhThuForm(connSQL);
            fm.TopLevel = false;

            ThongKeLuongForm fmm = new ThongKeLuongForm(connSQL);
            fmm.TopLevel = false;

            this.tabDoanhThu.Controls.Add(fm);
            this.tabLuong.Controls.Add(fmm);

            fm.Show();
            fmm.Show();
        }
    }
}
