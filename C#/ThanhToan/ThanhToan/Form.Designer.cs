namespace ThanhToan
{
    partial class Form
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            label1 = new Label();
            label2 = new Label();
            label3 = new Label();
            tbName = new TextBox();
            tbID = new TextBox();
            cbSinhVien = new CheckBox();
            groupBox1 = new GroupBox();
            rbCafeKem = new RadioButton();
            rbCafeDa = new RadioButton();
            rbCafeSuaDa = new RadioButton();
            rbCafeSua = new RadioButton();
            rbCafeDen = new RadioButton();
            groupBox2 = new GroupBox();
            cbMyCay = new CheckBox();
            cbMyXaoBo = new CheckBox();
            cbMyTomTrung = new CheckBox();
            cbBanhMyCa = new CheckBox();
            cbBanhMyTrung = new CheckBox();
            btnTinhTien = new Button();
            btnNhapLai = new Button();
            btnThanhToan = new Button();
            btnThoat = new Button();
            label4 = new Label();
            label5 = new Label();
            tbTotalCustomer = new TextBox();
            tbTotalPay = new TextBox();
            groupBox1.SuspendLayout();
            groupBox2.SuspendLayout();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI Variable Text", 16F, FontStyle.Bold);
            label1.ForeColor = Color.FromArgb(192, 192, 0);
            label1.Location = new Point(196, 9);
            label1.Name = "label1";
            label1.Size = new Size(181, 30);
            label1.TabIndex = 0;
            label1.Text = "CAFE SINH VIÊN";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI Variable Text", 10F, FontStyle.Bold);
            label2.Location = new Point(26, 57);
            label2.Name = "label2";
            label2.Size = new Size(112, 19);
            label2.TabIndex = 1;
            label2.Text = "Tên khách hàng";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(26, 85);
            label3.Name = "label3";
            label3.Size = new Size(106, 19);
            label3.TabIndex = 2;
            label3.Text = "Số khách hàng";
            // 
            // tbName
            // 
            tbName.Location = new Point(153, 54);
            tbName.Name = "tbName";
            tbName.Size = new Size(365, 25);
            tbName.TabIndex = 3;
            tbName.TextChanged += tbName_TextChanged;
            // 
            // tbID
            // 
            tbID.Location = new Point(153, 85);
            tbID.Name = "tbID";
            tbID.Size = new Size(365, 25);
            tbID.TabIndex = 4;
            tbID.TextChanged += tbID_TextChanged;
            tbID.KeyPress += tbID_Press;
            // 
            // cbSinhVien
            // 
            cbSinhVien.AutoSize = true;
            cbSinhVien.Font = new Font("Segoe UI Variable Text", 10F);
            cbSinhVien.Location = new Point(153, 126);
            cbSinhVien.Name = "cbSinhVien";
            cbSinhVien.Size = new Size(89, 23);
            cbSinhVien.TabIndex = 5;
            cbSinhVien.Text = "Sinh viên?";
            cbSinhVien.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(rbCafeKem);
            groupBox1.Controls.Add(rbCafeDa);
            groupBox1.Controls.Add(rbCafeSuaDa);
            groupBox1.Controls.Add(rbCafeSua);
            groupBox1.Controls.Add(rbCafeDen);
            groupBox1.Font = new Font("Segoe UI Variable Text", 10F);
            groupBox1.Location = new Point(26, 152);
            groupBox1.Name = "groupBox1";
            groupBox1.Size = new Size(227, 135);
            groupBox1.TabIndex = 6;
            groupBox1.TabStop = false;
            groupBox1.Text = "Thức uống";
            // 
            // rbCafeKem
            // 
            rbCafeKem.AutoSize = true;
            rbCafeKem.Location = new Point(127, 61);
            rbCafeKem.Name = "rbCafeKem";
            rbCafeKem.Size = new Size(84, 23);
            rbCafeKem.TabIndex = 4;
            rbCafeKem.Text = "Cafe kem";
            rbCafeKem.UseVisualStyleBackColor = true;
            // 
            // rbCafeDa
            // 
            rbCafeDa.AutoSize = true;
            rbCafeDa.Location = new Point(128, 28);
            rbCafeDa.Name = "rbCafeDa";
            rbCafeDa.Size = new Size(73, 23);
            rbCafeDa.TabIndex = 3;
            rbCafeDa.Text = "Cafe đá";
            rbCafeDa.UseVisualStyleBackColor = true;
            // 
            // rbCafeSuaDa
            // 
            rbCafeSuaDa.AutoSize = true;
            rbCafeSuaDa.Location = new Point(14, 96);
            rbCafeSuaDa.Name = "rbCafeSuaDa";
            rbCafeSuaDa.Size = new Size(98, 23);
            rbCafeSuaDa.TabIndex = 2;
            rbCafeSuaDa.Text = "Cafe sữa đá";
            rbCafeSuaDa.UseVisualStyleBackColor = true;
            // 
            // rbCafeSua
            // 
            rbCafeSua.AutoSize = true;
            rbCafeSua.Location = new Point(14, 61);
            rbCafeSua.Name = "rbCafeSua";
            rbCafeSua.Size = new Size(79, 23);
            rbCafeSua.TabIndex = 1;
            rbCafeSua.Text = "Cafe sữa";
            rbCafeSua.UseVisualStyleBackColor = true;
            // 
            // rbCafeDen
            // 
            rbCafeDen.AutoSize = true;
            rbCafeDen.Location = new Point(14, 28);
            rbCafeDen.Name = "rbCafeDen";
            rbCafeDen.Size = new Size(81, 23);
            rbCafeDen.TabIndex = 0;
            rbCafeDen.Text = "Cafe đen";
            rbCafeDen.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            groupBox2.Controls.Add(cbMyCay);
            groupBox2.Controls.Add(cbMyXaoBo);
            groupBox2.Controls.Add(cbMyTomTrung);
            groupBox2.Controls.Add(cbBanhMyCa);
            groupBox2.Controls.Add(cbBanhMyTrung);
            groupBox2.Font = new Font("Segoe UI Variable Text", 10F);
            groupBox2.Location = new Point(270, 152);
            groupBox2.Name = "groupBox2";
            groupBox2.Size = new Size(248, 135);
            groupBox2.TabIndex = 7;
            groupBox2.TabStop = false;
            groupBox2.Text = "Thức ăn";
            // 
            // cbMyCay
            // 
            cbMyCay.AutoSize = true;
            cbMyCay.Location = new Point(138, 62);
            cbMyCay.Name = "cbMyCay";
            cbMyCay.Size = new Size(72, 23);
            cbMyCay.TabIndex = 4;
            cbMyCay.Text = "Mỳ cay";
            cbMyCay.UseVisualStyleBackColor = true;
            // 
            // cbMyXaoBo
            // 
            cbMyXaoBo.AutoSize = true;
            cbMyXaoBo.Location = new Point(138, 28);
            cbMyXaoBo.Name = "cbMyXaoBo";
            cbMyXaoBo.Size = new Size(93, 23);
            cbMyXaoBo.TabIndex = 3;
            cbMyXaoBo.Text = "Mỳ xào bò";
            cbMyXaoBo.UseVisualStyleBackColor = true;
            // 
            // cbMyTomTrung
            // 
            cbMyTomTrung.AutoSize = true;
            cbMyTomTrung.Location = new Point(13, 97);
            cbMyTomTrung.Name = "cbMyTomTrung";
            cbMyTomTrung.Size = new Size(115, 23);
            cbMyTomTrung.TabIndex = 2;
            cbMyTomTrung.Text = "Mỳ tôm trứng";
            cbMyTomTrung.UseVisualStyleBackColor = true;
            // 
            // cbBanhMyCa
            // 
            cbBanhMyCa.AutoSize = true;
            cbBanhMyCa.Location = new Point(13, 62);
            cbBanhMyCa.Name = "cbBanhMyCa";
            cbBanhMyCa.Size = new Size(99, 23);
            cbBanhMyCa.TabIndex = 1;
            cbBanhMyCa.Text = "Bánh mỳ cá";
            cbBanhMyCa.UseVisualStyleBackColor = true;
            // 
            // cbBanhMyTrung
            // 
            cbBanhMyTrung.AutoSize = true;
            cbBanhMyTrung.Location = new Point(12, 28);
            cbBanhMyTrung.Name = "cbBanhMyTrung";
            cbBanhMyTrung.Size = new Size(120, 23);
            cbBanhMyTrung.TabIndex = 0;
            cbBanhMyTrung.Text = "Bánh mỳ trứng";
            cbBanhMyTrung.UseVisualStyleBackColor = true;
            // 
            // btnTinhTien
            // 
            btnTinhTien.Font = new Font("Segoe UI Variable Text", 10F);
            btnTinhTien.Location = new Point(26, 293);
            btnTinhTien.Name = "btnTinhTien";
            btnTinhTien.Size = new Size(87, 39);
            btnTinhTien.TabIndex = 8;
            btnTinhTien.Text = "Tính tiền";
            btnTinhTien.UseVisualStyleBackColor = true;
            btnTinhTien.Click += btnTinhTien_Click;
            // 
            // btnNhapLai
            // 
            btnNhapLai.Font = new Font("Segoe UI Variable Text", 10F);
            btnNhapLai.Location = new Point(164, 293);
            btnNhapLai.Name = "btnNhapLai";
            btnNhapLai.Size = new Size(78, 38);
            btnNhapLai.TabIndex = 9;
            btnNhapLai.Text = "Nhập lại";
            btnNhapLai.UseVisualStyleBackColor = true;
            btnNhapLai.Click += btnNhapLai_Click;
            // 
            // btnThanhToan
            // 
            btnThanhToan.Font = new Font("Segoe UI Variable Text", 10F);
            btnThanhToan.Location = new Point(290, 294);
            btnThanhToan.Name = "btnThanhToan";
            btnThanhToan.Size = new Size(92, 38);
            btnThanhToan.TabIndex = 10;
            btnThanhToan.Text = "Thanh toán";
            btnThanhToan.UseVisualStyleBackColor = true;
            btnThanhToan.Click += btnThanhToan_Click;
            // 
            // btnThoat
            // 
            btnThoat.Font = new Font("Segoe UI Variable Text", 10F);
            btnThoat.Location = new Point(434, 295);
            btnThoat.Name = "btnThoat";
            btnThoat.Size = new Size(84, 37);
            btnThoat.TabIndex = 11;
            btnThoat.Text = "Thoát";
            btnThoat.UseVisualStyleBackColor = true;
            btnThoat.Click += btnThoat_Click;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(32, 350);
            label4.Name = "label4";
            label4.Size = new Size(123, 19);
            label4.TabIndex = 12;
            label4.Text = "Tổng khách hàng";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(32, 378);
            label5.Name = "label5";
            label5.Size = new Size(146, 19);
            label5.TabIndex = 13;
            label5.Text = "Tổng tiền thanh toán";
            // 
            // tbTotalCustomer
            // 
            tbTotalCustomer.Location = new Point(196, 344);
            tbTotalCustomer.Name = "tbTotalCustomer";
            tbTotalCustomer.ReadOnly = true;
            tbTotalCustomer.Size = new Size(322, 25);
            tbTotalCustomer.TabIndex = 14;
            // 
            // tbTotalPay
            // 
            tbTotalPay.Location = new Point(196, 378);
            tbTotalPay.Name = "tbTotalPay";
            tbTotalPay.ReadOnly = true;
            tbTotalPay.Size = new Size(322, 25);
            tbTotalPay.TabIndex = 15;
            // 
            // Form
            // 
            AutoScaleDimensions = new SizeF(8F, 17F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(541, 429);
            Controls.Add(tbTotalPay);
            Controls.Add(tbTotalCustomer);
            Controls.Add(label5);
            Controls.Add(label4);
            Controls.Add(btnThoat);
            Controls.Add(btnThanhToan);
            Controls.Add(btnNhapLai);
            Controls.Add(btnTinhTien);
            Controls.Add(groupBox2);
            Controls.Add(groupBox1);
            Controls.Add(cbSinhVien);
            Controls.Add(tbID);
            Controls.Add(tbName);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(label1);
            Font = new Font("Segoe UI Variable Text", 10F, FontStyle.Bold);
            Name = "Form";
            Text = "Thanh toán tiền";
            Load += Form_Load;
            groupBox1.ResumeLayout(false);
            groupBox1.PerformLayout();
            groupBox2.ResumeLayout(false);
            groupBox2.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label label2;
        private Label label3;
        private TextBox tbName;
        private TextBox tbID;
        private CheckBox cbSinhVien;
        private GroupBox groupBox1;
        private RadioButton rbCafeKem;
        private RadioButton rbCafeDa;
        private RadioButton rbCafeSuaDa;
        private RadioButton rbCafeSua;
        private RadioButton rbCafeDen;
        private GroupBox groupBox2;
        private CheckBox cbMyTomTrung;
        private CheckBox cbBanhMyCa;
        private CheckBox cbBanhMyTrung;
        private CheckBox cbMyCay;
        private CheckBox cbMyXaoBo;
        private Button btnTinhTien;
        private Button btnNhapLai;
        private Button btnThanhToan;
        private Button btnThoat;
        private Label label4;
        private Label label5;
        private TextBox tbTotalCustomer;
        private TextBox tbTotalPay;
    }
}
