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

namespace library
{
    public partial class deletevisitation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static bkrtn[] DataBind2()
        {
            List<bkrtn> details = new List<bkrtn>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"
SELECT v.[std_id]
    ,v.[name]
    ,v.[dept_name]
    ,v.[facult_name]
    ,v.[class_name]
    ,v.[faculty_class]
    ,v.[sem_name]
    ,CONVERT(varchar, v.[date_visited], 101) AS date_visited
    ,a.AcademicYear
FROM [visittable] v
JOIN AcademicYear a ON CAST(v.[date_visited] AS DATE) BETWEEN a.StartDate AND a.EndDate;



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
            return details.ToArray();
        }

        [WebMethod]
        public static bkrtn[] DataBind3(string startDate, string endDate)
        {
            List<bkrtn> details = new List<bkrtn>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"
            SELECT v.[std_id]
                ,v.[name]
                ,v.[dept_name]
                ,v.[facult_name]
                ,v.[class_name]
                ,v.[faculty_class]
                ,v.[sem_name]
                ,CONVERT(varchar, v.[date_visited], 101) AS date_visited
                ,a.AcademicYear
            FROM [visittable] v
            JOIN AcademicYear a ON CAST(v.[date_visited] AS DATE) BETWEEN a.StartDate AND a.EndDate
            WHERE v.[date_visited] BETWEEN CONVERT(DATE, @StartDate, 101) AND CONVERT(DATE, @EndDate, 101);
        ";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);
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
                }
            }
            return details.ToArray();
        }

        public class bkrtn
        {
            public string stdid { get; set; }
            public string name { get; set; }
            public string deptname { get; set; }
            public string facultname { get; set; }
            public string classname { get; set; }
            public string facultclass { get; set; }
            public string semname { get; set; }
            public string datevisited { get; set; }
            public string year { get; set; }

        }


        [WebMethod]
        public static List<ListItem> getdepart()
        {
            string query = "SELECT TOP (1000) [AcademicYearID]    ,[AcademicYear]   FROM[kismalib].[dbo].[AcademicYear]";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    List<ListItem> customers = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(new ListItem
                            {
                                Value = sdr["AcademicYearID"].ToString(),
                                Text = sdr["AcademicYear"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }





        [WebMethod]
        public static yrclass[] searchyear(string search)
        {
            List<yrclass> details = new List<yrclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"
SELECT TOP (1000) CAST([StartDate] AS DATE) AS StartDate, CAST([EndDate] AS DATE) AS EndDate 
FROM [AcademicYear] 
WHERE [AcademicYearID] = @search
", con);
            cmd.Parameters.AddWithValue("@search", search);

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                yrclass field = new yrclass();
                field.StartDate = ((DateTime)dr["StartDate"]).ToString("MM/dd/yyyy");
                field.EndDate = ((DateTime)dr["EndDate"]).ToString("MM/dd/yyyy");

                details.Add(field);
            }
            return details.ToArray();
        }

        public class yrclass
        {
            public string StartDate { get; set; }
            public string EndDate { get; set; }
        }






        [WebMethod]
        public static string DeleteVisits(string academicYear, string startDate, string endDate)
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string sql = @"DELETE v
                       FROM [visittable] v
                       JOIN AcademicYear a ON CAST(v.[date_visited] AS DATE) BETWEEN a.StartDate AND a.EndDate
                       WHERE a.AcademicYear = @AcademicYear
                       AND a.StartDate = @StartDate
                       AND a.EndDate = @EndDate";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@AcademicYear", academicYear);
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (rowsAffected > 0)
                    {
                        return "Visits Deleted Successfully";
                    }
                    else
                    {
                        return "No Visits Found for the specified academic year";
                    }
                }
            }
        }






    }
}