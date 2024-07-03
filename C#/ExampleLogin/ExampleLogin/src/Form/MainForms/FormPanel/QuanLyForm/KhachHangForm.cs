using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.VisualStyles;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace ExampleLogin
{
    public partial class KhachHangForm : Form
    {
        private SQLToolBox connSQL;
        private string tableName = "KhachHang";
        private DataTable dtOld;
        private Thread threadSearch = null;
        

        public KhachHangForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
        }

        private void loadData()
        {
            this.connSQL.Connect();
            SQLTable s = this.connSQL.Select("Select * from " + this.tableName + ";");
            this.connSQL.Close();

            Library.setDataSource(dataGridView1, s.getDataTable());            
            cbTimKiem.Items.Clear();
            cbTimKiem.Items.Add("");

            if (s.Count > 0)
            {
                for (int i = 0; i < s.Row(0).Count; i++)
                {
                    cbTimKiem.Items.Add(s.Row(0).ColumnName(i));
                }

            }

            cbTimKiem.SelectedIndex = 0;
            GC.Collect(0);
        }

        private void QuanLyForm_Load(object sender, EventArgs e)
        {
            this.loadData();

            this.wipeButton();
            this.btnThem.Enabled = true;
            this.btnSua.Enabled = false;
            this.btnXoa.Enabled = false;
            this.tbTenKhachHang.Focus();

            this.generateMaKhachHang();
        }

        private void generateMaKhachHang()
        {
            if (dataGridView1.Rows.Count > 0)
            {
                string maKhachHang = dataGridView1.Rows[dataGridView1.Rows.Count - 2].Cells[dataGridView1.Columns[0].Name].Value.ToString();
                if ((maKhachHang.Length >= 5) && (maKhachHang.StartsWith("KH")))
                {
                    try
                    {
                        int num = Convert.ToInt32(maKhachHang.Substring(2, maKhachHang.Length - 2)) + 1;
                        maKhachHang = "KH";
                        if (num <= 9)
                        {
                            maKhachHang = maKhachHang + "00";
                        }
                        else if (num <= 99)
                        {
                            maKhachHang = maKhachHang + "0";
                        }
                        maKhachHang = maKhachHang + num.ToString();
                        tbMaKhachHang.Text = maKhachHang;
                    }
                    catch (Exception ex)
                    {
                        tbMaKhachHang.Text = "";
                        tbMaKhachHang.ReadOnly = false;
                    }

                }
                else
                {
                    tbMaKhachHang.Text = "";
                    tbMaKhachHang.ReadOnly = false;
                }
            }
            else
            {
                tbMaKhachHang.Text = "KH000";
            }
        }

        private void wipeButton()
        {
            foreach(TextBox s in new List<TextBox>() { tbMaKhachHang, tbTenKhachHang, tbDiaChi, tbSDT, tbEmail }) {
                s.Text = "";
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            if ((dataGridView1.Rows.Count - 1) == index)
            {
                btnThem.Enabled = true;
                btnXoa.Enabled = false;
                btnSua.Enabled = false;
                this.wipeButton();
                this.generateMaKhachHang();
            }
            else
            {
                List<TextBox> list = new List<TextBox>() { tbMaKhachHang, tbTenKhachHang, tbDiaChi, tbSDT, tbEmail };
                for (int i = 0; i < list.Count; i++)
                {
                    list[i].Text = dataGridView1.Rows[index].Cells[i].Value.ToString();
                }

                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnSua.Enabled = true;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                this.connSQL.Connect();
                string maKhachHang = tbMaKhachHang.Text;
                string tenKhachHang = tbTenKhachHang.Text;
                string diaChi = tbDiaChi.Text;
                string sdt = tbSDT.Text;
                string email = tbEmail.Text;
                
                foreach (string s in new List<string>() { maKhachHang, tenKhachHang, diaChi, sdt, email })
                {
                    if (string.IsNullOrEmpty(s))
                    {
                        MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO " + this.tableName + " (MaKH, TenKH, DiaChi, SDT, Email) VALUES (@MaKH, @TenKH, @DiaChi, @SDT, @Email);");
                cmd.Parameters.AddWithValue("@MaKH", maKhachHang);
                cmd.Parameters.AddWithValue("@TenKH", tenKhachHang);
                cmd.Parameters.AddWithValue("@DiaChi", diaChi);
                cmd.Parameters.AddWithValue("@SDT", sdt);
                cmd.Parameters.AddWithValue("@Email", email);

                if (this.connSQL.Execute(cmd))
                {
                    this.QuanLyForm_Load(sender, e);
                    MessageBox.Show("Thêm khách hàng thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Thêm khách hàng thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            } finally
            {
                this.connSQL.Close();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                string maKH = tbMaKhachHang.Text;
                if (MessageBox.Show("Bạn có muốn xóa khách hàng [" + maKH + "] không?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
                {
                    return;
                }

                this.connSQL.Connect();
                
                SqlCommand cmd = new SqlCommand("DELETE FROM " + this.tableName + " WHERE (MaKH = @MaKH);");
                cmd.Parameters.AddWithValue("@MaKH", maKH);

                if (this.connSQL.Execute(cmd))
                {
                    MessageBox.Show("Xóa khách hàng thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Xóa khách hàng thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                this.QuanLyForm_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                this.connSQL.Close();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                this.connSQL.Connect();
                string maKhachHang = tbMaKhachHang.Text;
                string tenKhachHang = tbTenKhachHang.Text;
                string diaChi = tbDiaChi.Text;
                string sdt = tbSDT.Text;
                string email = tbEmail.Text;

                foreach (string s in new List<string>() { maKhachHang, tenKhachHang, diaChi, sdt, email })
                {
                    if (string.IsNullOrEmpty(s))
                    {
                        MessageBox.Show("Dữ liệu không được để trống!", "LỖI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                }

                SqlCommand cmd = new SqlCommand("UPDATE " + this.tableName + " set TenKH = @TenKH, DiaChi = @DiaChi, SDT = @SDT, Email = @Email WHERE (MaKH = @MaKH);");
                cmd.Parameters.AddWithValue("@MaKH", maKhachHang);
                cmd.Parameters.AddWithValue("@TenKH", tenKhachHang);
                cmd.Parameters.AddWithValue("@DiaChi", diaChi);
                cmd.Parameters.AddWithValue("@SDT", sdt);
                cmd.Parameters.AddWithValue("@Email", email);

                if (this.connSQL.Execute(cmd))
                {
                    this.QuanLyForm_Load(sender, e);
                    MessageBox.Show("Sửa khách hàng thành công!", "THÀNH CÔNG", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Sửa khách hàng thất bại!", "THẤT BẠI", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                this.connSQL.Close();
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            tbTimKiem.Text = "";
            this.tbTimKiem_TextChanged(sender, e);
            this.loadData();
        }

        private void tbTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (this.threadSearch != null)
            {
                this.threadSearch.Abort();
            }

            this.threadSearch = new Thread(new ThreadStart(search));
            this.threadSearch.Start();
            GC.Collect(0);
        }

        private void search()
        {
            this.search(false);
        }

        private void search(bool noWait)
        {
            this.dtOld = Library.searchGridData(dataGridView1, this.dtOld, tbTimKiem, cbTimKiem, noWait);
        }

        private void cbTimKiem_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tbTimKiem.Text.Length == 0)
            {
                return;
            }
            this.search(true);

            // this.tbTimKiem_TextChanged(sender, e);
        }
    }
}
