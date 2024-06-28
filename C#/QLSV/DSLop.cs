using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LTTQBuoi6_QLSV
{
    public partial class DSLop : Form
    {

        KetNoiCSDL ketnoi = new KetNoiCSDL();
        public DSLop()
        {
            InitializeComponent();
        }

        void loaddata()
        {
            string str = "select * from LOP";
            dataGridView1.DataSource = ketnoi.Execute(str);
        }
        private void DSLop_Load(object sender, EventArgs e)
        {
            loaddata();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string tenlop = txtTenLop.Text;
            string qr = "insert into LOP values (N'" + tenlop + "')";
            ketnoi.ExecuteNonQuery(qr);
            loaddata();
        }
    }
}
