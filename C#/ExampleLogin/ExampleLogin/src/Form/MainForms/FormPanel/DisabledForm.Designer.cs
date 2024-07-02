namespace ExampleLogin
{
    partial class DisabledForm
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
            this.lbDisabled = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lbDisabled
            // 
            this.lbDisabled.AutoSize = true;
            this.lbDisabled.Font = new System.Drawing.Font("Microsoft Sans Serif", 26F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbDisabled.Location = new System.Drawing.Point(163, 169);
            this.lbDisabled.Name = "lbDisabled";
            this.lbDisabled.Size = new System.Drawing.Size(610, 39);
            this.lbDisabled.TabIndex = 0;
            this.lbDisabled.Text = "Bạn không có quyền hạn để truy cập";
            // 
            // PanelDisabledForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(938, 412);
            this.Controls.Add(this.lbDisabled);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(938, 412);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(938, 412);
            this.Name = "PanelDisabledForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "PanelDisabledForm";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbDisabled;
    }
}