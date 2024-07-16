namespace ExampleLogin
{
    partial class ChoosePTThanhToanForm
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
            this.btnSubmit = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.tbMaPhuongThuc = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cbTenPhuongThuc = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // btnSubmit
            // 
            this.btnSubmit.Enabled = false;
            this.btnSubmit.Location = new System.Drawing.Point(119, 101);
            this.btnSubmit.Name = "btnSubmit";
            this.btnSubmit.Size = new System.Drawing.Size(75, 23);
            this.btnSubmit.TabIndex = 0;
            this.btnSubmit.Text = "Chọn";
            this.btnSubmit.UseVisualStyleBackColor = true;
            this.btnSubmit.Click += new System.EventHandler(this.btnSubmit_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(203, 101);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 1;
            this.btnCancel.Text = "Hủy";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(91, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Mã phương thức: ";
            // 
            // tbMaPhuongThuc
            // 
            this.tbMaPhuongThuc.Location = new System.Drawing.Point(119, 18);
            this.tbMaPhuongThuc.Name = "tbMaPhuongThuc";
            this.tbMaPhuongThuc.ReadOnly = true;
            this.tbMaPhuongThuc.Size = new System.Drawing.Size(149, 20);
            this.tbMaPhuongThuc.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(22, 58);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(92, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Tên phương thức:";
            // 
            // cbTenPhuongThuc
            // 
            this.cbTenPhuongThuc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbTenPhuongThuc.FormattingEnabled = true;
            this.cbTenPhuongThuc.Location = new System.Drawing.Point(121, 58);
            this.cbTenPhuongThuc.Name = "cbTenPhuongThuc";
            this.cbTenPhuongThuc.Size = new System.Drawing.Size(147, 21);
            this.cbTenPhuongThuc.TabIndex = 5;
            this.cbTenPhuongThuc.SelectedIndexChanged += new System.EventHandler(this.cbTenPhuongThuc_SelectedIndexChanged);
            // 
            // ChoosePTThanhToanForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(290, 136);
            this.ControlBox = false;
            this.Controls.Add(this.cbTenPhuongThuc);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbMaPhuongThuc);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnSubmit);
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(306, 175);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(306, 175);
            this.Name = "ChoosePTThanhToanForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Chọn phương thức thanh toán";
            this.Load += new System.EventHandler(this.ChoosePTThanhToanForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnSubmit;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbMaPhuongThuc;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cbTenPhuongThuc;
    }
}