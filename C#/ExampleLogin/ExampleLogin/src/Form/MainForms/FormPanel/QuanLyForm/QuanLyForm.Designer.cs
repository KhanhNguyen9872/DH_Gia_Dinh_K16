namespace ExampleLogin
{
    partial class QuanLyForm
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
            this.tabControlQuanLy = new System.Windows.Forms.TabControl();
            this.tabKhachHang = new System.Windows.Forms.TabPage();
            this.tabNhanVien = new System.Windows.Forms.TabPage();
            this.tabTaiKhoan = new System.Windows.Forms.TabPage();
            this.tabControlQuanLy.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControlQuanLy
            // 
            this.tabControlQuanLy.Controls.Add(this.tabKhachHang);
            this.tabControlQuanLy.Controls.Add(this.tabNhanVien);
            this.tabControlQuanLy.Controls.Add(this.tabTaiKhoan);
            this.tabControlQuanLy.Location = new System.Drawing.Point(3, 4);
            this.tabControlQuanLy.MaximumSize = new System.Drawing.Size(932, 435);
            this.tabControlQuanLy.MinimumSize = new System.Drawing.Size(932, 435);
            this.tabControlQuanLy.Name = "tabControlQuanLy";
            this.tabControlQuanLy.SelectedIndex = 0;
            this.tabControlQuanLy.Size = new System.Drawing.Size(932, 435);
            this.tabControlQuanLy.TabIndex = 0;
            // 
            // tabKhachHang
            // 
            this.tabKhachHang.Location = new System.Drawing.Point(4, 22);
            this.tabKhachHang.Name = "tabKhachHang";
            this.tabKhachHang.Padding = new System.Windows.Forms.Padding(3);
            this.tabKhachHang.Size = new System.Drawing.Size(924, 409);
            this.tabKhachHang.TabIndex = 0;
            this.tabKhachHang.Text = "Khách hàng";
            this.tabKhachHang.UseVisualStyleBackColor = true;
            // 
            // tabNhanVien
            // 
            this.tabNhanVien.Location = new System.Drawing.Point(4, 22);
            this.tabNhanVien.Name = "tabNhanVien";
            this.tabNhanVien.Padding = new System.Windows.Forms.Padding(3);
            this.tabNhanVien.Size = new System.Drawing.Size(924, 403);
            this.tabNhanVien.TabIndex = 1;
            this.tabNhanVien.Text = "Nhân viên";
            this.tabNhanVien.UseVisualStyleBackColor = true;
            // 
            // tabTaiKhoan
            // 
            this.tabTaiKhoan.Location = new System.Drawing.Point(4, 22);
            this.tabTaiKhoan.Name = "tabTaiKhoan";
            this.tabTaiKhoan.Padding = new System.Windows.Forms.Padding(3);
            this.tabTaiKhoan.Size = new System.Drawing.Size(924, 403);
            this.tabTaiKhoan.TabIndex = 2;
            this.tabTaiKhoan.Text = "Tài khoản";
            this.tabTaiKhoan.UseVisualStyleBackColor = true;
            // 
            // QuanLyForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(932, 435);
            this.Controls.Add(this.tabControlQuanLy);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximumSize = new System.Drawing.Size(932, 435);
            this.MinimumSize = new System.Drawing.Size(932, 435);
            this.Name = "QuanLyForm";
            this.Text = "QuanLyForm";
            this.tabControlQuanLy.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControlQuanLy;
        private System.Windows.Forms.TabPage tabKhachHang;
        private System.Windows.Forms.TabPage tabNhanVien;
        private System.Windows.Forms.TabPage tabTaiKhoan;
    }
}