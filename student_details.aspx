<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="student_details.aspx.cs" Inherits="library.student_details" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">


    <style>
        .right-aligned-buttons {
    float: right;
    margin-top: 20px; /* Adjust margin as needed */
}

            .dataTables_filter {
        display: none; /* Hide the search input field */
    }
       /* Custom CSS to change the color of DataTables buttons */
       .buttons-excel {
           color: white; /* Change the color of the text */
           background-color: blue; /* Change the background color */
           border-color: blue; /* Change the border color */
       }
  
        .overflow-view1 {
   
    overflow-y:scroll;
}

        *,
*::after,
*::before {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

:root {
    --blue-color: #0c2f54;
    --dark-color: #535b61;
    --white-color: #fff;
}

ul {
    list-style-type: none;
}

    ul li {
        margin: 2px 0;
    }

/* text colors */
.text-dark {
    color: var(--dark-color);
}

.text-blue {
    color: var(--blue-color);
}

.text-end {
    text-align: right;
}

.text-center {
    text-align: center;
}

.text-start {
    text-align: left;
}

.text-bold {
    font-weight: 700;
}
/* hr line */
.hr {
    height: 1px;
    background-color: rgba(0, 0, 0, 0.1);
}
/* border-bottom */
.border-bottom {
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

body {
    font-family: 'Poppins', sans-serif;
    color: var(--dark-color);
    font-size: 14px;
}

.invoice-wrapper {
    min-height: 80vh;
    background-color: rgba(0, 0, 0, 0.1);
    padding-top: 20px;
    padding-bottom: 20px;
}

.invoice {
    max-width: 850px;
    margin-right: auto;
    margin-left: auto;
    background-color: var(--white-color);
    padding: 70px;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    min-height: 600px;
}

.invoice-head-top-left img {
    width: 130px;
}

.invoice-head-top-right h3 {
    font-weight: 500;
    font-size: 27px;
    color: var(--blue-color);
}

.invoice-head-middle, .invoice-head-bottom {
    padding: 16px 0;
}

.invoice-body {
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 4px;
    overflow: hidden;
}

    .invoice-body table {
        border-collapse: collapse;
        border-radius: 4px;
        height: 30%;
    }

        .invoice-body table td, .invoice-body table th {
            padding: 5px;
        }

        .invoice-body table tr {
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .invoice-body table thead {
            background-color: rgba(0, 0, 0, 0.02);
        }

.invoice-body-info-item {
    display: grid;
    grid-template-columns: 80% 20%;
}

    .invoice-body-info-item .info-item-td {
        padding: 12px;
        background-color: rgba(0, 0, 0, 0.02);
    }

.invoice-foot {
    padding: 30px 0;
}

    .invoice-foot p {
        font-size: 12px;
    }

.invoice-btns {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.invoice-btn {
    padding: 3px 9px;
    color: var(--dark-color);
    font-family: inherit;
    border: 1px solid rgba(0, 0, 0, 0.1);
    cursor: pointer;
}

.invoice-head-top, .invoice-head-middle, .invoice-head-bottom {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    padding-bottom: 10px;
}

@media screen and (max-width: 992px) {
    .invoice {
        padding: 40px;
    }
}

@media screen and (max-width: 576px) {
    .invoice-head-top, .invoice-head-middle, .invoice-head-bottom {
        grid-template-columns: repeat(1, 1fr);
    }

    .invoice-head-bottom-right {
        margin-top: 12px;
        margin-bottom: 12px;
    }

    .invoice * {
        text-align: left;
    }

    .invoice {
        padding: 28px;
    }
}

.overflow-view1 {
    overflow-y: auto; /* Use 'auto' to show the scrollbar only when necessary */
    max-height: 300px; /* Set a maximum height for the container to enable scrolling */
    width: 100%; /* Ensure full width */
}

.invoice-body {
    min-width: 100px;
    min-height: 50px;
}

@media print {
    #print-area {
        visibility: visible;
        width: 100%;
        position: absolute;
        left: 0;
        top: 0;
        overflow: hidden;
    }

    .overflow-view1 {
        overflow-x: hidden;
    }

    .invoice-btns {
        display: none;
    }
}



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   







     







    
         
        <div class="container">
        <div class="card card-header">
            <div class="card-body">
                    <div class="container border-1 border-black ">


                        <div class="row">
                            <div class="col-12">
                                <div class="container text-center">
                                    <h1>   Student Details</h1>
                                  
                                </div>

                            </div>

                        </div>
   
        <div class="container-fluid text-white ">

            <div class="row p-4">



                <div class="col-3 flex-row">
                    <input id="txtSearch" placeholder="search students...." onkeydown="Search_id()" type="text" class="form-control form-control-sm border" />
     

                </div>
                <div class="col-2">                    <button type="button" class="btn btn-primary " onkeybourd="Search_id()">
<i class="fa-solid fa-magnifying-glass"></i>Search
</button></div>
             
                
  
             
                

            </div>
        </div>
        <div class="container-fluid text-white">
            <div class="row">
                <!-- Table with stripped rows -->
                <table class="table datatable text-white" id="datatablee">
                    <thead>
                        <tr>
                 <th scope="col">id</th>
  <th scope="col">Name</th>
  <th scope="col">Faculty</th>
  <th scope="col">Sex</th>
  <th scope="col">Class</th>
  <th scope="col">dept</th>
  <th scope="col">Semesterer</th>
  <th scope="col">Visitation timesmes</th>


                         

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="pagination" class="pagination-container"></div>
                <!-- End Table with stripped rows -->
            </div>
        </div>


    </div>


          

            </div>


        </div>
    </div>











    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class=" modal-dialog  modal-xl ">
            <!-- Use the modal-lg class to make it larger -->
            <div class="modal-content">

                <!-- Modal Header -->

                           <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">  Student Report</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>


                <!-- Modal body -->
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-6">

                                <div class="row mt-4">
                                    <label for="lname" class="col-sm-2  
                col-form-label">
                                        Student id
                                    </label>
                                    <div class="col-sm">
                                        <input type="number"
                                            id="stdid">
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="fname" class="col-sm-2  
                col-form-label">
                                        First Name</label>
                                    <div class="col-sm">
                                        <input type="text"
                                            id="fname" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <label for="lname" class="col-sm-2  
                col-form-label">
                                        Last Name</label>
                                    <div class="col-sm">
                                        <input type="text"
                                            id="mname" placeholder="middle Name">
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <label for="lname" class="col-sm-2  
                col-form-label">
                                        Last Name</label>
                                    <div class="col-sm">
                                        <input type="text"
                                            id="lname" placeholder="Last Name">
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <label for="email" class="col-sm-2  
                col-form-label">
                                        phone numner</label>
                                    <div class="col-sm">
                                        <input type="number"
                                            id="snumber" placeholder="phone number">
                                    </div>
                                </div>


                            </div>
                            <div class="col-6">

                                <div class="row mt-4 mb-4">
                                    <label for="mobile" class="col-sm-2  
                col-form-label">
                                        department
                                    </label>
                                    <div class="col-sm">

                                        <select id="dept">
                                        </select>

                                    </div>
                                </div>

                                <div class="row mt-4 mb-4">
                                    <label for="mobile" class="col-sm-2  
                col-form-label">
                                        faculty
                                    </label>
                                    <div class="col-sm">

                                        <select id="drpsem2">
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-4 mb-4">
                                    <label for="mobile" class="col-sm-2  
                col-form-label">
                                        semesters
                                    </label>
                                    <div class="col-sm">

                                        <select id="drpfacult2">
                                        </select>
                                    </div>
                                </div>

                                <div class="row mt-4 mb-4">
                                    <label for="mobile" class="col-sm-2  
                col-form-label">
                                        genders
                                    </label>
                                    <div class="col-sm">

                                        <select id="gen">
                                            <option value="" selected disabled>Select gender</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                        </select>

                                    </div>
                                </div>

                            </div>


                        </div>




                    </div>

                </div>



                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <a href="#" class="btn btn-success" onclick="submitInfo()" id="btnSubmit">Submit</a>
                    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
                    <a href="#" class="btn btn-danger" onclick="deleteInfo()" id="btnDelete">Delete</a>

                    <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                        <span class="spinner-border spinner-border-sm"></span>
                        Loading..
                    </button>
                </div>

            </div>
        </div>
    </div>





    <!-- The Modal -->
    <div class="modal" id="myModal2">
        <div class="modal-dialog modal-lg">
            <!-- Use the modal-lg class to make it larger -->
            <div class="modal-content">

                <!-- Modal Header -->

                                         <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">  Student Report</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>


                <!-- Modal body -->
                <div class="modal-body">


                    <div class="col-md-6 form-group">
                        <label for="inputEmail4" hidden class="form-label">student id</label>
                        <br />
                        <input type="text" readonly hidden id="stdid2">
                    </div>
                    <div class="col-md-6">
                        <label for="inputPassword4" hidden class="form-label">student name</label><br />
                        <input type="text" hidden readonly id="stdname2">
                    </div>

                    <div class="col-md-12 form-group">
                     <div class="invoice-wrapper" id="print-area">
                        <div class="invoice">
                            <div class="invoice-container">
                                <div class="invoice-head student" id="studentsContainer">
                                    <div class="invoice-head-top">
                                        <div class="invoice-head-top-left text-start">

                                            <img src="images/download%20(2).png" />
                                        </div>
                                        <div class="invoice-head-top-right text-end">
                                            <h3>STUDENT VISITATION REPORT</h3>
                                        </div>
                                    </div>
                                    <div class="hr"></div>
                                    <div class="invoice-head-middle">
                                        <div class="invoice-head-middle-left text-start">
                                            <p><span class="text-bold">STUDENT NAME</span>: <span id="studentName"></span></p>
                                        </div>
                                        <div class="invoice-head-middle-right text-end">
                                            <p><span class="text-bold">STUDENT ID</span>: <span id="studentID"></span></p>
                                        </div>
                                    </div>
                                    <div class="hr"></div>
                                    <div class="invoice-head-bottom">
                                        <div class="invoice-head-bottom-left">
                                            <div class="invoice-head-middle-left text-start">
                                                <p><span class="text-bold">DEPARTMENT NAME</span>: <span id="departmentName"></span></p>
                                            </div>
                                            <div class="invoice-head-middle-left text-start">
                                                <p><span class="text-bold">FACULTY NAME</span>: <span id="facultyName"></span></p>
                                            </div>
                                            <div class="invoice-head-middle-left text-start">
                                                <p><span class="text-bold">SEMESTER NAME</span>: <span id="semesterName"></span></p>
                                            </div>
                                            <div class="invoice-head-middle-left text-start">
                                                <p><span class="text-bold">Date</span>: <span id="date"></span></p>
                                            </div>

                                        </div>
                                        <div class="invoice-head-middle-right text-end">
                                            <p><span class="text-bold">Class Name </span>: <span id="phonen"></span></p>
                                        </div>
                                        <div class="invoice-head-middle-right text-end">
                                            <p><span class="text-bold">NUMBER OF VISITS</span>: <span id="numberOfVisits"></span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="overflow-view1">
                                    <div class="invoice-body">
                                        <table id="visit">
                                            <thead>
                                                <tr>
                                                    <td class="text-bold">DATE </td>
                                                    <td class="text-bold">Rank </td>
                                                     <td class="text-bold">Delete</td>

                                                </tr>
                                            </thead>
                                            <tbody>

                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                           <%--     <div class="invoice-foot text-center">
                                    

                                    <div class="invoice-btns">
                                        <button type="button" class="invoice-btn" onclick="window.print()">
                                            <span>
                                                <i class="fa-solid fa-print"></i>
                                            </span>
                                            <span>Print</span>
                                        </button>
                                        <button type="button" class="invoice-btn">
                                            <span>
                                                <i class="fa-solid fa-download"></i>
                                            </span>
                                            <span>Download</span>
                                        </button>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    </div>









                </div>

                <div>
                </div>


            </div>
        </div>
    </div>






    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="//cdn.datatables.net/1.13.7/js/jquery.dataTables.  <%--   
        <script>
        $(document).ready(function () {
            $('#datatablee').datatable();

        });
    </script>--%>min.js"></script>

      <script>

          $(document).ready(function () {
              // This code ensures the DOM is fully loaded before executing
              // Bind the click event to the close button
              $('.close').on('click', function () {
                  $('#myModal2').modal('hide'); // Hide the modal when the button is clicked
              });

              $('.close').on('click', function () {
                  $('#myModal6').modal('hide'); // Hide the modal when the button is clicked
              });
          });




        //var currentPage = 1;

        //function DataBind(page) {
        //    $.ajax({
        //        url: 'student_details.aspx/DataBind',
        //        dataType: 'json',
        //        type: 'POST',
        //        contentType: 'application/json',
        //        data: JSON.stringify({ 'currentPage': page }), // Send the current page to the server
        //        success: function (response) {
        //            console.log(response);
        //            var tableBody = $("#datatablee tbody");
        //            tableBody.empty();

        //            for (var i = 0; i < response.d.length; i++) {
        //                tableBody.append(
        //                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
        //                    "<td>" + response.d[i].id + "</td>" +
        //                    "<td>" + response.d[i].sname + "</td>" +
        //                    "<td>" + response.d[i].snumber + "</td>" +
        //                    "<td>" + response.d[i].sfaculty + "</td>" +
        //                    "<td>" + response.d[i].ssemester + "</td>" +
        //                    "</tr>"
        //                );
        //            }

        //            // Update the current page
        //      /*      currentPage = page;*/
        //     /*       updatePagination(response.d.length);*/
        //            // Update the pagination controls
        //    /*        updatePagination();*/
        //        },
        //        error: function (response) {
        //            alert(response.responseText);
        //        }
        //    });
        //}
        //function updatePagination(totalRecords) {
        //    var paginationContainer = $("#pagination");
        //    paginationContainer.empty();

        //    var totalPages = Math.ceil(totalRecords / 10); // Display 10 rows per page

        //    for (var i = 1; i <= totalPages; i++) {
        //        var button = $("<button>" + i + "</button>");
        //        if (i === currentPage) {
        //            button.addClass("active");
        //        }
        //        button.click(function (event) {
        //            paginationContainer.find("button.active").removeClass("active");

        //            // Apply active class to the clicked button
        //            $(this).addClass("active");
        //            event.preventDefault(); // Prevent default button behavior
        //            var page = parseInt($(this).text());
        //            DataBind(page);
        //        });

        //        paginationContainer.append(button);
        //    }
        //}
      

        //$(document).ready(function () {
        //    // Get the total number of records and initialize the pagination
        //    $.ajax({
        //        url: 'student_details.aspx/GetTotalRecords',
        //        dataType: 'json',
        //        type: 'POST',
        //        contentType: 'application/json',
        //        success: function (response) {
        //            console.log(response);
        //            updatePagination(response.d); // Update pagination based on total records
        //            DataBind(currentPage);
        //        },
        //        error: function (response) {
        //            alert(response.responseText);
        //        }
        //    });
        //});

        //function passValue(element) {
        //    // Handle the click event on a table row (if needed)
        //    console.log("Row clicked: " + $(element).find("td:first").text());
        //}
        //function getCurrentDate() {
        //    const currentDate = new Date();
        //    const day = currentDate.getDate().toString().padStart(2, '0');
        //    const month = (currentDate.getMonth() + 1).toString().padStart(2, '0'); // Month is zero-based
        //    const year = currentDate.getFullYear();
        //    return `${day}/${month}/${year}`;
        //}

      /*  document.getElementById("date").textContent = getCurrentDate();*/

      
        //DataBind();
        //function DataBind() {
        //    $.ajax({
        //        url: 'student_details.aspx/DataBind',
        //        dataType: "json",
        //        type: 'POST',
        //        contentType: "application/json",
        //        success: function (response) {
        //            console.log(response);

        //            $("#tableStudents tbody").empty();

        //            for (var i = 0; i < response.d.length; i++) {
        //                $("#datatablee tbody").append(
        //                    "<tr style='cursor:pointer' onclick='passValue(this)'>"
        //                    + "<td>" + response.d[i].id + "</td>"
        //                    + "<td>" + response.d[i].sname + "</td>"
        //                    + "<td>" + response.d[i].snumber + "</td>"
        //                    + "<td>" + response.d[i].sfaculty + "</td>"
        //                    + "<td>" + response.d[i].ssemester + "</td>"


        //                    + "</tr>")
        //            }
        //        },
        //        error: function (response) {
        //            alert(response.responseText);
        //        }
        //    });
        //} 
        //DataBind();
        //$(document).ready(function () {
       
        //    $(function () {
              

        //        $.ajax({
        //            type: "POST",
        //            url: "student_details.aspx/getfacul2",
        //            data: '{}',
        //            contentType: "application/json; charset=utf-8",
        //            dataType: "json",
        //            success: function (r) {
        //                var drpsem2 = $("[id*=drpsem2]");
        //                drpsem2.empty().append('<option selected="selected" value="0">Please select</option>');
        //                $.each(r.d, function () {
        //                    drpsem2.append($("<option></option>").val(this['Value']).html(this['Text']));
        //                });
        //            }
        //        });
        //    });
        //});

        ////$(document).ready(function () {
        ////    $(function () {
        ////        $.ajax({
        ////            type: "POST",
        ////            url: "student_details.aspx/GetSemesterData",
        ////            data: '{}',
        ////            contentType: "application/json; charset=utf-8",
        ////            dataType: "json",
        ////            success: function (r) {
        ////                var drpfacult2 = $("[id*=drpfacult2]");
        ////                drpfacult2.empty().append('<option selected="selected" value="0">Please select</option>');
        ////                $.each(r.d, function () {
        ////                    drpfacult2.append($("<option></option>").val(this['Value']).html(this['Text']));
        ////                });
        ////            }
        ////        });
        ////    });
        ////});


        //$(document).ready(function () {
        //    // When the first dropdown changes
        //    $('#drpsem2').change(function () {
        //        var selectedValue = $(this).val(); // Get the selected value
    
        //        // Call a server-side method to get data for the second dropdown based on the selected value
        //        $.ajax({
        //            type: "POST",
        //            url: "student_details.aspx/GetSemesterData",
        //          //  data: JSON.stringify({ selectedValue: selectedValue }), // Send selected value as a parameter
        //            data: "{'selectedValue':'" + selectedValue + "'} ",
        //            contentType: "application/json; charset=utf-8",
        //            dataType: "json",
        //            success: function (r) {
                         
        //                var drpfacult2 = $("[id*=drpfacult2]");
                  
        //                drpfacult2.empty().append('<option selected="selected" value="0">Please select</option>');
        //                $.each(r.d, function () {
        //                    drpfacult2.append($("<option></option>").val(this['Value']).html(this['Text']));
        //                });
        //            }
        //        });
        //    });
        //});

        ////$(document).ready(function () {
        ////    // When the button is clicked
        ////    $('#drpfacult2').change(function () {
        ////        var selectedValue = $(this).val(); // Get the selected value
        ////        alert('Selected Value: ' + selectedValue);

        ////    });
        ////});


        ////var selectedValue2 = $(drpfacult2).val(); // Get the selected value
        ////var selectedValue3 = $(drpsem2).val(); // Get the selected value


        //function Search_DataBind() {

        //    var facul = $(drpfacult2).val(); // Get the selected value
        //    var sem = $(drpsem2).val(); // Get the selected value

        //    alert('Selected Value: ' + selectedValue2);
        //    alert('Selected Value: ' + selectedValue3);

        //    $.ajax({
        //        url: 'student_details.aspx/Search_DataBind',
        //        data: "{'facul':'" + facul + "','sem':'" + sem + "'}",
        //        dataType: "json",
        //        type: 'POST',
        //        contentType: "application/json",
        //        success: function (response) {
        //            console.log(response);

        //            $("#tableStudents tbody").empty();

        //            for (var i = 0; i < response.d.length; i++) {
        //                $("#datatablee tbody").append(
        //                    "<tr style='cursor:pointer' onclick='passValue(this)'>"
        //                    + "<td>" + response.d[i].id + "</td>"
        //                    + "<td>" + response.d[i].sname + "</td>"
        //                    + "<td>" + response.d[i].snumber + "</td>"
        //                    + "<td>" + response.d[i].sfaculty + "</td>"
        //                    + "<td>" + response.d[i].ssemester + "</td>"


        //                    + "</tr>")
        //            }
        //        },
        //        error: function (response) {
        //            alert(response.responseText);
        //        }
        //    });
        //}

        function submitInfo() {

            document.getElementById("btnSubmit").style.display = "none";
            document.getElementById("btnspinner").style.display = "block";

            var id = document.getElementById("stdid").value;
            var fname = document.getElementById("fname").value;
            var mname = document.getElementById("mname").value;
            var lname = document.getElementById("lname").value;
            var facul = document.getElementById("drpsem2").value;
            var dept = document.getElementById("dept").value;
            var sem = document.getElementById("drpfacult2").value;
            var gen = document.getElementById("gen").value;
            var snumber = document.getElementById("snumber").value;
            //var id = parseInt(document.getElementById("stdid").value, 10);
            //var fname = document.getElementById("fname").value;
            //var mname = document.getElementById("mname").value;
            //var lname = document.getElementById("lname").value;
            //var sem = parseInt(document.getElementById("drpsem2").value, 10);
            //var gen = document.getElementById("gen").value;
            //var snumber = parseInt(document.getElementById("snumber").value, 10);
            //var dept = parseInt(document.getElementById("dept").value, 10);
            //var facul = parseInt(document.getElementById("drpfacult2").value, 10);



            $.ajax({
                url: 'insertStudents.aspx/submitData',
                data: "{ 'id':'" + id + "' ,  'fname':'" + fname + "','mname':'" + mname + "' ,  'lname':'" + lname + "', 'snumber':'" + snumber + "' , 'gen':'" + gen + "' ,  'facul':'" + facul + "', 'sem':'" + sem + "',  'dept':'" + dept + "'} ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {



                    document.getElementById("btnSubmit").style.display = "block";
                    document.getElementById("btnspinner").style.display = "none";

                    $("#myModal").modal("hide");
                    DataBind();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }
        function insertvisit() {

            document.getElementById("btnSubmit").style.display = "none";
            document.getElementById("btnspinner").style.display = "block";

            var id = document.getElementById("stdid2").value;
            /*    var sname = document.getElementById("stdname2").value;*/





            $.ajax({
                url: 'insertStudents.aspx/submitvisit',
                data: "{ 'id':'" + id + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {


                    document.getElementById("btnSubmit").style.display = "block";
                    document.getElementById("btnspinner").style.display = "none";

                    $("#myModal2").modal("hide");
                    DataBind();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

        DataBind();
        function DataBind() {
            $.ajax({
                url: 'student_details.aspx/DataBind2',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatablee tbody").append(
                            "<tr style='cursor:pointer' onclick='passValue(this)'>"
                          




                            + "<td>" + response.d[i].id + "</td>"
                            + "<td>" + response.d[i].name + "</td>"
                            + "<td>" + response.d[i].facul + "</td>"
                            + "<td>" + response.d[i].class_name + "</td>"
                            + "<td>" + response.d[i].faculty_class + "</td>"
                              + "<td>" + response.d[i].dept + "</td>"
                            + "<td>" + response.d[i].sem + "</td>"
                            + "<td>" + response.d[i].visted + "</td>"


                            + "</tr>")
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

        function passValue(row) {
            var cell = row.cells;

            document.getElementById("stdid2").value = cell[0].innerHTML;
            document.getElementById("stdname2").value = cell[1].innerHTML;
     
        /*    document.getElementById("drpsem2").value = cell[4].innerHTML;*/

            document.getElementById("btnSubmit").style.display = "none";
            document.getElementById("btnUpdate").style.display = "block";
            document.getElementById("btnDelete").style.display = "block";

            var celvalue = cell[0].innerHTML;
  var celsem = cell[6].innerHTML;
     

            $.ajax({
                url: 'student_details.aspx/GetRowCount',
                data: "{'celvalue':'" + celvalue + "','celsem':'" + celsem + "'}",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);



                    // Assuming your response structure
                    var rowCount = response.d;

                    // Update the element where you want to display the count
                    $("#numberOfVisits").text(rowCount);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

            $.ajax({
                url: 'student_details.aspx/stddetails',
                data: "{'celvalue':'" + celvalue + "','celsem':'" + celsem + "'}",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);

         
                    // Assuming your response structure
                    var students = response.d; // Assuming it's an array


                    // Loop through the array of students
                    for (var i = 0; i < students.length; i++) {
                        var student = students[i];

                  

                        $("#studentName").text(student.sname);
                        $("#studentID").text(student.id);
                        $("#departmentName").text(student.snumber);
                        $("#facultyName").text(student.sfaculty);
                        $("#phonen").text(student.ssemester);
                        $("#semesterName").text(student.department);


                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


            $.ajax({
                url: 'student_details.aspx/stddate',
                data: "{'celvalue':'" + celvalue + "','celsem':'" + celsem + "'}",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    console.log(response);
                    console.log(response);


             $("#visit tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#visit tbody").append(

                            "<tr style='cursor:pointer'>"
                            + "<td>" + response.d[i].visitdate + "</td>"
                            + "<td>" + response.d[i].visit_number + "</td>"
                            + "<td><button class='deleteButton btn btn-danger' data-id='" + response.d[i].visit_id + "'>Delete</button></td>"
                            + "</tr>"
                        );
                    }

                    //var students = response.d; // Assuming it's an array


                    //for (var i = 0; i < students.length; i++) {
                    //    var student = students[i];


                  
                    //    $("#studentName").text(student.sname);
                    //    $("#studentID").text(student.id);
                    //    $("#departmentName").text(student.department);
                    //    $("#facultyName").text(student.sfaculty);
                    //    $("#phonen").text(student.snumber);
                    //    $("#semesterName").text(student.ssemester);


                    //}
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


            $(document).ready(function () {
                $(document).on('click', '.deleteButton', function (event) {
                    event.preventDefault();

                    var visitId = $(this).data("id");
               

                $.ajax({
                    type: "POST",
                    url: "student_details.aspx/DeleteVisit",
                    data: JSON.stringify({ visitId: visitId }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $("#myModal2").modal("hide");
                        Swal.fire(
                            'Successfully Deleted !',
                            'You Deleted  a Visitation!',
                            'success'
                        )
                        DataBind();
                        // Handle success, maybe refresh the table or show a success message
                    },
                    error: function (xhr, status, error) {
                        // Handle error
                        console.error(error);
                    }
                });
            });

            });
         








    var currentDate = new Date();

    // Format the date (adjust as needed)
    var formattedDate = currentDate.toLocaleDateString(); // You can customize the format here

    // Display the date in the span element
    document.getElementById("date").innerHTML = formattedDate;










            $(document).ready(function () {
                $("#generateReportButton").click(function () {
                    // Get the student ID from the user input or other sources
                   /* var studentId = 123;*/ // Replace with your logic to get the student ID
                    alert(celvalue);
                    // Make an AJAX request to the server
                    $.ajax({
                        type: "POST",
                        url: "SearchResults.aspx/GenerateCrystalReport", // Replace with the correct path to your web service
                        data: "{'celvalue':'" + celvalue + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            console.log(data);
                            // Handle the response data (e.g., download the generated report)
                            // You may need to implement this part based on your requirements
                        },
                        error: function (error) {
                            console.log("Error: " + error.d);
                        }
                    });
                });
            });


       


            $("#myModal2").modal("show")
        }





        







        function addNew() {
            //document.getElementById("txtID").value = "";
            //document.getElementById("txtFirstname").value = "";
            //document.getElementById("txtLastname").value = "";

            document.getElementById("btnSubmit").style.display = "block";
            document.getElementById("btnUpdate").style.display = "none";
            document.getElementById("btnDelete").style.display = "none";

            $("#myModal").modal("show")

            DataBind();
            //   Search_DataBind();
        }





        $(document).ready(function () {



            $(function () {


                $.ajax({
                    type: "POST",
                    url: "student_details.aspx/getdepart",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var dept = $("[id*=dept]");
                        dept.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            dept.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });



            });

        });
        $(document).ready(function () {
            // When the first dropdown changes
            $('#dept').change(function () {
                var selectedValue = $(this).val();


                $(function () {


                    $.ajax({
                        type: "POST",
                        url: "insertStudents.aspx/getfacul2",
                        data: "{'selectedValue':'" + selectedValue + "'} ",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var drpsem2 = $("[id*=drpsem2]");
                            drpsem2.empty().append('<option selected="selected" value="0">Please select</option>');
                            $.each(r.d, function () {
                                drpsem2.append($("<option></option>").val(this['Value']).html(this['Text']));
                            });
                        }
                    });
                });


            });


        });

        $(document).ready(function () {
            // When the first dropdown changes
            $('#drpsem2').change(function () {
                var selectedValue = $(this).val(); // Get the selected value

                // Call a server-side method to get data for the second dropdown based on the selected value
                $.ajax({
                    type: "POST",
                    url: "student_details.aspx/GetSemesterData",
                    //  data: JSON.stringify({ selectedValue: selectedValue }), // Send selected value as a parameter
                    data: "{'selectedValue':'" + selectedValue + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        var drpfacult2 = $("[id*=drpfacult2]");

                        drpfacult2.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            drpfacult2.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });
            });
        });


        $(document).ready(function () {



            $(function () {


                $.ajax({
                    type: "POST",
                    url: "student_details.aspx/getdepart1",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var dept1 = $("[id*=dept1]");
                        dept1.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            dept1.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });



            });

        });


        $(document).ready(function () {
            // When the first dropdown changes
            $('#dept1').change(function () {
                var selectedValue = $(this).val();


                $(function () {


                    $.ajax({
                        type: "POST",
                        url: "student_details.aspx/getfacul21",
                        data: "{'selectedValue':'" + selectedValue + "'} ",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var drpsem21 = $("[id*=drpsem21]");
                            drpsem21.empty().append('<option selected="selected" value="0">Please select</option>');
                            $.each(r.d, function () {
                                drpsem21.append($("<option></option>").val(this['Value']).html(this['Text']));
                            });
                        }
                    });
                });


            });


        });

        $(document).ready(function () {
            // When the first dropdown changes
            $('#drpsem21').change(function () {
                var selectedValue = $(this).val(); // Get the selected value

                // Call a server-side method to get data for the second dropdown based on the selected value
                $.ajax({
                    type: "POST",
                    url: "student_details.aspx/GetSemesterData1",
                    //  data: JSON.stringify({ selectedValue: selectedValue }), // Send selected value as a parameter
                    data: "{'selectedValue':'" + selectedValue + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        var drpfacult21 = $("[id*=drpfacult21]");

                        drpfacult21.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            drpfacult21.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });
            });
        });
        //    Search_DataBind();
   function Search_DataBind() {
 var sem = $("#drpfacult21").val(); // Get the selected value
var classs = $("#classs").val(); // Get the selected value

    $.ajax({
        url: 'student_details.aspx/Search_DataBind',
      data: "{'sem':'" + sem + "','classs':'" + classs + "'} ",
        dataType: "json",
        type: 'POST',
        contentType: "application/json",
        success: function (response) {
            console.log(response);

            $("#datatablee tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#datatablee tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>"
                     + "<td>" + response.d[i].id + "</td>"
                    + "<td>" + response.d[i].name + "</td>"
                    + "<td>" + response.d[i].facul + "</td>"
                    + "<td>" + response.d[i].class_name + "</td>"
                    + "<td>" + response.d[i].faculty_class + "</td>"
                      + "<td>" + response.d[i].dept + "</td>"
                    + "<td>" + response.d[i].sem + "</td>"
                    + "<td>" + response.d[i].visted + "</td>"
                    + "</tr>"
                );
            }


            var selectValue = $('#drpfacult21').val(); // Retrieve the value from the select input
            var inputValue = $('#classs').val(); // Retrieve the value from the text input

            // Combine selectValue and inputValue as per your requirement to form the search term
            var searchTerm = selectValue + ' ' + inputValue;

            var table = $('#datatablee').DataTable();
            table.search(searchTerm).draw();
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}

        function Search_id() {
            var search = document.getElementById('txtSearch').value;

           

            $.ajax({
                url: 'student_details.aspx/Search_id',
                data: "{'search':'" + search + "'}",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);

                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatablee tbody").append(
                            "<tr style='cursor:pointer' onclick='passValue(this)'>"
          + "<td>" + response.d[i].id + "</td>"
                    + "<td>" + response.d[i].name + "</td>"
                    + "<td>" + response.d[i].facul + "</td>"
                    + "<td>" + response.d[i].class_name + "</td>"
                    + "<td>" + response.d[i].faculty_class + "</td>"
                      + "<td>" + response.d[i].dept + "</td>"
                    + "<td>" + response.d[i].sem + "</td>"
                    + "<td>" + response.d[i].visted + "</td>"


                            + "</tr>")
                    }

                    var searchTerm = $('#txtSearch').val(); // Assuming you have an input field for search term
                    var table = $('#datatablee').DataTable();
                    table.search(searchTerm).draw();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

        }


          $(document).ready(function () {
              var table = $('#datatablee').DataTable({
                  lengthChange: false,
                  dom: 'Bfrtip', // Only show the buttons without search input
                  buttons: [
                      {
                          extend: 'excel',
                          text: 'Export to Excel'
                      }
                  ]
              });

              // Select the DataTable button container and add a class to it
              var buttonContainer = table.buttons().container().addClass('right-aligned-buttons');
          });


          //$(document).ready(function () {
          //    var table = $('#datatablee').DataTable({
          //        lengthChange: false,
          //        buttons: [
          //            {
          //                extend: 'copy'
          //            },
          //            {
          //                extend: 'excel',
          //                action: function (e, dt, button, config) {
          //                    var newData = [];
          //                    dt.rows({ page: 'current' }).every(function (rowIdx, tableLoop, rowLoop) {
          //                        newData.push(this.data());
          //                    });
          //                    var data = dt.buttons.exportData({ format: { body: function (data, row, column, node) { return data; } } });
          //                    data.body = newData;
          //                    $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, button, $.extend(true, {}, config, { exportOptions: { columns: ':visible' }, data: data }));
          //                }
          //            }
          //        ]
          //    });

          //    // Select the DataTable button container and append it with margin
          //    table.buttons().container()
          //        .appendTo('#datatablee_wrapper .col-md-6:eq(0)')
          //        .css('margin', '20px'); // Add margin of 20px to the appended container
          //});



      </script>
    

</asp:Content>
