using ExampleLogin.src.Library;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class ChoosePTThanhToanForm : Form
    {
        private string pttt = "";
        private SQLToolBox connSQL;
        private string tableName = "PhuongThucThanhToan";
        public bool isSuccess = false;

        public ChoosePTThanhToanForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
        }

        public string getPhuongThucThanhToan()
        {
            return this.pttt;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            this.pttt = tbMaPhuongThuc.Text;
            this.isSuccess = true;
            this.Close();
        }

        private void cbTenPhuongThuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select MaPhuongThuc from " + this.tableName + " where (LoaiThanhToan = @LoaiThanhToan);");
            cmd.Parameters.AddWithValue("@LoaiThanhToan", cbTenPhuongThuc.Text);

            tbMaPhuongThuc.Text = this.connSQL.Select(cmd).Row(0).Column(0);
            this.btnSubmit.Enabled = true;
        }

        private void ChoosePTThanhToanForm_Load(object sender, EventArgs e)
        {
            this.loadData();
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            SQLTable table = this.connSQL.Select("Select LoaiThanhToan from " + this.tableName + ";");
            cbTenPhuongThuc.Items.Clear();
            for(int i = 0; i < table.Count; i++)
            {
                cbTenPhuongThuc.Items.Add(table.Row(i).Column(0));
            }
        }
    }
}
