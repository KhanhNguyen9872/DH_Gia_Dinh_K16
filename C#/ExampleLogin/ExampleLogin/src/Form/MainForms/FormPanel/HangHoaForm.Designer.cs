namespace ExampleLogin
{
    partial class HangHoaForm
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnLamMoi = new System.Windows.Forms.Button();
            this.btnXoa = new System.Windows.Forms.Button();
            this.btnSua = new System.Windows.Forms.Button();
            this.btnThem = new System.Windows.Forms.Button();
            this.tbMoTa = new System.Windows.Forms.TextBox();
            this.numKhuyenMai = new System.Windows.Forms.NumericUpDown();
            this.numBaoHanh = new System.Windows.Forms.NumericUpDown();
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.cbNhaCungCap = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.tbGia = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tbMaLinhKien = new System.Windows.Forms.TextBox();
            this.tbTenMatHang = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.tbMaMatHang = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cbNhomLinhKien = new System.Windows.Forms.ComboBox();
            this.lbNhomLinhKien = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.cbLoc = new System.Windows.Forms.ComboBox();
            this.label11 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numKhuyenMai)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numBaoHanh)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnLamMoi);
            this.groupBox1.Controls.Add(this.btnXoa);
            this.groupBox1.Controls.Add(this.btnSua);
            this.groupBox1.Controls.Add(this.btnThem);
            this.groupBox1.Controls.Add(this.tbMoTa);
            this.groupBox1.Controls.Add(this.numKhuyenMai);
            this.groupBox1.Controls.Add(this.numBaoHanh);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.cbNhaCungCap);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.tbGia);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.tbMaLinhKien);
            this.groupBox1.Controls.Add(this.tbTenMatHang);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.tbMaMatHang);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.cbNhomLinhKien);
            this.groupBox1.Controls.Add(this.lbNhomLinhKien);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(309, 421);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin linh kiện";
            // 
            // btnLamMoi
            // 
            this.btnLamMoi.Location = new System.Drawing.Point(11, 341);
            this.btnLamMoi.Name = "btnLamMoi";
            this.btnLamMoi.Size = new System.Drawing.Size(75, 26);
            this.btnLamMoi.TabIndex = 25;
            this.btnLamMoi.Text = "Làm mới";
            this.btnLamMoi.UseVisualStyleBackColor = true;
            this.btnLamMoi.Click += new System.EventHandler(this.btnLamMoi_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.Location = new System.Drawing.Point(220, 381);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(75, 23);
            this.btnXoa.TabIndex = 24;
            this.btnXoa.Text = "Xóa";
            this.btnXoa.UseVisualStyleBackColor = true;
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // btnSua
            // 
            this.btnSua.Location = new System.Drawing.Point(118, 381);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(75, 23);
            this.btnSua.TabIndex = 23;
            this.btnSua.Text = "Sửa";
            this.btnSua.UseVisualStyleBackColor = true;
            this.btnSua.Click += new System.EventHandler(this.btnSua_Click);
            // 
            // btnThem
            // 
            this.btnThem.Location = new System.Drawing.Point(11, 381);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(75, 23);
            this.btnThem.TabIndex = 22;
            this.btnThem.Text = "Thêm";
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // tbMoTa
            // 
            this.tbMoTa.Location = new System.Drawing.Point(104, 264);
            this.tbMoTa.Multiline = true;
            this.tbMoTa.Name = "tbMoTa";
            this.tbMoTa.Size = new System.Drawing.Size(191, 103);
            this.tbMoTa.TabIndex = 21;
            // 
            // numKhuyenMai
            // 
            this.numKhuyenMai.Location = new System.Drawing.Point(244, 229);
            this.numKhuyenMai.Name = "numKhuyenMai";
            this.numKhuyenMai.Size = new System.Drawing.Size(51, 20);
            this.numKhuyenMai.TabIndex = 20;
            // 
            // numBaoHanh
            // 
            this.numBaoHanh.Location = new System.Drawing.Point(104, 229);
            this.numBaoHanh.Maximum = new decimal(new int[] {
            72,
            0,
            0,
            0});
            this.numBaoHanh.Name = "numBaoHanh";
            this.numBaoHanh.Size = new System.Drawing.Size(47, 20);
            this.numBaoHanh.TabIndex = 19;
            this.numBaoHanh.Value = new decimal(new int[] {
            12,
            0,
            0,
            0});
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(16, 264);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(40, 13);
            this.label9.TabIndex = 18;
            this.label9.Text = "Mô tả: ";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(170, 231);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(68, 13);
            this.label8.TabIndex = 16;
            this.label8.Text = "Khuyến mãi: ";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(16, 229);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(59, 13);
            this.label7.TabIndex = 14;
            this.label7.Text = "Bảo hành: ";
            // 
            // cbNhaCungCap
            // 
            this.cbNhaCungCap.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbNhaCungCap.FormattingEnabled = true;
            this.cbNhaCungCap.Location = new System.Drawing.Point(107, 192);
            this.cbNhaCungCap.Name = "cbNhaCungCap";
            this.cbNhaCungCap.Size = new System.Drawing.Size(188, 21);
            this.cbNhaCungCap.TabIndex = 13;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(16, 195);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(81, 13);
            this.label6.TabIndex = 12;
            this.label6.Text = "Nhà cung cấp: ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(244, 164);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(30, 13);
            this.label5.TabIndex = 11;
            this.label5.Text = "VND";
            // 
            // tbGia
            // 
            this.tbGia.Location = new System.Drawing.Point(105, 161);
            this.tbGia.Name = "tbGia";
            this.tbGia.Size = new System.Drawing.Size(133, 20);
            this.tbGia.TabIndex = 10;
            this.tbGia.Text = "0";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 164);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "Giá: ";
            // 
            // tbMaLinhKien
            // 
            this.tbMaLinhKien.Location = new System.Drawing.Point(105, 61);
            this.tbMaLinhKien.Name = "tbMaLinhKien";
            this.tbMaLinhKien.ReadOnly = true;
            this.tbMaLinhKien.Size = new System.Drawing.Size(190, 20);
            this.tbMaLinhKien.TabIndex = 8;
            // 
            // tbTenMatHang
            // 
            this.tbTenMatHang.Location = new System.Drawing.Point(105, 128);
            this.tbTenMatHang.Name = "tbTenMatHang";
            this.tbTenMatHang.Size = new System.Drawing.Size(190, 20);
            this.tbTenMatHang.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 131);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(79, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Tên mặt hàng: ";
            // 
            // tbMaMatHang
            // 
            this.tbMaMatHang.Location = new System.Drawing.Point(105, 92);
            this.tbMaMatHang.Name = "tbMaMatHang";
            this.tbMaMatHang.ReadOnly = true;
            this.tbMaMatHang.Size = new System.Drawing.Size(190, 20);
            this.tbMaMatHang.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 64);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Mã linh kiện: ";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 95);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Mã mặt hàng: ";
            // 
            // cbNhomLinhKien
            // 
            this.cbNhomLinhKien.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbNhomLinhKien.FormattingEnabled = true;
            this.cbNhomLinhKien.Location = new System.Drawing.Point(105, 30);
            this.cbNhomLinhKien.Name = "cbNhomLinhKien";
            this.cbNhomLinhKien.Size = new System.Drawing.Size(190, 21);
            this.cbNhomLinhKien.TabIndex = 1;
            this.cbNhomLinhKien.SelectedIndexChanged += new System.EventHandler(this.cbNhomLinhKien_SelectedIndexChanged);
            // 
            // lbNhomLinhKien
            // 
            this.lbNhomLinhKien.AutoSize = true;
            this.lbNhomLinhKien.Location = new System.Drawing.Point(16, 33);
            this.lbNhomLinhKien.Name = "lbNhomLinhKien";
            this.lbNhomLinhKien.Size = new System.Drawing.Size(83, 13);
            this.lbNhomLinhKien.TabIndex = 0;
            this.lbNhomLinhKien.Text = "Nhóm linh kiện: ";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.cbLoc);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Controls.Add(this.textBox1);
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.dataGridView1);
            this.groupBox2.Location = new System.Drawing.Point(340, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(586, 421);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Danh sách linh kiện";
            // 
            // cbLoc
            // 
            this.cbLoc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbLoc.FormattingEnabled = true;
            this.cbLoc.Location = new System.Drawing.Point(409, 386);
            this.cbLoc.Name = "cbLoc";
            this.cbLoc.Size = new System.Drawing.Size(156, 21);
            this.cbLoc.TabIndex = 4;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(372, 391);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(31, 13);
            this.label11.TabIndex = 3;
            this.label11.Text = "Lọc: ";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(78, 386);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(273, 20);
            this.textBox1.TabIndex = 2;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(16, 386);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(55, 13);
            this.label10.TabIndex = 1;
            this.label10.Text = "Tìm kiếm: ";
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(7, 20);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(573, 347);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // HangHoaForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(938, 445);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximumSize = new System.Drawing.Size(938, 445);
            this.MinimumSize = new System.Drawing.Size(938, 445);
            this.Name = "HangHoaForm";
            this.Text = "HangHoaForm";
            this.Load += new System.EventHandler(this.HangHoaForm_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numKhuyenMai)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numBaoHanh)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label lbNhomLinhKien;
        private System.Windows.Forms.ComboBox cbNhomLinhKien;
        private System.Windows.Forms.TextBox tbMaMatHang;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbTenMatHang;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tbGia;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbNhaCungCap;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.NumericUpDown numKhuyenMai;
        private System.Windows.Forms.NumericUpDown numBaoHanh;
        private System.Windows.Forms.TextBox tbMoTa;
        private System.Windows.Forms.Button btnXoa;
        private System.Windows.Forms.Button btnSua;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Button btnLamMoi;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.ComboBox cbLoc;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox tbMaLinhKien;
    }
}