namespace QLThuVien_Buoi9
{
    partial class Bai2Form
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.cbTenTacGia = new System.Windows.Forms.ComboBox();
            this.btnSubmit = new System.Windows.Forms.Button();
            this.cbNhaXuatBan = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cbNamXuatBan = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 54);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(715, 263);
            this.dataGridView1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Tác giả:";
            // 
            // cbTenTacGia
            // 
            this.cbTenTacGia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbTenTacGia.FormattingEnabled = true;
            this.cbTenTacGia.Location = new System.Drawing.Point(64, 17);
            this.cbTenTacGia.Name = "cbTenTacGia";
            this.cbTenTacGia.Size = new System.Drawing.Size(155, 21);
            this.cbTenTacGia.TabIndex = 2;
            this.cbTenTacGia.SelectedIndexChanged += new System.EventHandler(this.trigger);
            // 
            // btnSubmit
            // 
            this.btnSubmit.Location = new System.Drawing.Point(652, 12);
            this.btnSubmit.Name = "btnSubmit";
            this.btnSubmit.Size = new System.Drawing.Size(75, 36);
            this.btnSubmit.TabIndex = 3;
            this.btnSubmit.Text = "In";
            this.btnSubmit.UseVisualStyleBackColor = true;
            this.btnSubmit.Click += new System.EventHandler(this.btnSubmit_Click);
            // 
            // cbNhaXuatBan
            // 
            this.cbNhaXuatBan.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbNhaXuatBan.FormattingEnabled = true;
            this.cbNhaXuatBan.Location = new System.Drawing.Point(314, 20);
            this.cbNhaXuatBan.Name = "cbNhaXuatBan";
            this.cbNhaXuatBan.Size = new System.Drawing.Size(155, 21);
            this.cbNhaXuatBan.TabIndex = 5;
            this.cbNhaXuatBan.SelectedIndexChanged += new System.EventHandler(this.trigger);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(234, 23);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(74, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Nhà xuất bản:";
            // 
            // cbNamXuatBan
            // 
            this.cbNamXuatBan.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbNamXuatBan.FormattingEnabled = true;
            this.cbNamXuatBan.Location = new System.Drawing.Point(564, 20);
            this.cbNamXuatBan.Name = "cbNamXuatBan";
            this.cbNamXuatBan.Size = new System.Drawing.Size(71, 21);
            this.cbNamXuatBan.TabIndex = 7;
            this.cbNamXuatBan.SelectedIndexChanged += new System.EventHandler(this.trigger);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(484, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(76, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Năm xuất bản:";
            // 
            // Bai2Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(739, 329);
            this.ControlBox = false;
            this.Controls.Add(this.cbNamXuatBan);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cbNhaXuatBan);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnSubmit);
            this.Controls.Add(this.cbTenTacGia);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(739, 329);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(739, 329);
            this.Name = "Bai2Form";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "Bai2Form";
            this.Load += new System.EventHandler(this.Bai2Form_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbTenTacGia;
        private System.Windows.Forms.Button btnSubmit;
        private System.Windows.Forms.ComboBox cbNhaXuatBan;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cbNamXuatBan;
        private System.Windows.Forms.Label label2;
    }
}