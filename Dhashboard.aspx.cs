using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static library.deletevisitation;
using static library.student_details;

namespace library
{
    public partial class Dhashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
  
        }



        [WebMethod]
        public static recent[] DataBind99()
        {
            List<recent> details = new List<recent>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
    SELECT TOP 9 *,
           CASE 
               WHEN DATEDIFF(MINUTE, date, GETDATE()) < 1 THEN 'just now'
               ELSE CONCAT(
                   CASE 
                       WHEN DATEDIFF(MINUTE, date, GETDATE()) >= 1440 THEN CONCAT(DATEDIFF(MINUTE, date, GETDATE()) / 1440, 'days ')
                       ELSE ''
                   END,
                   CASE 
                       WHEN DATEDIFF(MINUTE, date, GETDATE()) % 1440 / 60 > 0 THEN
                           CONCAT(
                               CASE 
                                   WHEN DATEDIFF(MINUTE, date, GETDATE()) >= 1440 THEN ' '
                                   ELSE ''
                               END,
                               DATEDIFF(MINUTE, date, GETDATE()) % 1440 / 60, 'hr'
                           )
                       ELSE ''
                   END,
                   CASE 
                       WHEN DATEDIFF(MINUTE, date, GETDATE()) % 60 > 0 THEN
                           CONCAT(
                               CASE 
                                   WHEN DATEDIFF(MINUTE, date, GETDATE()) % 1440 / 60 > 0 THEN ' '
                                   ELSE ''
                               END,
                               DATEDIFF(MINUTE, date, GETDATE()) % 60, 'mins'
                           )
                       ELSE ''
                   END
               )
           END AS interval_combined
    FROM
    (
        -- Query 1: Returned Books with Latest Return Date
        SELECT
            r.returndate AS date,
            'Returned Book' AS activity_type,
            s.first_name + ' ' + s.middle_name + ' ' + s.last_name AS student_name,
            r.bookname AS book_name
        FROM
            students s
        JOIN
            rent r ON s.std_id = r.std_id
        WHERE
            r.status = 1
        AND r.returndate = (
            SELECT MAX(returndate)
            FROM rent
            WHERE status = 1
        )

        UNION ALL

        -- Query 2: Issued Books with Latest Issue Date
        SELECT
            r.issuedate AS date,
            'Issued Book' AS activity_type,
            s.first_name + ' ' + s.middle_name + ' ' + s.last_name AS student_name,
            r.bookname AS book_name
        FROM
            students s
        JOIN
            rent r ON s.std_id = r.std_id
        WHERE
            r.status = 0
        AND r.issuedate = (
            SELECT MAX(issuedate)
            FROM rent
            WHERE status = 0
        )

        UNION ALL

        -- Query 3: Most Recent Visit
        SELECT 
            v.[date_visited] AS date,
            'Visit' AS activity_type,
            v.[name] AS student_name,
            NULL AS book_name
        FROM 
            [visittable] v
        JOIN 
            AcademicYear a ON v.[date_visited] BETWEEN a.StartDate AND a.EndDate
    ) AS combined_activities
    ORDER BY date DESC;
", con);


                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    recent field = new recent();
                    field.activity_type = dr["activity_type"].ToString();
                    field.student_name = dr["student_name"].ToString();
                    field.book_name = dr["book_name"].ToString();
                    field.interval_combined = dr["interval_combined"].ToString();
                    details.Add(field);
                }
            } // The connection will be automatically closed here

            return details.ToArray();
        }





        //        SELECT top 9 *,
        //       CASE
        //           WHEN DATEDIFF(DAY, date, GETDATE()) > 0 THEN
        //               CONCAT(
        //                   DATEDIFF(DAY, date, GETDATE()),
        //                   ' days ',
        //                   DATEDIFF(HOUR, date, GETDATE()) - (DATEDIFF(DAY, date, GETDATE()) * 24),
        //                   ' hours ',
        //                   DATEDIFF(MINUTE, date, GETDATE()) - (DATEDIFF(HOUR, date, GETDATE()) * 60),
        //                   ' minutes'
        //               )
        //           WHEN DATEDIFF(HOUR, date, GETDATE()) > 0 THEN
        //               CONCAT(
        //                   DATEDIFF(HOUR, date, GETDATE()),
        //                   ' hours ',
        //                   DATEDIFF(MINUTE, date, GETDATE()) % 60,
        //                   ' minutes'
        //               )
        //           ELSE
        //               CONCAT(
        //                   DATEDIFF(MINUTE, date, GETDATE()) % 60,
        //                   ' minutes'
        //               )
        //       END AS interval_combined

        //FROM
        //(
        //    -- Query 1: Returned Books with Latest Return Date
        //    SELECT
        //        r.returndate AS date,
        //        'Returned Book' AS activity_type,
        //        s.first_name + ' ' + s.middle_name + ' ' + s.last_name AS student_name,
        //        r.bookname AS book_name
        //    FROM
        //        kismalib.dbo.students s
        //    JOIN
        //        kismalib.dbo.rent r ON s.std_id = r.std_id
        //    WHERE
        //        r.status = 1
        //    AND r.returndate = (
        //        SELECT MAX(returndate)
        //        FROM kismalib.dbo.rent
        //        WHERE status = 1
        //    )

        //    UNION ALL

        //    -- Query 2: Issued Books with Latest Issue Date
        //    SELECT
        //        r.issuedate AS date,
        //        'Issued Book' AS activity_type,
        //        s.first_name + ' ' + s.middle_name + ' ' + s.last_name AS student_name,
        //        r.bookname AS book_name
        //    FROM
        //        kismalib.dbo.students s
        //    JOIN
        //        kismalib.dbo.rent r ON s.std_id = r.std_id
        //    WHERE
        //        r.status = 0
        //    AND r.issuedate = (
        //        SELECT MAX(issuedate)
        //        FROM kismalib.dbo.rent
        //        WHERE status = 0
        //    )

        //    UNION ALL

        //    -- Query 3: Most Recent Visit
        //    SELECT
        //        v.[date_visited] AS date,
        //        'Visit' AS activity_type,
        //        v.[name]
        //        AS student_name,
        //        NULL AS book_name
        //    FROM
        //        [kismalib].[dbo].[visittable]
        //        v
        //    JOIN
        //        AcademicYear a ON v.[date_visited] BETWEEN a.StartDate AND a.EndDate
        //) AS combined_activities
        //ORDER BY date DESC;






        public class recent
        {
            public string activity_type { get; set; }
            public string student_name { get; set; }
            public string book_name { get; set; }
            public string interval_combined { get; set; }
            



        }



















        [WebMethod]
        public static int GetRowCount()
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
    SELECT SUM(bookQuantity) AS TotalBookQuantity
    FROM [books]
    WHERE available_qty > 0;
";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
              
                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }



        [WebMethod]
        public static int GetRowCount2()
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT SUM(available_qty) AS TotalBookQuantity
FROM [books]
WHERE available_qty > 0;
            ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {

                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }

        [WebMethod]
        public static int GetRowCount3()
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT SUM(rent_qty) AS TotalBookQuantity
FROM [books]

            ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {

                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }


        [WebMethod]
        public static int students1()
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT TOP (1000)
     count( std_id)
  FROM [students]

            ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {

                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }

        [WebMethod]
        public static int visitors()
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT TOP (1000) 
      count(visit_id)
  FROM [visitertable]
    ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {

                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }



        [WebMethod]
        public static bkrtn[] DataBind3()
        {
            List<bkrtn> details = new List<bkrtn>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP 3
                v.[std_id],
                v.[name],
                v.[dept_name],
                v.[facult_name],
                v.[class_name],
                v.[faculty_class],
                v.[sem_name],
                v.[date_visited],
                a.AcademicYear
            FROM 
                [visittable] v
            JOIN 
                AcademicYear a ON v.[date_visited] BETWEEN a.StartDate AND a.EndDate
            ORDER BY 
                v.[date_visited] DESC;
        ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    bkrtn field = new bkrtn();
                    field.stdid = dr["std_id"].ToString();
                    field.name = dr["name"].ToString();
                    field.deptname = dr["dept_name"].ToString();
                    field.facultname = dr["facult_name"].ToString();
                    field.classname = dr["class_name"].ToString();
                    field.facultclass = dr["faculty_class"].ToString();
                    field.semname = dr["sem_name"].ToString();
                    field.datevisited = dr["date_visited"].ToString();
                    field.year = dr["AcademicYear"].ToString();
                    details.Add(field);
                }
            } // The connection will be automatically closed here

            return details.ToArray();
        }

        [WebMethod]
        public static stdvisit[] DataBind2()
        {
            List<stdvisit> details = new List<stdvisit>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            WITH RankedData AS (
                SELECT
                    [std_id],
                    [name],
                    [dept_name],
                    [facult_name],
                    [class_name],
                    [faculty_class],
                    [sem_name],
                    [date_visited],
                    ROW_NUMBER() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) AS row_num,
                    COUNT(*) OVER (PARTITION BY [std_id]) AS times_visited
                FROM
                    [visittable]
            )
            SELECT TOP 3
                [std_id],
                [name],
                [dept_name],
                [facult_name],
                [class_name],
                [faculty_class],
                [sem_name],
                times_visited
            FROM
                RankedData
            WHERE
                row_num = 1
            ORDER BY
                times_visited DESC;
        ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdvisit field = new stdvisit();
                    field.id = dr["std_id"].ToString();
                    field.name = dr["name"].ToString();
                    field.dept = dr["dept_name"].ToString();
                    field.facul = dr["facult_name"].ToString();
                    field.class_name = dr["class_name"].ToString();
                    field.faculty_class = dr["faculty_class"].ToString();
                    field.sem = dr["sem_name"].ToString();
                    field.visted = dr["times_visited"].ToString();

                    details.Add(field);
                }
            } // The connection will be automatically closed here

            return details.ToArray();
        }


    }
}