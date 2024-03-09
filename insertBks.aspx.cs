using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class insertBks : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        
        }






        [WebMethod]
        public static stdvisit111[] DataBind28()
        {
            List<stdvisit111> details = new List<stdvisit111>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT AcademicYear
            FROM AcademicYear
            WHERE CAST(GETDATE() AS DATE) BETWEEN StartDate AND EndDate;
        ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdvisit111 field = new stdvisit111();
                    field.AcademicYear = dr["AcademicYear"].ToString();
                    details.Add(field);
                }
            } // The connection will be automatically closed here

            return details.ToArray();
        }



        public class stdvisit111
        {
            public string AcademicYear { get; set; }


        }



        [WebMethod]
        public static string sbmitbook(string bookName, int bookPrice, string bookDept, string bookFaculty, int bookQuantity, string dateRegistered, int availableQuantity, string bookDetails)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "INSERT INTO books (bookName, bookPrice, bookDepartment, bookFaculty, bookQuantity, bookDetails, entryData, available_qty) " +
                           "VALUES (@bookName, @bookPrice, @bookDept, @bookFaculty, @bookQuantity, @bookDetails, @entryData, @availableQuantity)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@bookName", bookName);
                        cmd.Parameters.AddWithValue("@bookPrice", bookPrice);
                        cmd.Parameters.AddWithValue("@bookDept", bookDept);
                        cmd.Parameters.AddWithValue("@bookFaculty", bookFaculty);
                        cmd.Parameters.AddWithValue("@bookQuantity", bookQuantity);
                        cmd.Parameters.AddWithValue("@bookDetails", bookDetails);
                        cmd.Parameters.AddWithValue("@entryData", dateRegistered);  // Assuming dateRegistered corresponds to entryData
                        cmd.Parameters.AddWithValue("@availableQuantity", availableQuantity);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in sbmitbook method", ex);
            }
        }






        [WebMethod]
        public static string updatebook1(string bookName, string bookPrice, string bookDept, string bookFaculty, string bookQuantity, string dateRegistered, string availableQuantity, string bookDetails,int bookId)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE books SET " +
                             
                                   "bookName = @bookName, " +
                                   "bookPrice = @bookPrice, " +
                                   "bookDepartment = @bookDept, " +
                                   "bookFaculty = @bookFaculty, " +
                                   "bookQuantity = @bookQuantity, " +
                                   "bookDetails = @bookDetails, " +
                                   "entryData = @entryData, " +
                                   "available_qty = @availableQuantity " +
                                   "WHERE bookID = @bookID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@bookName", bookName);
                        cmd.Parameters.AddWithValue("@bookPrice", bookPrice);
                        cmd.Parameters.AddWithValue("@bookDept", bookDept);
                        cmd.Parameters.AddWithValue("@bookFaculty", bookFaculty);
                        cmd.Parameters.AddWithValue("@bookQuantity", bookQuantity);
                        cmd.Parameters.AddWithValue("@bookDetails", bookDetails);
                        cmd.Parameters.AddWithValue("@entryData", dateRegistered);  // Assuming dateRegistered corresponds to entryData
                        cmd.Parameters.AddWithValue("@availableQuantity", availableQuantity);
                        cmd.Parameters.AddWithValue("@bookID", bookId);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in sbmitbook method", ex);
            }
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
                available_qty > 0;
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
                bookid,
                [bookName],
                [bookPrice],
                [bookDepartment],
                [bookFaculty],
                [bookQuantity],
                [bookImage],
                [entryData],
                [available_qty],
                [rent_qty],
                bookDetails
            FROM 
                [books] 
            WHERE 
                bookid = @search;
        ", con);

                cmd.Parameters.AddWithValue("@search", celvalue);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdrpt field = new stdrpt();
                    field.bookid = dr["bookid"].ToString();
                    field.name = dr["bookName"].ToString();
                    field.price = dr["bookPrice"].ToString();
                    field.dept = dr["bookDepartment"].ToString();
                    field.facul = dr["bookFaculty"].ToString();
                    field.qty = dr["bookQuantity"].ToString();
                    field.image = dr["bookImage"].ToString();
                    field.date = dr["entryData"].ToString();
                    field.aqty = dr["available_qty"].ToString();
                    field.rqty = dr["rent_qty"].ToString();
                    field.bookDetails = dr["bookDetails"].ToString();

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
            public string bookid { get; set; }
            public string name { get; set; }
            public string price { get; set; }
            public string dept { get; set; }
            public string facul { get; set; }
            public string qty { get; set; }
            public string image { get; set; }
            public string date { get; set; }
            public string aqty { get; set; }
            public string rqty { get; set; }
            public string bookDetails  { get; set; }
            

        }









        [WebMethod]
        public static List<ListItem> getdepart()
        {
            string query = "select   * from departments";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    List<ListItem> customers = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(new ListItem
                            {
                                Value = sdr["dept_id"].ToString(),
                                Text = sdr["dept_name"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }


        [WebMethod]
        public static List<ListItem> getfacul2(int selectedValue)
        {
            string query = "SELECT facul_id, faculty_name FROM facults WHERE dept_id = @selectedValue1";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    List<ListItem> semesters = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@selectedValue1", selectedValue);
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            semesters.Add(new ListItem
                            {
                                Value = sdr["facul_id"].ToString(),
                                Text = sdr["faculty_name"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return semesters;
                }
            }
        }








        [WebMethod]
        public static string SaveImage(BookData data)
        {

            string filePath = HttpContext.Current.Server.MapPath("images/");
            if (!Directory.Exists(filePath))
            {
                Directory.CreateDirectory(filePath);
            }

            string fileName = Path.GetFileName(data.Name);
           
            byte[] bytes = Convert.FromBase64String(data.Data);
            File.WriteAllBytes(filePath + fileName, bytes);


            Console.WriteLine("BookName: " + data.BookName);
            Console.WriteLine("BookPrice: " + data.BookPrice);

            string imageFilePath = "images/" + fileName;
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            // ... Repeat for other properties
            Console.WriteLine("image: " + imageFilePath);
            Console.WriteLine("BookimagenName: " + data.Name);
            Console.WriteLine("BookName: " + data.BookName);
            Console.WriteLine("BookPrice: " + data.BookPrice);
            using (SqlConnection conn = new SqlConnection(constr))
            {
                string sql = "INSERT INTO books (bookImage, bookName, bookPrice, bookDepartment, bookFaculty,  bookQuantity, bookDetails, entryData, available_qty) " +
                             "VALUES (@bookImage, @bookName, @bookPrice, @bookDept, @bookFaculty, @bookQuantity,@bookDetails, @entryData, @availableQuantity)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@bookImage", imageFilePath);
                    cmd.Parameters.AddWithValue("@bookName", data.BookName);
                    cmd.Parameters.AddWithValue("@bookPrice", data.BookPrice);
                    cmd.Parameters.AddWithValue("@bookDept", data.BookDept);
                    cmd.Parameters.AddWithValue("@bookFaculty", data.BookFaculty);
                    cmd.Parameters.AddWithValue("@bookQuantity", data.BookQuantity);
                    cmd.Parameters.AddWithValue("@bookDetails", data.bookDetails);
                    cmd.Parameters.AddWithValue("@entryData", DateTime.Now); // Assuming entryData is a DateTime column
                    cmd.Parameters.AddWithValue("@availableQuantity", data.AvailableQuantity);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            return "Data Saved Successfully";
        }
        [WebMethod]
        public static string UpdateBook(BookData1 data1)
        {
            string filePath = HttpContext.Current.Server.MapPath("~/images/");
            if (!Directory.Exists(filePath))
            {
                Directory.CreateDirectory(filePath);
            }

            // Check if data1.Name is not null before using it to construct fileName
            string fileName = data1.Name != null ? Path.GetFileName(data1.Name) : null;

            if (fileName != null)
            {
                byte[] bytes = Convert.FromBase64String(data1.Data);
                File.WriteAllBytes(Path.Combine(filePath, fileName), bytes);

                Console.WriteLine("BookID: " + data1.BookID);
                Console.WriteLine("BookName: " + data1.BookName);
                Console.WriteLine("BookPrice: " + data1.BookPrice);

                string imageFilePath = "images/" + fileName; // Use a relative path

                string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(constr))
                {
                    string sql = "UPDATE books SET " +
                                 "bookImage = @bookImage, " +
                                 "bookName = @bookName, " +
                                 "bookPrice = @bookPrice, " +
                                 "bookDepartment = @bookDept, " +
                                 "bookFaculty = @bookFaculty, " +
                                 "bookQuantity = @bookQuantity, " +
                                 "bookDetails = @bookDetails, " +
                                 "entryData = @entryData, " +
                                 "available_qty = @availableQuantity " +
                                 "WHERE bookID = @bookID";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@bookID", data1.BookID);
                        cmd.Parameters.AddWithValue("@bookImage", imageFilePath);
                        cmd.Parameters.AddWithValue("@bookName", data1.BookName);
                        cmd.Parameters.AddWithValue("@bookPrice", data1.BookPrice);
                        cmd.Parameters.AddWithValue("@bookDept", data1.BookDept);
                        cmd.Parameters.AddWithValue("@bookFaculty", data1.BookFaculty);
                        cmd.Parameters.AddWithValue("@bookQuantity", data1.BookQuantity);
                        cmd.Parameters.AddWithValue("@bookDetails", data1.bookDetails);
                        cmd.Parameters.AddWithValue("@entryData", DateTime.Now); // Assuming entryData is a DateTime column
                        cmd.Parameters.AddWithValue("@availableQuantity", data1.AvailableQuantity);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                return "Data Updated Successfully";
            }
            else
            {
                // Update other fields even if image is not provided
                string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(constr))
                {
                    string sql = "UPDATE books SET " +
                                 "bookName = @bookName, " +
                                 "bookPrice = @bookPrice, " +
                                 "bookDepartment = @bookDept, " +
                                 "bookFaculty = @bookFaculty, " +
                                 "bookQuantity = @bookQuantity, " +
                                 "bookDetails = @bookDetails, " +
                                 "entryData = @entryData, " +
                                 "available_qty = @availableQuantity " +
                                 "WHERE bookID = @bookID";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@bookID", data1.BookID);
                        cmd.Parameters.AddWithValue("@bookName", data1.BookName);
                        cmd.Parameters.AddWithValue("@bookPrice", data1.BookPrice);
                        cmd.Parameters.AddWithValue("@bookDept", data1.BookDept);
                        cmd.Parameters.AddWithValue("@bookFaculty", data1.BookFaculty);
                        cmd.Parameters.AddWithValue("@bookQuantity", data1.BookQuantity);
                        cmd.Parameters.AddWithValue("@bookDetails", data1.bookDetails);
                        cmd.Parameters.AddWithValue("@entryData", DateTime.Now); // Assuming entryData is a DateTime column
                        cmd.Parameters.AddWithValue("@availableQuantity", data1.AvailableQuantity);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                return "Data Updated Successfully (excluding image)";
            }
        }


        [WebMethod]
        public static string DeleteBook(int bookId)
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string sql = "DELETE FROM books WHERE bookid = @bookID";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@bookID", bookId);

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


        public class BookData : FileData
        {
            public string BookName { get; set; }
            public string BookID { get; set; }
            public string BookPrice { get; set; }
            public string BookDept { get; set; }
            public string BookFaculty { get; set; }
            public string BookQuantity { get; set; }
            public string DateRegistered { get; set; }
            public string AvailableQuantity { get; set; }
            public string bookDetails { get; set; }
        }

        public class FileData
        {
            public string Data { get; set; }
            public string ContentType { get; set; }
            public string Name { get; set; }

        }


        public class BookData1 : FileData1
        {
            public string BookName { get; set; }
            public string BookID { get; set; }
            public string BookPrice { get; set; }
            public string BookDept { get; set; }
            public string BookFaculty { get; set; }
            public string BookQuantity { get; set; }
            public string DateRegistered { get; set; }
            public string AvailableQuantity { get; set; }
            public string bookDetails { get; set; }
        }

        public class FileData1
        {
            public string Data { get; set; }
            public string ContentType { get; set; }
            public string Name { get; set; }

        }




        public class stdclass
        {
            public string id { get; set; }
            public string category { get; set; }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            con.Open();

        //            // Validate file upload
        //            if (bookImageInput.HasFile)
        //            {
        //                string ext = Path.GetExtension(bookImageInput.FileName);
        //                if (ext.Equals(".jpg", StringComparison.OrdinalIgnoreCase) ||
        //                    ext.Equals(".jpeg", StringComparison.OrdinalIgnoreCase) ||  // Add ".jpeg" as a valid extension
        //                    ext.Equals(".png", StringComparison.OrdinalIgnoreCase))
        //                {
        //                    string path = Server.MapPath("images/");
        //                    bookImageInput.SaveAs(path + bookImageInput.FileName);
        //                    string imagePath = "images/" + bookImageInput.FileName;

        //                    // Insert data into the database
        //                    string query = "INSERT INTO books (bookName, bookDetails, bookPrice, bookDepartment, bookFaculty, bookQuantity, available_qty, bookImage, entryData) " +
        //                                   "VALUES (@BookName, @BookDetails, @BookPrice, @BookDepartment, @BookFaculty, @BookQuantity, @AvailableQuantity, @BookImage, @EntryData)";

        //                    using (SqlCommand cmd = new SqlCommand(query, con))
        //                    {
        //                        cmd.Parameters.AddWithValue("@BookName", bookNameInput.Text);
        //                        cmd.Parameters.AddWithValue("@BookDetails", bookDetailsInput.Text);
        //                        cmd.Parameters.AddWithValue("@BookPrice", Convert.ToDecimal(bookPriceInput.Text));

        //                        // Retrieve the selected department and faculty names
        //                        cmd.Parameters.AddWithValue("@BookDepartment", depts.SelectedItem.Text);
        //                        cmd.Parameters.AddWithValue("@BookFaculty", faculs.SelectedItem.Text);

        //                        cmd.Parameters.AddWithValue("@BookQuantity", Convert.ToInt32(bookQuantityInput.Text));
        //                        cmd.Parameters.AddWithValue("@AvailableQuantity", Convert.ToInt32(bookavailble.Text)); // Assuming bookavailble is the input for AvailableQuantity
        //                        cmd.Parameters.AddWithValue("@BookImage", imagePath);
        //                        cmd.Parameters.AddWithValue("@EntryData", Convert.ToDateTime(entryDataInput.Text));

        //                        cmd.ExecuteNonQuery();

        //                        // Provide feedback to the user
        //                        // You can redirect to another page or display a success message here
        //                        Response.Write("Form submitted successfully!");
        //                    }
        //                }
        //                else
        //                {
        //                    // Handle invalid file type
        //                    Response.Write("Invalid file type. Please upload a .jpg, .jpeg, or .png file.");
        //                }
        //            }
        //            else
        //            {
        //                // Handle case where no file is uploaded
        //                Response.Write("Please upload a file.");
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle other exceptions
        //        Response.Write("An error occurred: " + ex.Message);
        //    }
        //}

    }
}