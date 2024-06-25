using ExampleLogin.src;
using System;
using System.Windows.Forms;

namespace ExampleLogin
{
    internal static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MainForm(new src.Library.SQLToolBox(""), "root"));
        }
    }
}
