
//
// Nguyễn Văn Khánh - 22150129
// 221402
// CAFE SINH VIÊN
//

namespace ThanhToan
{
    public partial class Form : System.Windows.Forms.Form
    {
        private int totalCustomer = 0;
        private double totalMoney = 0;
        private double currentMoney = 0;

        public Form()
        {
            InitializeComponent();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát không?", "Thoát", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void btnNhapLai_Click(object sender, EventArgs e)
        {
            this.totalCustomer = 0;
            this.totalMoney = 0;
            this.currentMoney = 0;
            this.wipeInput();
            this.reloadTotal();
            this.btnThanhToan.Enabled = false;
            this.btnNhapLai.Enabled = false;
        }

        private void wipeInput()
        {
            this.tbName.Text = "";
            this.tbID.Text = "";
            this.cbSinhVien.Checked = false;

            this.rbCafeDa.Checked = false;
            this.rbCafeDen.Checked = false;
            this.rbCafeKem.Checked = false;
            this.rbCafeSua.Checked = false;
            this.rbCafeSuaDa.Checked = false;

            this.cbBanhMyCa.Checked = false;
            this.cbBanhMyTrung.Checked = false;
            this.cbMyCay.Checked = false;
            this.cbMyTomTrung.Checked = false;
            this.cbMyXaoBo.Checked = false;
        }

        private void tbName_TextChanged(object sender, EventArgs e)
        {
            SetButton();
        }

        private void tbID_TextChanged(object sender, EventArgs e)
        {
            SetButton();
        }

        private void SetButton()
        {
            if ((this.tbName.Text.Length == 0) || (this.tbID.Text.Length == 0))
            {
                this.btnTinhTien.Enabled = false;
            }
            else
            {
                this.btnTinhTien.Enabled = true;
            }
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            this.totalCustomer += 1;
            this.totalMoney += this.currentMoney;
            this.currentMoney = 0;
            this.reloadTotal();
            this.wipeInput();
            this.btnThanhToan.Enabled = false;
        }

        private void reloadTotal()
        {
            this.tbTotalCustomer.Text = this.totalCustomer.ToString();
            this.tbTotalPay.Text = this.totalMoney.ToString() + " VND";
        }

        private void btnTinhTien_Click(object sender, EventArgs e)
        {
            this.currentMoney = this.tinhTien();
            if (this.currentMoney > (double)0)
            {
                MessageBox.Show("Tổng tiền: " + this.currentMoney.ToString() + " VND", "Thành công", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.btnNhapLai.Enabled = true;
                this.btnThanhToan.Enabled = true;
            } 
            else
            {
                MessageBox.Show("Bạn chưa chọn món hàng nào!", "Thất bại", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private double tinhTien()
        {
            double total = 0;

            if (this.rbCafeDen.Checked) total += 20000;
            if (this.rbCafeDa.Checked) total += 25000;
            if (this.rbCafeSua.Checked) total += 25000;
            if (this.rbCafeSuaDa.Checked) total += 30000;
            if (this.rbCafeKem.Checked) total += 35000;
            if (this.cbBanhMyTrung.Checked) total += 15000;
            if (this.cbBanhMyCa.Checked) total += 15000;
            if (this.cbMyTomTrung.Checked) total += 20000;
            if (this.cbMyXaoBo.Checked) total += 30000;
            if (this.cbMyCay.Checked) total += 50000;

            if (this.cbSinhVien.Checked) total = total * 0.8;

            return total;
        }

        private void tbID_Press(object sender, KeyPressEventArgs e)
        {
            char chr = e.KeyChar;

            if (((chr >= '0') && (chr <= '9')) || (chr == 8))
            {
                
            } else
            {
                e.Handled = true;
            }
        }

        private void Form_Load(object sender, EventArgs e)
        {
            this.tbName.Focus();
            this.btnTinhTien.Enabled = false;
            this.btnNhapLai.Enabled = false;
            this.btnThanhToan.Enabled = false;
            this.reloadTotal();
        }
    }
}
