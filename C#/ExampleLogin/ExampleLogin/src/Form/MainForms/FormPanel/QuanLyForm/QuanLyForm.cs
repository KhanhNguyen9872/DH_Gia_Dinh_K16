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
    public partial class QuanLyForm : Form
    {
        private SQLToolBox connSQL;
        private KhachHangForm khachHangForm;
        private NhanVienForm nhanVienForm;
        private TaiKhoanForm taiKhoanForm;

        public QuanLyForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;

            this.khachHangForm = new KhachHangForm(this.connSQL);
            this.khachHangForm.TopLevel = false;

            this.nhanVienForm = new NhanVienForm(connSQL);
            this.nhanVienForm.TopLevel = false;

            this.taiKhoanForm = new TaiKhoanForm(connSQL);
            this.taiKhoanForm.TopLevel = false;

            this.tabKhachHang.Controls.Add(this.khachHangForm);
            this.tabNhanVien.Controls.Add(this.nhanVienForm);
            this.tabTaiKhoan.Controls.Add(this.taiKhoanForm);

            this.khachHangForm.Show();
            this.nhanVienForm.Show();
            this.taiKhoanForm.Show();
        }

    }
}
