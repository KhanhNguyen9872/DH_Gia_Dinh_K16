namespace ExampleLogin
{
    partial class AboutForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AboutForm));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.tabControlAbout = new System.Windows.Forms.TabControl();
            this.tabAbout = new System.Windows.Forms.TabPage();
            this.tabInfo = new System.Windows.Forms.TabPage();
            this.labelThinh = new System.Windows.Forms.Label();
            this.labelHao = new System.Windows.Forms.Label();
            this.labelThang = new System.Windows.Forms.Label();
            this.labelKhanh = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.tabControlAbout.SuspendLayout();
            this.tabAbout.SuspendLayout();
            this.tabInfo.SuspendLayout();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.InitialImage = null;
            this.pictureBox1.Location = new System.Drawing.Point(92, 6);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(306, 138);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(178, 182);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(162, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Copyright 2024. All right reversed";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(187, 153);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(153, 20);
            this.label2.TabIndex = 2;
            this.label2.Text = "LOW TECH TEAM";
            // 
            // tabControlAbout
            // 
            this.tabControlAbout.Controls.Add(this.tabAbout);
            this.tabControlAbout.Controls.Add(this.tabInfo);
            this.tabControlAbout.Location = new System.Drawing.Point(1, 1);
            this.tabControlAbout.Name = "tabControlAbout";
            this.tabControlAbout.SelectedIndex = 0;
            this.tabControlAbout.Size = new System.Drawing.Size(482, 238);
            this.tabControlAbout.TabIndex = 3;
            // 
            // tabAbout
            // 
            this.tabAbout.BackColor = System.Drawing.Color.White;
            this.tabAbout.Controls.Add(this.pictureBox1);
            this.tabAbout.Controls.Add(this.label1);
            this.tabAbout.Controls.Add(this.label2);
            this.tabAbout.Location = new System.Drawing.Point(4, 22);
            this.tabAbout.Name = "tabAbout";
            this.tabAbout.Padding = new System.Windows.Forms.Padding(3);
            this.tabAbout.Size = new System.Drawing.Size(474, 212);
            this.tabAbout.TabIndex = 0;
            this.tabAbout.Text = "About";
            // 
            // tabInfo
            // 
            this.tabInfo.BackColor = System.Drawing.Color.White;
            this.tabInfo.Controls.Add(this.labelThinh);
            this.tabInfo.Controls.Add(this.labelHao);
            this.tabInfo.Controls.Add(this.labelThang);
            this.tabInfo.Controls.Add(this.labelKhanh);
            this.tabInfo.Controls.Add(this.label4);
            this.tabInfo.Controls.Add(this.label3);
            this.tabInfo.Location = new System.Drawing.Point(4, 22);
            this.tabInfo.Name = "tabInfo";
            this.tabInfo.Padding = new System.Windows.Forms.Padding(3);
            this.tabInfo.Size = new System.Drawing.Size(474, 212);
            this.tabInfo.TabIndex = 1;
            this.tabInfo.Text = "Info";
            // 
            // labelThinh
            // 
            this.labelThinh.AutoSize = true;
            this.labelThinh.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelThinh.Location = new System.Drawing.Point(153, 166);
            this.labelThinh.Name = "labelThinh";
            this.labelThinh.Size = new System.Drawing.Size(94, 17);
            this.labelThinh.TabIndex = 7;
            this.labelThinh.Text = "Vũ Đức Thịnh";
            this.labelThinh.Click += new System.EventHandler(this.labelThinh_Click);
            // 
            // labelHao
            // 
            this.labelHao.AutoSize = true;
            this.labelHao.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelHao.Location = new System.Drawing.Point(153, 128);
            this.labelHao.Name = "labelHao";
            this.labelHao.Size = new System.Drawing.Size(121, 17);
            this.labelHao.TabIndex = 6;
            this.labelHao.Text = "Trương Ngọc Hào";
            this.labelHao.Click += new System.EventHandler(this.labelHao_Click);
            // 
            // labelThang
            // 
            this.labelThang.AutoSize = true;
            this.labelThang.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelThang.Location = new System.Drawing.Point(153, 94);
            this.labelThang.Name = "labelThang";
            this.labelThang.Size = new System.Drawing.Size(140, 17);
            this.labelThang.TabIndex = 5;
            this.labelThang.Text = "Lê Lâm Chiến Thắng";
            this.labelThang.Click += new System.EventHandler(this.labelThang_Click);
            // 
            // labelKhanh
            // 
            this.labelKhanh.AutoSize = true;
            this.labelKhanh.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelKhanh.Location = new System.Drawing.Point(153, 60);
            this.labelKhanh.Name = "labelKhanh";
            this.labelKhanh.Size = new System.Drawing.Size(257, 17);
            this.labelKhanh.TabIndex = 4;
            this.labelKhanh.Text = "Nguyễn Văn Khánh (Nhóm trưởng)";
            this.labelKhanh.Click += new System.EventHandler(this.labelKhanh_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(198, 19);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(76, 20);
            this.label4.TabIndex = 3;
            this.label4.Text = "NHÓM 1";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(42, 57);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(94, 20);
            this.label3.TabIndex = 0;
            this.label3.Text = "Thành viên: ";
            // 
            // AboutForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(483, 238);
            this.Controls.Add(this.tabControlAbout);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximumSize = new System.Drawing.Size(499, 277);
            this.MinimumSize = new System.Drawing.Size(499, 277);
            this.Name = "AboutForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "About | Quản lý linh kiện";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.tabControlAbout.ResumeLayout(false);
            this.tabAbout.ResumeLayout(false);
            this.tabAbout.PerformLayout();
            this.tabInfo.ResumeLayout(false);
            this.tabInfo.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TabControl tabControlAbout;
        private System.Windows.Forms.TabPage tabAbout;
        private System.Windows.Forms.TabPage tabInfo;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label labelThinh;
        private System.Windows.Forms.Label labelHao;
        private System.Windows.Forms.Label labelThang;
        private System.Windows.Forms.Label labelKhanh;
    }
}