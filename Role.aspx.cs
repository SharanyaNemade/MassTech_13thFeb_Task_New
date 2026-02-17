using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Task13Feb
{
    public partial class Role : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertRole", con);
                cmd.CommandType = CommandType.StoredProcedure;


                //  It Needs to be replaced

                /*cmd.Parameters.Add("@RoleName", SqlDbType.VarChar, 100).Value = TextBox1.Text.Trim();
                cmd.Parameters.Add("@Status", SqlDbType.VarChar, 20).Value = DropDownList1.SelectedValue;*/

                con.Open();
                cmd.ExecuteNonQuery();
            }

            ClearControls();
            BindGrid();
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_GetRoles", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        private void ClearControls()
        {
            TextBox1.Text = "";
            DropDownList1.SelectedIndex = 0;
        }
    }
}