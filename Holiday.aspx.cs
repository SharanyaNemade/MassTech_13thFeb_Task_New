using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Task13Feb
{
    public partial class Holiday : System.Web.UI.Page
    {
        private readonly string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEvents();
                BindGrid();
            }
        }

        private void BindEvents()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT EventId, EventName FROM Event WHERE Status='Active'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "EventName";
                DropDownList1.DataValueField = "EventId";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("-- Select Event --", "0"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0 || Calendar1.SelectedDate == DateTime.MinValue)
            {
                // Basic validation
                return;
            }

            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "INSERT INTO Holiday (EventId, HolidayName, HolidayDate, Status) VALUES (@EventId, @HolidayName, @HolidayDate, @Status)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EventId", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@HolidayName", TextBox1.Text.Trim());
                cmd.Parameters.Add("@HolidayDate", SqlDbType.Date).Value = Calendar1.SelectedDate;
                cmd.Parameters.AddWithValue("@Status", DropDownList2.SelectedValue);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            ClearControls();
            BindGrid();
        }

        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                // Join query to get EventName instead of just EventId
                string query = @"SELECT h.HolidayId, e.EventName, h.HolidayName, h.HolidayDate, h.Status 
                                 FROM Holiday h 
                                 INNER JOIN Event e ON h.EventId = e.EventId";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        private void ClearControls()
        {
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = "";
            Calendar1.SelectedDates.Clear();
            DropDownList2.SelectedIndex = 0;
        }
    }
}














/*//using System;
//using System.Configuration;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.UI;

//namespace Task13Feb
//{
//    public partial class Holiday : System.Web.UI.Page
//    {
//        private string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                BindGrid();
//            }
//        }

//        protected void Button1_Click(object sender, EventArgs e)
//        {
//            using (SqlConnection conn = new SqlConnection(cs))
//            {
//                string query = @"INSERT INTO Holiday
//                                 (EventId, HolidayName, HolidayDate, Status)
//                                 VALUES
//                                 (@EventId, @HolidayName, @HolidayDate, @Status)";

//                SqlCommand cmd = new SqlCommand(query, conn);

//                cmd.Parameters.AddWithValue("@EventId", DropDownList1.SelectedValue);
//                cmd.Parameters.AddWithValue("@HolidayName", TextBox1.Text);
//                cmd.Parameters.Add("@HolidayDate", SqlDbType.Date)
//                    .Value = Calendar1.SelectedDate;
//                cmd.Parameters.AddWithValue("@Status", DropDownList2.SelectedValue);

//                conn.Open();
//                cmd.ExecuteNonQuery();
//            }

//            BindGrid();
//        }

//        private void BindGrid()
//        {
//            using (SqlConnection conn = new SqlConnection(cs))
//            {
//                string query = "SELECT * FROM Holiday";

//                SqlDataAdapter da = new SqlDataAdapter(query, conn);
//                DataTable dt = new DataTable();
//                da.Fill(dt);

//                GridView1.DataSource = dt;
//                GridView1.DataBind();
//            }
//        }
//    }
//}*/