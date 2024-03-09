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
    public partial class insertvisitors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string deletevisitor(int visitid)
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string sql = "DELETE FROM visitertable WHERE visit_id = @visitid";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@visitid", visitid);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (rowsAffected > 0)
                    {
                        return "Book Deleted Successfully";
                    }
                    else
                    {
                        return "Book Not Found";
                    }
                }
            }
        }




        [WebMethod]
        public static string updateVisitor(string firstName, string middleName, string lastName, int phoneNumber, string details, int visitid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "UPDATE [visitertable] SET " +

                                   "[firstname] = @firstname, " +
                                   "[middlename] = @middlename, " +
                                   "[lastname] = @lastname, " +
                                   "[phone_number] = @phoneNumber, " +
                                   "[details] = @details " +
                                   "WHERE [visit_id] = @visitID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@firstname", firstName);
                        cmd.Parameters.AddWithValue("@middlename", middleName);
                        cmd.Parameters.AddWithValue("@lastname", lastName);
                        cmd.Parameters.AddWithValue("@phoneNumber", phoneNumber);
                        cmd.Parameters.AddWithValue("@details", details);
                        cmd.Parameters.AddWithValue("@visitID", visitid);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updateVisitor method", ex);
            }
        }




        [WebMethod]
        public static stdvisit11[] DataBind2()
        {
            List<stdvisit11> details = new List<stdvisit11>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000) 
                [visit_id],
                [firstname],
                [middlename],
                [lastname],
                [phone_number],
                [details]
            FROM [visitertable]", con);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    stdvisit11 field = new stdvisit11();
                    field.visit_id = dr["visit_id"].ToString();
                    field.firstname = dr["firstname"].ToString();
                    field.middlename = dr["middlename"].ToString();
                    field.lastname = dr["lastname"].ToString();
                    field.phone_number = dr["phone_number"].ToString();
                    field.details = dr["details"].ToString();

                    details.Add(field);
                }
            }

            return details.ToArray();
        }



        public class stdvisit11
        {
            public string visit_id { get; set; }
            public string firstname { get; set; }
            public string middlename { get; set; }
            public string lastname { get; set; }
            public string phone_number { get; set; }
            public string details { get; set; }
        }


        [WebMethod]
        public static bool CheckIdExists(int phoneNumber)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT COUNT(*) FROM visitertable WHERE phone_number = @std_id";

                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", phoneNumber);

                        int count = Convert.ToInt32(command.ExecuteScalar());
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in CheckIdExists method", ex);
            }
        }

        [WebMethod]
        public static string SubmitVisit(string firstname, string middlename, string lastname, string phoneNumber, string details)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "INSERT INTO visitertable (firstname, middlename, lastname, phone_number, details) " +
                                   "VALUES (@p_firstname, @p_middlename, @p_lastname, @p_phone_number, @p_details)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@p_firstname", firstname);
                        cmd.Parameters.AddWithValue("@p_middlename", middlename);
                        cmd.Parameters.AddWithValue("@p_lastname", lastname);
                        cmd.Parameters.AddWithValue("@p_phone_number", phoneNumber);
                        cmd.Parameters.AddWithValue("@p_details", details);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in SubmitVisit method", ex);
            }
        }


    }
}