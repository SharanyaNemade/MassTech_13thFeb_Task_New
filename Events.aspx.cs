using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Task13Feb
{
    public partial class Events : System.Web.UI.Page
    {
        private readonly string cs =
            ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Future ready (if you add GridView)
                // BindGrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Basic Validation
            if (string.IsNullOrWhiteSpace(TextBox1.Text))
                return;

            if (string.IsNullOrWhiteSpace(TextBox2.Text))
                return;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = @"INSERT INTO Event
                                 (EventName, Status, Color)
                                 VALUES
                                 (@EventName, @Status, @Color)";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@EventName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Color", TextBox2.Text.Trim());

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            ClearControls();
        }

        private void ClearControls()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            DropDownList1.SelectedIndex = 0;
        }

        // Optional future expansion
        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Event ORDER BY EventId DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // If you add GridView later:
                // GridView1.DataSource = dt;
                // GridView1.DataBind();
            }
        }
    }
}