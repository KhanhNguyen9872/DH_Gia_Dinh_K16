using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class PleaseWaitForm : Form
    {
        public PleaseWaitForm()
        {
            InitializeComponent();
        }

        public PleaseWaitForm(string text)
        {
            InitializeComponent();
            this.lbText.Text = text;
            this.TopMost = true;
        }
    }
}
