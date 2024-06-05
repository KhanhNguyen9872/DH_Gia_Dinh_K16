namespace WinFormsApp1
{
    partial class Form1
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
            label4 = new Label();
            tbFullName = new TextBox();
            tbClass = new TextBox();
            groupBox1 = new GroupBox();
            rbNu = new RadioButton();
            rbNam = new RadioButton();
            groupBox2 = new GroupBox();
            cbAnNinhMang = new CheckBox();
            cbQuanLy = new CheckBox();
            cbWebsite = new CheckBox();
            cbTrucQuan = new CheckBox();
            btnSave = new Button();
            btnExit = new Button();
            lbResult = new ListBox();
            tbResult = new TextBox();
            groupBox1.SuspendLayout();
            groupBox2.SuspendLayout();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI Variable Text", 15.75F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.Location = new Point(74, 9);
            label1.Name = "label1";
            label1.Size = new Size(206, 28);
            label1.TabIndex = 0;
            label1.Text = "Thông tin Sinh viên";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(25, 51);
            label2.Name = "label2";
            label2.Size = new Size(61, 16);
            label2.TabIndex = 1;
            label2.Text = "Họ và tên:";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(74, 174);
            label3.Name = "label3";
            label3.Size = new Size(0, 16);
            label3.TabIndex = 1;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(25, 87);
            label4.Name = "label4";
            label4.Size = new Size(30, 16);
            label4.TabIndex = 2;
            label4.Text = "Lớp:";
            // 
            // tbFullName
            // 
            tbFullName.Location = new Point(105, 48);
            tbFullName.Name = "tbFullName";
            tbFullName.Size = new Size(169, 23);
            tbFullName.TabIndex = 3;
            // 
            // tbClass
            // 
            tbClass.Location = new Point(105, 87);
            tbClass.Name = "tbClass";
            tbClass.Size = new Size(169, 23);
            tbClass.TabIndex = 4;
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(rbNu);
            groupBox1.Controls.Add(rbNam);
            groupBox1.Location = new Point(74, 137);
            groupBox1.Name = "groupBox1";
            groupBox1.Size = new Size(200, 71);
            groupBox1.TabIndex = 5;
            groupBox1.TabStop = false;
            groupBox1.Text = "Giới tính";
            // 
            // rbNu
            // 
            rbNu.AutoSize = true;
            rbNu.Location = new Point(125, 33);
            rbNu.Name = "rbNu";
            rbNu.Size = new Size(41, 20);
            rbNu.TabIndex = 1;
            rbNu.Text = "Nữ";
            rbNu.UseVisualStyleBackColor = true;
            // 
            // rbNam
            // 
            rbNam.AutoSize = true;
            rbNam.Checked = true;
            rbNam.Location = new Point(43, 33);
            rbNam.Name = "rbNam";
            rbNam.Size = new Size(50, 20);
            rbNam.TabIndex = 0;
            rbNam.TabStop = true;
            rbNam.Text = "Nam";
            rbNam.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            groupBox2.Controls.Add(cbAnNinhMang);
            groupBox2.Controls.Add(cbQuanLy);
            groupBox2.Controls.Add(cbWebsite);
            groupBox2.Controls.Add(cbTrucQuan);
            groupBox2.Location = new Point(25, 237);
            groupBox2.Name = "groupBox2";
            groupBox2.Size = new Size(249, 197);
            groupBox2.TabIndex = 6;
            groupBox2.TabStop = false;
            groupBox2.Text = "Danh sách môn học tự chọn";
            // 
            // cbAnNinhMang
            // 
            cbAnNinhMang.AutoSize = true;
            cbAnNinhMang.Location = new Point(49, 153);
            cbAnNinhMang.Name = "cbAnNinhMang";
            cbAnNinhMang.Size = new Size(101, 20);
            cbAnNinhMang.TabIndex = 3;
            cbAnNinhMang.Text = "An ninh mạng";
            cbAnNinhMang.UseVisualStyleBackColor = true;
            // 
            // cbQuanLy
            // 
            cbQuanLy.AutoSize = true;
            cbQuanLy.Location = new Point(49, 114);
            cbQuanLy.Name = "cbQuanLy";
            cbQuanLy.Size = new Size(115, 20);
            cbQuanLy.TabIndex = 2;
            cbQuanLy.Text = "Lập trình quản lý";
            cbQuanLy.UseVisualStyleBackColor = true;
            // 
            // cbWebsite
            // 
            cbWebsite.AutoSize = true;
            cbWebsite.Location = new Point(49, 74);
            cbWebsite.Name = "cbWebsite";
            cbWebsite.Size = new Size(118, 20);
            cbWebsite.TabIndex = 1;
            cbWebsite.Text = "Lập trình Website";
            cbWebsite.UseVisualStyleBackColor = true;
            // 
            // cbTrucQuan
            // 
            cbTrucQuan.AutoSize = true;
            cbTrucQuan.Location = new Point(49, 34);
            cbTrucQuan.Name = "cbTrucQuan";
            cbTrucQuan.Size = new Size(127, 20);
            cbTrucQuan.TabIndex = 0;
            cbTrucQuan.Text = "Lập trình trực quan";
            cbTrucQuan.UseVisualStyleBackColor = true;
            // 
            // btnSave
            // 
            btnSave.Location = new Point(49, 451);
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(75, 23);
            btnSave.TabIndex = 7;
            btnSave.Text = "Lưu";
            btnSave.UseVisualStyleBackColor = true;
            btnSave.Click += btnSave_Click;
            // 
            // btnExit
            // 
            btnExit.Location = new Point(180, 451);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(75, 23);
            btnExit.TabIndex = 8;
            btnExit.Text = "Thoát";
            btnExit.UseVisualStyleBackColor = true;
            btnExit.Click += btnExit_Click;
            // 
            // lbResult
            // 
            lbResult.FormattingEnabled = true;
            lbResult.Location = new Point(307, 48);
            lbResult.Name = "lbResult";
            lbResult.Size = new Size(297, 388);
            lbResult.TabIndex = 9;
            // 
            // tbResult
            // 
            tbResult.Location = new Point(642, 51);
            tbResult.Multiline = true;
            tbResult.Name = "tbResult";
            tbResult.Size = new Size(242, 385);
            tbResult.TabIndex = 10;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 16F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(911, 502);
            Controls.Add(tbResult);
            Controls.Add(lbResult);
            Controls.Add(btnExit);
            Controls.Add(btnSave);
            Controls.Add(groupBox2);
            Controls.Add(groupBox1);
            Controls.Add(tbClass);
            Controls.Add(tbFullName);
            Controls.Add(label4);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(label1);
            Name = "Form1";
            Text = "CheckBox";
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
        private Label label4;
        private TextBox tbFullName;
        private TextBox tbClass;
        private GroupBox groupBox1;
        private RadioButton rbNu;
        private RadioButton rbNam;
        private GroupBox groupBox2;
        private CheckBox cbAnNinhMang;
        private CheckBox cbQuanLy;
        private CheckBox cbWebsite;
        private CheckBox cbTrucQuan;
        private Button btnSave;
        private Button btnExit;
        private ListBox lbResult;
        private TextBox tbResult;
    }
}
