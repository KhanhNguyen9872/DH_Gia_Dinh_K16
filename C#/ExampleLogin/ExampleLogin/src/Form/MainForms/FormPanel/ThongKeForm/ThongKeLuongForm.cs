using ExampleLogin.src.Library;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class ThongKeLuongForm : Form
    {
        private SQLToolBox connSQL;
        public ThongKeLuongForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
        }

        private void ThongKeForm_Load(object sender, EventArgs e)
        {
            this.loadData();
            this.wipeInput();
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            SQLTable table;

            cbMaNV.Items.Clear();
            cbTenNV.Items.Clear();
            table = this.connSQL.Select("select MaNV, TenNV from NhanVien;");
            for(int i = 0; i < table.Count; i++)
            {
                cbMaNV.Items.Add(table.Row(i).Column(0));
                cbTenNV.Items.Add(table.Row(i).Column(1));
            }

        }

        private void wipeInput()
        {
            cbMaNV.SelectedIndex = -1;
            cbTenNV.SelectedIndex = -1;
            dateTimeTu.Text = new DateTime(2000, 1, 1).ToString();
            dateTimeDen.Text = new DateTime(2077, 1, 1).ToString();

        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            this.loadData();
            this.wipeInput();
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        private void cbMaLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbMaNV.SelectedIndex == -1)
            {
                cbTenNV.SelectedIndex = -1;
                return;
            }
            SqlCommand cmd = new SqlCommand("select TenNV from NhanVien where (MaNV = @MaNV);");
            cmd.Parameters.AddWithValue("@MaNV", cbMaNV.Text);
            Library.setComboBox(cbTenNV, this.connSQL.Select(cmd).Row(0).Column(0));
        }

        private void cbTenLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTenNV.SelectedIndex == -1)
            {
                cbMaNV.SelectedIndex = -1;
                return;
            }
            SqlCommand cmd = new SqlCommand("select MaNV from NhanVien where (TenNV = @TenNV);");
            cmd.Parameters.AddWithValue("@TenNV", cbTenNV.Text);
            Library.setComboBox(cbMaNV, this.connSQL.Select(cmd).Row(0).Column(0));
        }
    }
}
