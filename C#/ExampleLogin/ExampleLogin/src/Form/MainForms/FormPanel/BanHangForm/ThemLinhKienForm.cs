using ExampleLogin.src.Library;
using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class ThemLinhKienForm : Form
    {
        private SQLToolBox connSQL;
        public Boolean Success = false;

        public ThemLinhKienForm(SQLToolBox connSQL, string MaDH)
        {
            InitializeComponent();
            this.connSQL = connSQL;
            this.Text = "Thêm linh kiện | Mã đơn hàng " + MaDH;
            soLuong.TextChanged += new EventHandler(soLuong_ValueChanged);
            khuyenMai.TextChanged += new EventHandler(soLuong_ValueChanged);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            this.Success = true;
            this.Close();
        }

        private void ThemLinhKienForm_Load(object sender, EventArgs e)
        {
            this.loadData();
            cbTenLinhKien.Enabled = false;
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            cbTenLoai.Items.Clear();
            SQLTable table = this.connSQL.Select("select TenLoaiLK from LoaiLinhKien;");
            for(int i = 0; i < table.Count; i++)
            {
                cbTenLoai.Items.Add(table.Row(i).Column(0));
            }
        }

        private void loadDataLinhKien()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            cbTenLinhKien.Items.Clear();
            SqlCommand cmd = new SqlCommand("select TenLK from LinhKien where (MaLoaiLK = @MaLoaiLK);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", tbMaLoai.Text);
            SQLTable table = this.connSQL.Select(cmd);
            for (int i = 0; i < table.Count; i++)
            {
                cbTenLinhKien.Items.Add(table.Row(i).Column(0));
            }
        }

        private void cbTenLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select MaLoaiLK from LoaiLinhKien where (TenLoaiLK = @TenLoaiLK);");
            cmd.Parameters.AddWithValue("@TenLoaiLK", cbTenLoai.Text);
            tbMaLoai.Text = this.connSQL.Select(cmd).Row(0).Column(0);
            if (!string.IsNullOrEmpty(tbMaLoai.Text))
            {
                this.loadDataLinhKien();
                cbTenLinhKien.Enabled = true;
                btnThem.Enabled = false;
            }
        }

        private void cbTenLinhKien_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select MaLK, Gia, BaoHanh, KhuyenMai, MoTa, HinhAnh from LinhKien where (TenLK = @TenLK);");
            cmd.Parameters.AddWithValue("@TenLK", cbTenLinhKien.Text);
            SQLTable table = this.connSQL.Select(cmd);
            tbMaLinhKien.Text = table.Row(0).Column("MaLK");
            if (!string.IsNullOrEmpty(tbMaLinhKien.Text))
            {
                tbDonGia.Text = table.Row(0).Column("Gia");
                soLuong.Value = 1;
                baoHanh.Value = Convert.ToInt32(table.Row(0).Column("BaoHanh"));
                khuyenMai.Value = Convert.ToInt32(table.Row(0).Column("KhuyenMai"));
                tbMoTa.Text = table.Row(0).Column("MoTa");
                this.change_img(anhSanPham, "assets\\" + table.Row(0).Column("HinhAnh"));
                btnThem.Enabled = true;
            }
        }

        private void change_img(PictureBox pictureBox1, String path)
        {
            if (pictureBox1.Image != null)
            {
                var i = pictureBox1.Image;  // cache it to dispose
                pictureBox1.Image = null;     // don't dispose an used object
                i.Dispose();                // and dispose of it
            }

            pictureBox1.Image = new Bitmap(path);
            pictureBox1.Refresh();
        }

        private void soLuong_ValueChanged(object sender, EventArgs e)
        {
            tbThanhTien.Text = ( (Convert.ToInt32(tbDonGia.Text) * soLuong.Value) / 100 * (100 - khuyenMai.Value) ).ToString();
        }

        public String getMaLoai()
        {
            return this.tbMaLoai.Text;
        }

        public String getMaLinhKien()
        {
            return this.tbMaLinhKien.Text;
        }

        public String getTenLinhKien()
        {
            return this.cbTenLinhKien.Text;
        }

        public String getDonGia()
        {
            return this.tbDonGia.Text;
        }

        public int getSoLuong()
        {
            return (int)this.soLuong.Value;
        }

        public int getBaoHanh()
        {
            return (int)this.baoHanh.Value;
        }

        public int getKhuyenMai()
        {
            return (int)this.khuyenMai.Value;
        }

        public String getMoTa()
        {
            return this.tbMoTa.Text;
        }

        public String getThanhTien()
        {
            return this.tbThanhTien.Text;
        }

        public void setMaLinhKien(string s)
        {
            this.tbMaLinhKien.Text = s;
            SqlCommand cmd = new SqlCommand("select TenLK, MoTa from LinhKien where (MaLK = @MaLK);");
            cmd.Parameters.AddWithValue("@MaLK", s);
            SQLTable table = this.connSQL.Select(cmd);
            string name = table.Row(0).Column(0);
            tbMoTa.Text = table.Row(0).Column(1);

            cbTenLinhKien.DropDownStyle = ComboBoxStyle.DropDown;
            cbTenLinhKien.Text = name;
            btnThem.Text = "Sửa";
            btnThem.Enabled = true;
        }

        public void setLoai(string s) 
        {
            this.tbMaLoai.Text = s;
            SqlCommand cmd = new SqlCommand("select TenLoaiLK from LoaiLinhKien where (MaLoaiLK = @MaLoaiLK);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", s);
            SQLTable table = this.connSQL.Select(cmd);
            string name = table.Row(0).Column(0);
            cbTenLoai.DropDownStyle = ComboBoxStyle.DropDown;
            cbTenLoai.Enabled = false;
            cbTenLoai.Text = name;
        }

        public void setDonGia(string s)
        {
            this.tbDonGia.Text = s;
        }

        public void setSoLuong(int s)
        {
            this.soLuong.Value = s;
        }

        public void setBaoHanh(int s)
        {
            this.baoHanh.Value = s;
        }

        public void setKhuyenMai(int s)
        {
            this.khuyenMai.Value = s;
        }

        public void setThanhTien(string s)
        {
            this.tbThanhTien.Text = s;
        }

        private void khuyenMai_ValueChanged(object sender, EventArgs e)
        {
            this.soLuong_ValueChanged(sender, e);
        }
    }
}
