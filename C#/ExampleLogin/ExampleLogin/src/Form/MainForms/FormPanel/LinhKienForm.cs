using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class LinhKienForm : Form
    {
        private MainForm mainForm = null;
        private Thread threadSearch = null;
        private DataTable dtOld = null;
        private SQLToolBox connSQL;
        private string tableName = "LinhKien";

        public LinhKienForm(SQLToolBox connSQL, MainForm mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
            this.connSQL = connSQL;
            this.connSQL.Connect();
        }

        private void HangHoaForm_Load(object sender, EventArgs e)
        {
            this.loadData();
            this.wipeInput();
            this.generateMaLinhKien();
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            tbTimKiem.Text = "";
            if (cbLoc.Items.Count > 0)
            {
                cbLoc.SelectedIndex = 0;
            }
            cbUpLowCase.Checked = false;

            // load Nhom mat hang
            SQLTable table = this.connSQL.Select("select MaLoaiLK, TenLoaiLK from LoaiLinhKien;");

            cbNhomLinhKien.Items.Clear();
            for (int i = 0; i < table.Count; i++)
            {
                cbNhomLinhKien.Items.Add(table.Row(i).Column(1));
            }
            if (cbNhomLinhKien.Items.Count > 0)
            {
                tbMaLinhKien.Text = table.Row(0).Column(0);
                cbNhomLinhKien.SelectedIndex = 0;
            }

            // load nhaCungCap
            table = this.connSQL.Select("select TenNhaCungCap from NhaCungCap;");
            cbNhaCungCap.Items.Clear();
            for(int i = 0; i < table.Count; i++)
            {
                cbNhaCungCap.Items.Add(table.Row(i).Column(0));
            }
            if (cbNhaCungCap.Items.Count > 0)
            {
                cbNhaCungCap.SelectedIndex = 0;
            }

            // load datagridview
            table = this.connSQL.Select("select * from " + this.tableName + ";");
            Library.setDataSource(dataGridView1, table.getDataTable());

            // search
            cbLoc.Items.Clear();
            cbLoc.Items.Add("");
            for (int i = 0; i < table.Row(0).Count; i++)
            {
                cbLoc.Items.Add(table.Row(0).ColumnName(i));
            }
        }

        private void cbNhomLinhKien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            tbMaLinhKien.Text = this.connSQL.Select("select MaLoaiLK from LoaiLinhKien;").Row(cbNhomLinhKien.SelectedIndex).Column(0);
        }

        private void generateMaLinhKien()
        {
            if (dataGridView1.Rows.Count > 0)
            {
                string maMH = dataGridView1.Rows[dataGridView1.Rows.Count - 2].Cells[dataGridView1.Columns[0].Name].Value.ToString();
                if ((maMH.Length >= 5) && (maMH.StartsWith("MH")))
                {
                    try
                    {
                        int num = Convert.ToInt32(maMH.Substring(2, maMH.Length - 2)) + 1;
                        maMH = "MH";
                        if (num <= 9)
                        {
                            maMH = maMH + "00";
                        }
                        else if (num <= 99)
                        {
                            maMH = maMH + "0";
                        }
                        maMH = maMH + num.ToString();
                        tbMaMatHang.Text = maMH;
                        tbMaMatHang.ReadOnly = true;
                    }
                    catch (Exception ex)
                    {
                        tbMaMatHang.Text = "";
                        tbMaMatHang.ReadOnly = false;
                    }

                }
                else
                {
                    tbMaMatHang.Text = "";
                    tbMaMatHang.ReadOnly = false;
                }
            }
            else
            {
                tbMaMatHang.Text = "MH000";
                tbMaMatHang.ReadOnly = true;
            }
        }

        private void wipeInput()
        {
            tbTenMatHang.Text = "";
            tbGia.Text = "0";
            tbMoTa.Text = "";
            numBaoHanh.Value = 12;
            numKhuyenMai.Value = 0;

            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;

        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            this.HangHoaForm_Load(sender, e);
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State())this.connSQL.Connect();

            string maLK = tbMaMatHang.Text;
            if (MessageBox.Show("Bạn có muốn xóa linh kiện [" + maLK + "] không?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            SqlCommand cmd = new SqlCommand("DELETE FROM " + this.tableName + " WHERE (MaLK = @MaLK);");
            cmd.Parameters.AddWithValue("@MaLK", maLK);

            if (this.connSQL.Execute(cmd))
            {
                this.HangHoaForm_Load(sender, e);
                MessageBox.Show("Xóa linh kiện thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maLK = tbMaMatHang.Text;
            string maNhaCungCap = cbNhaCungCap.Text;
            string maLoaiLK = cbNhomLinhKien.Text;
            string tenLinhKien = tbTenMatHang.Text;
            string gia = tbGia.Text;
            int baoHanh = Convert.ToInt32(numBaoHanh.Value.ToString());
            int khuyenMai = Convert.ToInt32(numKhuyenMai.Value.ToString());
            string moTa = tbMoTa.Text;

            // maNhaCungCap
            SqlCommand cmd = new SqlCommand("select MaNhaCungCap from NhaCungCap where (TenNhaCungCap = @TenNhaCungCap);");
            cmd.Parameters.AddWithValue("@TenNhaCungCap", maNhaCungCap);

            maNhaCungCap = this.connSQL.Select(cmd).Row(0).Column(0);

            // MaLoaiLK
            cmd = new SqlCommand("select MaLoaiLK from LoaiLinhKien where (TenLoaiLK = @TenLoaiLK);");
            cmd.Parameters.AddWithValue("@TenLoaiLK", maLoaiLK);

            maLoaiLK = this.connSQL.Select(cmd).Row(0).Column(0);

            foreach (string s in new List<string>() { maLK, maNhaCungCap, maLoaiLK, tenLinhKien, gia })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            cmd = new SqlCommand("UPDATE " + this.tableName + " SET MaNhaCungCap = @MaNhaCungCap, MaLoaiLK = @MaLoaiLK, TenLK = @TenLK, Gia = @Gia, BaoHanh = @BaoHanh, KhuyenMai = @KhuyenMai, MoTa = @MoTa WHERE (maLK = @maLK);");
            cmd.Parameters.AddWithValue("@maLK", maLK);
            cmd.Parameters.AddWithValue("@MaNhaCungCap", maNhaCungCap);
            cmd.Parameters.AddWithValue("@MaLoaiLK", maLoaiLK);
            cmd.Parameters.AddWithValue("@TenLK", tenLinhKien);
            cmd.Parameters.AddWithValue("@Gia", gia);
            cmd.Parameters.AddWithValue("@BaoHanh", baoHanh);
            cmd.Parameters.AddWithValue("@KhuyenMai", khuyenMai);
            cmd.Parameters.AddWithValue("@MoTa", moTa);

            if (this.connSQL.Execute(cmd))
            {
                this.HangHoaForm_Load(sender, e);
                MessageBox.Show("Sửa linh kiện thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maLK = tbMaMatHang.Text;
            string maNhaCungCap = cbNhaCungCap.Text;
            string maLoaiLK = cbNhomLinhKien.Text;
            string tenMatHang = tbTenMatHang.Text;
            string gia = tbGia.Text;
            int baoHanh = Convert.ToInt32(numBaoHanh.Value.ToString());
            int khuyenMai = Convert.ToInt32(numKhuyenMai.Value.ToString());
            string moTa = tbMoTa.Text;

            // maNhaCungCap
            SqlCommand cmd = new SqlCommand("select MaNhaCungCap from NhaCungCap where (TenNhaCungCap = @TenNhaCungCap);");
            cmd.Parameters.AddWithValue("@TenNhaCungCap", maNhaCungCap);

            maNhaCungCap = this.connSQL.Select(cmd).Row(0).Column(0);

            // maLoaiMH
            cmd = new SqlCommand("select MaLoaiLK from LoaiLinhKien where (TenLoaiLK = @TenLoaiLK);");
            cmd.Parameters.AddWithValue("@TenLoaiLK", maLoaiLK);

            maLoaiLK = this.connSQL.Select(cmd).Row(0).Column(0);

            foreach (string s in new List<string>() { maLK, maNhaCungCap, maLoaiLK, tenMatHang, gia })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            cmd = new SqlCommand("INSERT INTO " + this.tableName + " (MaLK, MaNhaCungCap, MaLoaiLK, TenLK, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (@MaLK, @MaNhaCungCap, @MaLoaiLK, @TenLK, @Gia, @BaoHanh, @KhuyenMai, @MoTa);");
            cmd.Parameters.AddWithValue("@MaLK", maLK);
            cmd.Parameters.AddWithValue("@MaNhaCungCap", maNhaCungCap);
            cmd.Parameters.AddWithValue("@MaLoaiLK", maLoaiLK);
            cmd.Parameters.AddWithValue("@TenLK", tenMatHang);
            cmd.Parameters.AddWithValue("@Gia", gia);
            cmd.Parameters.AddWithValue("@BaoHanh", baoHanh);
            cmd.Parameters.AddWithValue("@KhuyenMai", khuyenMai);
            cmd.Parameters.AddWithValue("@MoTa", moTa);

            if (this.connSQL.Execute(cmd))
            {
                this.HangHoaForm_Load(sender, e);
                MessageBox.Show("Thêm linh kiện thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Thêm linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if ((dataGridView1.Rows.Count - 1) == index)
            {
                this.wipeInput();
                this.generateMaLinhKien();
            }
            else
            {
                if (!this.connSQL.State())
                {
                    this.connSQL.Connect();
                }
                SqlCommand cmd = null;
                tbMaMatHang.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();

                cmd = new SqlCommand("select TenNhaCungCap from NhaCungCap where (MaNhaCungCap = @MNCC);");
                cmd.Parameters.AddWithValue("@MNCC", dataGridView1.Rows[index].Cells[1].Value.ToString());
                cbNhaCungCap.Text = this.connSQL.Select(cmd).Row(0).Column(0);

                cmd = new SqlCommand("select TenLoaiLK from LoaiLinhKien where (MaLoaiLK = @MaLoaiLK);");
                cmd.Parameters.AddWithValue("@MaLoaiLK", dataGridView1.Rows[index].Cells[2].Value.ToString());
                cbNhomLinhKien.Text = this.connSQL.Select(cmd).Row(0).Column(0);

                tbTenMatHang.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
                tbGia.Text = dataGridView1.Rows[index].Cells[4].Value.ToString();
                numBaoHanh.Value = Convert.ToInt32(dataGridView1.Rows[index].Cells[5].Value.ToString());
                numKhuyenMai.Value = Convert.ToInt32(dataGridView1.Rows[index].Cells[6].Value.ToString());
                tbMoTa.Text = dataGridView1.Rows[index].Cells[7].Value.ToString();

                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnSua.Enabled = true;
            }
        }

        private void search()
        {
            this.search(false);
        }

        private void search(bool noWait)
        {
            this.dtOld = Library.searchGridData(dataGridView1, this.dtOld, tbTimKiem, cbLoc, noWait, cbUpLowCase.Checked);
        }

        private void tbTimKiem_TextChanged_1(object sender, EventArgs e)
        {
            this.threadSearch = Library.abortThread(this.threadSearch);

            this.threadSearch = new Thread(new ThreadStart(search));
            this.threadSearch.Start();
            GC.Collect(0);
        }

        private void cbLoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tbTimKiem.Text.Length == 0)
            {
                return;
            }
            this.threadSearch = Library.abortThread(this.threadSearch);
            this.search(true);

            // this.tbTimKiem_TextChanged(sender, e);
        }

        private void tbTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Return)
            {
                this.threadSearch = Library.abortThread(this.threadSearch);
                this.search(true);
            }
        }

        private void cbUpLowCase_CheckedChanged(object sender, EventArgs e)
        {
            this.cbLoc_SelectedIndexChanged(sender, e);
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Form fm = new LoaiLinhKienForm(this.connSQL, mainForm);
            fm.TopLevel = false;
            mainForm.switchForm(this, fm);
        }

    }
}
