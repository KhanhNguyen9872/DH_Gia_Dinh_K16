namespace WinFormsApp2
{
    partial class Login
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
            dataGridView1 = new DataGridView();
            btnThem = new Button();
            txtUsername = new TextBox();
            txtPassword = new TextBox();
            txtType = new TextBox();
            lbUsername = new Label();
            lbPassword = new Label();
            lbType = new Label();
            btnDangNhap = new Button();
            btnDelete = new Button();
            btnEdit = new Button();
            cbShowPass = new CheckBox();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(12, 12);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowTemplate.Height = 25;
            dataGridView1.Size = new Size(457, 185);
            dataGridView1.TabIndex = 0;
            dataGridView1.CellClick += dataGridView1_CellContentClick;
            // 
            // btnThem
            // 
            btnThem.Location = new Point(304, 218);
            btnThem.Name = "btnThem";
            btnThem.Size = new Size(75, 23);
            btnThem.TabIndex = 1;
            btnThem.Text = "Thêm";
            btnThem.UseVisualStyleBackColor = true;
            btnThem.Click += btnThem_Click;
            // 
            // txtUsername
            // 
            txtUsername.Location = new Point(160, 222);
            txtUsername.Name = "txtUsername";
            txtUsername.Size = new Size(100, 23);
            txtUsername.TabIndex = 2;
            // 
            // txtPassword
            // 
            txtPassword.Location = new Point(160, 254);
            txtPassword.Name = "txtPassword";
            txtPassword.PasswordChar = '*';
            txtPassword.Size = new Size(100, 23);
            txtPassword.TabIndex = 3;
            // 
            // txtType
            // 
            txtType.Location = new Point(160, 287);
            txtType.Name = "txtType";
            txtType.Size = new Size(100, 23);
            txtType.TabIndex = 4;
            // 
            // lbUsername
            // 
            lbUsername.AutoSize = true;
            lbUsername.Location = new Point(73, 225);
            lbUsername.Name = "lbUsername";
            lbUsername.Size = new Size(59, 16);
            lbUsername.TabIndex = 5;
            lbUsername.Text = "Username";
            // 
            // lbPassword
            // 
            lbPassword.AutoSize = true;
            lbPassword.Location = new Point(75, 254);
            lbPassword.Name = "lbPassword";
            lbPassword.Size = new Size(57, 16);
            lbPassword.TabIndex = 6;
            lbPassword.Text = "Password";
            // 
            // lbType
            // 
            lbType.AutoSize = true;
            lbType.Location = new Point(86, 287);
            lbType.Name = "lbType";
            lbType.Size = new Size(31, 16);
            lbType.TabIndex = 7;
            lbType.Text = "Type";
            // 
            // btnDangNhap
            // 
            btnDangNhap.Location = new Point(304, 251);
            btnDangNhap.Name = "btnDangNhap";
            btnDangNhap.Size = new Size(75, 23);
            btnDangNhap.TabIndex = 8;
            btnDangNhap.Text = "Đăng nhập";
            btnDangNhap.UseVisualStyleBackColor = true;
            btnDangNhap.Click += btnDangNhap_Click;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(304, 280);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(75, 23);
            btnDelete.TabIndex = 9;
            btnDelete.Text = "Xóa";
            btnDelete.UseVisualStyleBackColor = true;
            btnDelete.Click += btnDelete_Click;
            // 
            // btnEdit
            // 
            btnEdit.Location = new Point(304, 313);
            btnEdit.Name = "btnEdit";
            btnEdit.Size = new Size(75, 23);
            btnEdit.TabIndex = 10;
            btnEdit.Text = "Sửa";
            btnEdit.UseVisualStyleBackColor = true;
            btnEdit.Click += btnEdit_Click;
            // 
            // cbShowPass
            // 
            cbShowPass.AutoSize = true;
            cbShowPass.Location = new Point(160, 328);
            cbShowPass.Name = "cbShowPass";
            cbShowPass.Size = new Size(108, 20);
            cbShowPass.TabIndex = 11;
            cbShowPass.Text = "Show password";
            cbShowPass.UseVisualStyleBackColor = true;
            cbShowPass.CheckedChanged += cbShowPass_CheckedChanged;
            // 
            // Login
            // 
            AutoScaleDimensions = new SizeF(7F, 16F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(480, 366);
            Controls.Add(cbShowPass);
            Controls.Add(btnEdit);
            Controls.Add(btnDelete);
            Controls.Add(btnDangNhap);
            Controls.Add(lbType);
            Controls.Add(lbPassword);
            Controls.Add(lbUsername);
            Controls.Add(txtType);
            Controls.Add(txtPassword);
            Controls.Add(txtUsername);
            Controls.Add(btnThem);
            Controls.Add(dataGridView1);
            Name = "Login";
            Text = "Form1";
            FormClosing += this.Login_FormClosing;
            Load += Form1_Load;
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView dataGridView1;
        private Button btnThem;
        private TextBox txtUsername;
        private TextBox txtPassword;
        private TextBox txtType;
        private Label lbUsername;
        private Label lbPassword;
        private Label lbType;
        private Button btnDangNhap;
        private Button btnDelete;
        private Button btnEdit;
        private CheckBox cbShowPass;
    }
}
