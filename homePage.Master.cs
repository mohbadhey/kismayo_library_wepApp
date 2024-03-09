using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace library
{
    public partial class homePage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
          
            if (Session["username"] == null)
            {
                // Redirect to the login page (assuming the login page URL is "login.aspx")
                Response.Redirect("index.aspx");
            }
            else
            {
                // Set the text of Label1 to the value of the std_id session variable
                lbl.Text = (string)Session["username"];
              
            }

        }


        protected void button_Click(object sender, EventArgs e)
        {
            // Clear session
            Session.Clear();

            // Redirect to logout page
            Response.Redirect("index.aspx");
        }
    }
}