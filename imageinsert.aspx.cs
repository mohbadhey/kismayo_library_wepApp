using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;





// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 


namespace library
{
    
    public partial class imageinsert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        [WebMethod]
        public static string SaveImage(FileData data)
        {
            string filePath = HttpContext.Current.Server.MapPath("~/Files/");
            if (!Directory.Exists(filePath))
            {
                Directory.CreateDirectory(filePath);
            }

            string fileName = Path.GetFileName(data.Name);
            byte[] bytes = Convert.FromBase64String(data.Data);
            File.WriteAllBytes(filePath + fileName, bytes);

            string imageFilePath = "~/Files/" + fileName;
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                string sql = "INSERT INTO books (bookImage) VALUES (@bookImage)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@bookImage", imageFilePath);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            return "Data Saved Successfully";
        }

        public class FileData
        {
            public string Data { get; set; }
            public string ContentType { get; set; }
            public string Name { get; set; }
        }



    }
}