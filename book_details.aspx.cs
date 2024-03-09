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
    public partial class book_details : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static stdvisit1[] DataBind2()
        {
            List<stdvisit1> details = new List<stdvisit1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000) 
                bookid,
                [bookName],
                [bookDepartment],
                [bookFaculty],
                [bookQuantity],
                [available_qty]
            FROM 
                [books]
            WHERE 
                available_qty > 0
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdvisit1 field = new stdvisit1();
                    field.id1 = dr["bookid"].ToString();
                    field.id = dr["bookName"].ToString();
                    field.name = dr["bookDepartment"].ToString();
                    field.dept = dr["bookFaculty"].ToString();
                    field.facul = dr["bookQuantity"].ToString();
                    field.class_name = dr["available_qty"].ToString();

                    details.Add(field);
                }
            } // The connection will be automatically closed here

            return details.ToArray();
        }

        [WebMethod]
        public static stdrpt[] stddetails(int celvalue)
        {
            List<stdrpt> details = new List<stdrpt>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000) 
                [bookName],
                [bookPrice],
                [bookDepartment],
                [bookFaculty],
                [bookQuantity],
                [bookImage],
                [entryData],
                [available_qty],
                [rent_qty]
            FROM 
                [books] 
            WHERE 
                bookid = @search
        ", con);

                cmd.Parameters.AddWithValue("@search", celvalue);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdrpt field = new stdrpt();
                    field.name = dr["bookName"].ToString();
                    field.price = dr["bookPrice"].ToString();
                    field.dept = dr["bookDepartment"].ToString();
                    field.facul = dr["bookFaculty"].ToString();
                    field.qty = dr["bookQuantity"].ToString();
                    field.image = dr["bookImage"].ToString();
                    field.date = dr["entryData"].ToString();
                    field.aqty = dr["available_qty"].ToString();
                    field.rqty = dr["rent_qty"].ToString();

                    details.Add(field);
                }
            } // The connection will be automatically closed here

            return details.ToArray();
        }


        [WebMethod]
        public static stdvisit1[] Search_id(string search)
        {
            List<stdvisit1> details = new List<stdvisit1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000) 
                [bookid],
                [bookName],
                [bookDetails],
                [bookPrice],
                [bookDepartment],
                [bookFaculty],
                [bookQuantity],
                [bookImage],
                [entryData],
                [available_qty],
                [rent_qty]
            FROM 
                [books]
            WHERE 
                (
                    [bookName] LIKE '%' + @search + '%'
                    OR [bookDepartment] LIKE '%' + @search + '%'
                    OR [bookFaculty] LIKE '%' + @search + '%'
                )
                AND [available_qty] > 0;
        ", con);
                cmd.Parameters.AddWithValue("@search", search);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdvisit1 field = new stdvisit1();
                    field.id1 = dr["bookid"].ToString();
                    field.id = dr["bookName"].ToString();
                    field.name = dr["bookDepartment"].ToString();
                    field.dept = dr["bookFaculty"].ToString();
                    field.facul = dr["bookQuantity"].ToString();
                    field.class_name = dr["available_qty"].ToString();

                    details.Add(field);
                }
            } // The connection will be automatically closed here

            return details.ToArray();
        }


        public class stdvisit1
        {
            public string id { get; set; }
            public string id1 { get; set; }
            public string name { get; set; }
            public string dept { get; set; }
            public string facul { get; set; }
            public string faculty_class { get; set; }
            public string class_name { get; set; }
     
        }

        public class stdrpt
        {
          
            public string name { get; set; }
            public string price { get; set; }
            public string dept { get; set; }
            public string facul { get; set; }
            public string qty { get; set; }
            public string image { get; set; }
            public string date { get; set; }
            public string aqty { get; set; }
            public string rqty { get; set; }

        }


    }
}