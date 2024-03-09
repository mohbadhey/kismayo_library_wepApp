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
    public partial class book_issue : System.Web.UI.Page
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
                string query = "SELECT COUNT(*) FROM students WHERE std_id = @std_id";

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
                string query = " SELECT count(*) FROM    [students] s JOIN   [rent] r ON s.[std_id] = r.[std_id]  where r.status = 0   and s.std_id = @std_id ";

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
        public static string submitissue(int std_id, string name, int days, int bookid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Step 1: Insert data into the 'rent' table
                    string insertQuery = "INSERT INTO rent (std_id, bookname, days) " +
                                        "VALUES (@p_std_id, @p_name, @day)";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                    {
                        insertCmd.Parameters.AddWithValue("@p_std_id", std_id);
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

        public class stdvisit12
        {
            public int bookid { get; set; }
            public string bookName { get; set; }
            public string bookDetails { get; set; }
            public decimal bookPrice { get; set; }
            public string bookDepartment { get; set; }
            public string bookFaculty { get; set; }
            public int bookQuantity { get; set; }
            public string bookImage { get; set; }
            public DateTime entryData { get; set; }
            public int available_qty { get; set; }
            public int rent_qty { get; set; }
        }



        [WebMethod]
        public static stdvisit1[] DataBind2()
        {
            List<stdvisit1> details = new List<stdvisit1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000) bookid,
                [bookName],
                [bookDepartment],
                [bookFaculty],
                [bookQuantity],
                [available_qty]
            FROM [books]
            WHERE available_qty > 1
        ", con);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdvisit1 field = new stdvisit1();
                        field.id1 = dr["bookid"].ToString();
                        field.id = dr["bookName"].ToString();
                        field.name = dr["bookDepartment"].ToString();
                        field.dept = dr["bookFaculty"].ToString();
                        field.facul = dr["bookQuantity"].ToString();
                        field.class_name = dr["available_qty"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }

        [WebMethod]
        public static stdrpt[] stddetails(int celvalue)
        {
            List<stdrpt> details = new List<stdrpt>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000) 
                [bookid],
                [bookName],
                [bookPrice],
                [bookDepartment],
                [bookFaculty],
                [bookQuantity],
                [bookImage],
                [entryData],
                [available_qty],
                [rent_qty]
            FROM [books] 
            WHERE bookid = @search
        ", con);
                cmd.Parameters.AddWithValue("@search", celvalue);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdrpt field = new stdrpt();
                        field.id = dr["bookid"].ToString();
                        field.name = dr["bookName"].ToString();
                        field.price = dr["bookPrice"].ToString();
                        field.dept = dr["bookDepartment"].ToString();
                        field.facul = dr["bookFaculty"].ToString();
                        field.qty = dr["bookQuantity"].ToString();
                        field.image = dr["bookImage"].ToString();
                        field.date = dr["entryData"].ToString();
                        field.aqty = dr["available_qty"].ToString();
                        field.rqty = dr["rent_qty"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }

        [WebMethod]
        public static stdvisit1[] Search_id(string search)
        {
            List<stdvisit1> details = new List<stdvisit1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000) 
                [bookid],
                [bookName],
                [bookDetails],
                [bookPrice],
                [bookDepartment],
                [bookFaculty],
                [bookQuantity],
                [bookImage],
                [entryData],
                [available_qty],
                [rent_qty]
            FROM [books]
            WHERE 
                available_qty > 1 
                AND (
                    [bookName] LIKE '%' + @search + '%'
                    OR [bookDepartment] LIKE '%' + @search + '%'
                    OR [bookFaculty] LIKE '%' + @search + '%'
                )
        ", con);
                cmd.Parameters.AddWithValue("@search", search);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdvisit1 field = new stdvisit1();
                        field.id1 = dr["bookid"].ToString();
                        field.id = dr["bookName"].ToString();
                        field.name = dr["bookDepartment"].ToString();
                        field.dept = dr["bookFaculty"].ToString();
                        field.facul = dr["bookQuantity"].ToString();
                        field.class_name = dr["available_qty"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }


        public class stdvisit1
        {
            public string id { get; set; }
            public string id1 { get; set; }
            public string name { get; set; }
            public string dept { get; set; }
            public string facul { get; set; }
            public string faculty_class { get; set; }
            public string class_name { get; set; }

        }

        public class stdrpt
        {
            public string id { get; set; }
            public string name { get; set; }
            public string price { get; set; }
            public string dept { get; set; }
            public string facul { get; set; }
            public string qty { get; set; }
            public string image { get; set; }
            public string date { get; set; }
            public string aqty { get; set; }
            public string rqty { get; set; }

        }
    }
}