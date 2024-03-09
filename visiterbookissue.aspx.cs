using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class visiterbookissue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]

        public static bool CheckIdExists(int std_id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Define a SQL query to check if the ID exists in the "students" table
                string query = "SELECT COUNT(*) FROM visitertable WHERE phone_number = @std_id";

                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@std_id", std_id);

                    // Execute the query to count the occurrences of the provided ID
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    // If count > 0, the ID exists; otherwise, it doesn't
                    return count > 0;
                }
            }
        }



        [WebMethod]

        public static bool checkrentexist(int std_id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Define a SQL query to check if the ID exists in the "students" table
                string query = "SELECT COUNT(*) FROM [visitertable] v JOIN [visitorrent] vr ON v.[phone_number] = vr.[phone_number] WHERE vr.status = 0 AND v.phone_number = @phone_number";



                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@phone_number", std_id);

                    // Execute the query to count the occurrences of the provided ID
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    // If count > 0, the ID exists; otherwise, it doesn't
                    return count > 0;
                }
            }
        }




        [WebMethod]
        public static string submitissue(int std_id, string name, int days, int bookid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Step 1: Insert data into the 'rent' table
                    string insertQuery = "INSERT INTO visitorrent (phone_number, bookname, days) " +
                        "VALUES (@p_phone_number, @p_name, @day)";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                    {
                        insertCmd.Parameters.AddWithValue("@p_phone_number", std_id);
                        insertCmd.Parameters.AddWithValue("@p_name", name);
                        insertCmd.Parameters.AddWithValue("@day", days);

                        insertCmd.ExecuteNonQuery();
                    }

                    // Step 2: Update the 'books' table
                    string updateQuery = @"
                UPDATE books
                SET available_qty = ISNULL(available_qty, 0) - 1,
                    rent_qty = ISNULL(rent_qty, 0) + 1
                WHERE bookid = @bookid;
            ";

                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
                    {
                        updateCmd.Parameters.AddWithValue("@bookid", bookid);

                        updateCmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                return ex.Message;
            }
        }


    }
}