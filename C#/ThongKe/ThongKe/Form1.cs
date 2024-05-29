
// THỐNG KÊ
// Nhóm 1
/*
1. Nguyễn Văn Khánh - 22150129 - Nhóm Trưởng
2. Lê Lâm Chiến Thắng - 22140345
3. Vũ Đức Thịnh - 22140459
4. Trương Ngọc Hào - 22140336
*/

namespace ThongKe
{
    public partial class Form1 : Form
    {
        private Dictionary<string, int> dictStr;

        public Form1()
        {
            InitializeComponent();
            this.dictStr = new Dictionary<string, int>();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do you want to exit?", "Exit", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (string s in tbInput.Text.Replace("\r\n", " ").Replace("\n", " ").Replace("\r", " ").Split(' '))
            {
                if (s == "")
                {
                    continue;
                }

                if (checkInDict(s) == 0)
                {
                    this.dictStr.Add(s, 1);
                }
                else
                {
                    this.dictStr[s] = this.dictStr[s] + 1;
                }
            }
            this.reloadListbox();
            this.reset();
        }

        private void reloadListbox()
        {
            listBoxOutput.Items.Clear();
            foreach (var s in this.dictStr)
            {
                listBoxOutput.Items.Add(s.Key + ": " + s.Value + " lần");
            }
        }

        private int checkInDict(string target)
        {
            try
            {
                return this.dictStr[target];
            }
            catch (Exception)
            {

            }

            return 0;
        }

        private void reset()
        {
            this.dictStr = new Dictionary<string, int>();
            GC.Collect(0);
        }
    }
}
