using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LTTQBuoi6_QLSV
{
    public partial class DSGiangVien : Form
    {
        KetNoiCSDL ketnoi = new KetNoiCSDL();
        public DSGiangVien()
        {
            InitializeComponent();
        }

        void loaddata()
        {
            string query = "select * from GIANGVIEN";
            dataGridView1.DataSource = ketnoi.Execute(query);
        }
        private void DSGiangVien_Load(object sender, EventArgs e)
        {
            loaddata();
            txtID.Enabled = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string hoten = txtHovaTen.Text;
            string gioitinh = null;
            if (rbNam.Checked) gioitinh = "Nam";
            else gioitinh = "Nữ";
            string sdt = txtSDT.Text;
            string bangcap = txtBangcap.Text;

            string qr = "insert into GIANGVIEN values (N'"+hoten+"',N'"+gioitinh+"','"+sdt+"',N'"+bangcap+"')";
            ketnoi.ExecuteNonQuery(qr);
            loaddata();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            txtID.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
            txtHovaTen.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
            if (dataGridView1.Rows[index].Cells[2].Value.ToString() == "Nam")
                rbNam.Checked = true;
            else rbNu.Checked = true;

            txtSDT.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
            txtBangcap.Text = dataGridView1.Rows[index].Cells[4].Value.ToString();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int magv = Convert.ToInt32(txtID.Text);
            string query = "delete from GIANGVIEN where MaGV = "+magv;
            ketnoi.ExecuteNonQuery(query);
            loaddata();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtID.Text);
            string hoten = txtHovaTen.Text;
            string gioitinh = null;
            if (rbNam.Checked) gioitinh = "Nam";
            else gioitinh = "Nữ";
            string sdt = txtSDT.Text;
            string bangcap = txtBangcap.Text;

            string qr = "UPDATE GIANGVIEN SET TenGV=N'"+hoten+"',Phai=N'"+gioitinh+"',SDT='"+sdt+"',BangCap=N'"+bangcap+"' WHERE MaGV =" + id;
            ketnoi.ExecuteNonQuery(qr);
            loaddata();
            
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            loaddata();
        }

        private void btnTimkiem_Click(object sender, EventArgs e)
        {
            if (rbTimID.Checked)
            {
                string giatri = txtTim.Text;
                int giatriID = Convert.ToInt32(giatri);
                string query = "select * from GIANGVIEN where MaGV = " + giatriID;
                DataTable dt = ketnoi.Execute(query);

                if (dt.Rows.Count > 0)
                {
                    //MessageBox.Show("Tìm thấy");
                    dataGridView1.DataSource = dt;
                }
                else
                {
                    MessageBox.Show("Không tìm thấy");
                }
            }
            else if (rbTimSDT.Checked)
            {
                string sdt = txtTim.Text;
                string query = "select * from GIANGVIEN where SDT ='" + sdt + "'";
                DataTable dt = ketnoi.Execute(query);

                if (dt.Rows.Count > 0)
                {
                    //MessageBox.Show("Tìm thấy");
                    dataGridView1.DataSource = dt;
                }
                else
                {
                    MessageBox.Show("Không tìm thấy");
                }
            }
            else if (rbTimTen.Checked) { 
                string name = txtTim.Text;
                string query = "select * from GIANGVIEN where TenGV =N'" + name + "'";
                DataTable dt = ketnoi.Execute(query);

                if (dt.Rows.Count > 0)
                {
                    //MessageBox.Show("Tìm thấy");
                    dataGridView1.DataSource = dt;
                }
                else
                {
                    MessageBox.Show("Không tìm thấy");
                }
            }
            
            
        }
    }
}
