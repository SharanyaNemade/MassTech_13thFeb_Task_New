using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Task13Feb
{
    public partial class Department : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                FetchList();
            }
               
        }

        // SUBMIT button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            string deptName = TextBox1.Text;
            string status = DropDownList2.SelectedValue;

            string q = $"exec sp_InsertDepartment '{deptName}','{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Saved Success')</script>");

            FetchList();
            
        }

        //public void FetchList()
        //{
        //    string q = "exec sp_GetDepartmentById";
        //    SqlDataAdapter ada = new SqlDataAdapter(q, conn);
        //    DataSet ds = new DataSet();
        //    ada.Fill(ds);
        //    GridView2.DataSource = ds;
        //    GridView2.DataBind();
        //}


        public void FetchList()
        {
            int deptId;

            if (!int.TryParse(TextBox1.Text, out deptId))
            {
                Response.Write("<script>alert('Enter valid Department ID')</script>");
                return;
            }

            SqlCommand cmd = new SqlCommand("sp_GetDepartmentById", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DeptId", deptId);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            GridView2.DataSource = ds;
            GridView2.DataBind();
        }


        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lbl = (Label)GridView2.Rows[e.RowIndex].FindControl("Label1");
            int id = int.Parse(lbl.Text);
            string q = $"exec sp_deleteDept '{id}'";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Deleted')</script>");
            FetchList();
        }
    }
}
