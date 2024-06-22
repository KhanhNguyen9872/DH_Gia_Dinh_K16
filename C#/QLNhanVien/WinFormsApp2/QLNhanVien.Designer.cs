namespace WinFormsApp2
{
    partial class QLNhanVien
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
            dataGridView1 = new DataGridView();
            gbThongTin = new GroupBox();
            gbChiTiet = new GroupBox();
            cbGioiTinh = new ComboBox();
            dateTimePicker1 = new DateTimePicker();
            txtTienLuong = new TextBox();
            txtChucVu = new TextBox();
            txtName = new TextBox();
            txtMaNV = new TextBox();
            label6 = new Label();
            label5 = new Label();
            label4 = new Label();
            label3 = new Label();
            label2 = new Label();
            label1 = new Label();
            btnThem = new Button();
            btnSua = new Button();
            btnXoa = new Button();
            btnThoat = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            gbThongTin.SuspendLayout();
            gbChiTiet.SuspendLayout();
            SuspendLayout();
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(6, 22);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowTemplate.Height = 25;
            dataGridView1.Size = new Size(583, 171);
            dataGridView1.TabIndex = 0;
            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
            // 
            // gbThongTin
            // 
            gbThongTin.Controls.Add(dataGridView1);
            gbThongTin.Location = new Point(12, 12);
            gbThongTin.Name = "gbThongTin";
            gbThongTin.Size = new Size(595, 199);
            gbThongTin.TabIndex = 1;
            gbThongTin.TabStop = false;
            gbThongTin.Text = "Thông tin";
            // 
            // gbChiTiet
            // 
            gbChiTiet.Controls.Add(cbGioiTinh);
            gbChiTiet.Controls.Add(dateTimePicker1);
            gbChiTiet.Controls.Add(txtTienLuong);
            gbChiTiet.Controls.Add(txtChucVu);
            gbChiTiet.Controls.Add(txtName);
            gbChiTiet.Controls.Add(txtMaNV);
            gbChiTiet.Controls.Add(label6);
            gbChiTiet.Controls.Add(label5);
            gbChiTiet.Controls.Add(label4);
            gbChiTiet.Controls.Add(label3);
            gbChiTiet.Controls.Add(label2);
            gbChiTiet.Controls.Add(label1);
            gbChiTiet.Location = new Point(18, 211);
            gbChiTiet.Name = "gbChiTiet";
            gbChiTiet.Size = new Size(502, 153);
            gbChiTiet.TabIndex = 2;
            gbChiTiet.TabStop = false;
            gbChiTiet.Text = "Chi tiết";
            // 
            // cbGioiTinh
            // 
            cbGioiTinh.FormattingEnabled = true;
            cbGioiTinh.Items.AddRange(new object[] { "Nam", "Nữ" });
            cbGioiTinh.Location = new Point(91, 107);
            cbGioiTinh.Name = "cbGioiTinh";
            cbGioiTinh.Size = new Size(143, 24);
            cbGioiTinh.TabIndex = 11;
            // 
            // dateTimePicker1
            // 
            dateTimePicker1.Format = DateTimePickerFormat.Short;
            dateTimePicker1.Location = new Point(324, 29);
            dateTimePicker1.Name = "dateTimePicker1";
            dateTimePicker1.Size = new Size(100, 23);
            dateTimePicker1.TabIndex = 10;
            // 
            // txtTienLuong
            // 
            txtTienLuong.Location = new Point(324, 109);
            txtTienLuong.Name = "txtTienLuong";
            txtTienLuong.Size = new Size(161, 23);
            txtTienLuong.TabIndex = 9;
            // 
            // txtChucVu
            // 
            txtChucVu.Location = new Point(324, 70);
            txtChucVu.Name = "txtChucVu";
            txtChucVu.Size = new Size(161, 23);
            txtChucVu.TabIndex = 8;
            // 
            // txtName
            // 
            txtName.Location = new Point(91, 70);
            txtName.Name = "txtName";
            txtName.Size = new Size(143, 23);
            txtName.TabIndex = 7;
            // 
            // txtMaNV
            // 
            txtMaNV.Location = new Point(90, 29);
            txtMaNV.Name = "txtMaNV";
            txtMaNV.Size = new Size(144, 23);
            txtMaNV.TabIndex = 6;
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Location = new Point(255, 112);
            label6.Name = "label6";
            label6.Size = new Size(63, 16);
            label6.TabIndex = 5;
            label6.Text = "Tiền lương";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(252, 73);
            label5.Name = "label5";
            label5.Size = new Size(50, 16);
            label5.TabIndex = 4;
            label5.Text = "Chức vụ";
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(252, 34);
            label4.Name = "label4";
            label4.Size = new Size(60, 16);
            label4.TabIndex = 3;
            label4.Text = "Ngày sinh";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(14, 112);
            label3.Name = "label3";
            label3.Size = new Size(52, 16);
            label3.TabIndex = 2;
            label3.Text = "Giới tính";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(14, 73);
            label2.Name = "label2";
            label2.Size = new Size(58, 16);
            label2.TabIndex = 1;
            label2.Text = "Họ và tên";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(14, 34);
            label1.Name = "label1";
            label1.Size = new Size(43, 16);
            label1.TabIndex = 0;
            label1.Text = "Mã NV";
            // 
            // btnThem
            // 
            btnThem.Location = new Point(526, 232);
            btnThem.Name = "btnThem";
            btnThem.Size = new Size(75, 23);
            btnThem.TabIndex = 3;
            btnThem.Text = "Thêm";
            btnThem.UseVisualStyleBackColor = true;
            btnThem.Click += btnThem_Click;
            // 
            // btnSua
            // 
            btnSua.Location = new Point(526, 267);
            btnSua.Name = "btnSua";
            btnSua.Size = new Size(75, 23);
            btnSua.TabIndex = 4;
            btnSua.Text = "Sửa";
            btnSua.UseVisualStyleBackColor = true;
            btnSua.Click += btnSua_Click;
            // 
            // btnXoa
            // 
            btnXoa.Location = new Point(526, 296);
            btnXoa.Name = "btnXoa";
            btnXoa.Size = new Size(75, 23);
            btnXoa.TabIndex = 5;
            btnXoa.Text = "Xóa";
            btnXoa.UseVisualStyleBackColor = true;
            btnXoa.Click += btnXoa_Click;
            // 
            // btnThoat
            // 
            btnThoat.Location = new Point(526, 341);
            btnThoat.Name = "btnThoat";
            btnThoat.Size = new Size(75, 23);
            btnThoat.TabIndex = 6;
            btnThoat.Text = "Thoát";
            btnThoat.UseVisualStyleBackColor = true;
            btnThoat.Click += btnThoat_Click;
            // 
            // QLNhanVien
            // 
            AutoScaleDimensions = new SizeF(7F, 16F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(619, 376);
            Controls.Add(btnThoat);
            Controls.Add(btnXoa);
            Controls.Add(btnSua);
            Controls.Add(btnThem);
            Controls.Add(gbChiTiet);
            Controls.Add(gbThongTin);
            Name = "QLNhanVien";
            Text = "QLNhanVien";
            FormClosing += QLNhanVien_FormClosing;
            Load += QLNhanVien_Load;
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            gbThongTin.ResumeLayout(false);
            gbChiTiet.ResumeLayout(false);
            gbChiTiet.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private DataGridView dataGridView1;
        private GroupBox gbThongTin;
        private GroupBox gbChiTiet;
        private Label label6;
        private Label label5;
        private Label label4;
        private Label label3;
        private Label label2;
        private Label label1;
        private Button btnThem;
        private Button btnSua;
        private Button btnXoa;
        private Button btnThoat;
        private ComboBox cbGioiTinh;
        private DateTimePicker dateTimePicker1;
        private TextBox txtTienLuong;
        private TextBox txtChucVu;
        private TextBox txtName;
        private TextBox txtMaNV;
    }
}