using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class studentopera : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }










        [WebMethod]
        public static int GetRowCount(int facul)
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT TOP (1000) [facul_id]

  FROM [facults]
  where faculty_name = @search


            ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@search", facul);
               
                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }








        [WebMethod]
        public static int GetRowCount2(int cls)
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT TOP (1000) [dept_id]


  FROM [departments]

  where dept_name = @search



            ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@search", cls);

                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }









        [WebMethod]
        public static int GetRowCount3(int sem , int val )
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"


DECLARE @departmentId INT = @val; -- Provide the department ID here
DECLARE @className NVARCHAR(100) = @search; -- Provide the class name here

SELECT 
    CASE 
        WHEN @departmentId = 5 THEN itclass.Itclass_id
        WHEN @departmentId = 12 THEN medclass.medclass_id
        WHEN @departmentId = 1 THEN BAclass.Baclass_id
        WHEN @departmentId = 2 THEN Accountingclass.AFclass_id
        WHEN @departmentId = 3 THEN publicadministrationclass.PAclass_id
        WHEN @departmentId = 9 THEN generalfiqhiclass.GFclass_id
        WHEN @departmentId = 14 THEN Publichealthclass.PHclass_id
        WHEN @departmentId = 6 THEN educationclass.edcnclass_id
        WHEN @departmentId = 13 THEN generalnursingclass.gnclass_id
        WHEN @departmentId = 11 THEN shlclass.shl_id
    END AS ClassId
FROM 
    departments
LEFT JOIN 
    itclass ON itclass.dept_id = departments.dept_id
LEFT JOIN 
    medclass ON medclass.dept_id = departments.dept_id
LEFT JOIN 
    BAclass ON BAclass.dept_id = departments.dept_id
LEFT JOIN 
    Accountingclass ON Accountingclass.dept_id = departments.dept_id
LEFT JOIN 
    publicadministrationclass ON publicadministrationclass.dept_id = departments.dept_id
LEFT JOIN 
    generalfiqhiclass ON generalfiqhiclass.dept_id = departments.dept_id
LEFT JOIN 
    Publichealthclass ON Publichealthclass.dept_id = departments.dept_id
LEFT JOIN 
    educationclass ON educationclass.dept_id = departments.dept_id
LEFT JOIN 
    generalnursingclass ON generalnursingclass.dept_id = departments.dept_id
LEFT JOIN 
    shlclass ON shlclass.dept_id = departments.dept_id
WHERE 
    departments.dept_id = @departmentId
    AND
    (
        itclass.itclassname = @className OR
        medclass.medclassname = @className OR
        BAclass.BAclass_name = @className OR
        Accountingclass.AFclassname = @className OR
        publicadministrationclass.PAclassname = @className OR
        generalfiqhiclass.GFclassname = @className OR
        Publichealthclass.PHclassname = @className OR
        educationclass.edcnclassname = @className OR
        generalnursingclass.gnclassname = @className OR
        shlclass.shlclassname = @className
    );


            ";



         



                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@search", sem);
                    cmd.Parameters.AddWithValue("@val", val);
                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }












































































        [WebMethod]
        public static stdf[] stddetails(int celvalue)
        {
            List<stdf> details = new List<stdf>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT 
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
    students.password -- Include the password field here
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
LEFT JOIN semesters AS edcnsem ON edcnclass.sem_id = edcnsem.sem_id
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
        students.std_id = @search
    )
)
", con);

                cmd.Parameters.AddWithValue("@search", celvalue);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdf field = new stdf();
                        field.facul = dr["combined_facults"].ToString();
                        field.classname = dr["combined_classname"].ToString();
                        field.department = dr["departments"].ToString();
                        field.pass = dr["password"].ToString();
                        details.Add(field);
                    }
                } // SqlDataReader will be automatically closed here
            } // SqlConnection will be automatically closed here

            return details.ToArray();
        }





        public class stdf
        {
            public string facul { get; set; }
            public string classname { get; set; }
            public string department { get; set; }
            public string pass { get; set; }

        }

        [WebMethod]
        public static stdclass1[] Search_id(string search)
        {
            List<stdclass1> details = new List<stdclass1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT 
                students.std_id,
                students.phone_number,
                students.first_name,
                students.middle_name,
                students.last_name,
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
                    edcnen.sem_name, gnsem.sem_name, phsem.sem_name,
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
            LEFT JOIN semesters AS edcnen ON edcnclass.sem_id = edcnen.sem_id
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
            )", con);

                cmd.Parameters.AddWithValue("@search", search);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdclass1 field = new stdclass1();
                        field.id = dr["std_id"].ToString();
                        field.fist = dr["first_name"].ToString();
                        field.facults = dr["combined_facults"].ToString();
                        field.classname = dr["combined_classname"].ToString();
                        field.semesters = dr["semesters"].ToString();
                        field.departments = dr["departments"].ToString();
                        field.gender = dr["gender"].ToString();
                        field.number = dr["phone_number"].ToString();
                        field.middle = dr["middle_name"].ToString();
                        field.last = dr["last_name"].ToString();
                        details.Add(field);
                    }
                } // SqlDataReader will be automatically closed here
            } // SqlConnection will be automatically closed here

            return details.ToArray();
        }

        [WebMethod]
        public static stdclass1[] DataBind()
        {
            List<stdclass1> details = new List<stdclass1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT 
    students.std_id,
	students.phone_number,
	students.first_name,
	students.middle_name,
	students.last_name,
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

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdclass1 field = new stdclass1();
                        field.id = dr["std_id"].ToString();
                        field.fist = dr["first_name"].ToString();
                        field.facults = dr["combined_facults"].ToString();
                        field.classname = dr["combined_classname"].ToString();
                        field.semesters = dr["semesters"].ToString();
                        field.departments = dr["departments"].ToString();

                        field.gender = dr["gender"].ToString();
                        field.number = dr["phone_number"].ToString();
                        field.middle = dr["middle_name"].ToString();
                        field.last = dr["last_name"].ToString();
                        details.Add(field);
                    }
                } // SqlDataReader will be automatically closed here
            } // SqlConnection will be automatically closed here

            return details.ToArray();
        }




        public class stdclass1
        {
            public string id { get; set; }
            public string last { get; set; }
            public string facults { get; set; }
            public string classname { get; set; }
            public string semesters { get; set; }
            public string departments { get; set; }
            public string classes { get; set; }
            public string gender { get; set; }
            public string number { get; set; }
            public string fist { get; set; }
            public string middle { get; set; }
        }




        [WebMethod]
        public static string updateData1(int id, string fname, string mname, string lname, int snumber, string gen, int sem, int cls, int facul ,string pass)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {


                con.Open();

                // Update data in the 'students' table, including std_id
                using (SqlCommand cmd = new SqlCommand(@"
                    UPDATE students 
                    SET std_id = @new_std_id,
                        first_name = @first_name, 
                        middle_name = @middle_name, 
                        last_name = @last_name, 
                         password = @pass, 
                        phone_number = @phone_number, 
                        gender = @gender
                    WHERE std_id = @std_id", con))
                {
                    cmd.Parameters.AddWithValue("@std_id", id); // Old std_id
                    cmd.Parameters.AddWithValue("@new_std_id", id); // New std_id
                    cmd.Parameters.AddWithValue("@first_name", fname);
                    cmd.Parameters.AddWithValue("@middle_name", mname);
                    cmd.Parameters.AddWithValue("@last_name", lname);
                    cmd.Parameters.AddWithValue("@phone_number", snumber);
                    cmd.Parameters.AddWithValue("@gender", gen);
                    cmd.Parameters.AddWithValue("@pass", pass);

                    cmd.ExecuteNonQuery();
                }




                return "{ \"success\": true, \"message\": \"Update successful\" }";
            }
        }


        [WebMethod]
        public static string updateData(int id, string fname, string mname, string lname, int snumber, string gen, int sem, int cls, int facul, string pass)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Check if std_id exists in any department table and delete it
                   DeleteStudentFromDepartments(con, id);

                    // Update data in the 'students' table, including std_id
                    using (SqlCommand cmd = new SqlCommand(@"
                    UPDATE students 
                    SET std_id = @new_std_id,
                        first_name = @first_name, 
                        middle_name = @middle_name, 
                        last_name = @last_name, 
                            password = @pass, 
                        phone_number = @phone_number, 
                        gender = @gender
                    WHERE std_id = @std_id", con))
                    {
                        cmd.Parameters.AddWithValue("@std_id", id); // Old std_id
                        cmd.Parameters.AddWithValue("@new_std_id", id); // New std_id
                        cmd.Parameters.AddWithValue("@first_name", fname);
                        cmd.Parameters.AddWithValue("@middle_name", mname);
                        cmd.Parameters.AddWithValue("@last_name", lname);
                        cmd.Parameters.AddWithValue("@phone_number", snumber);
                        cmd.Parameters.AddWithValue("@gender", gen);
                        cmd.Parameters.AddWithValue("@pass", pass);

                        cmd.ExecuteNonQuery();
                    }

                    // Update data in the appropriate department table based on the department (cls)
                    switch (cls)
                    {
                        case 5: // IT Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentIT_class (std_id, itclass_id) VALUES (@std_id, @itclass_id)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@itclass_id", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 12: // Medical Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentMed_class (std_id, medclass_id) VALUES (@std_id, @medclass_id)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@medclass_id", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 1: // BA Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentBA_class (std_id, BAclass_id) VALUES (@std_id, @BAclass_id)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@BAclass_id", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 9: // General Fiqhi Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentgeneralfiqhiclass (std_id, GFclass_id) VALUES (@std_id, @GFclass_id)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@GFclass_id", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 11: // Sharia Law Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentsharialawclass (std_id, shl_id) VALUES (@std_id, @ShariaLawclass_id)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@ShariaLawclass_id", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 14: // Public Health Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentpublichealthclass (std_id, PHclass_id) VALUES (@std_id, @PHclass_id)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@PHclass_id", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 6: // Education Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studenteducationclass (std_id, edcnclass_id) VALUES (@std_id, @Educationclass_id)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@Educationclass_id", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 3: // Public Administration Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentpublicadministrationclass (std_id, PAclass_id) VALUES (@std_id, @edastdclass)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@edastdclass", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 2: // Accounting Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentaccountingclass (std_id, AFclass_id) VALUES (@std_id, @stdclassaccount)", con))
                            {
                                cmd3.Parameters.AddWithValue("@std_id", id);
                                cmd3.Parameters.AddWithValue("@stdclassaccount", sem);
                                cmd3.ExecuteNonQuery();
                            }
                            break;

                        case 13: // General Nursing Department
                            using (SqlCommand cmd3 = new SqlCommand("INSERT INTO studentgeneralnursingclass (std_id, GNclass_id) VALUES (@std_id, @GNclass_id)", con))
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

                return "{ \"success\": true, \"message\": \"Update successful\" }";
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                return "{ \"success\": false, \"message\": \"An error occurred during the update operation\" }";
            }
        }

        private static void DeleteStudentFromDepartments(SqlConnection con, int id)
        {
            List<string> departmentTables = new List<string>
    {
        "studentIT_class",
        "studentMed_class",
        "studentBA_class",
        "studentgeneralfiqhiclass",
        "studentsharialawclass",
        "studentpublichealthclass",
        "studenteducationclass",
        "studentpublicadministrationclass",
        "studentaccountingclass",
        "studentgeneralnursingclass",
        // Add other department tables
    };

            foreach (string tableName in departmentTables)
            {
                try
                {
                    using (SqlCommand deleteCmd = new SqlCommand($"DELETE FROM {tableName} WHERE std_id = @std_id", con))
                    {
                        deleteCmd.Parameters.AddWithValue("@std_id", id);
                        deleteCmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error deleting from {tableName}: {ex.Message}");
                    // Log the error if needed
                }
            }
        }




    }













}
