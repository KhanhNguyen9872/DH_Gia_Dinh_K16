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
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void Main_Load(object sender, EventArgs e)
        {

        }

        private void danhsachLopMenu_Click(object sender, EventArgs e)
        {
            DSLop fmLop = new DSLop();
            fmLop.ShowDialog();

        }

        private void ttGiangvienMenu_Click(object sender, EventArgs e)
        {
            DSGiangVien fmGiangvien = new DSGiangVien();
            fmGiangvien.ShowDialog();   
        }

        private void ttSinhvienMenu_Click(object sender, EventArgs e)
        {
            ThongTinSinhVien ttSinhVien = new ThongTinSinhVien();
            ttSinhVien.ShowDialog();
        }

        private void thongtinMonhocMenu_Click(object sender, EventArgs e)
        {
            ThongTinMonHoc ttMonHoc = new ThongTinMonHoc();
            ttMonHoc.ShowDialog();
        }
    }
}
