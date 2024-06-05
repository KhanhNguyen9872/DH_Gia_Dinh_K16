namespace WinFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            tbFullName.Focus();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (this.CheckName())
            {
                this.Clear();
                foreach (String s in this.getResult()) {
                    lbResult.Items.Add(s);
                    tbResult.Text = tbResult.Text + s + "\n";
                };
                this.WriteFile("luuthongtin.txt", tbResult.Text);
            }
        }

        private void Clear()
        {
            lbResult.Items.Clear();
            tbResult.Clear();
        }

        private List<String> getResult()
        {
            List<String> result = new List<String>();
            result.Add("Họ và tên: " + tbFullName.Text);
            result.Add("Lớp: " + tbClass.Text);
            
            if (rbNam.Checked)
            {
                result.Add("Giới tính: Nam");
            }
            else if (rbNu.Checked)
            {
                result.Add("Giới tính: Nữ");
            }

            if (cbTrucQuan.Checked)
            {
                result.Add("Lập trình trực quan");
            }
            if (cbWebsite.Checked)
            {
                result.Add("Lập trình Website");
            }
            if (cbQuanLy.Checked)
            {
                result.Add("Lập trình quản lý");
            }
            if (cbAnNinhMang.Checked)
            {
                result.Add("An ninh mạng");
            }

            return result;
        }

        private void WriteFile(string path, string text)
        {
            using (StreamWriter writer = new StreamWriter(path))
            {
                writer.WriteLine(text);
            }
        }

        private void MessageError(string msg) {
            MessageBox.Show(msg, "MESSAGE", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private bool CheckName()
        {
            if (string.IsNullOrEmpty(tbFullName.Text))
            {
                MessageError("Vui lòng nhập Họ và Tên");
                tbFullName.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(tbClass.Text))
            {
                MessageError("Vui lòng nhập Lớp");
                tbClass.Focus();
                return false;
            }
            return true;
        }
    }
}
