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
    public partial class ThongTinMonHoc : Form
    {
        KetNoiCSDL ketnoi = new KetNoiCSDL();
        public ThongTinMonHoc()
        {
            InitializeComponent();
        }

        void loaddata()
        {
            string query = "select * from MonHoc";
            dataGridView1.DataSource = ketnoi.Execute(query);
        }
        private void DSGiangVien_Load(object sender, EventArgs e)
        {
            loaddata();
            txtID.Enabled = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string tenMonHoc = txtTenMonHoc.Text;
            string soTC = txtSoTC.Text;
            string moTa = txtMoTa.Text;

            string qr = "insert into MonHoc values (N'" + tenMonHoc + "','"+ soTC+ "',N'"+moTa+"')";
            ketnoi.ExecuteNonQuery(qr);
            loaddata();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            txtID.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
            txtTenMonHoc.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();

            txtSoTC.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();
            txtMoTa.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int mamh = Convert.ToInt32(txtID.Text);
            string query = "delete from MonHoc where MaMH = " + mamh;
            ketnoi.ExecuteNonQuery(query);
            loaddata();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtID.Text);
            string tenMH = txtTenMonHoc.Text;
            string soTC = txtSoTC.Text;
            string mota = txtMoTa.Text;

            string qr = "UPDATE MonHoc SET TenMH=N'" + tenMH + "',SoTC='"+soTC+"',MoTa='"+mota+"' WHERE MAMH =" + id;
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
                string mamh = txtTim.Text;
                int mamhID = Convert.ToInt32(mamh);
                string query = "select * from MonHoc where MaMH = " + mamhID;
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
            else if (rbSoTinChi.Checked)
            {
                string SoTinChi = txtTim.Text;
                string query = "select * from MonHoc where SoTC ='" + SoTinChi + "'";
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
                string query = "select * from MonHoc where TenMH =N'" + name + "'";
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

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
