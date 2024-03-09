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
    public partial class return_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string submitissue(int rent_id, int bookid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Step 1: Insert data into the 'rent' table
                    string insertQuery = "  update rent set status = 1 where rent_id = @rent";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                    {

                        insertCmd.Parameters.AddWithValue("@rent", rent_id);


                        insertCmd.ExecuteNonQuery();
                    }

                    // Step 2: Update the 'books' table
                    string updateQuery = "UPDATE books SET available_qty = available_qty + 1, rent_qty = rent_qty - 1 WHERE bookid = @bookid";

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









        [WebMethod]
        public static string submitissue(int rent_id, int bookid, string date, int exdate)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Step 1: Insert data into the 'rent' table
                    string insertQuery = "  update rent set status = 1 where rent_id = @rent";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                    {

                        insertCmd.Parameters.AddWithValue("@rent", rent_id);


                        insertCmd.ExecuteNonQuery();
                    }
                    string inserdate = "  update rent set extra_days =  @exdate where rent_id = @exdate";

                    using (SqlCommand datecmd = new SqlCommand(inserdate, con))
                    {

                        datecmd.Parameters.AddWithValue("@exdate", exdate);


                        datecmd.ExecuteNonQuery();
                    }


                    string updatetime = "  update rent set returndate =@date  where rent_id = @rent";

                    using (SqlCommand timecmd = new SqlCommand(updatetime, con))
                    {

                        timecmd.Parameters.AddWithValue("@date", date);


                        timecmd.ExecuteNonQuery();
                    }

                    // Step 2: Update the 'books' table
                    string updateQuery = "UPDATE books SET available_qty = available_qty + 1, rent_qty = rent_qty - 1 WHERE bookid = @bookid";

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







        [WebMethod]
        public static bkrtn[] DataBind2()
        {
            List<bkrtn> details = new List<bkrtn>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT
                r.rent_id,
                r.[extra_days],
                r.[returndate],
                s.[first_name] + ' ' + s.[middle_name] + ' ' + s.[last_name] AS [student_name],
                r.[bookname] AS [book_name],
                r.[issuedate] AS [issue_date],
                r.[days] AS [days]
            FROM
                [students] s
            JOIN
                [rent] r ON s.[std_id] = r.[std_id]
            WHERE
                r.status = 1
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    bkrtn field = new bkrtn();
                    field.rentid = dr["rent_id"].ToString();
                    field.stdname = dr["student_name"].ToString();
                    field.bookname = dr["book_name"].ToString();
                    field.issue_date = dr["issue_date"].ToString();
                    field.extra_days = dr["extra_days"].ToString();
                    field.returndate = dr["returndate"].ToString();
                    field.days = dr["days"].ToString();

                    details.Add(field);
                }
            }

            return details.ToArray();
        }


        [WebMethod]
        public static stdbkrpt[] stddetails(int celvalue, string rdate)
        {
            List<stdbkrpt> details = new List<stdbkrpt>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            DECLARE @actual_returndate DATETIME = @rdate;
            DECLARE @target_rent_id INT = @search;

            WITH RentDetails AS (
                SELECT
                    rent_id,
                    std_id,
                    days,
                    issuedate,
                    @actual_returndate AS actual_returndate,
                    DATEADD(DAY, days, issuedate) AS expected_returndate,
                    CASE
                        WHEN @actual_returndate > DATEADD(DAY, days, issuedate) THEN 0
                        ELSE DATEDIFF(DAY, @actual_returndate, DATEADD(DAY, days, issuedate))
                    END AS rem_days,
                    CASE
                        WHEN @actual_returndate > DATEADD(DAY, days, issuedate) THEN DATEDIFF(DAY, DATEADD(DAY, days, issuedate), @actual_returndate)
                        ELSE 0
                    END AS days_exceeded
                FROM
                    rent
                WHERE
                    rent_id = @target_rent_id
            )

            SELECT
                r.rent_id,
                s.[first_name] + ' ' + s.[middle_name] + ' ' + s.[last_name] AS [student_name],
                r.[bookname] AS [book_name],
                r.[issuedate] AS [issue_date],
                r.[days] AS [days],
                b.bookid,
                b.[bookQuantity],
                b.[bookImage],
                b.[available_qty],
                b.[rent_qty],
                rd.actual_returndate,
                rd.expected_returndate,
                rd.rem_days,
                rd.days_exceeded
            FROM
                [students] s
            JOIN
                [rent] r ON s.[std_id] = r.[std_id]
            JOIN
                [books] b ON r.[bookname] = b.[bookName]
            JOIN
                RentDetails rd ON r.rent_id = rd.rent_id;
        ", con);

                cmd.Parameters.AddWithValue("@search", celvalue);
                cmd.Parameters.AddWithValue("@rdate", rdate);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdbkrpt field = new stdbkrpt();
                    field.rent_id = dr["rent_id"].ToString();
                    field.student_name = dr["student_name"].ToString();
                    field.book_name = dr["book_name"].ToString();
                    field.issuedate = dr["issue_date"].ToString();
                    field.days = dr["days"].ToString();
                    field.bookid = dr["bookid"].ToString();
                    field.bookQuantity = dr["bookQuantity"].ToString();
                    field.bookImage = dr["bookImage"].ToString();
                    field.actual_returndate = dr["actual_returndate"].ToString();
                    field.rent_qty = dr["rent_qty"].ToString();
                    field.expected_returndate = dr["expected_returndate"].ToString();
                    field.days_exceeded = dr["days_exceeded"].ToString();
                    field.available_qty = dr["available_qty"].ToString();
                    field.rem_days = dr["rem_days"].ToString();

                    details.Add(field);
                }
            }

            return details.ToArray();
        }



        [WebMethod]
        public static bkrtn[] Search_id(string search)
        {
            List<bkrtn> details = new List<bkrtn>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT
                r.rent_id,
                r.[extra_days],
                r.[returndate],
                s.[first_name] + ' ' + s.[middle_name] + ' ' + s.[last_name] AS [student_name],
                r.[bookname] AS [book_name],
                r.[issuedate] AS [issue_date],
                r.[days] AS [days]
            FROM
                [students] s
            JOIN
                [rent] r ON s.[std_id] = r.[std_id]
            WHERE
                r.status = 1
                AND (
                    r.[bookname] LIKE '%' + @search + '%'
                    OR s.[first_name] + ' ' + s.[middle_name] + ' ' + s.[last_name] LIKE '%' + @search + '%'
                );
        ", con);

                cmd.Parameters.AddWithValue("@search", search);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    bkrtn field = new bkrtn();
                    field.rentid = dr["rent_id"].ToString();
                    field.stdname = dr["student_name"].ToString();
                    field.bookname = dr["book_name"].ToString();
                    field.issue_date = dr["issue_date"].ToString();
                    field.extra_days = dr["extra_days"].ToString();
                    field.returndate = dr["returndate"].ToString();
                    field.days = dr["days"].ToString();

                    details.Add(field);
                }
            }

            return details.ToArray();
        }



        public class bkrtn
        {
            public string rentid { get; set; }
            public string stdname { get; set; }
            public string bookname { get; set; }
            public string extra_days { get; set; }
            public string returndate { get; set; }
            public string issue_date { get; set; }
            public string days { get; set; }


        }

        public class stdbkrpt
        {
            public string rent_id { get; set; }
            public string student_name { get; set; }
            public string bookid { get; set; }
            public string book_name { get; set; }
            public string issuedate { get; set; }
            public string days { get; set; }
            public string bookQuantity { get; set; }
            public string bookImage { get; set; }
            public string available_qty { get; set; }
            public string rent_qty { get; set; }
            public string actual_returndate { get; set; }
            public string expected_returndate { get; set; }
            public string rem_days { get; set; }
            public string days_exceeded { get; set; }

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