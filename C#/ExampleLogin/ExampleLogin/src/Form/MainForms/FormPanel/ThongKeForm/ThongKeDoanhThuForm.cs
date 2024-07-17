using ExampleLogin.src.Library;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class ThongKeDoanhThuForm : Form
    {
        private SQLToolBox connSQL;
        public ThongKeDoanhThuForm(SQLToolBox connSQL)
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
            SQLTable table;

            cbMaLoai.Items.Clear();
            cbTenLoai.Items.Clear();
            table = this.connSQL.Select("select MaLoaiLK, TenLoaiLK from LoaiLinhKien;");
            for(int i = 0; i < table.Count; i++)
            {
                cbMaLoai.Items.Add(table.Row(i).Column(0));
                cbTenLoai.Items.Add(table.Row(i).Column(1));
            }

        }

        private void wipeInput()
        {
            cbMaLoai.SelectedIndex = -1;
            cbTenLoai.SelectedIndex = -1;
            cbMaMatHang.Enabled = false;
            cbTenMatHang.Enabled = false;
            cbMaMatHang.SelectedIndex = -1;
            cbTenMatHang.SelectedIndex = -1;
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
            if (cbMaLoai.SelectedIndex == -1)
            {
                cbTenLoai.SelectedIndex = -1;
                return;
            }
            SqlCommand cmd = new SqlCommand("select TenLoaiLK from LoaiLinhKien where (MaLoaiLK = @MaLoaiLK);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", cbMaLoai.Text);
            Library.setComboBox(cbTenLoai, this.connSQL.Select(cmd).Row(0).Column(0));

            cbMaMatHang.Items.Clear();
            cbTenMatHang.Items.Clear();
            cmd = new SqlCommand("select MaLK, TenLK from LinhKien where (MaLoaiLK = @MaLoaiLK);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", cbMaLoai.Text);
            SQLTable table = this.connSQL.Select(cmd);
            for (int i = 0; i < table.Count; i++)
            {
                cbMaMatHang.Items.Add(table.Row(i).Column(0));
                cbTenMatHang.Items.Add(table.Row(i).Column(1));
            }

            cbMaMatHang.SelectedIndex = -1;
            cbTenMatHang.SelectedIndex = -1;

            cbMaMatHang.Enabled = true;
            cbTenMatHang.Enabled = true;
        }

        private void cbTenLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTenLoai.SelectedIndex == -1)
            {
                cbMaLoai.SelectedIndex = -1;
                return;
            }
            SqlCommand cmd = new SqlCommand("select MaLoaiLK from LoaiLinhKien where (TenLoaiLK = @TenLoaiLK);");
            cmd.Parameters.AddWithValue("@TenLoaiLK", cbTenLoai.Text);
            Library.setComboBox(cbMaLoai, this.connSQL.Select(cmd).Row(0).Column(0));
        }

        private void cbMaMatHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbMaMatHang.SelectedIndex == -1)
            {
                cbTenMatHang.SelectedIndex = -1;
                return;
            }
            SqlCommand cmd = new SqlCommand("select TenLK from LinhKien where (MaLK = @MaLK);");
            cmd.Parameters.AddWithValue("@MaLK", cbMaMatHang.Text);
            Library.setComboBox(cbTenMatHang, this.connSQL.Select(cmd).Row(0).Column(0));
        }

        private void cbTenMatHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbTenMatHang.SelectedIndex == -1)
            {
                cbMaMatHang.SelectedIndex = -1;
                return;
            }
            SqlCommand cmd = new SqlCommand("select MaLK from LinhKien where (TenLK = @TenLK);");
            cmd.Parameters.AddWithValue("@TenLK", cbTenMatHang.Text);
            Library.setComboBox(cbMaMatHang, this.connSQL.Select(cmd).Row(0).Column(0));
        }
    }
}
