namespace ExampleLogin
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.hệThốngToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.logOutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.giớiThiệuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBoxOptions = new System.Windows.Forms.GroupBox();
            this.btnOptionQuanly = new System.Windows.Forms.Button();
            this.btnOptionNhanvien = new System.Windows.Forms.Button();
            this.btnOptionKhachhang = new System.Windows.Forms.Button();
            this.btnOptionThongke = new System.Windows.Forms.Button();
            this.btnOptionHanghoa = new System.Windows.Forms.Button();
            this.btnOptionHoadon = new System.Windows.Forms.Button();
            this.btnOptionBanHang = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.labelVersion = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.labelUsername = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panelForm = new System.Windows.Forms.Panel();
            this.titlePanel = new System.Windows.Forms.GroupBox();
            this.menuStrip1.SuspendLayout();
            this.groupBoxOptions.SuspendLayout();
            this.panel1.SuspendLayout();
            this.titlePanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.hệThốngToolStripMenuItem,
            this.giớiThiệuToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.MaximumSize = new System.Drawing.Size(924, 24);
            this.menuStrip1.MinimumSize = new System.Drawing.Size(924, 24);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.menuStrip1.Size = new System.Drawing.Size(924, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // hệThốngToolStripMenuItem
            // 
            this.hệThốngToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.logOutToolStripMenuItem,
            this.exitToolStripMenuItem});
            this.hệThốngToolStripMenuItem.Name = "hệThốngToolStripMenuItem";
            this.hệThốngToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.hệThốngToolStripMenuItem.Text = "File";
            // 
            // logOutToolStripMenuItem
            // 
            this.logOutToolStripMenuItem.Name = "logOutToolStripMenuItem";
            this.logOutToolStripMenuItem.Size = new System.Drawing.Size(115, 22);
            this.logOutToolStripMenuItem.Text = "Log out";
            this.logOutToolStripMenuItem.Click += new System.EventHandler(this.logOutToolStripMenuItem_Click);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(115, 22);
            this.exitToolStripMenuItem.Text = "Exit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // giớiThiệuToolStripMenuItem
            // 
            this.giớiThiệuToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
            this.giớiThiệuToolStripMenuItem.Name = "giớiThiệuToolStripMenuItem";
            this.giớiThiệuToolStripMenuItem.Size = new System.Drawing.Size(44, 20);
            this.giớiThiệuToolStripMenuItem.Text = "Help";
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(107, 22);
            this.aboutToolStripMenuItem.Text = "About";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // groupBoxOptions
            // 
            this.groupBoxOptions.Controls.Add(this.btnOptionQuanly);
            this.groupBoxOptions.Controls.Add(this.btnOptionNhanvien);
            this.groupBoxOptions.Controls.Add(this.btnOptionKhachhang);
            this.groupBoxOptions.Controls.Add(this.btnOptionThongke);
            this.groupBoxOptions.Controls.Add(this.btnOptionHanghoa);
            this.groupBoxOptions.Controls.Add(this.btnOptionHoadon);
            this.groupBoxOptions.Controls.Add(this.btnOptionBanHang);
            this.groupBoxOptions.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBoxOptions.Location = new System.Drawing.Point(12, 27);
            this.groupBoxOptions.Name = "groupBoxOptions";
            this.groupBoxOptions.Size = new System.Drawing.Size(108, 434);
            this.groupBoxOptions.TabIndex = 1;
            this.groupBoxOptions.TabStop = false;
            this.groupBoxOptions.Text = "Mục";
            // 
            // btnOptionQuanly
            // 
            this.btnOptionQuanly.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOptionQuanly.Location = new System.Drawing.Point(6, 325);
            this.btnOptionQuanly.MaximumSize = new System.Drawing.Size(96, 45);
            this.btnOptionQuanly.MinimumSize = new System.Drawing.Size(96, 45);
            this.btnOptionQuanly.Name = "btnOptionQuanly";
            this.btnOptionQuanly.Size = new System.Drawing.Size(96, 45);
            this.btnOptionQuanly.TabIndex = 6;
            this.btnOptionQuanly.Text = "Quản lý";
            this.btnOptionQuanly.UseVisualStyleBackColor = true;
            this.btnOptionQuanly.Click += new System.EventHandler(this.btnOptionQuanly_Click);
            // 
            // btnOptionNhanvien
            // 
            this.btnOptionNhanvien.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOptionNhanvien.Location = new System.Drawing.Point(6, 274);
            this.btnOptionNhanvien.MaximumSize = new System.Drawing.Size(96, 45);
            this.btnOptionNhanvien.MinimumSize = new System.Drawing.Size(96, 45);
            this.btnOptionNhanvien.Name = "btnOptionNhanvien";
            this.btnOptionNhanvien.Size = new System.Drawing.Size(96, 45);
            this.btnOptionNhanvien.TabIndex = 5;
            this.btnOptionNhanvien.Text = "Nhân viên";
            this.btnOptionNhanvien.UseVisualStyleBackColor = true;
            this.btnOptionNhanvien.Click += new System.EventHandler(this.btnOptionNhanvien_Click);
            // 
            // btnOptionKhachhang
            // 
            this.btnOptionKhachhang.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOptionKhachhang.Location = new System.Drawing.Point(6, 223);
            this.btnOptionKhachhang.MaximumSize = new System.Drawing.Size(96, 45);
            this.btnOptionKhachhang.MinimumSize = new System.Drawing.Size(96, 45);
            this.btnOptionKhachhang.Name = "btnOptionKhachhang";
            this.btnOptionKhachhang.Size = new System.Drawing.Size(96, 45);
            this.btnOptionKhachhang.TabIndex = 4;
            this.btnOptionKhachhang.Text = "Khách hàng";
            this.btnOptionKhachhang.UseVisualStyleBackColor = true;
            this.btnOptionKhachhang.Click += new System.EventHandler(this.btnOptionKhachhang_Click);
            // 
            // btnOptionThongke
            // 
            this.btnOptionThongke.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOptionThongke.Location = new System.Drawing.Point(6, 172);
            this.btnOptionThongke.MaximumSize = new System.Drawing.Size(96, 45);
            this.btnOptionThongke.MinimumSize = new System.Drawing.Size(96, 45);
            this.btnOptionThongke.Name = "btnOptionThongke";
            this.btnOptionThongke.Size = new System.Drawing.Size(96, 45);
            this.btnOptionThongke.TabIndex = 3;
            this.btnOptionThongke.Text = "Thống kê";
            this.btnOptionThongke.UseVisualStyleBackColor = true;
            this.btnOptionThongke.Click += new System.EventHandler(this.btnOptionThongke_Click);
            // 
            // btnOptionHanghoa
            // 
            this.btnOptionHanghoa.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOptionHanghoa.Location = new System.Drawing.Point(6, 121);
            this.btnOptionHanghoa.MaximumSize = new System.Drawing.Size(96, 45);
            this.btnOptionHanghoa.MinimumSize = new System.Drawing.Size(96, 45);
            this.btnOptionHanghoa.Name = "btnOptionHanghoa";
            this.btnOptionHanghoa.Size = new System.Drawing.Size(96, 45);
            this.btnOptionHanghoa.TabIndex = 2;
            this.btnOptionHanghoa.Text = "Hàng hóa";
            this.btnOptionHanghoa.UseVisualStyleBackColor = true;
            this.btnOptionHanghoa.Click += new System.EventHandler(this.btnOptionHanghoa_Click);
            // 
            // btnOptionHoadon
            // 
            this.btnOptionHoadon.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOptionHoadon.Location = new System.Drawing.Point(6, 70);
            this.btnOptionHoadon.MaximumSize = new System.Drawing.Size(96, 45);
            this.btnOptionHoadon.MinimumSize = new System.Drawing.Size(96, 45);
            this.btnOptionHoadon.Name = "btnOptionHoadon";
            this.btnOptionHoadon.Size = new System.Drawing.Size(96, 45);
            this.btnOptionHoadon.TabIndex = 1;
            this.btnOptionHoadon.Text = "Hóa đơn";
            this.btnOptionHoadon.UseVisualStyleBackColor = true;
            this.btnOptionHoadon.Click += new System.EventHandler(this.btnOptionHoadon_Click);
            // 
            // btnOptionBanHang
            // 
            this.btnOptionBanHang.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOptionBanHang.Location = new System.Drawing.Point(6, 19);
            this.btnOptionBanHang.MaximumSize = new System.Drawing.Size(96, 45);
            this.btnOptionBanHang.MinimumSize = new System.Drawing.Size(96, 45);
            this.btnOptionBanHang.Name = "btnOptionBanHang";
            this.btnOptionBanHang.Size = new System.Drawing.Size(96, 45);
            this.btnOptionBanHang.TabIndex = 0;
            this.btnOptionBanHang.Text = "Bán hàng";
            this.btnOptionBanHang.UseVisualStyleBackColor = true;
            this.btnOptionBanHang.Click += new System.EventHandler(this.btnOptionBanHang_Click);
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.labelVersion);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.labelUsername);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(0, 467);
            this.panel1.MaximumSize = new System.Drawing.Size(924, 33);
            this.panel1.MinimumSize = new System.Drawing.Size(924, 33);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(924, 33);
            this.panel1.TabIndex = 2;
            // 
            // labelVersion
            // 
            this.labelVersion.AutoSize = true;
            this.labelVersion.Location = new System.Drawing.Point(888, 7);
            this.labelVersion.Name = "labelVersion";
            this.labelVersion.Size = new System.Drawing.Size(31, 13);
            this.labelVersion.TabIndex = 3;
            this.labelVersion.Text = "1.0.0";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(846, 7);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(48, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Version: ";
            // 
            // labelUsername
            // 
            this.labelUsername.AutoSize = true;
            this.labelUsername.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelUsername.Location = new System.Drawing.Point(71, 7);
            this.labelUsername.Name = "labelUsername";
            this.labelUsername.Size = new System.Drawing.Size(33, 17);
            this.labelUsername.TabIndex = 1;
            this.labelUsername.Text = "root";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(9, 7);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Account: ";
            // 
            // panelForm
            // 
            this.panelForm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelForm.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panelForm.Location = new System.Drawing.Point(3, 19);
            this.panelForm.MaximumSize = new System.Drawing.Size(784, 412);
            this.panelForm.MinimumSize = new System.Drawing.Size(784, 412);
            this.panelForm.Name = "panelForm";
            this.panelForm.Size = new System.Drawing.Size(784, 412);
            this.panelForm.TabIndex = 3;
            // 
            // titlePanel
            // 
            this.titlePanel.Controls.Add(this.panelForm);
            this.titlePanel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.titlePanel.Location = new System.Drawing.Point(130, 27);
            this.titlePanel.Name = "titlePanel";
            this.titlePanel.Size = new System.Drawing.Size(790, 434);
            this.titlePanel.TabIndex = 4;
            this.titlePanel.TabStop = false;
            this.titlePanel.Text = "Title";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(924, 496);
            this.Controls.Add(this.titlePanel);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.groupBoxOptions);
            this.Controls.Add(this.menuStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(940, 535);
            this.MinimumSize = new System.Drawing.Size(940, 535);
            this.Name = "MainForm";
            this.Text = "ExampleLogin";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.exitToolStripMenuItem_Click);
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.groupBoxOptions.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.titlePanel.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem hệThốngToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem giớiThiệuToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem logOutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.GroupBox groupBoxOptions;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label labelVersion;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label labelUsername;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnOptionBanHang;
        private System.Windows.Forms.Button btnOptionQuanly;
        private System.Windows.Forms.Button btnOptionNhanvien;
        private System.Windows.Forms.Button btnOptionKhachhang;
        private System.Windows.Forms.Button btnOptionThongke;
        private System.Windows.Forms.Button btnOptionHanghoa;
        private System.Windows.Forms.Button btnOptionHoadon;
        private System.Windows.Forms.Panel panelForm;
        private System.Windows.Forms.GroupBox titlePanel;
    }
}