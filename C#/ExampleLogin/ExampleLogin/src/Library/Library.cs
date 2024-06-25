using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExampleLogin
{
    public class Library
    {
        public static void killPid(int pid)
        {
            Process.GetProcessById(pid).Kill();
        }

        public static int getPid()
        {
            return Process.GetCurrentProcess().Id;
        }
    }
}
