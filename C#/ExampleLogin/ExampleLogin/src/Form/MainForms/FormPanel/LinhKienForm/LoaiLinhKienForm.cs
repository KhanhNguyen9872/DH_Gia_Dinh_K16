using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class LoaiLinhKienForm : Form
    {
        private SQLToolBox connSQL = null;
        private MainForm mainForm = null;
        private String tableName = "LoaiLinhKien";

        public LoaiLinhKienForm(SQLToolBox connSQL, MainForm mainForm)
        {
            InitializeComponent();
            this.connSQL = connSQL;
            this.mainForm = mainForm;
        }

        private void pictureBoxBack_Click(object sender, EventArgs e)
        {
            mainForm.backToOldForm(this);
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            this.LoaiHangHoaForm_Load(sender, e);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maLoaiLK = tbMaLoai.Text;
            string tenLoaiLK = tbTenLoai.Text;
            string ngayTao = DateTime.Now.ToString();

            foreach (string s in new List<string>() { maLoaiLK, tenLoaiLK })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            SqlCommand cmd = new SqlCommand("INSERT INTO " + this.tableName + " (MaLoaiLK, TenLoaiLK, NgayTao, NgayCapNhat) VALUES (@MaLoaiLK, @TenLoaiLK, @NgayTao, @NgayCapNhat);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", maLoaiLK);
            cmd.Parameters.AddWithValue("@TenLoaiLK", tenLoaiLK);
            cmd.Parameters.AddWithValue("@NgayTao", ngayTao);
            cmd.Parameters.AddWithValue("@NgayCapNhat", ngayTao);

            if (this.connSQL.Execute(cmd))
            {
                this.LoaiHangHoaForm_Load(sender, e);
                MessageBox.Show("Thêm loại linh kiện thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Thêm loại linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maLoaiLK = tbMaLoai.Text;
            if (MessageBox.Show("Bạn có muốn xóa loại linh kiện [" + maLoaiLK + "] không?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
            {
                return;
            }

            SqlCommand cmd = new SqlCommand("DELETE FROM " + this.tableName + " WHERE (MaLoaiLK = @MaLoaiLK);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", maLoaiLK);

            if (this.connSQL.Execute(cmd))
            {
                this.LoaiHangHoaForm_Load(sender, e);
                MessageBox.Show("Xóa loại linh kiện thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa loại linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (!this.connSQL.State()) this.connSQL.Connect();

            string maLoaiLK = tbMaLoai.Text;
            string tenLoaiLK = tbTenLoai.Text;
            string ngayTao = DateTime.Now.ToString();

            foreach (string s in new List<string>() { maLoaiLK, tenLoaiLK })
            {
                if (string.IsNullOrEmpty(s))
                {
                    MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }

            SqlCommand cmd = new SqlCommand("UPDATE " + this.tableName + " SET TenLoaiLK = @TenLoaiLK, NgayCapNhat = @NgayCapNhat WHERE (MaLoaiLK = @MaLoaiLK);");
            cmd.Parameters.AddWithValue("@MaLoaiLK", maLoaiLK);
            cmd.Parameters.AddWithValue("@TenLoaiLK", tenLoaiLK);
            cmd.Parameters.AddWithValue("@NgayCapNhat", ngayTao);

            if (this.connSQL.Execute(cmd))
            {
                this.LoaiHangHoaForm_Load(sender, e);
                MessageBox.Show("Sửa linh kiện thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa linh kiện thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if ((dataGridView1.Rows.Count - 1) == index)
            {
                this.wipeButton();
            }
            else
            {
                List<TextBox> list = new List<TextBox>() { tbMaLoai, tbTenLoai, tbNgayTao, tbThayDoiGanNhat };
                for(int i = 0; i < list.Count; i++)
                {
                    try
                    {
                        list[i].Text = dataGridView1.Rows[index].Cells[i].Value.ToString();
                    } catch (Exception ex)
                    {
                        break;
                    }
                }

                tbMaLoai.ReadOnly = true;
                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnSua.Enabled = true;
            }
        }

        private void LoaiHangHoaForm_Load(object sender, EventArgs e)
        {
            this.loadData();
            this.wipeButton();
        }

        private void loadData()
        {
            if (!this.connSQL.State()) this.connSQL.Connect();
            SQLTable table = this.connSQL.Select("select * from " + this.tableName + ";");
            Library.setDataSource(dataGridView1, table.getDataTable());
        }

        private void wipeButton()
        {
            tbMaLoai.Text = "";
            tbTenLoai.Text = "";
            tbNgayTao.Text = "";
            tbThayDoiGanNhat.Text = "";

            tbMaLoai.ReadOnly = false;
            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
        }
    }
}
