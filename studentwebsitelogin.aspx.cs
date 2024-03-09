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
    public partial class studentwebsitelogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { };
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {




                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand(@" SELECT std_id, CONCAT(first_name, ' ', middle_name, ' ', last_name) AS full_name
                                  FROM students
                                            where 
                                                std_id=@password", con))
                    {
                        cmd.Parameters.AddWithValue("@password", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@pass", TextBox3.Text);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                Session["std_id"] = dr["std_id"].ToString();
                                Session["full_name"] = dr["full_name"].ToString();
                                Response.Redirect("welcome2.aspx");



                            }
                            else
                            {
                                //Response.Write("waa qalad passwordkaaga.");
                                Label1.Text = ("waa qalad passwordkaaga.");
                                Label1.ForeColor = System.Drawing.Color.Red;
                                Label1.Style["font-size"] = "20px";

                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}