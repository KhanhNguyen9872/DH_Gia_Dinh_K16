namespace LTTQBuoi6_QLSV
{
    partial class Main
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
            this.components = new System.ComponentModel.Container();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.contextMenuStrip2 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.thôngTinLớpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.danhsachLopMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.ttGiangvienMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.ttSinhvienMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.thongtinMonhocMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.label1 = new System.Windows.Forms.Label();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // contextMenuStrip2
            // 
            this.contextMenuStrip2.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip2.Name = "contextMenuStrip2";
            this.contextMenuStrip2.Size = new System.Drawing.Size(61, 4);
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.thôngTinLớpToolStripMenuItem,
            this.ttGiangvienMenu,
            this.ttSinhvienMenu,
            this.thongtinMonhocMenu});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Padding = new System.Windows.Forms.Padding(4, 2, 0, 2);
            this.menuStrip1.Size = new System.Drawing.Size(600, 24);
            this.menuStrip1.TabIndex = 2;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // thôngTinLớpToolStripMenuItem
            // 
            this.thôngTinLớpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.danhsachLopMenu});
            this.thôngTinLớpToolStripMenuItem.Name = "thôngTinLớpToolStripMenuItem";
            this.thôngTinLớpToolStripMenuItem.Size = new System.Drawing.Size(90, 20);
            this.thôngTinLớpToolStripMenuItem.Text = "Thông tin lớp";
            // 
            // danhsachLopMenu
            // 
            this.danhsachLopMenu.Name = "danhsachLopMenu";
            this.danhsachLopMenu.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.A)));
            this.danhsachLopMenu.Size = new System.Drawing.Size(193, 22);
            this.danhsachLopMenu.Text = "Danh sach Lop";
            this.danhsachLopMenu.Click += new System.EventHandler(this.danhsachLopMenu_Click);
            // 
            // ttGiangvienMenu
            // 
            this.ttGiangvienMenu.Name = "ttGiangvienMenu";
            this.ttGiangvienMenu.Size = new System.Drawing.Size(129, 20);
            this.ttGiangvienMenu.Text = "Thông tin Giảng viên";
            this.ttGiangvienMenu.Click += new System.EventHandler(this.ttGiangvienMenu_Click);
            // 
            // ttSinhvienMenu
            // 
            this.ttSinhvienMenu.Name = "ttSinhvienMenu";
            this.ttSinhvienMenu.Size = new System.Drawing.Size(121, 20);
            this.ttSinhvienMenu.Text = "Thông tin Sinh viên";
            this.ttSinhvienMenu.Click += new System.EventHandler(this.ttSinhvienMenu_Click);
            // 
            // thongtinMonhocMenu
            // 
            this.thongtinMonhocMenu.Name = "thongtinMonhocMenu";
            this.thongtinMonhocMenu.Size = new System.Drawing.Size(120, 20);
            this.thongtinMonhocMenu.Text = "Thông tin môn học";
            this.thongtinMonhocMenu.Click += new System.EventHandler(this.thongtinMonhocMenu_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(23, 160);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(576, 26);
            this.label1.TabIndex = 3;
            this.label1.Text = "Chào mừng bạn đến với Phần mềm quản lý Sinh viên";
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.menuStrip1);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "Main";
            this.Text = "Main";
            this.Load += new System.EventHandler(this.Main_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip2;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem thôngTinLớpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ttGiangvienMenu;
        private System.Windows.Forms.ToolStripMenuItem ttSinhvienMenu;
        private System.Windows.Forms.ToolStripMenuItem thongtinMonhocMenu;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ToolStripMenuItem danhsachLopMenu;
    }
}