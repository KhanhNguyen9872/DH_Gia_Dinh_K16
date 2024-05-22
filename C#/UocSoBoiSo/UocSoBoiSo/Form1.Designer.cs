namespace UocSoBoiSo
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
            btnSubmit = new Button();
            btnContinue = new Button();
            btnExit = new Button();
            label2 = new Label();
            label3 = new Label();
            label4 = new Label();
            label5 = new Label();
            tbA = new TextBox();
            tbB = new TextBox();
            tbUCLN = new TextBox();
            tbBCNN = new TextBox();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI Variable Text", 16F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.ForeColor = Color.Red;
            label1.Location = new Point(25, 23);
            label1.Name = "label1";
            label1.Size = new Size(317, 30);
            label1.TabIndex = 0;
            label1.Text = "Ước Số Chung - Bội Số Chung";
            // 
            // btnSubmit
            // 
            btnSubmit.Location = new Point(40, 227);
            btnSubmit.Name = "btnSubmit";
            btnSubmit.Size = new Size(75, 23);
            btnSubmit.TabIndex = 1;
            btnSubmit.Text = "Thực hiện";
            btnSubmit.UseVisualStyleBackColor = true;
            btnSubmit.Click += btnSubmit_Click;
            // 
            // btnContinue
            // 
            btnContinue.Location = new Point(144, 227);
            btnContinue.Name = "btnContinue";
            btnContinue.Size = new Size(75, 23);
            btnContinue.TabIndex = 2;
            btnContinue.Text = "Tiếp tục";
            btnContinue.UseVisualStyleBackColor = true;
            btnContinue.Click += btnContinue_Click;
            // 
            // btnExit
            // 
            btnExit.Location = new Point(256, 227);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(75, 23);
            btnExit.TabIndex = 3;
            btnExit.Text = "Thoát";
            btnExit.UseVisualStyleBackColor = true;
            btnExit.Click += btnExit_Click;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI Variable Text", 10F);
            label2.Location = new Point(53, 78);
            label2.Name = "label2";
            label2.Size = new Size(78, 19);
            label2.TabIndex = 4;
            label2.Text = "Nhập số a: ";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Font = new Font("Segoe UI Variable Text", 10F);
            label3.Location = new Point(53, 115);
            label3.Name = "label3";
            label3.Size = new Size(79, 19);
            label3.TabIndex = 5;
            label3.Text = "Nhập số b: ";
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Font = new Font("Segoe UI Variable Text", 10F);
            label4.Location = new Point(53, 152);
            label4.Name = "label4";
            label4.Size = new Size(155, 19);
            label4.TabIndex = 6;
            label4.Text = "Ước số chung lớn nhất: ";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Font = new Font("Segoe UI Variable Text", 10F);
            label5.Location = new Point(53, 188);
            label5.Name = "label5";
            label5.Size = new Size(151, 19);
            label5.TabIndex = 7;
            label5.Text = "Bội số chung nhỏ nhất:";
            // 
            // tbA
            // 
            tbA.Location = new Point(144, 78);
            tbA.Name = "tbA";
            tbA.Size = new Size(159, 23);
            tbA.TabIndex = 8;
            // 
            // tbB
            // 
            tbB.Location = new Point(144, 115);
            tbB.Name = "tbB";
            tbB.Size = new Size(159, 23);
            tbB.TabIndex = 9;
            // 
            // tbUCLN
            // 
            tbUCLN.Location = new Point(214, 152);
            tbUCLN.Name = "tbUCLN";
            tbUCLN.ReadOnly = true;
            tbUCLN.Size = new Size(89, 23);
            tbUCLN.TabIndex = 10;
            // 
            // tbBCNN
            // 
            tbBCNN.Location = new Point(214, 186);
            tbBCNN.Name = "tbBCNN";
            tbBCNN.ReadOnly = true;
            tbBCNN.Size = new Size(89, 23);
            tbBCNN.TabIndex = 11;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 16F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(373, 276);
            Controls.Add(tbBCNN);
            Controls.Add(tbUCLN);
            Controls.Add(tbB);
            Controls.Add(tbA);
            Controls.Add(label5);
            Controls.Add(label4);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(btnExit);
            Controls.Add(btnContinue);
            Controls.Add(btnSubmit);
            Controls.Add(label1);
            Name = "Form1";
            Text = "Ước Số - Bội Số";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Button btnSubmit;
        private Button btnContinue;
        private Button btnExit;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private TextBox tbA;
        private TextBox tbB;
        private TextBox tbUCLN;
        private TextBox tbBCNN;
    }
}
