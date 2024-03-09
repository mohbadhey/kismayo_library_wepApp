using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static library.student_details;

namespace library
{
    public partial class visithistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [WebMethod]
        public static stdvisit[] Search_DataBind(string classs, string sem)
        {
            List<stdvisit> details = new List<stdvisit>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand(@"
                       SELECT
    [std_id],
    [name],
    [dept_name],
    [facult_name],
    [class_name],
    [faculty_class],
    [sem_name],
    COUNT(*) AS times_visited
FROM
    [visittable]
WHERE
    [faculty_class] = @classs -- Replace 'YourFacultyClass' with the desired faculty_class value
    AND [sem_name] = @sem -- Replace 'YourSemName' with the desired sem_name value
GROUP BY
    [std_id],
    [name],
    [dept_name],
    [facult_name],
    [class_name],
    [faculty_class],
    [sem_name];
", con))
                    {
                        cmd.Parameters.AddWithValue("@classs", classs);
                        cmd.Parameters.AddWithValue("@sem", sem);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
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

        [WebMethod]
        public static stdvisit[] DataBind2()
        {
            List<stdvisit> details = new List<stdvisit>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand(@"
                       SELECT
    [std_id],
    [name],
    [dept_name],
    [facult_name],
    [class_name],
    [faculty_class],
    [sem_name],
    COUNT(*) AS times_visited
FROM
    [visittable]

GROUP BY
    [std_id],
    [name],
    [dept_name],
    [facult_name],
    [class_name],
    [faculty_class],
    [sem_name];
", con))
                    {
                       

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
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