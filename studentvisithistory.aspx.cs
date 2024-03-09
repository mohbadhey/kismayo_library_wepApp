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
using static library.student_details;

namespace library
{
    public partial class studentvisithistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static int GetRowCount(int id, string search)
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
    SELECT
        COUNT(*) AS TotalVisits
    FROM
        visittable
    WHERE
        [std_id] = @id -- Replace 'your_student_id' with the actual student ID
        AND [sem_name] = @search; -- Replace 'your_semester_name' with the actual semester name
";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@search", search);
                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }

        public class stdc
        {
            public string date { get; set; }
            public string rank { get; set; }
          
        }


        [WebMethod]
        public static List<ListItem> getfacul2(int id)
        {
            string query = @"
    SELECT
        std_id,
        [sem_name]
    FROM
        visittable
    WHERE
        [std_id] = @id -- Replace 'YourFacultyClass' with the desired faculty_class value 
    GROUP BY
        std_id,
        [sem_name];
";

            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    List<ListItem> semesters = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            semesters.Add(new ListItem
                            {
                                Value = sdr["std_id"].ToString(),
                                Text = sdr["sem_name"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return semesters;
                }
            }
        }

        [WebMethod]
        public static stdc[] Search_DataBind(int id, string search)
        {
            List<stdc> details = new List<stdc>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand(@"
    SELECT
        [date_visited],
        CASE
            WHEN DENSE_RANK() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) = 1 THEN '1st'
            WHEN DENSE_RANK() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) = 2 THEN '2nd'
            WHEN DENSE_RANK() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) = 3 THEN '3rd'
            ELSE CAST(DENSE_RANK() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) AS VARCHAR) + 'th'
        END AS DateRank
    FROM
        visittable
    WHERE
        [std_id] = @id -- Replace 'your_student_id' with the actual student ID
        AND [sem_name] = @search; -- Replace 'your_semester_name' with the actual semester name
", con))

                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@search", search);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                stdc field = new stdc();
                                field.date = dr["date_visited"].ToString();
                                field.rank = dr["DateRank"].ToString();
                              

                                details.Add(field);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
                // Handle the exception (log it, show an error message, etc.)
            }

            return details.ToArray();
        }

    }
}