namespace UocSoBoiSo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Do you want to exit?", "Exit", MessageBoxButtons.YesNo))
            {
                Application.Exit();
            }
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            // UCLN
            int a = Convert.ToInt32(this.tbA.Text);
            int b = Convert.ToInt32(this.tbB.Text);
            while (a != b)
            {
                if (a > b)
                {
                    a = a - b;
                }
                else
                {
                    b = b - a;
                }
            }
            this.tbUCLN.Text = b.ToString();

            // BCNN
            a = Convert.ToInt32(this.tbA.Text);
            b = Convert.ToInt32(this.tbB.Text);
            int bcnn = (a > b) ? a : b;
            while (true)
            {
                if (bcnn % a == 0 && bcnn % b == 0)
                {
                    break;
                }
                bcnn++;
            }
            this.tbBCNN.Text = bcnn.ToString();
        }

        private void btnContinue_Click(object sender, EventArgs e)
        {
            this.tbA.Text = "";
            this.tbB.Text = "";
            this.tbUCLN.Text = "";
            this.tbBCNN.Text = "";
        }
    }
}
