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
    public partial class ApproveLeave : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                LoadNames();
            }
        }

        private void LoadNames()
        {
            string q = "exec sp_GetEmployeesWithPendingLeave";
            SqlDataAdapter da = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlNames.DataSource = dt;
            ddlNames.DataTextField = "EmpName";
            ddlNames.DataValueField = "EmpId";
            ddlNames.DataBind();

            ddlNames.Items.Insert(0, "-- Select Name --");
        }

        protected void ddlNames_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlNames.SelectedIndex > 0)
            {
                LoadLeaveDetails();
            }
        }

        private void LoadLeaveDetails()
        {
            string EmpId = ddlNames.SelectedValue;

            string q = $"exec sp_GetPendingLeaveByEmp '{EmpId}'";
            SqlCommand cmd = new SqlCommand(q, conn);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                ViewState["LeaveId"] = dr["LeaveId"].ToString();

                txtLeaveType.Text = dr["LeaveType"].ToString();
                txtFrom.Text = Convert.ToDateTime(dr["FromDate"]).ToString("yyyy-MM-dd");
                txtTo.Text = Convert.ToDateTime(dr["ToDate"]).ToString("yyyy-MM-dd");
                txtReason.Text = dr["Reason"].ToString();
            }

            dr.Close();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            UpdateStatus("Approved");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            UpdateStatus("Rejected");
        }

        private void UpdateStatus(string status)
        {
            if (ViewState["LeaveId"] == null)
                return;

            string LeaveId = ViewState["LeaveId"].ToString();

            string q = $"exec sp_UpdateLeaveStatus '{LeaveId}','{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Leave " + status + " Successfully')</script>");

            LoadNames();

            txtLeaveType.Text = "";
            txtFrom.Text = "";
            txtTo.Text = "";
            txtReason.Text = "";
        }
    }
}

















//using System;
//using System.Configuration;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.UI;

//namespace Task13Feb

//{
//    public partial class ApproveLeave : System.Web.UI.Page
//    {
//        private string cs;



//        protected void Page_Load(object sender, EventArgs e)
//        {

//            cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;


//            if (!IsPostBack)
//            {
//                LoadNames();
//            }
//        }

//        private void LoadNames()
//        {
//            using (SqlConnection conn = new SqlConnection(cs))
//            {
//                string query = @"
//                    SELECT DISTINCT e.EmpId, e.EmpName
//                    FROM LeaveRequest l
//                    INNER JOIN Employee e ON l.EmpId = e.EmpId
//                    WHERE l.Status = 'Pending'";

//                SqlDataAdapter da = new SqlDataAdapter(query, conn);

//                DataTable dt = new DataTable();
//                da.Fill(dt);

//                ddlNames.DataSource = dt;
//                ddlNames.DataTextField = "Name";
//                ddlNames.DataValueField = "EmpId";
//                ddlNames.DataBind();

//                ddlNames.Items.Insert(0, "-- Select Name --");
//            }
//        }

//        protected void ddlNames_SelectedIndexChanged(object sender, EventArgs e)
//        {
//            if (ddlNames.SelectedIndex > 0)
//            {
//                FetchLeaveData(ddlNames.SelectedValue);
//            }
//        }

//        private void FetchLeaveData(string name)
//        {
//            using (SqlConnection conn = new SqlConnection(cs))
//            {
//                string query = @"SELECT TOP 1 *
//                                 FROM LeaveRequest
//                                 WHERE Name=@Name AND Status='Pending'
//                                 ORDER BY LeaveId DESC";

//                SqlCommand cmd = new SqlCommand(query, conn);
//                cmd.Parameters.AddWithValue("@Name", name);

//                conn.Open();
//                SqlDataReader dr = cmd.ExecuteReader();

//                if (dr.Read())
//                {
//                    txtLeaveType.Text = dr["leavetype"].ToString();
//                    txtFrom.Text = dr["fromd"].ToString();
//                    txtTo.Text = dr["tod"].ToString();
//                    txtReason.Text = dr["reason"].ToString();
//                }
//            }
//        }

//        protected void btnApprove_Click(object sender, EventArgs e)
//        {
//            UpdateStatus("Approved");
//        }

//        protected void btnReject_Click(object sender, EventArgs e)
//        {
//            UpdateStatus("Rejected");
//        }

//        private void UpdateStatus(string status)
//        {
//            if (ddlNames.SelectedIndex <= 0)
//                return;

//            using (SqlConnection conn = new SqlConnection(cs))
//            {
//                string query = @"UPDATE LeaveRequest
//                                 SET Status=@Status
//                                 WHERE Name=@Name AND Status='Pending'";

//                SqlCommand cmd = new SqlCommand(query, conn);
//                cmd.Parameters.AddWithValue("@Status", status);
//                cmd.Parameters.AddWithValue("@Name", ddlNames.SelectedValue);

//                conn.Open();
//                cmd.ExecuteNonQuery();
//            }

//            ScriptManager.RegisterStartupScript(this, GetType(),
//                "alert", $"alert('Leave {status} Successfully');", true);

//            LoadNames();
//        }
//    }
//}