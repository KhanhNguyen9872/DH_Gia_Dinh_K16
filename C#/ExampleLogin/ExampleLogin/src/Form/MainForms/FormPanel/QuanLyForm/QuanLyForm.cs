using ExampleLogin.src.Library;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class QuanLyForm : Form
    {

        public QuanLyForm(SQLToolBox connSQL, string accountName)
        {
            InitializeComponent();
            bool b = Library.checkAccount(connSQL, accountName);

            KhachHangForm khachHangForm = new KhachHangForm(connSQL);
            khachHangForm.TopLevel = false;

            Form nhanVienForm;
            if (b)
            {
                nhanVienForm = new NhanVienForm(connSQL);
            } else
            {
                nhanVienForm = new DisabledForm();
            }
            nhanVienForm.TopLevel = false;

            Form taiKhoanForm;
            if (b)
            {
                taiKhoanForm = new TaiKhoanForm(connSQL);
            } else
            {
                taiKhoanForm = new DisabledForm();
            }
            taiKhoanForm.TopLevel = false;

            this.tabKhachHang.Controls.Add(khachHangForm);
            this.tabNhanVien.Controls.Add(nhanVienForm);
            this.tabTaiKhoan.Controls.Add(taiKhoanForm);

            khachHangForm.Show();
            nhanVienForm.Show();
            taiKhoanForm.Show();
        } 
    }
}
