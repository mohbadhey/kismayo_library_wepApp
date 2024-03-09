using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class thestudent2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set the text of Label1 to the value of the std_id session variable
            Label1.Text = (string)Session["std_id"];



            bill();
            paneldriver();


            if (!IsPostBack)
            {

            }
        }

        [WebMethod]
        public static string UpdateIsUnread()
        {
            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            // Your SQL query to update IsUnread to true
            string query = "UPDATE [dbo].[message] SET [IsUnread] = 1 WHERE [IsUnread] = 0"; // Assuming IsUnread is initially 0 for unread messages

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))

                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                return "IsUnread updated successfully.";
            }
            catch (Exception ex)
            {
                return "Error updating IsUnread: " + ex.Message;
            }
        }

        protected string TruncateDescription(string description, int maxLength)
        {
            if (description.Length > maxLength)
            {
                // Truncate the description and add ellipsis
                return description.Substring(0, maxLength) + "...";
            }
            else
            {
                // Return the original description if it's shorter than maxLength
                return description;
            }
        }

        //private void BindListView()
        //{

        //    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //    SqlConnection con = new SqlConnection(cs);
        //    con.Open();
        //    SqlCommand sqlcomm = new SqlCommand();
        //    string sqlquery = "SELECT TOP 3 * FROM [dbo].[message] where std_id='" + Label1.Text + "' ORDER BY [date] DESC ";
        //    sqlcomm.CommandText = sqlquery;
        //    sqlcomm.Connection = con;

        //    DataTable dt = new DataTable();
        //    SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
        //    sda.Fill(dt);
        //    transactionsListView.DataSource = dt;
        //    transactionsListView.DataBind();
        //}











        private void bill()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "select std_id as std_id, bookname as bookname, issuedate as isuedate, status as status from rent where std_id='" + Label1.Text + "'";
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = con;

            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Assuming status is in the 4th cell (index 3)
                TableCell statusCell = e.Row.Cells[3];

                // Check the value of status
                if (statusCell.Text == "1")
                {
                    // Change the background color to green
                    statusCell.BackColor = System.Drawing.Color.Green;

                    // Add a border
                    statusCell.Style.Add("border", "1px solid black");

                    // Change the value to "return"
                    statusCell.Text = "return";
                    statusCell.ForeColor = System.Drawing.Color.White;
                }
                else
                {
                    statusCell.BackColor = System.Drawing.Color.Red;
                    statusCell.Text = "rent";
                    statusCell.ForeColor = System.Drawing.Color.White;
                }
            }
        }


        protected void paneldriver()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "WITH MaxSem AS (" +
                   "SELECT " +
                   "std_id, " +
                   "MAX(CASE " +
                   "WHEN sem_name = 'semester one' THEN 1 " +
                   "WHEN sem_name = 'semester two' THEN 2 " +
                   "WHEN sem_name = 'semester three' THEN 3 " +
                   "WHEN sem_name = 'semester four' THEN 4 " +
                   "WHEN sem_name = 'semester five' THEN 5 " +
                   "WHEN sem_name = 'semester six' THEN 6 " +
                   "WHEN sem_name = 'semester seven' THEN 7 " +
                   "WHEN sem_name = 'semester eight' THEN 8 " +
                   "WHEN sem_name = 'semester nine' THEN 9 " +
                   "WHEN sem_name = 'semester ten' THEN 10 " +
                   "WHEN sem_name = 'semester eleven' THEN 11 " +
                   "WHEN sem_name = 'semester twelve' THEN 12 " +
                   "ELSE 0 END) AS max_sem_value " +
                   "FROM visittable " + // Removed [kismalib].[dbo]
                   "where std_id = @stdId " + // Parameterized query
                   "GROUP BY std_id) " +
                   "SELECT COUNT(*) AS times_visited " +
                   "FROM visittable AS vt " + // Removed [kismalib].[dbo]
                   "JOIN MaxSem ON vt.std_id = MaxSem.std_id " +
                   "WHERE CASE " +
                   "WHEN vt.sem_name = 'semester one' THEN 1 " +
                   "WHEN vt.sem_name = 'semester two' THEN 2 " +
                   "WHEN vt.sem_name = 'semester three' THEN 3 " +
                   "WHEN vt.sem_name = 'semester four' THEN 4 " +
                   "WHEN vt.sem_name = 'semester five' THEN 5 " +
                   "WHEN vt.sem_name = 'semester six' THEN 6 " +
                   "WHEN vt.sem_name = 'semester seven' THEN 7 " +
                   "WHEN vt.sem_name = 'semester eight' THEN 8 " +
                   "WHEN vt.sem_name = 'semester nine' THEN 9 " +
                   "WHEN vt.sem_name = 'semester ten' THEN 10 " +
                   "WHEN sem_name = 'semester eleven' THEN 11 " +
                   "WHEN sem_name = 'semester twelve' THEN 12 " +
                   "ELSE 0 END = MaxSem.max_sem_value " +
                   "GROUP BY vt.std_id " +
                   "ORDER BY times_visited DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@stdId", Label1.Text); // Add parameter for stdId
                var count1 = cmd.ExecuteScalar();
                if (count1 != null) // Check for null before conversion
                {
                    Label2.Text = Convert.ToInt32(count1).ToString();
                }
                else
                {
                    Label2.Text = "No visits found"; // Or any other appropriate message
                }

                con.Close();
            }
        }

        //protected void coms()
        //{
        //    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("select count (*) from message where std_id='" + Label1.Text + "' and [IsUnread] = 0", con);
        //        var count1 = cmd.ExecuteScalar();
        //        Label3.Text = count1.ToString();
        //        con.Close();


        //    }

        //}

        public class stdclass
        {
            public string id { get; set; }
            public string name { get; set; }
            public string phone { get; set; }

        }
        protected string FormatDate(object date)
        {
            if (DateTime.TryParse(date.ToString(), out DateTime dateTime))
            {
                TimeSpan timeAgo = DateTime.Now - dateTime;

                if (timeAgo.TotalMinutes < 1)
                    return "Just now";
                else if (timeAgo.TotalMinutes < 60)
                    return $"{(int)timeAgo.TotalMinutes} minute{((int)timeAgo.TotalMinutes != 1 ? "s" : "")} ago";
                else if (timeAgo.TotalHours < 24)
                    return $"{(int)timeAgo.TotalHours} hour{((int)timeAgo.TotalHours != 1 ? "s" : "")} ago";
                else
                    return dateTime.ToString("MMM dd, yyyy HH:mm");
            }
            else
            {
                return "Invalid Date";
            }
        }
    }
}