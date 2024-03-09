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
    

    public partial class userdetails : System.Web.UI.Page
    {

   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                // Clear the session
                Session.Clear();

                // Respond with "success" if the session is cleared successfully
                Response.Write("success");
                Response.End();
            }
        }


        [WebMethod]
        public static bool CheckPassword(int std_id, string enteredPassword)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Define a SQL query to retrieve the password for the given std_id
                string query = "SELECT password FROM students WHERE std_id = @std_id";

                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@std_id", std_id);

                    // Execute the query to retrieve the password
                    string password = command.ExecuteScalar() as string;

                    // Check if the password retrieved matches the entered password
                    return password != null && password.Equals(enteredPassword);
                }
            }
        }








        [WebMethod]
        public static bool UpdatePassword(int id, string update)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update the password in the database for the given user ID (id)
                    string updateQuery = "UPDATE students SET password = @newPassword WHERE std_id = @id";

                    using (SqlCommand command = new SqlCommand(updateQuery, con))
                    {
                        command.Parameters.AddWithValue("@newPassword", update);
                        command.Parameters.AddWithValue("@id", id);

                        // Execute the update query
                        int rowsAffected = command.ExecuteNonQuery();

                        // If rowsAffected > 0, the password was updated successfully; otherwise, it failed
                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log any exceptions that occur during the password update process
                Console.WriteLine("Error updating password: " + ex.Message);
                return false;
            }
        }







        [WebMethod]
        public static stdclass1[] stddetails(int id)
        {
            List<stdclass1> details = new List<stdclass1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"WITH MaxSem AS (
    SELECT
        std_id,
        MAX(CASE
            WHEN sem_name = 'semester one' THEN 1
            WHEN sem_name = 'semester two' THEN 2
            WHEN sem_name = 'semester three' THEN 3
            WHEN sem_name = 'semester four' THEN 4
            WHEN sem_name = 'semester five' THEN 5
            WHEN sem_name = 'semester six' THEN 6
            WHEN sem_name = 'semester seven' THEN 7
            WHEN sem_name = 'semester eight' THEN 8
            WHEN sem_name = 'semester nine' THEN 9
            WHEN sem_name = 'semester ten' THEN 10
            WHEN sem_name = 'semester eleven' THEN 11
            WHEN sem_name = 'semester twelve' THEN 12
            ELSE 0 -- Handle any other cases
        END) AS max_sem_value
    FROM
        visittable
    WHERE
        std_id = @id
    GROUP BY
        std_id
)
SELECT
    vt.std_id,
    vt.name,
    [facult_name],
    vt.dept_name,
    vt.faculty_class,
    vt.sem_name
FROM
    visittable AS vt
JOIN
    MaxSem ON vt.std_id = MaxSem.std_id
WHERE
    CASE
        WHEN vt.sem_name = 'semester one' THEN 1
        WHEN vt.sem_name = 'semester two' THEN 2
        WHEN vt.sem_name = 'semester three' THEN 3
        WHEN vt.sem_name = 'semester four' THEN 4
        WHEN vt.sem_name = 'semester five' THEN 5
        WHEN vt.sem_name = 'semester six' THEN 6
        WHEN vt.sem_name = 'semester seven' THEN 7
        WHEN vt.sem_name = 'semester eight' THEN 8
        WHEN vt.sem_name = 'semester nine' THEN 9
        WHEN vt.sem_name = 'semester ten' THEN 10
        WHEN vt.sem_name = 'semester eleven' THEN 11
        WHEN vt.sem_name = 'semester twelve' THEN 12
        ELSE 0 -- Handle any other cases
    END = MaxSem.max_sem_value
GROUP BY
    vt.std_id,
    vt.name,
    [facult_name],
    vt.dept_name,
    vt.faculty_class,
    vt.sem_name", con);


                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdclass1 field = new stdclass1();
                    field.id = dr["std_id"].ToString();
                    field.sname = dr["name"].ToString();
                    field.snumber = dr["dept_name"].ToString();
                    field.sfaculty = dr["facult_name"].ToString();
                    field.ssemester = dr["faculty_class"].ToString();
                    field.department = dr["sem_name"].ToString();

                    details.Add(field);
                }
            } // The connection will be automatically closed here

            return details.ToArray();
        }

       
    }
}