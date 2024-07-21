using ExampleLogin.src.Library;
using System;
using System.Data;
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
            if (!this.connSQL.State()) this.connSQL.Connect();
            SQLTable table;

            cbMaLoai.Items.Clear();
            cbTenLoai.Items.Clear();
            table = this.connSQL.Select("select MaLoaiLK, TenLoaiLK from LoaiLinhKien;");
            cbMaLoai.Items.Add("");
            cbTenLoai.Items.Add("");
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
            dateTimeDen.Text = new DateTime(2049, 12, 31).ToString();

        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            this.loadData();
            this.wipeInput();
            dataGridView1.DataSource = new DataTable();
            tbTongDoanhThu.Text = "0";
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            long tongDoanhThu = 0;
            string sql = "select DonDatHang.MaDH, ChiTietDatHang.MaLK, ChiTietDatHang.SoLuong, ChiTietDatHang.ThanhTien, DonDatHang.NgayDatHang from ChiTietDatHang join DonDatHang on DonDatHang.MaDH = ChiTietDatHang.MaDH join LinhKien on LinhKien.MaLK = ChiTietDatHang.MaLK  join ThongTinThanhToan on ThongTinThanhToan.MaDH = DonDatHang.MaDH where ((ThongTinThanhToan.TinhTrang = 1) AND (DonDatHang.NgayDatHang BETWEEN @Tu and @Den)) ";
            
            if (cbMaLoai.SelectedIndex > 0)
            {
                sql = sql + " AND (LinhKien.MaLoaiLK = @MaLoaiLK) ";
            }

            if (cbMaMatHang.SelectedIndex > 0)
            {
                sql = sql + " AND (ChiTietDatHang.MaLK = @MaLK) ";
            }

            sql = sql + " order by DonDatHang.NgayDatHang ";

            SqlCommand cmd = new SqlCommand(sql);
            cmd.Parameters.AddWithValue("@Tu", dateTimeTu.Text);
            cmd.Parameters.AddWithValue("@Den", dateTimeDen.Text);

            if (cbMaLoai.SelectedIndex > 0)
            {
                cmd.Parameters.AddWithValue("@MaLoaiLK", cbMaLoai.Text);
            }

            if (cbMaMatHang.SelectedIndex > 0)
            {
                cmd.Parameters.AddWithValue("@MaLK", cbMaMatHang.Text);
            }

            SQLTable table = this.connSQL.Select(cmd);
            for(int i = 0; i < table.Count; i++)
            {
                tongDoanhThu = tongDoanhThu + Convert.ToInt32(table.Row(i).Column("ThanhTien"));
                table.Row(i).setValueColumn("ThanhTien", Library.formatVND(table.Row(i).Column("ThanhTien")));
            }
            tbTongDoanhThu.Text = Library.formatVND(tongDoanhThu.ToString());
            dataGridView1.DataSource = table.getDataTable();
        }

        private void cbMaLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((cbMaLoai.SelectedIndex == -1) || (cbMaLoai.SelectedIndex == 0))
            {
                cbMaMatHang.Items.Clear();
                cbMaMatHang.Enabled = false;
                cbTenMatHang.Items.Clear();
                cbTenMatHang.Enabled = false;
                cbTenLoai.SelectedIndex = -1;
                return;
            }

            if (!this.connSQL.State()) this.connSQL.Connect();
            SqlCommand cmd = new SqlCommand("select TenLoaiLK from LoaiLinhKien where (MaLoaiLK = @MaLoaiLK);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", cbMaLoai.Text);
            Library.setComboBox(cbTenLoai, this.connSQL.Select(cmd).Row(0).Column(0));

            cbMaMatHang.Items.Clear();
            cbTenMatHang.Items.Clear();
            cmd = new SqlCommand("select MaLK, TenLK from LinhKien where (MaLoaiLK = @MaLoaiLK);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", cbMaLoai.Text);
            SQLTable table = this.connSQL.Select(cmd);
            cbMaMatHang.Items.Add("");
            cbTenMatHang.Items.Add("");
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
            if ((cbTenLoai.SelectedIndex == -1) || (cbTenLoai.SelectedIndex == 0))
            {
                cbMaLoai.SelectedIndex = -1;
                return;
            }
            if (!this.connSQL.State()) this.connSQL.Connect();
            SqlCommand cmd = new SqlCommand("select MaLoaiLK from LoaiLinhKien where (TenLoaiLK = @TenLoaiLK);");
            cmd.Parameters.AddWithValue("@TenLoaiLK", cbTenLoai.Text);
            Library.setComboBox(cbMaLoai, this.connSQL.Select(cmd).Row(0).Column(0));
        }

        private void cbMaMatHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((cbMaMatHang.SelectedIndex == -1) || (cbMaMatHang.SelectedIndex == 0))
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
            if ((cbTenMatHang.SelectedIndex == -1) || (cbTenMatHang.SelectedIndex == 0))
            {
                cbMaMatHang.SelectedIndex = -1;
                return;
            }
            SqlCommand cmd = new SqlCommand("select MaLK from LinhKien where (TenLK = @TenLK);");
            cmd.Parameters.AddWithValue("@TenLK", cbTenMatHang.Text);
            Library.setComboBox(cbMaMatHang, this.connSQL.Select(cmd).Row(0).Column(0));
        }

        private void dateTimeTu_ValueChanged(object sender, EventArgs e)
        {
            if (dateTimeTu.Value > dateTimeDen.Value)
            {
                dateTimeDen.Value = dateTimeTu.Value;
            }
        }

        private void dateTimeDen_ValueChanged(object sender, EventArgs e)
        {
            if (dateTimeTu.Value > dateTimeDen.Value)
            {
                dateTimeTu.Value = dateTimeDen.Value;
            }
        }
    }
}
