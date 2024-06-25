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
    public partial class MainForm : Form
    {
        private Dictionary<Button, Form> listForm = null;
        private SQLToolBox connSQL = null;

        public MainForm(SQLToolBox connSQL, string username)
        {
            InitializeComponent();
            this.listForm = new Dictionary<Button, Form>();
            this.connSQL = connSQL;
            this.labelUsername.Text = username;
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AboutForm fm = new AboutForm();
            fm.Show();
        }

        private void logOutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("You can't log out! Because dev is stupid!\nYou must exit program and log in again!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.exitApp();
        }

        private bool exitApp()
        {
            if (MessageBox.Show("Do you want to exit?", "EXIT", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                Library.killPid(Library.getPid());
            }
            return false;
        }

        private void exitToolStripMenuItem_Click(object sender, FormClosingEventArgs e)
        {
            if (!this.exitApp())
            {
                e.Cancel = true;
            }
        }

        private void reloadChooseOptions(Button btn, Form fm)
        {
            foreach(Button b in this.groupBoxOptions.Controls)
            {
                if (btn == b)
                {
                    b.Enabled = false;
                    b.Font = new Font(b.Font, FontStyle.Bold);
                } else
                {
                    b.Enabled = true;
                    b.Font = new Font(b.Font, FontStyle.Regular);
                }
            }

            foreach(Form f in this.panelForm.Controls)
            {
                if (fm == f)
                {
                    f.Show();
                }
                else
                {
                    f.Hide();
                }
            }
        }

        private void btnOptionBanHang_Click(object sender, EventArgs e)
        {   
            try 
            {
                if (this.listForm[this.btnOptionBanHang] == null)
                {
                    BanHangForm fm = new BanHangForm(this.connSQL);
                    fm.TopLevel = false;
                    fm.Size = new Size(this.panelForm.Width, this.panelForm.Height);
                    this.panelForm.Controls.Add(fm);
                    this.listForm[this.btnOptionBanHang] = fm;
                }
            } catch (Exception ex)
            {
                this.listForm[this.btnOptionBanHang] = null;
                this.btnOptionBanHang_Click(sender, e);
                return;
            }

            this.reloadChooseOptions(this.btnOptionBanHang, this.listForm[this.btnOptionBanHang]);
        }

        private void btnOptionHoadon_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.listForm[this.btnOptionHoadon] == null)
                {
                    HoaDonForm fm = new HoaDonForm(this.connSQL);
                    fm.TopLevel = false;
                    fm.Size = new Size(this.panelForm.Width, this.panelForm.Height);
                    this.panelForm.Controls.Add(fm);
                    this.listForm[this.btnOptionHoadon] = fm;
                }
            } catch (Exception ex)
            {
                this.listForm[this.btnOptionHoadon] = null;
                this.btnOptionHoadon_Click(sender, e);
                return;
            }

            this.reloadChooseOptions(this.btnOptionHoadon, this.listForm[this.btnOptionHoadon]);
        }

        private void btnOptionHanghoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.listForm[this.btnOptionHanghoa] == null)
                {
                    HangHoaForm fm = new HangHoaForm(this.connSQL);
                    fm.TopLevel = false;
                    fm.Size = new Size(this.panelForm.Width, this.panelForm.Height);
                    this.panelForm.Controls.Add(fm);
                    this.listForm[this.btnOptionHanghoa] = fm;
                }
            }
            catch (Exception ex)
            {
                this.listForm[this.btnOptionHanghoa] = null;
                this.btnOptionHanghoa_Click(sender, e);
                return;
            }

            this.reloadChooseOptions(this.btnOptionHanghoa, this.listForm[this.btnOptionHanghoa]);
        }

        private void btnOptionThongke_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.listForm[this.btnOptionThongke] == null)
                {
                    ThongKeForm fm = new ThongKeForm(this.connSQL);
                    fm.TopLevel = false;
                    fm.Size = new Size(this.panelForm.Width, this.panelForm.Height);
                    this.panelForm.Controls.Add(fm);
                    this.listForm[this.btnOptionThongke] = fm;
                }
            }
            catch (Exception ex)
            {
                this.listForm[this.btnOptionThongke] = null;
                this.btnOptionThongke_Click(sender, e);
                return;
            }

            this.reloadChooseOptions(this.btnOptionThongke, this.listForm[this.btnOptionThongke]);
        }

        private void btnOptionKhachhang_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.listForm[this.btnOptionKhachhang] == null)
                {
                    KhachHangForm fm = new KhachHangForm(this.connSQL);
                    fm.TopLevel = false;
                    fm.Size = new Size(this.panelForm.Width, this.panelForm.Height);
                    this.panelForm.Controls.Add(fm);
                    this.listForm[this.btnOptionKhachhang] = fm;
                }
            }
            catch (Exception ex)
            {
                this.listForm[this.btnOptionKhachhang] = null;
                this.btnOptionKhachhang_Click(sender, e);
                return;
            }

            this.reloadChooseOptions(this.btnOptionKhachhang, this.listForm[this.btnOptionKhachhang]);
        }

        private void btnOptionNhanvien_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.listForm[this.btnOptionNhanvien] == null)
                {
                    NhanVienForm fm = new NhanVienForm(this.connSQL);
                    fm.TopLevel = false;
                    fm.Size = new Size(this.panelForm.Width, this.panelForm.Height);
                    this.panelForm.Controls.Add(fm);
                    this.listForm[this.btnOptionNhanvien] = fm;
                }
            }
            catch (Exception ex)
            {
                this.listForm[this.btnOptionNhanvien] = null;
                this.btnOptionNhanvien_Click(sender, e);
                return;
            }

            this.reloadChooseOptions(this.btnOptionNhanvien, this.listForm[this.btnOptionNhanvien]);
        }

        private void btnOptionQuanly_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.listForm[this.btnOptionQuanly] == null)
                {
                    QuanLyForm fm = new QuanLyForm(this.connSQL);
                    fm.TopLevel = false;
                    fm.Size = new Size(this.panelForm.Width, this.panelForm.Height);
                    this.panelForm.Controls.Add(fm);
                    this.listForm[this.btnOptionQuanly] = fm;
                }
            }
            catch (Exception ex)
            {
                this.listForm[this.btnOptionQuanly] = null;
                this.btnOptionQuanly_Click(sender, e);
                return;
            }

            this.reloadChooseOptions(this.btnOptionQuanly, this.listForm[this.btnOptionQuanly]);
        }

        private void MainForm_Load(object sender, EventArgs e)
        {

        }
    }
}
