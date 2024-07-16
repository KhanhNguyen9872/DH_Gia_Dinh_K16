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
    public partial class XuatHoaDonForm : Form
    {
        private SQLToolBox connSQL;
        private string MaDH;

        public XuatHoaDonForm(SQLToolBox connSQL, string MaDH)
        {
            InitializeComponent();
            this.connSQL = connSQL;
            this.MaDH = MaDH;

            this.Text = "Xuất hóa đơn | Mã đơn hàng: " + this.MaDH;
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
