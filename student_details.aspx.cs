using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using static library.DataSet1;


namespace library
{
    public partial class student_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    if (!IsPostBack)
        //    {
        //int celvalue = 123; // Replace with your actual value
        //        stdclass[] data = student_details.Search_val(celvalue);

        //        ReportDocument crystalReport = new ReportDocument();
        //        crystalReport.Load(Server.MapPath("CrystalReport5.rpt")); // Specify the path to your Crystal Report file

        //        // Set the data source for the report
        //        crystalReport.SetDataSource(data);

        //        // Assign the Crystal Report to the CrystalReportViewer control
        //        CrystalReportViewer1.ReportSource = crystalReport;
        //    }
        }

        //protected void btnLoadReport_Click(object sender, EventArgs e)
        //{
        //    // Retrieve the DataSet
        //    DataSet ds = GetSearchResults(celvalue);

        //    // Assuming your DataSet has a table named "students"
        //    DataTable studentsTable = ds.Tables["students"];

        //    if (studentsTable != null)
        //    {
        //        // Create an instance of the Crystal Report
        //        CrystalReport1 report = new CrystalReport1();

        //        // Set the data source of the report to the "students" table
        //        report.SetDataSource(studentsTable);

        //        // Set the Crystal Report as the viewer's report source
        //        crystalReportViewer1.ReportSource = report;

        //        // Update the UpdatePanel to display the report
        //        updatePanel.Update();
        //    }
        //}


        [WebMethod]
        public static DataTable1DataTable GetSearchResults(int celvalue)
        {
            DataTable1DataTable dataTable = new DataTable1DataTable(); // Create a new*/ /*DataTable1DataTable*/
            //DataSet1.DataTable1DataTable dataTable = new DataSet1.DataTable1DataTable();


            string connectionString = ConfigurationManager.ConnectionStrings["DBCS2"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"SELECT
            students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
            semesters.sem_name AS semester,
            facults.faculty_name AS faculty,
            departments.dept_name AS department,
            visitation.visit_date AS visitdate
        FROM
            [kismayo_lib].[dbo].[students] AS students
            INNER JOIN [kismayo_lib].[dbo].[student_semesters] AS student_semesters
            ON students.std_id = student_semesters.std_id
            INNER JOIN [kismayo_lib].[dbo].[semesters] AS semesters
            ON student_semesters.sem_id = semesters.sem_id
            INNER JOIN [kismayo_lib].[dbo].[facults] AS facults
            ON semesters.facul_id = facults.facul_id
            INNER JOIN [kismayo_lib].[dbo].[departments] AS departments
            ON facults.dept_id = departments.dept_id
            INNER JOIN [kismayo_lib].[dbo].[visitation] AS visitation
            ON students.std_id = visitation.std_id
        WHERE students.std_id = @search
        ORDER BY visitation.visit_date DESC";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@search", celvalue);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Create a new row in the DataTable1DataTable
                            DataTable1Row newRow = dataTable.NewDataTable1Row();

                            // Set the values of the columns in the new row based on the data from the SQL query
                            newRow.stdname = reader["stdname"].ToString();
                            newRow.semester = reader["semester"].ToString();
                            newRow.faculty = reader["faculty"].ToString();
                            newRow.department = reader["department"].ToString();
                            newRow.visitdate = reader["visitdate"].ToString();

                            // Add the new row to the DataTable1DataTable
                            dataTable.AddDataTable1Row(newRow);
                        }
                    }
                }
            }

            return dataTable;
        }
        //public static DataTable GetSearchResults(int celvalue)
        //{
        //    DataTable dataTable = new DataTable();

        //    string connectionString = ConfigurationManager.ConnectionStrings["DBCS2"].ConnectionString;
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        connection.Open();
        //        string query = @"SELECT
        //        students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
        //        semesters.sem_name AS semester,
        //        facults.faculty_name AS faculty,
        //        departments.dept_name AS department,
        //        visitation.visit_date AS visitdate
        //    FROM
        //        [kismayo_lib].[dbo].[students] AS students
        //        INNER JOIN [kismayo_lib].[dbo].[student_semesters] AS student_semesters
        //        ON students.std_id = student_semesters.std_id
        //        INNER JOIN [kismayo_lib].[dbo].[semesters] AS semesters
        //        ON student_semesters.sem_id = semesters.sem_id
        //        INNER JOIN [kismayo_lib].[dbo].[facults] AS facults
        //        ON semesters.facul_id = facults.facul_id
        //        INNER JOIN [kismayo_lib].[dbo].[departments] AS departments
        //        ON facults.dept_id = departments.dept_id
        //        INNER JOIN [kismayo_lib].[dbo].[visitation] AS visitation
        //        ON students.std_id = visitation.std_id
        //    WHERE students.std_id = @search
        //    ORDER BY visitation.visit_date DESC";

        //        using (SqlCommand command = new SqlCommand(query, connection))
        //        {
        //            command.Parameters.AddWithValue("@search", celvalue);
        //            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
        //            {
        //                adapter.Fill(dataTable);
        //            }
        //        }
        //    }

        //    return dataTable;
        //}

        [WebMethod]
        public static byte[] GenerateCrystalReport(int celvalue)
        {
            ReportDocument reportDocument = new ReportDocument();
            reportDocument.Load("~/CrystalReport8.rpt"); // Replace with your report file path

            DataTable dataTable = GetSearchResults(celvalue);
            reportDocument.SetDataSource(dataTable);

            // Export the report to a format suitable for AJAX, e.g., PDF
            Stream stream = reportDocument.ExportToStream(ExportFormatType.PortableDocFormat);

            // Read the stream and convert it to a byte array
            using (var memoryStream = new MemoryStream())
            {
                stream.CopyTo(memoryStream);
                return memoryStream.ToArray();
            }
        }
   [WebMethod]
public static stdclass[] Search_val(int celvalue)
{
    List<stdclass> details = new List<stdclass>();
    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

    using (SqlConnection con = new SqlConnection(cs))
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(@"
            SELECT
                students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
                semesters.sem_name AS semester,
                facults.faculty_name AS faculty,
                departments.dept_name AS department,
                visitation.visit_date AS visitdate
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
            INNER JOIN
                visitation
            ON
                students.std_id = visitation.std_id
            WHERE
                students.std_id = @search
            ORDER BY
                visitation.visit_date DESC", con);

        cmd.Parameters.AddWithValue("@search", celvalue);

        using (SqlDataReader dr = cmd.ExecuteReader())
        {
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("stdname", typeof(string));
            dataTable.Columns.Add("semester", typeof(string));
            dataTable.Columns.Add("faculty", typeof(string));
            dataTable.Columns.Add("department", typeof(string));
            dataTable.Columns.Add("visitdate", typeof(string));

            while (dr.Read())
            {
                DataRow row = dataTable.NewRow();
                row["stdname"] = dr["stdname"].ToString();
                row["semester"] = dr["semester"].ToString();
                row["faculty"] = dr["faculty"].ToString();
                row["department"] = dr["department"].ToString();
                row["visitdate"] = dr["visitdate"].ToString();
                dataTable.Rows.Add(row);

                stdclass field = new stdclass();
                field.sname = dr["stdname"].ToString();
                field.semesters = dr["semester"].ToString();
                field.facults = dr["faculty"].ToString();
                field.departments = dr["department"].ToString();
                //field.visitdate = dr["visitdate"].ToString();

                details.Add(field);
            }
        }
    }

    return details.ToArray();
}

        [WebMethod]
        public static stdclass[] Search_DataBind(int sem, int facul)
        {
            List<stdclass> details = new List<stdclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "SELECT * FROM students WHERE FName LIKE '%' + @sem + '%'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@sem", sem);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
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
            }

            return details.ToArray();
        }


        [WebMethod]

        public static StudentDetails[] DataBind7()
        {
            List<StudentDetails> details = new List<StudentDetails>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT TOP (1000) 
            s.[student_id],
            s.[student_name],
            s.[students_number],
            f.[faculty_name],
            sem.[semester_name]
        FROM [libra].[dbo].[student_table] s
        INNER JOIN [libra].[dbo].[faculty_table] f ON s.[faculty_id] = f.[faculty_id]
        INNER JOIN [libra].[dbo].[semester_table] sem ON s.[semester_id] = sem.[semester_id];
        ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                StudentDetails field = new StudentDetails();
                field.id = dr["student_id"].ToString();
                field.sname = dr["student_name"].ToString();
                field.snumber = dr["students_number"].ToString();
                field.sfaculty = dr["faculty_name"].ToString();
                field.ssemester = dr["semester_name"].ToString();

                details.Add(field);
            }
            return details.ToArray();
        }




        //[WebMethod]
        //public static List<ListItem> GetSemesterData(int selectedValue)
        //{
        //    string query = "SELECT semester_id, semester_name FROM semester_table WHERE faculty_id = @selectedValue1";
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
        //                        Value = sdr["semester_id"].ToString(),
        //                        Text = sdr["semester_name"].ToString()
        //                    });
        //                }
        //            }
        //            con.Close();
        //            return semesters;
        //        }
        //    }
        //}












        public class StudentDetails
        {
            public string id { get; set; }
            public string sname { get; set; }
            public string snumber { get; set; }
            public string sfaculty { get; set; }
            public string ssemester { get; set; }
        }





        //[WebMethod]
        //public static StudentDetails[] DataBind(int currentPage)
        //{
        //    int pageSize = 10; // Define the number of records to display per page
        //    int startIndex = (currentPage - 1) * pageSize;
        //    int endIndex = startIndex + pageSize;

        //    string cs = ConfigurationManager.ConnectionStrings["DBCS2"].ConnectionString;

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand(
        //            @"WITH OrderedResults AS
        //    (
        //        SELECT
        //            students.std_id,
        //            students.first_name + ' ' + students.middle_name + ' ' + students.last_name AS stdname,
        //            students.phone_number,
        //            semesters.sem_name AS semester,
        //            facults.faculty_name AS faculty,
        //            ROW_NUMBER() OVER (ORDER BY students.std_id) AS RowNumber
        //        FROM
        //            [kismayo_lib].[dbo].[students] AS students
        //        INNER JOIN
        //            [kismayo_lib].[dbo].[student_semesters] AS student_semesters
        //        ON
        //            students.std_id = student_semesters.std_id
        //        INNER JOIN
        //            [kismayo_lib].[dbo].[semesters] AS semesters
        //        ON
        //            student_semesters.sem_id = semesters.sem_id
        //        INNER JOIN
        //            [kismayo_lib].[dbo].[facults] AS facults
        //        ON
        //            semesters.facul_id = facults.facul_id
        //        INNER JOIN
        //            [kismayo_lib].[dbo].[departments] AS departments
        //        ON
        //            facults.dept_id = departments.dept_id
        //    )
        //    SELECT *
        //    FROM OrderedResults
        //    WHERE RowNumber > @startIndex AND RowNumber <= @endIndex", con);

        //        cmd.Parameters.AddWithValue("@startIndex", startIndex);
        //        cmd.Parameters.AddWithValue("@endIndex", endIndex);

        //        DataTable dt = new DataTable();
        //        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //        adapter.Fill(dt);

        //        StudentDetails[] details = new StudentDetails[dt.Rows.Count];
        //        for (int i = 0; i < dt.Rows.Count; i++)
        //        {
        //            details[i] = new StudentDetails();
        //            details[i].id = dt.Rows[i]["std_id"].ToString();
        //            details[i].sname = dt.Rows[i]["stdname"].ToString();
        //            details[i].snumber = dt.Rows[i]["phone_number"].ToString();
        //            details[i].sfaculty = dt.Rows[i]["faculty"].ToString();
        //            details[i].ssemester = dt.Rows[i]["semester"].ToString();
        //        }

        //        return details;
        //    }
        //}


        [WebMethod]
        public static int GetTotalRecords()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

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
        public static List<stdclass> DataBind3(int currentPage)
        {
            int pageSize = 10; // Define the number of records to display per page
            int startIndex = (currentPage - 1) * pageSize + 1;
            int endIndex = currentPage * pageSize;

            List<stdclass> details = new List<stdclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS2"].ConnectionString;
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
                        [kismayo_lib].[dbo].[students] AS students
                    INNER JOIN
                        [kismayo_lib].[dbo].[student_semesters] AS student_semesters
                    ON
                        students.std_id = student_semesters.std_id
                    INNER JOIN
                        [kismayo_lib].[dbo].[semesters] AS semesters
                    ON
                        student_semesters.sem_id = semesters.sem_id
                    INNER JOIN
                        [kismayo_lib].[dbo].[facults] AS facults
                    ON
                        semesters.facul_id = facults.facul_id
                    INNER JOIN
                        [kismayo_lib].[dbo].[departments] AS departments
                    ON
                        facults.dept_id = departments.dept_id
                )
                SELECT *
                FROM OrderedResults
                WHERE RowNumber BETWEEN @startIndex AND @endIndex", con);

                cmd.Parameters.AddWithValue("@startIndex", startIndex);
                cmd.Parameters.AddWithValue("@endIndex", endIndex);

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
            return details;
        }

        [WebMethod]
        public static stdvisit[] DataBind2()
        {
            List<stdvisit> details = new List<stdvisit>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"
            WITH MaxSem AS (
                SELECT
                    std_id,
                    MAX(CASE
                        WHEN sem_name = 'semester one' THEN 1
                        WHEN sem_name = 'semester two' THEN 2
                        WHEN sem_name = 'semester three' THEN 3
                        WHEN sem_name = 'semester four' THEN 4
                        WHEN sem_name = 'semester five' THEN 5
                        WHEN sem_name = 'semester six' THEN 6
                        WHEN sem_name = 'semester seven' THEN 7
                        WHEN sem_name = 'semester eight' THEN 8
                        WHEN sem_name = 'semester nine' THEN 9
                        WHEN sem_name = 'semester ten' THEN 10
                        WHEN sem_name = 'semester eleven' THEN 11
                        WHEN sem_name = 'semester twelve' THEN 12
                        ELSE 0 -- Handle any other cases
                    END) AS max_sem_value
                FROM
                    [visittable]
                GROUP BY
                    std_id
            )
            SELECT
                vt.std_id,
                vt.name,
                [facult_name],
                vt.dept_name,
                vt.faculty_class,
                [class_name],
                vt.sem_name,
                COUNT(*) AS times_visited
            FROM
                [visittable] AS vt
            JOIN
                MaxSem ON vt.std_id = MaxSem.std_id
            WHERE
                CASE
                    WHEN vt.sem_name = 'semester one' THEN 1
                    WHEN vt.sem_name = 'semester two' THEN 2
                    WHEN vt.sem_name = 'semester three' THEN 3
                    WHEN vt.sem_name = 'semester four' THEN 4
                    WHEN vt.sem_name = 'semester five' THEN 5
                    WHEN vt.sem_name = 'semester six' THEN 6
                    WHEN vt.sem_name = 'semester seven' THEN 7
                    WHEN vt.sem_name = 'semester eight' THEN 8
                    WHEN vt.sem_name = 'semester nine' THEN 9
                    WHEN vt.sem_name = 'semester ten' THEN 10
                    WHEN sem_name = 'semester eleven' THEN 11
                    WHEN sem_name = 'semester twelve' THEN 12
                    ELSE 0 -- Handle any other cases
                END = MaxSem.max_sem_value
            GROUP BY
                vt.std_id,
                vt.name,
                [facult_name],
                vt.dept_name,
                vt.faculty_class,
                [class_name],
                vt.sem_name
            ORDER BY
                times_visited DESC; -- Order by the number of times_visited in descending order
        ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            stdvisit field = new stdvisit();
                            field.id = dr["std_id"].ToString();
                            field.name = dr["name"].ToString();
                            field.dept = dr["dept_name"].ToString();
                            field.facul = dr["facult_name"].ToString();
                            field.class_name = dr["class_name"].ToString();
                            field.faculty_class = dr["faculty_class"].ToString();
                            field.sem = dr["sem_name"].ToString();
                            field.visted = dr["times_visited"].ToString();

                            details.Add(field);
                        }
                    }
                }
            }

            return details.ToArray();
        }



        [WebMethod]
        public static void DeleteVisit(int visitId)
        {





            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string sql = "DELETE FROM visittable WHERE visit_id = @VisitId";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@VisitId", visitId);
                    command.ExecuteNonQuery();
                }
            }
        }


        [WebMethod]
        public static stdvisit[] Search_id(string search)
        {
            List<stdvisit> details = new List<stdvisit>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            WITH RankedData AS (
                SELECT
                    [std_id],
                    [name],
                    [dept_name],
                    [facult_name],
                    [class_name],
                    [faculty_class],
                    [sem_name],
                    [date_visited],
                    ROW_NUMBER() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) AS row_num,
                    COUNT(*) OVER (PARTITION BY [std_id]) AS times_visited
                FROM
                    [visittable]
            )
            SELECT
                [std_id],
                [name],
                [dept_name],
                [facult_name],
                [class_name],
                [faculty_class],
                [sem_name],
                times_visited
            FROM
                RankedData
            WHERE
                row_num = 1
                AND ([std_id]  LIKE '%' + @search + '%' OR [name]  LIKE '%' + @search + '%')
            ORDER BY
                times_visited DESC;
        ", con);
                cmd.Parameters.AddWithValue("@search", search);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdvisit field = new stdvisit();
                        field.id = dr["std_id"].ToString();
                        field.name = dr["name"].ToString();
                        field.dept = dr["dept_name"].ToString();
                        field.facul = dr["facult_name"].ToString();
                        field.class_name = dr["class_name"].ToString();
                        field.faculty_class = dr["faculty_class"].ToString();
                        field.sem = dr["sem_name"].ToString();
                        field.visted = dr["times_visited"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }
        [WebMethod]
        public static stdclass1[] stddetails(int celvalue, string celsem)
        {
            List<stdclass1> details = new List<stdclass1>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT TOP (1000)
                [std_id],
                [name],
                [dept_name],
                [facult_name],
                [faculty_class],
                [sem_name]
            FROM
                [visittable]
            WHERE
                [std_id] = @search
                AND [sem_name] = @celsem;
        ", con);
                cmd.Parameters.AddWithValue("@search", celvalue);
                cmd.Parameters.AddWithValue("@celsem", celsem);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdclass1 field = new stdclass1();
                        field.id = dr["std_id"].ToString();
                        field.sname = dr["name"].ToString();
                        field.snumber = dr["dept_name"].ToString();
                        field.sfaculty = dr["facult_name"].ToString();
                        field.ssemester = dr["faculty_class"].ToString();
                        field.department = dr["sem_name"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }

        [WebMethod]
        public static int GetRowCount(int celvalue, string celsem)
        {
            int rowCount = 0;

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = @"
SELECT

    COUNT(*) AS TotalVisits
FROM
    [visittable]
WHERE
    [std_id] = @search -- Replace 'your_student_id' with the actual student ID
    AND [sem_name] = @celsem -- Replace 'your_semester_name' with the actual semester name


            ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@search", celvalue);
                    cmd.Parameters.AddWithValue("@celsem", celsem);
                    rowCount = (int)cmd.ExecuteScalar();
                }
            }

            return rowCount;
        }
        [WebMethod]
        public static stdclass2[] stddate(int celvalue, string celsem)
        {
            List<stdclass2> details = new List<stdclass2>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT
                [visit_id],
                [name],
                [dept_name],
                [facult_name],
                [class_name],
                [faculty_class],
                [sem_name],
                [date_visited],
                COUNT(*) OVER (PARTITION BY [std_id]) AS VisitCount,
                CASE
                    WHEN DENSE_RANK() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) = 1 THEN '1st'
                    WHEN DENSE_RANK() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) = 2 THEN '2nd'
                    WHEN DENSE_RANK() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) = 3 THEN '3rd'
                    ELSE CAST(DENSE_RANK() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) AS VARCHAR) + 'th'
                END AS DateRank
            FROM
                [visittable]
            WHERE
                [std_id] = @search
                AND [sem_name] = @celsem;
        ", con);
                cmd.Parameters.AddWithValue("@search", celvalue);
                cmd.Parameters.AddWithValue("@celsem", celsem);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        stdclass2 field = new stdclass2();
                        field.visit_id = dr["visit_id"].ToString();
                        field.visitdate = dr["date_visited"].ToString();
                        field.visit_number = dr["DateRank"].ToString();

                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }

        [WebMethod]
        public static stdvisit[] Search_DataBind(string classs, string sem)
        {
            List<stdvisit> details = new List<stdvisit>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand(@"
                           WITH RankedData AS (
    SELECT
        [std_id],
        [name],
        [dept_name],
        [facult_name],
        [class_name],
        [faculty_class],
        [sem_name],
        [date_visited],
        ROW_NUMBER() OVER (PARTITION BY [std_id] ORDER BY [date_visited] DESC) AS row_num,
        COUNT(*) OVER (PARTITION BY [std_id]) AS times_visited
    FROM
        [visittable]
)
SELECT
    [std_id],
    [name],
    [dept_name],
    [facult_name],
    [class_name],
    [faculty_class],
    [sem_name],
    times_visited
FROM
    RankedData
WHERE
    row_num = 1
    AND [faculty_class] = @classs -- Replace 'YourFacultyClass' with the desired faculty_class value
    AND [sem_name] = @sem -- Replace 'YourSemName' with the desired sem_name value
ORDER BY
    times_visited DESC;", con))
                    {
                        cmd.Parameters.AddWithValue("@classs", classs);
                        cmd.Parameters.AddWithValue("@sem", sem);
          
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                stdvisit field = new stdvisit();
                                field.id = dr["std_id"].ToString();
                                field.name = dr["name"].ToString();
                                field.dept = dr["dept_name"].ToString();
                                field.facul = dr["facult_name"].ToString();
                                field.class_name = dr["class_name"].ToString();
                                field.faculty_class = dr["faculty_class"].ToString();
                                field.sem = dr["sem_name"].ToString();
                                field.visted = dr["times_visited"].ToString();

                                details.Add(field);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception: {ex.Message}");
                // Handle the exception (log it, show an error message, etc.)
            }

            return details.ToArray();
        }

        //[WebMethod]
        //public static List<ListItem> getdepart1()
        //{
        //    string query = "select   * from departments";
        //    string constr = ConfigurationManager.ConnectionStrings["DBCS2"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(query))
        //        {
        //            List<ListItem> customers = new List<ListItem>();
        //            cmd.CommandType = CommandType.Text;
        //            cmd.Connection = con;
        //            con.Open();
        //            using (SqlDataReader sdr = cmd.ExecuteReader())
        //            {
        //                while (sdr.Read())
        //                {
        //                    customers.Add(new ListItem
        //                    {
        //                        Value = sdr["dept_id"].ToString(),
        //                        Text = sdr["dept_name"].ToString()
        //                    });
        //                }
        //            }
        //            con.Close();
        //            return customers;
        //        }
        //    }
        //}


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
        public static List<ListItem> GetSemesterData1(int selectedValue)
        {
            string query = "select sem_id , sem_name from semesters  where facul_id =  @selectedValue1;";
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
                                Value = sdr["sem_id"].ToString(),
                                Text = sdr["sem_name"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return semesters;
                }

            }
        }



        public class stdvisit
        {
            public string id { get; set; }
            public string name { get; set; }
            public string dept { get; set; }
            public string facul { get; set; }
            public string faculty_class { get; set; }
            public string class_name { get; set; }
            public string sem { get; set; }
            public string visted { get; set; }
        }

        public class stdclass1
        {
            public string id { get; set; }
            public string sname { get; set; }
            public string snumber { get; set; }
            public string sfaculty { get; set; }
            public string ssemester { get; set; }
            public string department { get; set; }
        }

        public class stdclass2
        {
            public string visit_id { get; set; }
            public string visitdate { get; set; }
            public string visit_number { get; set; }
            
      
        }

        //[WebMethod]
        //    public static List<ListItem> getfacul2()
        //    {
        //        string query = "select   * from faculty_table";
        //        string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //        using (SqlConnection con = new SqlConnection(constr))
        //        {
        //            using (SqlCommand cmd = new SqlCommand(query))
        //            {
        //                List<ListItem> customers = new List<ListItem>();
        //                cmd.CommandType = CommandType.Text;
        //                cmd.Connection = con;
        //                con.Open();
        //                using (SqlDataReader sdr = cmd.ExecuteReader())
        //                {
        //                    while (sdr.Read())
        //                    {
        //                        customers.Add(new ListItem
        //                        {
        //                            Value = sdr["faculty_id"].ToString(),
        //                            Text = sdr["faculty_name"].ToString()
        //                        });
        //                    }
        //                }
        //                con.Close();
        //                return customers;
        //            }
        //        }
        //    }


    }
}
