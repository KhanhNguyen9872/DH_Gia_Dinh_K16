using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using System.Management;
using System.Threading;

namespace ExampleLogin
{
    public partial class MainForm : Form
    {
        private Thread threadUpdateObj = null;
        private Dictionary<Button, Form> listForm = null;
        private Dictionary<Button, Form> bakForm = null;
        private SQLToolBox connSQL = null;
        private LoginForm loginForm = null;
        private bool noAskExit = false;
        private string windowsVersion = null;
        private string cpuName = null;
        private string username;

        // info
        PerformanceCounter cpuCounter = null;
        PerformanceCounter ramCounter = null;

        public MainForm(LoginForm fm, SQLToolBox connSQL, string username)
        {
            InitializeComponent();
            this.listForm = new Dictionary<Button, Form>();
            this.bakForm = new Dictionary<Button, Form>();
            this.loginForm = fm;
            this.connSQL = connSQL;
            this.username = username;
            labelUsername.Text = this.username;
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AboutForm fm = new AboutForm();
            fm.ShowDialog();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.exitApp();
        }

        private bool exitApp()
        {
            if (this.noAskExit)
            {
                this.threadUpdateObj.Abort();
                return true;
            }
            if (MessageBox.Show("Bạn có muốn thoát không?\nMọi công việc chưa lưu sẽ bị hủy!", "THOÁT CHƯƠNG TRÌNH", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
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
            string buttonText = "";
            foreach(Button b in this.groupBoxOptions.Controls)
            {
                if (btn == b)
                {
                    buttonText = b.Text;
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

            this.titlePanel.Text = buttonText;
        }

        public void backToOldForm(Form newForm)
        {
            if (newForm != null)
            {
                Button btn = null;
                foreach (var f in this.listForm)
                {
                    if (f.Value == newForm)
                    {
                        btn = f.Key;
                        break;
                    }
                }

                if (btn == null && this.bakForm[btn] != null)
                {
                    // newForm not in bakForm
                    return;
                }

                this.listForm[btn] = this.bakForm[btn];
                this.bakForm[btn] = null;
                this.panelForm.Controls.Remove(newForm);

                foreach (Form f in this.panelForm.Controls)
                {
                    if (this.listForm[btn] == f)
                    {
                        f.Show();
                    }
                    else
                    {
                        f.Hide();
                    }
                }
            }
        }

        public void switchForm(Form oldForm, Form newForm)
        {
            if (oldForm != null && newForm != null)
            {
                // check what button in listForm
                Button btn = null;
                foreach (var f in this.listForm)
                {
                    if (f.Value == oldForm)
                    {
                        btn = f.Key;
                        break;
                    }
                }

                if (btn == null)
                {
                    // oldForm not in listForm
                    return;
                }

                this.bakForm[btn] = this.listForm[btn];
                this.listForm[btn] = newForm;
                this.panelForm.Controls.Add(newForm);

                foreach (Form f in this.panelForm.Controls)
                {
                    if (newForm == f)
                    {
                        f.Show();
                    }
                    else
                    {
                        f.Hide();
                    }
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
                    DonHangForm fm = new DonHangForm(this.connSQL);
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
                    LinhKienForm fm = new LinhKienForm(this.connSQL, this);
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

        private void btnOptionQuanly_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.listForm[this.btnOptionQuanly] == null)
                {
                    QuanLyForm fm = new QuanLyForm(this.connSQL, this.username);
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
            this.btnOptionBanHang_Click(sender, e);
            this.threadUpdateObj = new Thread(new ThreadStart(update));
            this.threadUpdateObj.Start();
        }

        private void logOutToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn đăng xuất tài khoản không?\nMọi công việc chưa lưu sẽ bị hủy!", "ĐĂNG XUẤT", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.noAskExit = true;
                this.Hide();
                this.loginForm.Show();
                this.Close();
            }
        }

        private void update()
        {
            while (true)
            {
                if (this.cpuCounter == null)
                {
                    // PleaseWaitForm pleaseWaitForm = new PleaseWaitForm("Đang khởi tạo...");
                    // pleaseWaitForm.Show();
                    labelUsername.Text = this.username + "   |   Đang khởi tạo....";
                    Application.DoEvents();
                    this.cpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
                    this.ramCounter = new PerformanceCounter("Memory", "Available MBytes");

                    this.cpuName = "";
                    ManagementObjectSearcher mos = new ManagementObjectSearcher("select Name,Caption from Win32_Processor");
                    foreach (ManagementObject s in mos.Get())
                    {
                        if (this.cpuName.Length == 0)
                        {
                            this.cpuName = this.cpuName + s["Name"].ToString();
                        }
                        else
                        {
                            this.cpuName = this.cpuName + " / " + s["Name"].ToString();
                        }
                    }

                    this.windowsVersion = "";
                    mos = new ManagementObjectSearcher("select Caption,OSArchitecture from Win32_OperatingSystem");
                    foreach (ManagementObject s in mos.Get())
                    {
                        this.windowsVersion = s["Caption"].ToString() + " (" + s["OSArchitecture"].ToString() + ")";
                    }

                    this.windowsVersion = this.windowsVersion.Replace("Microsoft ", "");
                    // pleaseWaitForm.Close();
                }

                lbDateTime.Text = DateTime.Now.ToString();
                labelUsername.Text = this.username + "   |   " + this.windowsVersion + "   |   Available RAM: " + this.ramCounter.NextValue() + " MB   |   " + this.cpuName + "  (Load: " + Math.Round(this.cpuCounter.NextValue(), 2).ToString() + "%)";
                Thread.Sleep(1000);
            }
        }
    }
}
