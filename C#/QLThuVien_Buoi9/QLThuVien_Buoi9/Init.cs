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

namespace QLThuVien_Buoi9
{
    public partial class Init : Form
    {
        public Init()
        {
            InitializeComponent();
            // SQLToolBox connSQL = new SQLToolBox(//data source, //database, //user, //passwd);
            SQLToolBox connSQL = new SQLToolBox("DESKTOP-UI9AO8H", "QLThuVien");
            
            Form bai1Form = new Bai1Form(connSQL);
            Form bai2Form = new Bai2Form(connSQL);
            Form bai3Form = new Bai3Form(connSQL);

            foreach(var f in new Dictionary<Form, TabPage>() { { bai1Form , tabBai1 } , { bai2Form, tabBai2 }, { bai3Form, tabBai3 } })
            {
                f.Key.TopLevel = false;
                f.Value.Controls.Add(f.Key);
                f.Key.Show();
            }
        }
    }
}
