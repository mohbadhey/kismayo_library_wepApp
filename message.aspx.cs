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
    public partial class message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static void InsertMessage(string std_id, string description)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO [dbo].[message] (std_id, description, [date], IsUnread) VALUES (@std_id, @description, @date, 0)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@std_id", std_id);
                command.Parameters.AddWithValue("@description", description);
                command.Parameters.AddWithValue("@date", DateTime.Now);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        [WebMethod]
        public static List<Message> GetMessages()
        {
            List<Message> messages = new List<Message>();
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT m_id, std_id, description, [date] FROM [dbo].[message]";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Message message = new Message
                    {
                        m_id = Convert.ToInt32(reader["m_id"]),
                        std_id = reader["std_id"].ToString(),
                        description = reader["description"].ToString(),
                        date = Convert.ToDateTime(reader["date"]).ToString("yyyy-MM-dd HH:mm:ss")
                    };
                    messages.Add(message);
                }
                reader.Close();
            }
            return messages;
        }

        [WebMethod]
        public static void DeleteMessage(int messageId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM [dbo].[message] WHERE m_id = @m_id";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@m_id", messageId);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }


    }
    public class Message
    {
        public int m_id { get; set; }
        public string std_id { get; set; }
        public string description { get; set; }
        public string date { get; set; }
    }










}
