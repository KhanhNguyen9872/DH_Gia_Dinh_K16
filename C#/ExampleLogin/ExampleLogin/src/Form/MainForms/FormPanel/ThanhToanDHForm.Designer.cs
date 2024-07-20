namespace ExampleLogin
{
    partial class ThanhToanDHForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ThanhToanDHForm));
            this.btnQuit = new System.Windows.Forms.Button();
            this.btnSubmit = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.tbNoiDung = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.tbMaPhuongThuc = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.tbTongTien = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tbSoTaiKhoan = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cbPhuongThuc = new System.Windows.Forms.ComboBox();
            this.tbMaDH = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.pictureMaQR = new System.Windows.Forms.PictureBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureMaQR)).BeginInit();
            this.SuspendLayout();
            // 
            // btnQuit
            // 
            this.btnQuit.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.btnQuit.Location = new System.Drawing.Point(535, 250);
            this.btnQuit.Name = "btnQuit";
            this.btnQuit.Size = new System.Drawing.Size(105, 23);
            this.btnQuit.TabIndex = 1;
            this.btnQuit.Text = "Thanh toán sau";
            this.btnQuit.UseVisualStyleBackColor = true;
            this.btnQuit.Click += new System.EventHandler(this.btnQuit_Click);
            // 
            // btnSubmit
            // 
            this.btnSubmit.ForeColor = System.Drawing.Color.Green;
            this.btnSubmit.Location = new System.Drawing.Point(402, 250);
            this.btnSubmit.Name = "btnSubmit";
            this.btnSubmit.Size = new System.Drawing.Size(127, 23);
            this.btnSubmit.TabIndex = 2;
            this.btnSubmit.Text = "Kiểm tra thanh toán";
            this.btnSubmit.UseVisualStyleBackColor = true;
            this.btnSubmit.Click += new System.EventHandler(this.btnSubmit_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 95);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(128, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Phương thức thanh toán: ";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.tbNoiDung);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.tbMaPhuongThuc);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.tbTongTien);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.tbSoTaiKhoan);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.cbPhuongThuc);
            this.groupBox1.Controls.Add(this.tbMaDH);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(326, 261);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin thanh toán";
            // 
            // tbNoiDung
            // 
            this.tbNoiDung.Location = new System.Drawing.Point(92, 193);
            this.tbNoiDung.Multiline = true;
            this.tbNoiDung.Name = "tbNoiDung";
            this.tbNoiDung.Size = new System.Drawing.Size(209, 51);
            this.tbNoiDung.TabIndex = 16;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(22, 196);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(53, 13);
            this.label8.TabIndex = 15;
            this.label8.Text = "Nội dung:";
            // 
            // tbMaPhuongThuc
            // 
            this.tbMaPhuongThuc.Location = new System.Drawing.Point(172, 62);
            this.tbMaPhuongThuc.Name = "tbMaPhuongThuc";
            this.tbMaPhuongThuc.ReadOnly = true;
            this.tbMaPhuongThuc.Size = new System.Drawing.Size(129, 20);
            this.tbMaPhuongThuc.TabIndex = 13;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(19, 65);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(142, 13);
            this.label6.TabIndex = 12;
            this.label6.Text = "Mã phương thức thanh toán:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(274, 161);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(30, 13);
            this.label5.TabIndex = 11;
            this.label5.Text = "VND";
            // 
            // tbTongTien
            // 
            this.tbTongTien.Location = new System.Drawing.Point(129, 158);
            this.tbTongTien.Name = "tbTongTien";
            this.tbTongTien.ReadOnly = true;
            this.tbTongTien.Size = new System.Drawing.Size(139, 20);
            this.tbTongTien.TabIndex = 10;
            this.tbTongTien.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 161);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(100, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "Số tiền thanh toán: ";
            // 
            // tbSoTaiKhoan
            // 
            this.tbSoTaiKhoan.Location = new System.Drawing.Point(103, 124);
            this.tbSoTaiKhoan.Name = "tbSoTaiKhoan";
            this.tbSoTaiKhoan.ReadOnly = true;
            this.tbSoTaiKhoan.Size = new System.Drawing.Size(197, 20);
            this.tbSoTaiKhoan.TabIndex = 8;
            this.tbSoTaiKhoan.Text = "null";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(20, 127);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(73, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Số tài khoản: ";
            // 
            // cbPhuongThuc
            // 
            this.cbPhuongThuc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbPhuongThuc.FormattingEnabled = true;
            this.cbPhuongThuc.Location = new System.Drawing.Point(154, 92);
            this.cbPhuongThuc.Name = "cbPhuongThuc";
            this.cbPhuongThuc.Size = new System.Drawing.Size(147, 21);
            this.cbPhuongThuc.TabIndex = 6;
            this.cbPhuongThuc.SelectedIndexChanged += new System.EventHandler(this.cbPhuongThuc_SelectedIndexChanged);
            // 
            // tbMaDH
            // 
            this.tbMaDH.Location = new System.Drawing.Point(102, 31);
            this.tbMaDH.Name = "tbMaDH";
            this.tbMaDH.ReadOnly = true;
            this.tbMaDH.Size = new System.Drawing.Size(198, 20);
            this.tbMaDH.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(19, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(77, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Mã đơn hàng: ";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.pictureMaQR);
            this.groupBox2.Location = new System.Drawing.Point(345, 13);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(295, 231);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Mã QR";
            // 
            // pictureMaQR
            // 
            this.pictureMaQR.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureMaQR.Image = ((System.Drawing.Image)(resources.GetObject("pictureMaQR.Image")));
            this.pictureMaQR.Location = new System.Drawing.Point(3, 16);
            this.pictureMaQR.Name = "pictureMaQR";
            this.pictureMaQR.Size = new System.Drawing.Size(289, 212);
            this.pictureMaQR.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureMaQR.TabIndex = 0;
            this.pictureMaQR.TabStop = false;
            // 
            // ThanhToanDHForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(652, 285);
            this.ControlBox = false;
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnSubmit);
            this.Controls.Add(this.btnQuit);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ThanhToanDHForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Thanh toán | Mã: DH000";
            this.Load += new System.EventHandler(this.ThanhToanDHForm_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureMaQR)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button btnQuit;
        private System.Windows.Forms.Button btnSubmit;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox tbMaDH;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbPhuongThuc;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox tbSoTaiKhoan;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox tbTongTien;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.PictureBox pictureMaQR;
        private System.Windows.Forms.TextBox tbMaPhuongThuc;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox tbNoiDung;
        private System.Windows.Forms.Label label8;
    }
}