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
    public partial class studentlgn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { };
        }
        //protected void Button1_Click1(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //        SqlConnection con = new SqlConnection(cs);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand(@"
        //                              SELECT std_id, CONCAT(first_name, ' ', middle_name, ' ', last_name) AS full_name
        //                          FROM students
        //                                    where 
        //                                        std_id=@password
        //                                    ", con);

        //        cmd.Parameters.AddWithValue("@Password", TextBox4.Text);

        //        SqlDataReader dr = cmd.ExecuteReader();
        //        if (dr.Read())
        //        {
        //            Session["std_id"] = dr["std_id"].ToString();
        //            Session["full_name"] = dr["full_name"].ToString();

        //            Response.Redirect("welcome.aspx");
        //        }
        //        else
        //        {
        //            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('error!',  'Address or Password Is in correct!', 'error')", true);
        //        }
        //    }
        //    catch { }
        //}

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
                         WHERE std_id = @id
                          AND password = @pass;
                                      ", con))
                    {
                        cmd.Parameters.AddWithValue("@id", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@pass", TextBox3.Text);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                Session["std_id"] = dr["std_id"].ToString();
                                Session["full_name"] = dr["full_name"].ToString();
                                Response.Redirect("welcome.aspx");
                                Session.Clear();


                            }
                            else
                            {
                                //Response.Write("waa qalad passwordkaaga.");
                                Label1.Text = ("waa qalad  ID gaaga ama passwordkaaga ");
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