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
    public partial class visitorissuereport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static stdissue[] DataBind2()
        {
            List<stdissue> details = new List<stdissue>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT
                s.[phone_number],
                s.[firstname] + ' ' + s.[middlename] + ' ' + s.[lastname] AS [student_name],
                r.[bookname] AS [book_name],
                r.[issuedate] AS [issuedate],
                r.[days] AS [days]
            FROM
                [visitertable] s
            JOIN
                [visitorrent] r ON s.[phone_number] = r.[phone_number]
            WHERE r.status = 0", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdissue field = new stdissue();
                    field.id = dr["phone_number"].ToString();
                    field.stdname = dr["student_name"].ToString();
                    field.bookname = dr["book_name"].ToString();
                    field.issuedate = dr["issuedate"].ToString();
                    field.days = dr["days"].ToString();

                    details.Add(field);
                }
            } // The using block automatically closes the connection after exiting this block

            return details.ToArray();
        }


        public class stdissue
        {
            public string id { get; set; }
            public string stdname { get; set; }
            public string bookname { get; set; }
            public string issuedate { get; set; }
            public string days { get; set; }


        }

        [WebMethod]
        public static stdissue[] Search_id(string search)
        {
            List<stdissue> details = new List<stdissue>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"
SELECT
s.[phone_number],
    s.[firstname] + ' ' + s.[middlename] + ' ' + s.[lastname] AS [student_name],
    r.[bookname] AS [book_name],
    r.[issuedate] AS [issuedate],
    r.[days] AS [days]
FROM
    [visitertable] s
JOIN
    [visitorrent] r ON s.[phone_number] = r.[phone_number]
WHERE
   	 (s.[firstname] LIKE '%' + @search + '%' OR
    s.[lastname] LIKE '%' + @search + '%' OR
    r.[bookname] LIKE '%' + @search + '%' OR
    s.[phone_number] LIKE '%' + @search + '%')
    AND r.status = 0;

 ", con);
            cmd.Parameters.AddWithValue("@search", search);

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                stdissue field = new stdissue();
                field.id = dr["phone_number"].ToString();
                field.stdname = dr["student_name"].ToString();
                field.bookname = dr["book_name"].ToString();
                field.issuedate = dr["issuedate"].ToString();
                field.days = dr["days"].ToString();

                details.Add(field);
            }
            return details.ToArray();
        }
    }
}