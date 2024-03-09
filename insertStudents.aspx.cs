using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static library.insertBks;

namespace library
{
    public partial class insertStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
    
        }






        public class StudentDetails
        {
            public string id { get; set; }
            public string sname { get; set; }
            public string snumber { get; set; }
            public string sfaculty { get; set; }
            public string ssemester { get; set; }
        }





        [WebMethod]
        public static StudentDetails[] DataBind1(int currentPage)
        {
            int pageSize = 10; // Define the number of records to display per page
            int startIndex = (currentPage - 1) * pageSize;
            int endIndex = startIndex + pageSize;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
      @"WITH OrderedResults AS
    (
        SELECT
            students.std_id,
            students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
            students.phone_number,
            semesters.sem_name AS semester,
            facults.faculty_name AS faculty,
            ROW_NUMBER() OVER (ORDER BY students.std_id) AS RowNumber
        FROM
            students
        INNER JOIN
            student_semesters
        ON
            students.std_id = student_semesters.std_id
        INNER JOIN
            semesters
        ON
            student_semesters.sem_id = semesters.sem_id
        INNER JOIN
            facults
        ON
            semesters.facul_id = facults.facul_id
        INNER JOIN
            departments
        ON
            facults.dept_id = departments.dept_id
    )
    SELECT *
    FROM OrderedResults
    WHERE RowNumber > @startIndex AND RowNumber <= @endIndex", con);


                cmd.Parameters.AddWithValue("@startIndex", startIndex);
                cmd.Parameters.AddWithValue("@endIndex", endIndex);

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                StudentDetails[] details = new StudentDetails[dt.Rows.Count];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    details[i] = new StudentDetails();
                    details[i].id = dt.Rows[i]["std_id"].ToString();
                    details[i].sname = dt.Rows[i]["stdname"].ToString();
                    details[i].snumber = dt.Rows[i]["phone_number"].ToString();
                    details[i].sfaculty = dt.Rows[i]["faculty"].ToString();
                    details[i].ssemester = dt.Rows[i]["semester"].ToString();
                }

                return details;
            }
        }


        [WebMethod]
        public static int GetTotalRecords()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS2"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM [students]", con);

                int totalRecords = Convert.ToInt32(cmd.ExecuteScalar());
                return totalRecords;
            }
        }
















        [WebMethod]
        public static stdclass[] Search_id(string search)
        {
            List<stdclass> details = new List<stdclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT 
                students.std_id,
                students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
                CONCAT(
                    med_facults.faculty_name, ' ', it_facults.faculty_name,
                    bafaculs.faculty_name, acfaculs.faculty_name, pafaculs.faculty_name,
                    gffaculs.faculty_name, shlfaculs.faculty_name, gnfaculs.faculty_name,
                    pffaculs.faculty_name, edcfaculs.faculty_name
                ) AS combined_facults,
                CONCAT(
                    Itclass.itclassname, ' ', medclass.medclassname, BAclass.BAclass_name,
                    Accountingclass.AFclassname, PAclass.PAclassname,
                    GFclass.GFclassname, edcnclass.edcnclassname,
                    gnclass.gnclassname, PHclass.PHclassname, sclass.shlclassname
                ) AS combined_classname,
                CONCAT(
                    medept.dept_name, ' ', itdept.dept_name, badept.dept_name,
                    acdept.dept_name, padepart.dept_name, gfdept.dept_name,
                    edcndept.dept_name, gndept.dept_name, phdept.dept_name,
                    shldept.dept_name
                ) AS departments,
                CONCAT(
                    itsem.sem_name, ' ', medsem.sem_name, basem.sem_name,
                    acsem.sem_name, pasem.sem_name, gfsem.sem_name,
                    edcnnsem.sem_name, gnsem.sem_name, phsem.sem_name,
                    shlsem.sem_name
                ) AS semesters,
                students.gender
            FROM students
            LEFT JOIN studentIT_class ON students.std_id = studentIT_class.std_id
            LEFT JOIN studentMed_class ON students.std_id = studentMed_class.std_id
            LEFT JOIN studentaccountingclass ON students.std_id = studentaccountingclass.std_id
            LEFT JOIN studentBAclass ON students.std_id = studentBAclass.std_id
            LEFT JOIN studentpublicadministrationclass ON students.std_id = studentpublicadministrationclass.std_id
            LEFT JOIN studentgeneralfiqhiclass ON students.std_id = studentgeneralfiqhiclass.std_id
            LEFT JOIN studenteducationclass ON students.std_id = studenteducationclass.std_id
            LEFT JOIN studentgeneralnursingclass ON students.std_id = studentgeneralnursingclass.std_id
            LEFT JOIN studentpublichealthclass ON students.std_id = studentpublichealthclass.std_id
            LEFT JOIN studentsharialawclass ON students.std_id = studentsharialawclass.std_id

            LEFT JOIN BAclass ON studentBAclass.BAclass_id = BAclass.BAclass_id
            LEFT JOIN Accountingclass ON studentaccountingclass.AFclass_id = Accountingclass.AFclass_id
            LEFT JOIN publicadministrationclass AS PAclass ON studentpublicadministrationclass.PAclass_id = PAclass.PAclass_id
            LEFT JOIN generalfiqhiclass AS GFclass ON studentgeneralfiqhiclass.GFclass_id = GFclass.GFclass_id
            LEFT JOIN educationclass AS edcnclass ON studenteducationclass.edcnclass_id = edcnclass.edcnclass_id
            LEFT JOIN generalnursingclass AS gnclass ON studentgeneralnursingclass.gnclass_id = gnclass.gnclass_id
            LEFT JOIN Publichealthclass AS PHclass ON studentpublichealthclass.PHclass_id = PHclass.PHclass_id
            LEFT JOIN shlclass AS sclass ON studentsharialawclass.shl_id = sclass.shl_id

            LEFT JOIN departments AS badept ON BAclass.dept_id = badept.dept_id
            LEFT JOIN facults AS bafaculs ON badept.facul_id = bafaculs.facul_id
            LEFT JOIN departments AS acdept ON Accountingclass.dept_id = acdept.dept_id
            LEFT JOIN facults AS acfaculs ON acdept.facul_id = acfaculs.facul_id
            LEFT JOIN departments AS padepart ON PAclass.dept_id = padepart.dept_id
            LEFT JOIN facults AS pafaculs ON padepart.facul_id = pafaculs.facul_id
            LEFT JOIN departments AS gfdept ON GFclass.dept_id = gfdept.dept_id
            LEFT JOIN facults AS gffaculs ON gfdept.facul_id = gffaculs.facul_id
            LEFT JOIN departments AS edcndept ON edcnclass.dept_id = edcndept.dept_id
            LEFT JOIN facults AS edcfaculs ON edcndept.facul_id = edcfaculs.facul_id
            LEFT JOIN departments AS gndept ON gnclass.dept_id = gndept.dept_id
            LEFT JOIN facults AS gnfaculs ON gndept.dept_id = gnfaculs.facul_id
            LEFT JOIN departments AS phdept ON PHclass.dept_id = phdept.dept_id
            LEFT JOIN facults AS pffaculs ON phdept.dept_id = pffaculs.facul_id
            LEFT JOIN departments AS shldept ON sclass.dept_id = shldept.dept_id
            LEFT JOIN facults AS shlfaculs ON shldept.facul_id = shlfaculs.facul_id

            LEFT JOIN medclass ON studentMed_class.medclass_id = medclass.medclass_id
            LEFT JOIN Itclass ON studentIT_class.itclass_id = Itclass.Itclass_id
            LEFT JOIN departments AS medept ON medclass.dept_id = medept.dept_id
            LEFT JOIN departments AS itdept ON Itclass.dept_id = itdept.dept_id
            LEFT JOIN facults AS med_facults ON medept.facul_id = med_facults.facul_id
            LEFT JOIN facults AS it_facults ON itdept.facul_id = it_facults.facul_id

            LEFT JOIN semesters AS basem ON BAclass.sem_id = basem.sem_id
            LEFT JOIN semesters AS itsem ON Itclass.sem_id = itsem.sem_id
            LEFT JOIN semesters AS medsem ON medclass.sem_id = medsem.sem_id
            LEFT JOIN semesters AS acsem ON Accountingclass.sem_id = acsem.sem_id
            LEFT JOIN semesters AS pasem ON PAclass.sem_id = pasem.sem_id
            LEFT JOIN semesters AS gfsem ON GFclass.sem_id = gfsem.sem_id
            LEFT JOIN semesters AS edcnnsem ON edcnclass.sem_id = edcnnsem.sem_id
            LEFT JOIN semesters AS gnsem ON gnclass.sem_id = gnsem.sem_id
            LEFT JOIN semesters AS phsem ON PHclass.sem_id = phsem.sem_id
            LEFT JOIN semesters AS shlsem ON sclass.sem_id = shlsem.sem_id

            WHERE (
                CONCAT(
                    Itclass.itclassname, ' ', medclass.medclassname, BAclass.BAclass_name,
                    Accountingclass.AFclassname, PAclass.PAclassname,
                    GFclass.GFclassname, edcnclass.edcnclassname,
                    gnclass.gnclassname, PHclass.PHclassname, sclass.shlclassname
                ) IS NOT NULL
                AND CONCAT(
                    Itclass.itclassname, ' ', medclass.medclassname, BAclass.BAclass_name,
                    Accountingclass.AFclassname, PAclass.PAclassname,
                    GFclass.GFclassname, edcnclass.edcnclassname,
                    gnclass.gnclassname, PHclass.PHclassname, sclass.shlclassname
                ) != ''
                AND (
                    CONCAT(
                        Itclass.itclassname, ' ', medclass.medclassname, BAclass.BAclass_name,
                        Accountingclass.AFclassname, PAclass.PAclassname,
                        GFclass.GFclassname, edcnclass.edcnclassname,
                        gnclass.gnclassname, PHclass.PHclassname, sclass.shlclassname
                    )  LIKE '%' + @search + '%'
                    OR students.std_id LIKE '%' + @search + '%'
                    OR CONCAT(
                        students.first_name, ' ', students.middle_name, ' ', students.last_name
                    )  LIKE '%' + @search + '%'
                )
            )
            ", con);
                cmd.Parameters.AddWithValue("@search", search);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdclass field = new stdclass();
                    field.id = dr["std_id"].ToString();
                    field.sname = dr["stdname"].ToString();
                    field.facults = dr["combined_facults"].ToString();
                    field.classname = dr["combined_classname"].ToString();
                    field.semesters = dr["semesters"].ToString();
                    field.departments = dr["departments"].ToString();
                    field.gender = dr["gender"].ToString();

                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }



        [WebMethod]
        public static stdclass[] Search_DataBind(int cls, int clsf)
        {
            List<stdclass> details = new List<stdclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("GetStudentDataByClassId1", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                 
                    cmd.Parameters.AddWithValue("@classid", cls);
                    cmd.Parameters.AddWithValue("@medclass", clsf);
                    cmd.Parameters.AddWithValue("@itclass", clsf); // You may need to adjust this if it's a different parameter

                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        stdclass field = new stdclass();
                        field.id = dr["std_id"].ToString();
                        field.sname = dr["stdname"].ToString();
                        field.facults = dr["combined_facults"].ToString();
                        field.classname = dr["combined_classname"].ToString();
                        field.semesters = dr["semesters"].ToString();
                        field.departments = dr["deprtments"].ToString();
                        field.classes = dr["classes"].ToString();
                        field.gender = dr["gender"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }


        //[WebMethod]
        //public static List<ListItem> GetSemesterData(int selectedValue)
        //{
        //    string query = "select class_id , class_name from classes  where facul_id =  @selectedValue1;";
        //    string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(query))
        //        {
        //            List<ListItem> semesters = new List<ListItem>();
        //            cmd.CommandType = CommandType.Text;
        //            cmd.Connection = con;
        //            cmd.Parameters.AddWithValue("@selectedValue1", selectedValue);
        //            con.Open();
        //            using (SqlDataReader sdr = cmd.ExecuteReader())
        //            {
        //                while (sdr.Read())
        //                {
        //                    semesters.Add(new ListItem
        //                    {
        //                        Value = sdr["class_id"].ToString(),
        //                        Text = sdr["class_name"].ToString()
        //                    });
        //                }
        //            }
        //            con.Close();
        //            return semesters;
        //        }

        //    }
        //}






        [WebMethod]
        public static List<ListItem> GetSemesterData(int selectedValue)
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("selectbarches1", con))
                {
                    List<ListItem> semesters = new List<ListItem>();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@depts", selectedValue); // Assuming selectedValue corresponds to ClassId

                    con.Open();

                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            if (selectedValue == 5)
                            {
                                // Mapping for Itclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["Itclass_id"].ToString(),
                                    Text = sdr["itclassname"].ToString()
                                });
                            }
                            else if (selectedValue == 12)
                            {
                                // Mapping for medclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["medclass_id"].ToString(),
                                    Text = sdr["medclassname"].ToString()
                                });
                            }
                            // Add mappings for other departments based on their @depts values
                            else if (selectedValue == 1)
                            {
                                // Mapping for BAclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["BAclass_id"].ToString(),
                                    Text = sdr["BAclass_name"].ToString()
                                });
                            }
                            else if (selectedValue == 2)
                            {
                                // Mapping for Accountingclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["AFclass_id"].ToString(),
                                    Text = sdr["AFclassname"].ToString()
                                });
                            }
                            else if (selectedValue == 3)
                            {
                                // Mapping for publicadministrationclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["PAclass_id"].ToString(),
                                    Text = sdr["PAclassname"].ToString()
                                });
                            }
                            else if (selectedValue == 9)
                            {
                                // Mapping for generalfiqhiclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["GFclass_id"].ToString(),
                                    Text = sdr["GFclassname"].ToString()
                                });
                            }
                           
                            else if (selectedValue == 14)
                            {
                                // Mapping for Publichealthclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["PHclass_id"].ToString(),
                                    Text = sdr["PHclassname"].ToString()
                                });
                            }
                            else if (selectedValue == 6)
                            {
                                // Mapping for Publichealthclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["edcnclass_id"].ToString(),
                                    Text = sdr["edcnclassname"].ToString()
                                });
                            }
                            else if (selectedValue == 13)
                            {
                                // Mapping for Publichealthclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["gnclass_id"].ToString(),
                                    Text = sdr["gnclassname"].ToString()
                                });
                            }
                            else if (selectedValue == 11)
                            {
                                // Mapping for sharialawclass
                                semesters.Add(new ListItem
                                {
                                    Value = sdr["shl_id"].ToString(),
                                    Text = sdr["shlclassname"].ToString()
                                });
                            }
                        }
                    }

                    con.Close();
                    return semesters;
                }
            }
        }



        //    [WebMethod]
        //    public static List<ListItem> GetSemesterData(int selectedValue)
        //    {
        //        string query = @"
        //    SELECT itclass_id, itclassname FROM itclass WHERE facul_id = @selectedValue1;
        //    SELECT medclass_id, medclassname FROM medclass WHERE facul_id = @selectedValue1;
        //";

        //        string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //        using (SqlConnection con = new SqlConnection(constr))
        //        {
        //            using (SqlCommand cmd = new SqlCommand(query))
        //            {
        //                List<ListItem> semesters = new List<ListItem>();
        //                cmd.CommandType = CommandType.Text;
        //                cmd.Connection = con;
        //                cmd.Parameters.AddWithValue("@selectedValue1", selectedValue);

        //                con.Open();

        //                using (SqlDataReader sdr = cmd.ExecuteReader())
        //                {
        //                    // Read the first result set
        //                    while (sdr.Read())
        //                    {
        //                        semesters.Add(new ListItem
        //                        {
        //                            Value = sdr["itclass_id"].ToString(),
        //                            Text = sdr["itclassname"].ToString()
        //                        });
        //                    }

        //                    // Move to the next result set
        //                    sdr.NextResult();

        //                    // Create a new list for the second result set
        //                    List<ListItem> medtable = new List<ListItem>();

        //                    // Read the second result set
        //                    while (sdr.Read())
        //                    {
        //                        medtable.Add(new ListItem
        //                        {
        //                            Value = sdr["medclass_id"].ToString(),
        //                            Text = sdr["medclassname"].ToString()
        //                        });
        //                    }

        //                    // Combine or return both result sets as needed
        //                    semesters.AddRange(medtable);
        //                }

        //                con.Close();
        //                return semesters;
        //            }
        //        }
        //    }



        [WebMethod]
        public static List<ListItem> getdepart()
        {
            string query = "select   * from facults";
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
                                Value = sdr["facul_id"].ToString(),
                                Text = sdr["faculty_name"].ToString()
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
            string query = "SELECT dept_id, dept_name FROM departments WHERE facul_id = @selectedValue1";
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
                                Value = sdr["dept_id"].ToString(),
                                Text = sdr["dept_name"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return semesters;
                }
            }
        }

        [WebMethod]
        public static List<ListItem> classes(int selectedValue)
        {
            string query = "SELECT class_id, class_name FROM classes WHERE dept_id = @selectedValue1";
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
                                Value = sdr["class_id"].ToString(),
                                Text = sdr["class_name"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return semesters;
                }
            }
        }

        [WebMethod]
        public static List<ListItem> GetSemesterData1(int selectedValue)
        {
            string query = "select itclass_id , itclassname from itclass  where facul_id =  @selectedValue1;";
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
                                Value = sdr["itclass_id"].ToString(),
                                Text = sdr["itclassname"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return semesters;
                }

            }
        }




        [WebMethod]
        public static List<ListItem> getdepart1()
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
        public static List<ListItem> getfacul21(int selectedValue)
        {
            string query = "SELECT facul_id, faculty_name FROM facults WHERE dept_id = @selectedValue1";
            string constr = ConfigurationManager.ConnectionStrings["DBCS2"].ConnectionString;
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
        public static List<ListItem> GetCustomers()
        {
            string query = "select   * from faculty_table";
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
                                Value = sdr["faculty_id"].ToString(),
                                Text = sdr["faculty_name"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }


        [WebMethod]
        public static List<ListItem> getsem()
        {
            string query = "select   * from semester_table";
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
                                Value = sdr["semester_id"].ToString(),
                                Text = sdr["semester_name"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }



        [WebMethod]
        public static string SubmitVisit(int id, string name, string classname, string facul, string dept, string sem, string faculclass)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Use a parameterized query to prevent SQL injection
                    string query = "INSERT INTO visittable (std_id, name, dept_name, facult_name, class_name, faculty_class, sem_name) " +
                                   "VALUES (@p_std_id, @p_name, @p_dept_name, @p_facult_name, @p_class_name, @p_faculty_class, @p_sem_name)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the query
                        cmd.Parameters.AddWithValue("@p_std_id", id);
                        cmd.Parameters.AddWithValue("@p_name", name);
                        cmd.Parameters.AddWithValue("@p_dept_name", dept);
                        cmd.Parameters.AddWithValue("@p_facult_name", facul);
                        cmd.Parameters.AddWithValue("@p_class_name", classname);
                        cmd.Parameters.AddWithValue("@p_faculty_class", faculclass);
                        cmd.Parameters.AddWithValue("@p_sem_name", sem);

                        /*  cmd.Parameters.AddWithValue("@p_date_visited", DateTime.Now);*/ // Change as per your requirement

                        // Execute the query
                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions as needed
                return ex.Message;
            }
        }



        //[WebMethod]
        //public static string SubmitVisit(int id, string name, string classname, string facul, int dept, string date, string sem, string faculclass)
        //{
        //    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        con.Open();

        //        // Check if the ID already exists in the database
        //        if (CheckIdExists(id))
        //        {
        //            return "ID already exists";
        //        }

        //        // Insert data into the 'students' table
        //        using (SqlCommand cmd = new SqlCommand(@"
        //    INSERT INTO visittable (std_id, name, phone_number, gender)
        //    VALUES (@std_id, @first_name, @middle_name, @last_name, @phone_number, @gender)", con))
        //        {
        //            cmd.Parameters.AddWithValue("@std_id", id);
        //            cmd.Parameters.AddWithValue("@first_name", fname);
        //            cmd.Parameters.AddWithValue("@middle_name", mname);
        //            cmd.Parameters.AddWithValue("@last_name", lname);
        //            cmd.Parameters.AddWithValue("@phone_number", snumber);
        //            cmd.Parameters.AddWithValue("@gender", gen);

        //            cmd.ExecuteNonQuery();
        //        }

        //        if (cls == 1)
        //        {
        //            // Insert data into the 'student_class' table
        //            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentIT_class ( std_id, itclass_id) VALUES ( @std_id, @itclass_id)", con))
        //            {

        //                cmd3.Parameters.AddWithValue("@std_id", id);
        //                cmd3.Parameters.AddWithValue("@itclass_id", sem);

        //                cmd3.ExecuteNonQuery();
        //            }

        //        }
        //        if (cls == 2)
        //        {
        //            // Insert data into the 'student_class' table
        //            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentMed_class ( std_id, medclass_id) VALUES ( @std_id, @medclass_id)", con))
        //            {

        //                cmd3.Parameters.AddWithValue("@std_id", id);
        //                cmd3.Parameters.AddWithValue("@medclass_id", sem);

        //                cmd3.ExecuteNonQuery();
        //            }
        //        }

        //    }

        //    return "true";
        //}


        [WebMethod]

        public static bool CheckIdExists(int id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Define a SQL query to check if the ID exists in the "students" table
                string query = "SELECT COUNT(*) FROM students WHERE std_id = @std_id";

                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@std_id", id);

                    // Execute the query to count the occurrences of the provided ID
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    // If count > 0, the ID exists; otherwise, it doesn't
                    return count > 0;
                }
            }
        }











        [WebMethod]

        public static bool CheckIdExists1(int id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Define a SQL query to check if the ID exists in the "students" table
                string query = "SELECT \r\n    CASE \r\n        WHEN MAX(date_visited) IS NULL THEN 1\r\n        WHEN \r\n            DATEDIFF(MONTH, MAX(date_visited), GETDATE()) = 0 AND\r\n            DATEDIFF(HOUR, MAX(date_visited), GETDATE()) < 5 THEN 0\r\n        ELSE 1\r\n    END AS visitation_status\r\nFROM \r\n    visittable\r\nWHERE \r\n    std_id = @std_id;\r\n";

                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@std_id", id);

                    // Execute the query to count the occurrences of the provided ID
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    // If count > 0, the ID exists; otherwise, it doesn't
                    return count > 0;
                }
            }
        }









        [WebMethod]
        public static string submitData(int id, string fname, string pass, string mname, string lname, int snumber, string gen, int sem, int cls)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Check if the ID already exists in the database
                if (CheckIdExists(id))
                {
                    return "ID already exists";
                }

                // Insert data into the 'students' table
                using (SqlCommand cmd = new SqlCommand(@"
            INSERT INTO students (std_id, first_name, middle_name, last_name, phone_number, gender , password)
            VALUES (@std_id, @first_name, @middle_name, @last_name, @phone_number, @gender ,@pass)", con))
                {
                    cmd.Parameters.AddWithValue("@std_id", id);
                    cmd.Parameters.AddWithValue("@first_name", fname);
                    cmd.Parameters.AddWithValue("@middle_name", mname);
                    cmd.Parameters.AddWithValue("@last_name", lname);
                    cmd.Parameters.AddWithValue("@phone_number", snumber);
                    cmd.Parameters.AddWithValue("@gender", gen);
                    cmd.Parameters.AddWithValue("@pass", pass);

                    cmd.ExecuteNonQuery();
                }

                // Insert data into the 'student_class' table based on the department (cls)
                switch (cls)
                {
                    case 5: // IT Department
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentIT_class ( std_id, itclass_id) VALUES ( @std_id, @itclass_id)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@itclass_id", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;

                    case 12: // Medical Department
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentMed_class ( std_id, medclass_id) VALUES ( @std_id, @medclass_id)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@medclass_id", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;

                    // Add cases for other departments
                    case 1: // BA Department
                            // Insert data into the 'studentBA_class' table
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentBAclass ( std_id, BAclass_id) VALUES ( @std_id, @BAclass_id)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@BAclass_id", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;

                    case 9: // General Fiqhi Department
                            // Insert data into the 'studentGF_class' table
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentgeneralfiqhiclass ( std_id, GFclass_id) VALUES ( @std_id, @GFclass_id)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@GFclass_id", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;

                    case 11: // Sharia Law Department
                             // Insert data into the 'studentShariaLaw_class' table
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentsharialawclass ( std_id, shl_id) VALUES ( @std_id, @ShariaLawclass_id)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@ShariaLawclass_id", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;

                    case 14: // Public Health Department
                             // Insert data into the 'studentPH_class' table
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentpublichealthclass ( std_id, PHclass_id) VALUES ( @std_id, @PHclass_id)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@PHclass_id", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;

                    case 6: // Education Department
                            // Insert data into the 'studentEducation_class' table
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studenteducationclass ( std_id, edcnclass_id) VALUES ( @std_id, @Educationclass_id)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@Educationclass_id", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;
                    case 3: // Education Department
                            // Insert data into the 'studentEducation_class' table
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentpublicadministrationclass ( std_id, PAclass_id) VALUES ( @std_id, @edastdclass)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@edastdclass", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;

                    case 2: // Education Department
                            // Insert data into the 'studentEducation_class' table
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentaccountingclass ( std_id, AFclass_id) VALUES ( @std_id, @stdclassaccount)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@stdclassaccount", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;
                    case 13: // General Nursing Department
                             // Insert data into the 'studentGN_class' table
                        using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentgeneralnursingclass ( std_id, PAclass_id) VALUES ( @std_id, @GNclass_id)", con))
                        {
                            cmd3.Parameters.AddWithValue("@std_id", id);
                            cmd3.Parameters.AddWithValue("@GNclass_id", sem);
                            cmd3.ExecuteNonQuery();
                        }
                        break;

                    // Add more cases for other departments

                    default:
                        return "Invalid department ID";
                }
            }

            return "true";
        }


        [WebMethod]
        public static stdclass[] DataBind()
        {
            List<stdclass> details = new List<stdclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT 
            students.std_id,
            students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
            students.phone_number,
            CONCAT(
                med_facults.faculty_name, ' ', it_facults.faculty_name,
                bafaculs.faculty_name, acfaculs.faculty_name, pafaculs.faculty_name,
                gffaculs.faculty_name, shlfaculs.faculty_name, gnfaculs.faculty_name,
                pffaculs.faculty_name, edcfaculs.faculty_name
            ) AS combined_facults,
            CONCAT(
                Itclass.itclassname, ' ', medclass.medclassname, BAclass.BAclass_name,
                Accountingclass.AFclassname, PAclass.PAclassname,
                GFclass.GFclassname, edcnclass.edcnclassname,
                gnclass.gnclassname, PHclass.PHclassname, sclass.shlclassname
            ) AS combined_classname,
            CONCAT(
                medept.dept_name, ' ', itdept.dept_name, badept.dept_name,
                acdept.dept_name, padepart.dept_name, gfdept.dept_name,
                edcndept.dept_name, gndept.dept_name, phdept.dept_name,
                shldept.dept_name
            ) AS departments,
            CONCAT(
                itsem.sem_name, ' ', medsem.sem_name, basem.sem_name,
                acsem.sem_name, pasem.sem_name, gfsem.sem_name,
                edcnsem.sem_name, gnsem.sem_name, phsem.sem_name,
                shlsem.sem_name
            ) AS semesters,
            students.gender
        FROM students
        LEFT JOIN studentIT_class ON students.std_id = studentIT_class.std_id
        LEFT JOIN studentMed_class ON students.std_id = studentMed_class.std_id
        LEFT JOIN studentaccountingclass ON students.std_id = studentaccountingclass.std_id
        LEFT JOIN studentBAclass ON students.std_id = studentBAclass.std_id
        LEFT JOIN studentpublicadministrationclass ON students.std_id = studentpublicadministrationclass.std_id
        LEFT JOIN studentgeneralfiqhiclass ON students.std_id = studentgeneralfiqhiclass.std_id
        LEFT JOIN studenteducationclass ON students.std_id = studenteducationclass.std_id
        LEFT JOIN studentgeneralnursingclass ON students.std_id = studentgeneralnursingclass.std_id
        LEFT JOIN studentpublichealthclass ON students.std_id = studentpublichealthclass.std_id
        LEFT JOIN studentsharialawclass ON students.std_id = studentsharialawclass.std_id

        LEFT JOIN BAclass ON studentBAclass.BAclass_id = BAclass.BAclass_id
        LEFT JOIN Accountingclass ON studentaccountingclass.AFclass_id = Accountingclass.AFclass_id
        LEFT JOIN publicadministrationclass AS PAclass ON studentpublicadministrationclass.PAclass_id = PAclass.PAclass_id
        LEFT JOIN generalfiqhiclass AS GFclass ON studentgeneralfiqhiclass.GFclass_id = GFclass.GFclass_id
        LEFT JOIN educationclass AS edcnclass ON studenteducationclass.edcnclass_id = edcnclass.edcnclass_id
        LEFT JOIN generalnursingclass AS gnclass ON studentgeneralnursingclass.gnclass_id = gnclass.gnclass_id
        LEFT JOIN Publichealthclass AS PHclass ON studentpublichealthclass.PHclass_id = PHclass.PHclass_id
        LEFT JOIN shlclass AS sclass ON studentsharialawclass.shl_id = sclass.shl_id

        LEFT JOIN departments AS badept ON BAclass.dept_id = badept.dept_id
        LEFT JOIN facults AS bafaculs ON badept.facul_id = bafaculs.facul_id
        LEFT JOIN departments AS acdept ON Accountingclass.dept_id = acdept.dept_id
        LEFT JOIN facults AS acfaculs ON acdept.facul_id = acfaculs.facul_id
        LEFT JOIN departments AS padepart ON PAclass.dept_id = padepart.dept_id
        LEFT JOIN facults AS pafaculs ON padepart.facul_id = pafaculs.facul_id
        LEFT JOIN departments AS gfdept ON GFclass.dept_id = gfdept.dept_id
        LEFT JOIN facults AS gffaculs ON gfdept.facul_id = gffaculs.facul_id
        LEFT JOIN departments AS edcndept ON edcnclass.dept_id = edcndept.dept_id
        LEFT JOIN facults AS edcfaculs ON edcndept.facul_id = edcfaculs.facul_id
        LEFT JOIN departments AS gndept ON gnclass.dept_id = gndept.dept_id
        LEFT JOIN facults AS gnfaculs ON gndept.dept_id = gnfaculs.facul_id
        LEFT JOIN departments AS phdept ON PHclass.dept_id = phdept.dept_id
        LEFT JOIN facults AS pffaculs ON phdept.facul_id = pffaculs.facul_id
        LEFT JOIN departments AS shldept ON sclass.dept_id = shldept.dept_id
        LEFT JOIN facults AS shlfaculs ON shldept.facul_id = shlfaculs.facul_id

        LEFT JOIN medclass ON studentMed_class.medclass_id = medclass.medclass_id
        LEFT JOIN Itclass ON studentIT_class.itclass_id = Itclass.Itclass_id
        LEFT JOIN departments AS medept ON medclass.dept_id = medept.dept_id
        LEFT JOIN departments AS itdept ON Itclass.dept_id = itdept.dept_id
        LEFT JOIN facults AS med_facults ON medept.facul_id = med_facults.facul_id
        LEFT JOIN facults AS it_facults ON itdept.facul_id = it_facults.facul_id

        LEFT JOIN semesters AS basem ON BAclass.sem_id = basem.sem_id
        LEFT JOIN semesters AS itsem ON Itclass.sem_id = itsem.sem_id
        LEFT JOIN semesters AS medsem ON medclass.sem_id = medsem.sem_id
        LEFT JOIN semesters AS acsem ON Accountingclass.sem_id = acsem.sem_id
        LEFT JOIN semesters AS pasem ON PAclass.sem_id = pasem.sem_id
        LEFT JOIN semesters AS gfsem ON GFclass.sem_id = gfsem.sem_id
        LEFT JOIN semesters AS edcnsem ON edcnclass.sem_id = edcnsem.sem_id
        LEFT JOIN semesters AS gnsem ON gnclass.sem_id = gnsem.sem_id
        LEFT JOIN semesters AS phsem ON PHclass.sem_id = phsem.sem_id
        LEFT JOIN semesters AS shlsem ON sclass.sem_id = shlsem.sem_id

        WHERE CONCAT(
            Itclass.itclassname, ' ', medclass.medclassname, BAclass.BAclass_name,
            Accountingclass.AFclassname, PAclass.PAclassname,
            GFclass.GFclassname, edcnclass.edcnclassname,
            gnclass.gnclassname, PHclass.PHclassname, sclass.shlclassname
        ) IS NOT NULL
        AND CONCAT(
            Itclass.itclassname, ' ', medclass.medclassname, BAclass.BAclass_name,
            Accountingclass.AFclassname, PAclass.PAclassname,
            GFclass.GFclassname, edcnclass.edcnclassname,
            gnclass.gnclassname, PHclass.PHclassname, sclass.shlclassname
        ) != '';

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    stdclass field = new stdclass();
                    field.id = dr["std_id"].ToString();
                    field.sname = dr["stdname"].ToString();
                    field.facults = dr["combined_facults"].ToString();
                    field.classname = dr["combined_classname"].ToString();
                    field.semesters = dr["semesters"].ToString();
                    field.departments = dr["departments"].ToString();
                    field.gender = dr["gender"].ToString();
                    field.number = dr["phone_number"].ToString();
                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }



    }




    public class stdclass
    {
        public string id { get; set; }
        public string sname { get; set; }
        public string facults { get; set; }
        public string classname { get; set; }
        public string semesters { get; set; }
        public string departments { get; set; }
        public string classes { get; set; }
        public string gender { get; set; }
        public string number { get; set; }
    }
    }



