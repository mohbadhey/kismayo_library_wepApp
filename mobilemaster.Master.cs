using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class mobilemaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["std_id"] == null)
            {
                // Redirect to the login page (assuming the login page URL is "login.aspx")
                Response.Redirect("studentlgn.aspx");
            }
            else
            {
                // Set the text of Label1 to the value of the std_id session variable
                Label1.Text = (string)Session["std_id"];
       
            }






            if (!IsPostBack)
            {
                BindListView();
            }
            coms();
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

        private void BindListView()
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "SELECT TOP 3 * FROM [dbo].[message] where std_id='" + Label1.Text + "' ORDER BY [date] DESC ";
            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = con;

            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            sda.Fill(dt);
            transactionsListView.DataSource = dt;
            transactionsListView.DataBind();
        }










        protected void coms()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select count (*) from message where std_id='" + Label1.Text + "' and [IsUnread] = 0", con);
                var count1 = cmd.ExecuteScalar();
                Label3.Text = count1.ToString();
                con.Close();


            }

        }

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