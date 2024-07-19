using System;
using System.Windows.Forms;

namespace QLThuVien_Buoi9
{
    public class Lib
    {
        public static void setComboBox(ComboBox cb, string target)
        {
            try
            {
                for (int i = 0; i < cb.Items.Count; i++)
                {
                    if (cb.Items[i].ToString().Equals(target))
                    {
                        cb.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {
                cb.SelectedIndex = -1;
            }
        }
    }
}
