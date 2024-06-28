using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Windows.Forms;

namespace LTTQBuoi6_QLSV
{
    public class KetNoiCSDL
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataSet ds;

        public KetNoiCSDL() {
            string str = ConfigurationManager.ConnectionStrings["ketnoi"].ConnectionString;
            //string str = "Data Source=PHONGDANG-LAPTO\\PHONGDANG;Initial Catalog=QLDiemSV;Integrated Security=True;Encrypt=False";
            conn = new SqlConnection(str);
        }

        public void openConnection()
        {
            if (ConnectionState.Closed == conn.State)
            {
                {
                    try
                    {
                        conn.Open();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi kết nối, vui lòng check Connection string");
                    }

                }

            }
        }
        public void closeConnection() {
            if (ConnectionState.Open == conn.State)
            {
                try
                {
                    conn.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi kết nối, vui lòng check Connection string");
                }
            }
        }

        public DataTable Execute(string query) {
            DataTable dt = new DataTable();
            openConnection();
            
            try
            {
                adapter = new SqlDataAdapter(query, conn);
                adapter.Fill(dt);
            }
            catch (Exception ex) { 
            }
            finally
            {
                closeConnection();
            }
            return dt;
        }

        public void ExecuteNonQuery(string query) {
            openConnection();
            try
            {
                cmd = conn.CreateCommand();
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally {
                closeConnection();
            }
            
        }
    }
}
