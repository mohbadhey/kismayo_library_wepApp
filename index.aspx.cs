using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class loginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            

            if (!Page.IsPostBack)
            { };










            }

        protected void btnlogn_Click(object sender, EventArgs e)
        {
          

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"
                                         select * from users 
                                            where 
                                                username=@username and 
                                                password=@password
                                            ", con);
            cmd.Parameters.AddWithValue("@Username", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox4.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["username"] = dr["username"].ToString();
                Response.Redirect("Dhashboard.aspx");
               
            }
            else
            {

            }
        }
    }
}