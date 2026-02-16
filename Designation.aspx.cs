using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task13Feb
{
    public partial class Designation : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string DeptName = DropDownList1.SelectedValue;
            string DesigName = TextBox1.Text;
            string status = DropDownList2.SelectedValue;

            string q = $"exec sp_InsertDesignation '{DeptName}','{DesigName}','{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Saved Success')</script>");
            LoadGrid();
        }

        private void LoadGrid()
        {
            string q = "SELECT * FROM Designation ORDER BY DesignationId";
            SqlDataAdapter da = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}