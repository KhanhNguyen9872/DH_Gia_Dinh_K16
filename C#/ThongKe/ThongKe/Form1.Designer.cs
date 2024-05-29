namespace ThongKe
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
            tbInput = new TextBox();
            label1 = new Label();
            label2 = new Label();
            btnSubmit = new Button();
            btnExit = new Button();
            listBoxOutput = new ListBox();
            SuspendLayout();
            // 
            // tbInput
            // 
            tbInput.Location = new Point(37, 65);
            tbInput.Multiline = true;
            tbInput.Name = "tbInput";
            tbInput.Size = new Size(211, 148);
            tbInput.TabIndex = 0;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI Variable Text", 10F);
            label1.Location = new Point(37, 35);
            label1.Name = "label1";
            label1.Size = new Size(82, 19);
            label1.TabIndex = 2;
            label1.Text = "Nhập chuỗi:";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI Variable Text", 10F);
            label2.Location = new Point(282, 35);
            label2.Name = "label2";
            label2.Size = new Size(118, 19);
            label2.TabIndex = 3;
            label2.Text = "Kết quả thống kê:";
            // 
            // btnSubmit
            // 
            btnSubmit.BackColor = Color.Silver;
            btnSubmit.Location = new Point(98, 231);
            btnSubmit.Name = "btnSubmit";
            btnSubmit.Size = new Size(95, 43);
            btnSubmit.TabIndex = 4;
            btnSubmit.Text = "Đếm số từ";
            btnSubmit.UseVisualStyleBackColor = false;
            btnSubmit.Click += btnSubmit_Click;
            // 
            // btnExit
            // 
            btnExit.BackColor = Color.Silver;
            btnExit.Location = new Point(327, 231);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(93, 43);
            btnExit.TabIndex = 5;
            btnExit.Text = "Thoát";
            btnExit.UseVisualStyleBackColor = false;
            btnExit.Click += btnExit_Click;
            // 
            // listBoxOutput
            // 
            listBoxOutput.FormattingEnabled = true;
            listBoxOutput.Location = new Point(282, 65);
            listBoxOutput.Name = "listBoxOutput";
            listBoxOutput.Size = new Size(204, 148);
            listBoxOutput.TabIndex = 6;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 16F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(524, 302);
            Controls.Add(listBoxOutput);
            Controls.Add(btnExit);
            Controls.Add(btnSubmit);
            Controls.Add(label2);
            Controls.Add(label1);
            Controls.Add(tbInput);
            Name = "Form1";
            Text = "ThongKe  -  Nhóm 1";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox tbInput;
        private Label label1;
        private Label label2;
        private Button btnSubmit;
        private Button btnExit;
        private ListBox listBoxOutput;
    }
}
