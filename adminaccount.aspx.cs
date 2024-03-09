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
    public partial class adminaccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string updatepass(string id, string user, string pass)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "UPDATE [users] SET " +
                    "[username] = @user, " +
                    "[password] = @pass " +
                    "WHERE [id] = @id";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@user", user);
                        cmd.Parameters.AddWithValue("@pass", pass);
          

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
           SELECT TOP (1000) [id]
              ,[username]
                     ,[password]
             FROM [users]
            ", con);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    stdvisit11 field = new stdvisit11();
                    field.id = dr["id"].ToString();
                    field.username = dr["username"].ToString();
                    field.password = dr["password"].ToString();
             

                    details.Add(field);
                }
            }

            return details.ToArray();
        }


        public class stdvisit11
        {
            public string id { get; set; }
            public string username { get; set; }
            public string password { get; set; }
        
        }
    }
}