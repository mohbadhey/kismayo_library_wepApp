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
    public partial class book_issue_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        public static stdissue[] DataBind2()
        {
            List<stdissue> details = new List<stdissue>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT
                s.std_id,
                s.[first_name] + ' ' + s.[middle_name] + ' ' + s.[last_name] AS [student_name],
                r.[bookname] AS [book_name],
                r.[issuedate] AS [issue_date],
                r.[days] AS [days]
            FROM
                [students] s
            JOIN
                [rent] r ON s.[std_id] = r.[std_id]
            WHERE r.status = 0
        ", con);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdissue field = new stdissue();
                        field.id = dr["std_id"].ToString();
                        field.stdname = dr["student_name"].ToString();
                        field.bookname = dr["book_name"].ToString();
                        field.issuedate = dr["issue_date"].ToString();
                        field.days = dr["days"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }

        [WebMethod]
        public static stdissue[] Search_id(string search)
        {
            List<stdissue> details = new List<stdissue>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT
                s.std_id,
                s.[first_name] + ' ' + s.[middle_name] + ' ' + s.[last_name] AS [student_name],
                r.[bookname] AS [book_name],
                r.[issuedate] AS [issue_date],
                r.[days] AS [days]
            FROM
                [students] s
            JOIN
                [rent] r ON s.[std_id] = r.[std_id]
            WHERE
                (s.[first_name] LIKE '%' + @search + '%' OR
                s.[last_name] LIKE '%' + @search + '%' OR
                r.[bookname] LIKE '%' + @search + '%' OR
                s.[std_id] LIKE '%' + @search + '%')
                AND r.status = 0
        ", con);
                cmd.Parameters.AddWithValue("@search", search);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdissue field = new stdissue();
                        field.id = dr["std_id"].ToString();
                        field.stdname = dr["student_name"].ToString();
                        field.bookname = dr["book_name"].ToString();
                        field.issuedate = dr["issue_date"].ToString();
                        field.days = dr["days"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }

    }
}