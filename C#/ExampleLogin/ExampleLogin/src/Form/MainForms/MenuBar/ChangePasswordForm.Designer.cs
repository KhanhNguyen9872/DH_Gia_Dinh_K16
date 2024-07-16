namespace ExampleLogin
{
    partial class ChangePasswordForm
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
            this.label1 = new System.Windows.Forms.Label();
            this.tbUsername = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.tbOldPassword = new System.Windows.Forms.TextBox();
            this.cbShowOldPassword = new System.Windows.Forms.CheckBox();
            this.tbNewPassword = new System.Windows.Forms.TextBox();
            this.tbReNewPassword = new System.Windows.Forms.TextBox();
            this.cbShowNewPassword = new System.Windows.Forms.CheckBox();
            this.btnSubmit = new System.Windows.Forms.Button();
            this.btnQuit = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.lbCaptcha = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.tbCaptcha = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Tên tài khoản:";
            // 
            // tbUsername
            // 
            this.tbUsername.Enabled = false;
            this.tbUsername.Location = new System.Drawing.Point(104, 19);
            this.tbUsername.Name = "tbUsername";
            this.tbUsername.ReadOnly = true;
            this.tbUsername.Size = new System.Drawing.Size(167, 20);
            this.tbUsername.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(22, 53);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Mật khẩu cũ:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(22, 103);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(74, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Mật khẩu mới:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(22, 135);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(115, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "Nhập lại mật khẩu mới:";
            // 
            // tbOldPassword
            // 
            this.tbOldPassword.Location = new System.Drawing.Point(104, 53);
            this.tbOldPassword.Name = "tbOldPassword";
            this.tbOldPassword.PasswordChar = '*';
            this.tbOldPassword.Size = new System.Drawing.Size(167, 20);
            this.tbOldPassword.TabIndex = 5;
            // 
            // cbShowOldPassword
            // 
            this.cbShowOldPassword.AutoSize = true;
            this.cbShowOldPassword.Location = new System.Drawing.Point(162, 79);
            this.cbShowOldPassword.Name = "cbShowOldPassword";
            this.cbShowOldPassword.Size = new System.Drawing.Size(109, 17);
            this.cbShowOldPassword.TabIndex = 6;
            this.cbShowOldPassword.Text = "Hiển thị mật khẩu";
            this.cbShowOldPassword.UseVisualStyleBackColor = true;
            this.cbShowOldPassword.CheckedChanged += new System.EventHandler(this.cbShowOldPassword_CheckedChanged);
            // 
            // tbNewPassword
            // 
            this.tbNewPassword.Location = new System.Drawing.Point(104, 103);
            this.tbNewPassword.Name = "tbNewPassword";
            this.tbNewPassword.PasswordChar = '*';
            this.tbNewPassword.Size = new System.Drawing.Size(167, 20);
            this.tbNewPassword.TabIndex = 7;
            // 
            // tbReNewPassword
            // 
            this.tbReNewPassword.Location = new System.Drawing.Point(143, 132);
            this.tbReNewPassword.Name = "tbReNewPassword";
            this.tbReNewPassword.PasswordChar = '*';
            this.tbReNewPassword.Size = new System.Drawing.Size(128, 20);
            this.tbReNewPassword.TabIndex = 8;
            // 
            // cbShowNewPassword
            // 
            this.cbShowNewPassword.AutoSize = true;
            this.cbShowNewPassword.Location = new System.Drawing.Point(162, 158);
            this.cbShowNewPassword.Name = "cbShowNewPassword";
            this.cbShowNewPassword.Size = new System.Drawing.Size(109, 17);
            this.cbShowNewPassword.TabIndex = 9;
            this.cbShowNewPassword.Text = "Hiển thị mật khẩu";
            this.cbShowNewPassword.UseVisualStyleBackColor = true;
            this.cbShowNewPassword.CheckedChanged += new System.EventHandler(this.cbShowNewPassword_CheckedChanged);
            // 
            // btnSubmit
            // 
            this.btnSubmit.Location = new System.Drawing.Point(111, 226);
            this.btnSubmit.Name = "btnSubmit";
            this.btnSubmit.Size = new System.Drawing.Size(94, 23);
            this.btnSubmit.TabIndex = 10;
            this.btnSubmit.Text = "Đổi mật khẩu";
            this.btnSubmit.UseVisualStyleBackColor = true;
            this.btnSubmit.Click += new System.EventHandler(this.btnSubmit_Click);
            // 
            // btnQuit
            // 
            this.btnQuit.Location = new System.Drawing.Point(211, 226);
            this.btnQuit.Name = "btnQuit";
            this.btnQuit.Size = new System.Drawing.Size(75, 23);
            this.btnQuit.TabIndex = 11;
            this.btnQuit.Text = "Quay về";
            this.btnQuit.UseVisualStyleBackColor = true;
            this.btnQuit.Click += new System.EventHandler(this.btnQuit_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(25, 193);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(54, 13);
            this.label5.TabIndex = 12;
            this.label5.Text = "Xác minh:";
            // 
            // lbCaptcha
            // 
            this.lbCaptcha.AutoSize = true;
            this.lbCaptcha.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCaptcha.Location = new System.Drawing.Point(122, 191);
            this.lbCaptcha.Name = "lbCaptcha";
            this.lbCaptcha.Size = new System.Drawing.Size(15, 15);
            this.lbCaptcha.TabIndex = 13;
            this.lbCaptcha.Text = "0";
            this.lbCaptcha.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(195, 193);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(13, 13);
            this.label7.TabIndex = 14;
            this.label7.Text = "=";
            // 
            // tbCaptcha
            // 
            this.tbCaptcha.Location = new System.Drawing.Point(214, 190);
            this.tbCaptcha.Name = "tbCaptcha";
            this.tbCaptcha.Size = new System.Drawing.Size(56, 20);
            this.tbCaptcha.TabIndex = 15;
            // 
            // ChangePasswordForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(298, 261);
            this.ControlBox = false;
            this.Controls.Add(this.tbCaptcha);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.lbCaptcha);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btnQuit);
            this.Controls.Add(this.btnSubmit);
            this.Controls.Add(this.cbShowNewPassword);
            this.Controls.Add(this.tbReNewPassword);
            this.Controls.Add(this.tbNewPassword);
            this.Controls.Add(this.cbShowOldPassword);
            this.Controls.Add(this.tbOldPassword);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbUsername);
            this.Controls.Add(this.label1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ChangePasswordForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đổi mật khẩu";
            this.Load += new System.EventHandler(this.ChangePasswordForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbUsername;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.CheckBox cbShowOldPassword;
        private System.Windows.Forms.TextBox tbNewPassword;
        private System.Windows.Forms.TextBox tbReNewPassword;
        private System.Windows.Forms.CheckBox cbShowNewPassword;
        private System.Windows.Forms.Button btnSubmit;
        private System.Windows.Forms.Button btnQuit;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label lbCaptcha;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox tbCaptcha;
        private System.Windows.Forms.TextBox tbOldPassword;
    }
}