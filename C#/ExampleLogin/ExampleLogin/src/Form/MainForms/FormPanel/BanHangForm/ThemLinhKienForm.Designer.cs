namespace ExampleLogin
{
    partial class ThemLinhKienForm
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
            this.btnThem = new System.Windows.Forms.Button();
            this.btnThoat = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBoxMoTa = new System.Windows.Forms.GroupBox();
            this.tbMoTa = new System.Windows.Forms.TextBox();
            this.khuyenMai = new System.Windows.Forms.NumericUpDown();
            this.label9 = new System.Windows.Forms.Label();
            this.baoHanh = new System.Windows.Forms.NumericUpDown();
            this.label8 = new System.Windows.Forms.Label();
            this.cbTenLinhKien = new System.Windows.Forms.ComboBox();
            this.tbMaLinhKien = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.soLuong = new System.Windows.Forms.NumericUpDown();
            this.tbDonGia = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.tbMaLoai = new System.Windows.Forms.TextBox();
            this.cbTenLoai = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.tbThanhTien = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBoxMoTa.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.khuyenMai)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.baoHanh)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.soLuong)).BeginInit();
            this.SuspendLayout();
            // 
            // btnThem
            // 
            this.btnThem.Enabled = false;
            this.btnThem.Location = new System.Drawing.Point(588, 211);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(75, 23);
            this.btnThem.TabIndex = 0;
            this.btnThem.Text = "Thêm";
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // btnThoat
            // 
            this.btnThoat.Location = new System.Drawing.Point(678, 211);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(75, 23);
            this.btnThoat.TabIndex = 1;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.UseVisualStyleBackColor = true;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.groupBoxMoTa);
            this.groupBox1.Controls.Add(this.khuyenMai);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.baoHanh);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.cbTenLinhKien);
            this.groupBox1.Controls.Add(this.tbMaLinhKien);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.soLuong);
            this.groupBox1.Controls.Add(this.tbDonGia);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.tbMaLoai);
            this.groupBox1.Controls.Add(this.cbTenLoai);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(13, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(740, 192);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin linh kiện";
            // 
            // groupBoxMoTa
            // 
            this.groupBoxMoTa.Controls.Add(this.tbMoTa);
            this.groupBoxMoTa.Location = new System.Drawing.Point(498, 19);
            this.groupBoxMoTa.Name = "groupBoxMoTa";
            this.groupBoxMoTa.Size = new System.Drawing.Size(236, 167);
            this.groupBoxMoTa.TabIndex = 18;
            this.groupBoxMoTa.TabStop = false;
            this.groupBoxMoTa.Text = "Mô tả";
            // 
            // tbMoTa
            // 
            this.tbMoTa.BackColor = System.Drawing.SystemColors.Control;
            this.tbMoTa.Location = new System.Drawing.Point(6, 16);
            this.tbMoTa.Multiline = true;
            this.tbMoTa.Name = "tbMoTa";
            this.tbMoTa.ReadOnly = true;
            this.tbMoTa.Size = new System.Drawing.Size(224, 145);
            this.tbMoTa.TabIndex = 0;
            // 
            // khuyenMai
            // 
            this.khuyenMai.Location = new System.Drawing.Point(422, 145);
            this.khuyenMai.Name = "khuyenMai";
            this.khuyenMai.Size = new System.Drawing.Size(56, 20);
            this.khuyenMai.TabIndex = 17;
            this.khuyenMai.ValueChanged += new System.EventHandler(this.khuyenMai_ValueChanged);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(317, 147);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(82, 13);
            this.label9.TabIndex = 16;
            this.label9.Text = "Khuyến mãi (%):";
            // 
            // baoHanh
            // 
            this.baoHanh.Location = new System.Drawing.Point(422, 109);
            this.baoHanh.Maximum = new decimal(new int[] {
            72,
            0,
            0,
            0});
            this.baoHanh.Name = "baoHanh";
            this.baoHanh.Size = new System.Drawing.Size(56, 20);
            this.baoHanh.TabIndex = 15;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(317, 112);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(99, 13);
            this.label8.TabIndex = 14;
            this.label8.Text = "Bảo hành (Tháng): ";
            // 
            // cbTenLinhKien
            // 
            this.cbTenLinhKien.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbTenLinhKien.FormattingEnabled = true;
            this.cbTenLinhKien.Location = new System.Drawing.Point(54, 144);
            this.cbTenLinhKien.Name = "cbTenLinhKien";
            this.cbTenLinhKien.Size = new System.Drawing.Size(245, 21);
            this.cbTenLinhKien.TabIndex = 13;
            this.cbTenLinhKien.SelectedIndexChanged += new System.EventHandler(this.cbTenLinhKien_SelectedIndexChanged);
            // 
            // tbMaLinhKien
            // 
            this.tbMaLinhKien.Location = new System.Drawing.Point(92, 106);
            this.tbMaLinhKien.Name = "tbMaLinhKien";
            this.tbMaLinhKien.ReadOnly = true;
            this.tbMaLinhKien.Size = new System.Drawing.Size(137, 20);
            this.tbMaLinhKien.TabIndex = 12;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(448, 40);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(30, 13);
            this.label7.TabIndex = 11;
            this.label7.Text = "VND";
            // 
            // soLuong
            // 
            this.soLuong.Location = new System.Drawing.Point(422, 70);
            this.soLuong.Name = "soLuong";
            this.soLuong.Size = new System.Drawing.Size(56, 20);
            this.soLuong.TabIndex = 9;
            this.soLuong.ValueChanged += new System.EventHandler(this.soLuong_ValueChanged);
            // 
            // tbDonGia
            // 
            this.tbDonGia.Location = new System.Drawing.Point(353, 35);
            this.tbDonGia.Name = "tbDonGia";
            this.tbDonGia.ReadOnly = true;
            this.tbDonGia.Size = new System.Drawing.Size(89, 20);
            this.tbDonGia.TabIndex = 8;
            this.tbDonGia.Text = "0";
            this.tbDonGia.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(317, 72);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(52, 13);
            this.label6.TabIndex = 7;
            this.label6.Text = "Số lượng:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(300, 40);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(47, 13);
            this.label5.TabIndex = 6;
            this.label5.Text = "Đơn giá:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(19, 147);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 13);
            this.label4.TabIndex = 5;
            this.label4.Text = "Tên:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(19, 109);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(67, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Mã linh kiện:";
            // 
            // tbMaLoai
            // 
            this.tbMaLoai.Location = new System.Drawing.Point(76, 30);
            this.tbMaLoai.Name = "tbMaLoai";
            this.tbMaLoai.ReadOnly = true;
            this.tbMaLoai.Size = new System.Drawing.Size(153, 20);
            this.tbMaLoai.TabIndex = 3;
            // 
            // cbTenLoai
            // 
            this.cbTenLoai.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbTenLoai.FormattingEnabled = true;
            this.cbTenLoai.Location = new System.Drawing.Point(76, 67);
            this.cbTenLoai.Name = "cbTenLoai";
            this.cbTenLoai.Size = new System.Drawing.Size(153, 21);
            this.cbTenLoai.TabIndex = 2;
            this.cbTenLoai.SelectedIndexChanged += new System.EventHandler(this.cbTenLoai_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(19, 70);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(51, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Tên loại: ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(19, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Mã loại:";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(32, 220);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(61, 13);
            this.label10.TabIndex = 3;
            this.label10.Text = "Thành tiền:";
            // 
            // tbThanhTien
            // 
            this.tbThanhTien.Location = new System.Drawing.Point(99, 217);
            this.tbThanhTien.Name = "tbThanhTien";
            this.tbThanhTien.ReadOnly = true;
            this.tbThanhTien.Size = new System.Drawing.Size(108, 20);
            this.tbThanhTien.TabIndex = 4;
            this.tbThanhTien.Text = "0";
            this.tbThanhTien.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(213, 221);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(30, 13);
            this.label11.TabIndex = 12;
            this.label11.Text = "VND";
            // 
            // ThemLinhKienForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(765, 246);
            this.ControlBox = false;
            this.Controls.Add(this.label11);
            this.Controls.Add(this.tbThanhTien);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.btnThem);
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(781, 285);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(781, 285);
            this.Name = "ThemLinhKienForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Thêm linh kiện";
            this.Load += new System.EventHandler(this.ThemLinhKienForm_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBoxMoTa.ResumeLayout(false);
            this.groupBoxMoTa.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.khuyenMai)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.baoHanh)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.soLuong)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Button btnThoat;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tbMaLoai;
        private System.Windows.Forms.ComboBox cbTenLoai;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.NumericUpDown soLuong;
        private System.Windows.Forms.TextBox tbDonGia;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbTenLinhKien;
        private System.Windows.Forms.TextBox tbMaLinhKien;
        private System.Windows.Forms.NumericUpDown khuyenMai;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.NumericUpDown baoHanh;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox tbThanhTien;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.GroupBox groupBoxMoTa;
        private System.Windows.Forms.TextBox tbMoTa;
    }
}