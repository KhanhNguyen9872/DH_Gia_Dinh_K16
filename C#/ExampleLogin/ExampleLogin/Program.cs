using ExampleLogin.src.Library;
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace ExampleLogin
{
    internal static class Program
    {
        [STAThread]
        [DllImport("user32.dll")]
        static extern bool SetForegroundWindow(IntPtr hWnd);

        static void Main()
        {
            Process p = Library.PriorProcess();
            if (p != null)
            {
                SetForegroundWindow(p.MainWindowHandle);
                // MessageBox.Show("Another instance of the app is already running!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                Library.killPid(Library.getPid());
            }

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new InitForm());
        }
    }
}
