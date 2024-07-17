namespace ExampleLogin
{
    partial class ThongKeForm
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
            this.ControlTab = new System.Windows.Forms.TabControl();
            this.tabDoanhThu = new System.Windows.Forms.TabPage();
            this.tabLuong = new System.Windows.Forms.TabPage();
            this.ControlTab.SuspendLayout();
            this.SuspendLayout();
            // 
            // ControlTab
            // 
            this.ControlTab.Controls.Add(this.tabDoanhThu);
            this.ControlTab.Controls.Add(this.tabLuong);
            this.ControlTab.Location = new System.Drawing.Point(2, 1);
            this.ControlTab.MaximumSize = new System.Drawing.Size(938, 446);
            this.ControlTab.MinimumSize = new System.Drawing.Size(938, 446);
            this.ControlTab.Name = "ControlTab";
            this.ControlTab.SelectedIndex = 0;
            this.ControlTab.Size = new System.Drawing.Size(938, 446);
            this.ControlTab.TabIndex = 0;
            // 
            // tabDoanhThu
            // 
            this.tabDoanhThu.Location = new System.Drawing.Point(4, 22);
            this.tabDoanhThu.Name = "tabDoanhThu";
            this.tabDoanhThu.Padding = new System.Windows.Forms.Padding(3);
            this.tabDoanhThu.Size = new System.Drawing.Size(930, 420);
            this.tabDoanhThu.TabIndex = 0;
            this.tabDoanhThu.Text = "Doanh thu";
            this.tabDoanhThu.UseVisualStyleBackColor = true;
            // 
            // tabLuong
            // 
            this.tabLuong.Location = new System.Drawing.Point(4, 22);
            this.tabLuong.Name = "tabLuong";
            this.tabLuong.Padding = new System.Windows.Forms.Padding(3);
            this.tabLuong.Size = new System.Drawing.Size(906, 395);
            this.tabLuong.TabIndex = 1;
            this.tabLuong.Text = "Lương";
            this.tabLuong.UseVisualStyleBackColor = true;
            // 
            // ThongKeForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(938, 445);
            this.ControlBox = false;
            this.Controls.Add(this.ControlTab);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(938, 445);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(938, 445);
            this.Name = "ThongKeForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "ThongKeForm";
            this.ControlTab.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl ControlTab;
        private System.Windows.Forms.TabPage tabDoanhThu;
        private System.Windows.Forms.TabPage tabLuong;
    }
}