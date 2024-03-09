using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace library
{
    public partial class updatesemesters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static bool checksl(string slname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                     "WHEN EXISTS ( " +
                     "SELECT 1 " +
                     "FROM [shlclass] " +
                     "WHERE [shlclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                     ") THEN 1 " +
                     "ELSE 0 " +
                     "END AS NameExists;";







                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", slname2);

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
        public static bool checkba(string baname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                 "WHEN EXISTS ( " +
                 "SELECT 1 " +
                 "FROM [BAclass] " +
                 "WHERE [BAclass_name] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                 ") THEN 1 " +
                 "ELSE 0 " +
                 "END AS NameExists;";







                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", baname2);

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
        public static bool checkph(string phname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                      "WHEN EXISTS ( " +
                      "SELECT 1 " +
                      "FROM [Publichealthclass] " +
                      "WHERE [PHclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                      ") THEN 1 " +
                      "ELSE 0 " +
                      "END AS NameExists;";






                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", phname2);

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
        public static bool checkpa(string paname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                 "WHEN EXISTS ( " +
                 "SELECT 1 " +
                 "FROM [publicadministrationclass] " +
                 "WHERE [PAclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                 ") THEN 1 " +
                 "ELSE 0 " +
                 "END AS NameExists;";






                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", paname2);

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
        public static bool checkmed(string medname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                  "WHEN EXISTS ( " +
                  "SELECT 1 " +
                  "FROM [medclass] " +
                  "WHERE [medclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                  ") THEN 1 " +
                  "ELSE 0 " +
                  "END AS NameExists;";





                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", medname2);

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
        public static bool checkgf(string gfname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                           "WHEN EXISTS ( " +
                           "SELECT 1 " +
                           "FROM [generalfiqhiclass] " +
                           "WHERE [GFclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                           ") THEN 1 " +
                           "ELSE 0 " +
                           "END AS NameExists;";




                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", gfname2);

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
        public static bool checkgn(string gnname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                 "WHEN EXISTS ( " +
                 "SELECT 1 " +
                 "FROM [generalnursingclass] " +
                 "WHERE [gnclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                 ") THEN 1 " +
                 "ELSE 0 " +
                 "END AS NameExists;";



                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", gnname2);

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
        public static bool checkedcn(string edname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                    "WHEN EXISTS ( " +
                    "SELECT 1 " +
                    "FROM [educationclass] " +
                    "WHERE [edcnclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                    ") THEN 1 " +
                    "ELSE 0 " +
                    "END AS NameExists;";


                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", edname2);

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
        public static bool checkac(string acname2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT CASE " +
                "WHEN EXISTS ( " +
                "SELECT 1 " +
                "FROM [Accountingclass] " +
                "WHERE [AFclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS " +
                ") THEN 1 " +
                "ELSE 0 " +
                "END AS NameExists;";



                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", acname2);

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
        public static string insertac(string acname2, int acsem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "INSERT INTO Accountingclass (AFclassname, sem_id) " +
                 "VALUES (@itname, @itsem)";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", acname2);
                        cmd.Parameters.AddWithValue("@itsem", acsem2);


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

        [WebMethod]
        public static string submitedcn(string edname2, int edsem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "INSERT INTO educationclass (edcnclassname, sem_id) " +
                 "VALUES (@itname, @itsem)";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", edname2);
                        cmd.Parameters.AddWithValue("@itsem", edsem2);


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


        [WebMethod]
        public static string submitgn(string gnname2, int gnsem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "INSERT INTO generalnursingclass (gnclassname, sem_id) " +
                    "VALUES (@itname, @itsem)";



                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", gnname2);
                        cmd.Parameters.AddWithValue("@itsem", gnsem2);


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

        [WebMethod]
        public static string submitgf(string gfname2, int gfsem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "INSERT INTO generalfiqhiclass (GFclassname, sem_id) " +
                                   "VALUES (@itname, @itsem)";



                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", gfname2);
                        cmd.Parameters.AddWithValue("@itsem", gfsem2);


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
        [WebMethod]
        public static string submitmed(string medname2, int medsem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "INSERT INTO medclass (medclassname, sem_id) " +
                   "VALUES (@itname, @itsem)";




                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", medname2);
                        cmd.Parameters.AddWithValue("@itsem", medsem2);


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

        [WebMethod]
        public static string submitpa(string paname2, int pasem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "INSERT INTO publicadministrationclass (PAclassname,  sem_id) " +
                    "VALUES (@itname, @itsem)";





                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", paname2);
                        cmd.Parameters.AddWithValue("@itsem", pasem2);


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
        [WebMethod]
        public static string submitph(string phname2, int phsem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "INSERT INTO Publichealthclass (PHclassname,  sem_id) " +
                  "VALUES (@itname,  @itsem)";






                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", phname2);
                        cmd.Parameters.AddWithValue("@itsem", phsem2);


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

        [WebMethod]
        public static string submitba(string baname2, int basem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "INSERT INTO BAclass (BAclass_name,  sem_id) " +
                      "VALUES (@itname,  @itsem)";







                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", baname2);
                        cmd.Parameters.AddWithValue("@itsem", basem2);


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


        [WebMethod]
        public static string submitsl(string slname2, int slsem2)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "INSERT INTO shlclass (shlclassname, sem_id) " +
                    "VALUES (@itname,  @itsem)";








                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", slname2);
                        cmd.Parameters.AddWithValue("@itsem", slsem2);


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




        [WebMethod]
        public static bool CheckIdExists(string itname)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT \r\n    CASE \r\n        WHEN EXISTS (\r\n            SELECT 1\r\n    FROM [Itclass]\r\n   " +
                        "       WHERE [itclassname] COLLATE SQL_Latin1_General_CP1_CI_AS = @std_id COLLATE SQL_Latin1_General_CP1_CI_AS\r\n        )" +
                        " THEN 1\r\n   " +     "     ELSE 0\r\n    END AS NameExists;\r\n";

                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@std_id", itname);

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
        public static string SubmitVisit(string itname, int itsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "INSERT INTO Itclass (itclassname, sem_id) " +
                                   "VALUES ( @itname, @itsem)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itname", itname);
                        cmd.Parameters.AddWithValue("@itsem", itsem);
                   

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


        [WebMethod]
        public static string updateedu(int edid, string edname, string edsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE educationclass " +
                                   "SET edcnclassname = @itname, sem_id = @itsem " +
                                   "WHERE edcnclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", edid);
                        cmd.Parameters.AddWithValue("@itname", edname);
                        cmd.Parameters.AddWithValue("@itsem", edsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }




        [WebMethod]
        public static string updateit(int itid, string itname, string itsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE Itclass " +
                                   "SET itclassname = @itname, sem_id = @itsem " +
                                   "WHERE Itclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", itid);
                        cmd.Parameters.AddWithValue("@itname", itname);
                        cmd.Parameters.AddWithValue("@itsem", itsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }


        [WebMethod]
        public static string deleteit(int itid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "DELETE FROM Itclass " +
                          "WHERE Itclass_id = @itid";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", itid);
                 

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }

        [WebMethod]
        public static string deleteac(int acid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "DELETE FROM Accountingclass " +
                          "WHERE AFclass_id = @itid";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", acid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }


        [WebMethod]
        public static string deleteed(int edid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "DELETE FROM educationclass " +
                 "WHERE edcnclass_id = @itid";



                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", edid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }
        [WebMethod]
        public static string deletegn(int gnid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "DELETE FROM generalnursingclass " +
                    "WHERE gnclass_id = @itid";



                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", gnid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }
        [WebMethod]
        public static string deletegf(int gfid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "DELETE FROM generalfiqhiclass " +
                   "WHERE GFclass_id = @itid";




                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", gfid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }
        [WebMethod]
        public static string deletemed(int medid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "DELETE FROM medclass " +
                 "WHERE medclass_id = @itid";





                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", medid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }
        [WebMethod]
        public static string deleteba(int baid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "DELETE FROM BAclass " +
                                   "WHERE BAclass_id = @itid";






                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", baid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }
        [WebMethod]
        public static string deletepa(int paid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "DELETE FROM publicadministrationclass " +
                   "WHERE PAclass_id = @itid";







                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", paid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }
        [WebMethod]
        public static string deleteph(int phid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "DELETE FROM Publichealthclass " +
                 "WHERE PHclass_id = @itid";








                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", phid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }
        [WebMethod]
        public static string deletesl(int slid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "DELETE FROM shlclass " +
                 "WHERE shl_id = @itid";









                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", slid);


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }

        [WebMethod]
        public static string updateac(int acid, string acname, string acsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE Accountingclass " +
                                   "SET AFclassname = @itname, sem_id = @itsem " +
                                   "WHERE AFclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", acid);
                        cmd.Parameters.AddWithValue("@itname", acname);
                        cmd.Parameters.AddWithValue("@itsem", acsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }

        [WebMethod]
        public static string updategn(int itid, string itname, string itsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE generalnursingclass " +
                                   "SET gnclassname = @itname, sem_id = @itsem " +
                                   "WHERE gnclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", itid);
                        cmd.Parameters.AddWithValue("@itname", itname);
                        cmd.Parameters.AddWithValue("@itsem", itsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }



        [WebMethod]
        public static string updategf(int itid, string itname, string itsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE generalfiqhiclass " +
                                   "SET GFclassname = @itname, sem_id = @itsem " +
                                   "WHERE GFclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", itid);
                        cmd.Parameters.AddWithValue("@itname", itname);
                        cmd.Parameters.AddWithValue("@itsem", itsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }



        [WebMethod]
        public static string updatem(int itid, string itname, string itsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE medclass " +
                                   "SET medclassname = @itname, sem_id = @itsem " +
                                   "WHERE medclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", itid);
                        cmd.Parameters.AddWithValue("@itname", itname);
                        cmd.Parameters.AddWithValue("@itsem", itsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }


        [WebMethod]
        public static string updatepa(int itid, string itname, string itsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE publicadministrationclass " +
                                   "SET PAclassname = @itname, sem_id = @itsem " +
                                   "WHERE PAclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", itid);
                        cmd.Parameters.AddWithValue("@itname", itname);
                        cmd.Parameters.AddWithValue("@itsem", itsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }

        [WebMethod]
        public static string updateph(int itid, string itname, string itsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE Publichealthclass " +
                                   "SET PHclassname = @itname, sem_id = @itsem " +
                                   "WHERE PHclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", itid);
                        cmd.Parameters.AddWithValue("@itname", itname);
                        cmd.Parameters.AddWithValue("@itsem", itsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }

        [WebMethod]
        public static string updateba(int itid, string itname, string itsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE BAclass " +
                                   "SET BAclass_name = @itname, sem_id = @itsem " +
                                   "WHERE BAclass_id = @itid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@itid", itid);
                        cmd.Parameters.AddWithValue("@itname", itname);
                        cmd.Parameters.AddWithValue("@itsem", itsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }

        [WebMethod]
        public static string updatesl(int slid, string slname, string slsem)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "UPDATE shlclass " +
                                   "SET shlclassname = @slname, sem_id = @slsem " +
                                   "WHERE shl_id = @slid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@slid", slid);
                        cmd.Parameters.AddWithValue("@slname", slname);
                        cmd.Parameters.AddWithValue("@slsem", slsem);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                // You might want to log the exception for troubleshooting
                throw new Exception("Error in updatebook1 method", ex);
            }
        }

        [WebMethod]
        public static string updatesem()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "-- Update Itclass\n" +
       "UPDATE [Itclass]\n" +
       "SET [sem_id] = CASE\n" +
       "               WHEN [sem_id] < 8 THEN [sem_id] + 1\n" +
       "               ELSE [sem_id]\n" +
       "           END\n" +
       "WHERE [sem_id] < 8;\n\n" +

       "-- Update educationclass\n" +
       "UPDATE [educationclass]\n" +
       "SET [sem_id] = CASE\n" +
       "               WHEN [sem_id] < 8 THEN [sem_id] + 1\n" +
       "               ELSE [sem_id]\n" +
       "           END\n" +
       "WHERE [sem_id] < 8;\n\n" +

       "-- Update generalnursingclass\n" +
       "UPDATE [generalnursingclass]\n" +
       "SET [sem_id] = CASE\n" +
       "               WHEN [sem_id] < 8 THEN [sem_id] + 1\n" +
       "               ELSE [sem_id]\n" +
       "           END\n" +
       "WHERE [sem_id] < 8;\n\n" +

       "-- Update generalfiqhiclass\n" +
       "UPDATE [generalfiqhiclass]\n" +
       "SET [sem_id] = CASE\n" +
       "               WHEN [sem_id] < 8 THEN [sem_id] + 1\n" +
       "               ELSE [sem_id]\n" +
       "           END\n" +
       "WHERE [sem_id] < 8;\n\n" +

       "-- Update medclass\n" +
       "UPDATE [medclass]\n" +
       "SET [sem_id] = CASE\n" +
       "               WHEN [sem_id] < 12 THEN [sem_id] + 1\n" +
       "               ELSE [sem_id]\n" +
       "           END\n" +
       "WHERE [sem_id] < 8;\n\n" +

       "-- Update publicadministrationclass\n" +
       "UPDATE [publicadministrationclass]\n" +
       "SET [sem_id] = CASE\n" +
       "               WHEN [sem_id] < 8 THEN [sem_id] + 1\n" +
       "               ELSE [sem_id]\n" +
       "           END\n" +
       "WHERE [sem_id] < 8;\n\n" +

       "-- Update Publichealthclass\n" +
       "UPDATE [Publichealthclass]\n" +
       "SET [sem_id] = CASE\n" +
       "               WHEN [sem_id] < 8 THEN [sem_id] + 1\n" +
       "               ELSE [sem_id]\n" +
       "           END\n" +
       "WHERE [sem_id] < 8;\n\n" +

       "-- Update shlclass\n" +
       "UPDATE [shlclass]\n" +
       "SET [sem_id] = CASE\n" +
       "               WHEN [sem_id] < 8 THEN [sem_id] + 1\n" +
       "               ELSE [sem_id]\n" +
       "           END\n" +
       "WHERE [sem_id] < 8;";


                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                       

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
        public static semtbl[] DataBindItClass()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT Itclass_id, itclassname, [sem_id]
            FROM [Itclass];", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["itclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["Itclass_id"].ToString();

                    details.Add(field);
                }
            } // Connection is automatically closed here

            return details.ToArray();
        }

        [WebMethod]
        public static semtbl[] DataBindACClass()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT AFclass_id, AFclassname, sem_id
            FROM Accountingclass;", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["AFclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["AFclass_id"].ToString();

                    details.Add(field);
                }
            } // Connection is automatically closed here

            return details.ToArray();
        }

        public class semtbl
        {
            public string name { get; set; }
            public string sem { get; set; }
            public string id { get; set; }



        }
        [WebMethod]
        public static semtbl[] databindpublichealth()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT PHclass_id, PHclassname, [sem_id]
            FROM [Publichealthclass];", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["PHclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["PHclass_id"].ToString();

                    details.Add(field);
                }
            } // The connection is automatically closed here

            return details.ToArray();
        }


        [WebMethod]
        public static semtbl[] databindba()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000) BAclass_id,
                [BAclass_name],
                [sem_id]
            FROM [BAclass]", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["BAclass_name"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["BAclass_id"].ToString();

                    details.Add(field);
                }
            } // Connection is automatically closed here

            return details.ToArray();
        }

        [WebMethod]
        public static semtbl[] databindsh()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT shl_id, shlclassname, [sem_id]
            FROM [shlclass]", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["shlclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["shl_id"].ToString();

                    details.Add(field);
                }
            } // Connection is automatically closed here

            return details.ToArray();
        }



        [WebMethod]
        public static semtbl[] DataBindEducationClass()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            -- Select from educationclass
      SELECT edcnclass_id, edcnclassname, [sem_id]
      FROM [educationclass];

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["edcnclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["edcnclass_id"].ToString();
                    details.Add(field);
                }
            }

            return details.ToArray();
        }



        [WebMethod]
        public static semtbl[] DataBindGeneralNursingClass()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            -- Select from generalnursingclass
            SELECT gnclass_id, gnclassname, [sem_id]
            FROM [generalnursingclass];
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["gnclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["gnclass_id"].ToString();
                    details.Add(field);
                }
            }

            return details.ToArray();
        }




        [WebMethod]
        public static semtbl[] DataBindGeneralfiqhiclass()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            -- Select from generalfiqhiclass
            SELECT GFclass_id, GFclassname, [sem_id]
            FROM [generalfiqhiclass];
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["GFclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["GFclass_id"].ToString();
                    details.Add(field);
                }
            }

            return details.ToArray();
        }





        [WebMethod]
        public static semtbl[] DataBindMedClass()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            -- Select from medclass
            SELECT medclass_id, medclassname, [sem_id]
            FROM [medclass];
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["medclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["medclass_id"].ToString();
                    details.Add(field);
                }
            }

            return details.ToArray();
        }



        [WebMethod]
        public static semtbl[] DataBindPublicAdministrationClass()
        {
            List<semtbl> details = new List<semtbl>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            -- Select from publicadministrationclass
            SELECT PAclass_id, PAclassname, [sem_id]
            FROM [publicadministrationclass];
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    semtbl field = new semtbl();
                    field.name = dr["PAclassname"].ToString();
                    field.sem = dr["sem_id"].ToString();
                    field.id = dr["PAclass_id"].ToString();
                    details.Add(field);
                }
            }

            return details.ToArray();
        }







    }
}