using ExampleLogin.src.Library;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExampleLogin
{
    public partial class QuanLyForm : Form
    {
        private SQLToolBox connSQL;
        public QuanLyForm(SQLToolBox connSQL)
        {
            InitializeComponent();
            this.connSQL = connSQL;
        }

        private void QuanLyForm_Load(object sender, EventArgs e)
        {
            this.connSQL.Connect();
            dataGridView1.DataSource = this.connSQL.Select("Select * from account;").getDataTable();

            this.connSQL.Close();

            this.tbTenTaiKhoan.Focus();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView1.CurrentRow.Index;
            tbTenTaiKhoan.Text = dataGridView1.Rows[index].Cells[0].Value.ToString();
            tbMatKhau.Text = dataGridView1.Rows[index].Cells[1].Value.ToString();
            tbSDT.Text = dataGridView1.Rows[index].Cells[2].Value.ToString();
            tbEmail.Text = dataGridView1.Rows[index].Cells[3].Value.ToString();
        }
    }
}
