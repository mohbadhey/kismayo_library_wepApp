<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="deletevisitation.aspx.cs" Inherits="library.deletevisitation" %>
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

        .hidden {
    display: none;
}

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
                                    <h1>   Student Visitiation Deletation</h1>
                                  
                                </div>

                            </div>

                        </div>
   
        <div class="container-fluid text-white ">

           <div class="row p-4">
    <%--    <div class="col-3">
            <div class="row p-1">
                <div class="col-4">
             <input id="txtSearch" onkeydown="Search_id()" type="text" class="form-control form-control-sm border" />


                </div>
                <div class="col-8">

                    <button type="button" class="btn btn-primary " onclick="Search_id()">
                        searchID
                    </button>
                </div>
            </div>
            
        </div>--%>
        <div class="col-3">

            <%--<%--   <select id="dept1">

            </sel--%>
       <select id="dept1"></select>
        </div>
        <div class="col-4">
            <%--<%-- <select id="drpsem21">

            </sel--%>
        
            <div class="row text-dark">
                <div class="col-6">
                    <span id="start"></span>
                </div>
                  <div class="col-6">
                      <span id="end"></span>
                  </div>
            </div>
        </div>
        <div class="col-2">
          <button id="deleteButton"  type ="button" class="btn btn-danger " onclick="deleteVisits()">
                                   Delete this 
                    </button>
        </div>
        <div class="col-3">
          
        </div>

    </div>
        </div>
        <div class="container-fluid text-white">
            <div class="row">
                <!-- Table with stripped rows -->
                <table class="table datatable text-white" id="datatablee">
                    <thead>
                        <tr>
                             <th scope="col">Student ID</th>
<th scope="col">Name</th>
<th scope="col">Department Name</th>
<th scope="col">Faculty Name</th>
<th scope="col">Class Name</th>
<th scope="col">Faculty Class</th>
<th scope="col">Semester Name</th>
<th scope="col">Date Visited</th>
<th scope="col">Academic Year</th>



                         

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
       
                <!-- End Table with stripped rows -->
            </div>
        </div>


    </div>


          

            </div>


        </div>
    </div>































































    



    <script>


  DataBind();
   function DataBind() {
    $.ajax({
        url: 'deletevisitation.aspx/DataBind2',
        dataType: "json",
        type: 'POST',
        contentType: "application/json",
        success: function (response) {
            console.log(response)

            $("#datatablee tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
      

                // Append the row without applying inline style
                $("#datatablee tbody").append(
                    "<tr  style='cursor:pointer;' onclick='passValue(this)'>" +
              "<td>" + response.d[i].stdid + "</td>" +
"<td>" + response.d[i].name + "</td>" +
"<td>" + response.d[i].deptname + "</td>" +
"<td>" + response.d[i].facultname + "</td>" +
"<td>" + response.d[i].classname + "</td>" +
"<td>" + response.d[i].facultclass + "</td>" +
"<td>" + response.d[i].semname + "</td>" +
"<td>" + response.d[i].datevisited + "</td>" +
"<td>" + response.d[i].year + "</td>" +

                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}




        function DataBind3() {
            // Get the start date and end date values
            var startDate = $('#start').text(); // Assuming #start is the ID of the element holding the start date
            var endDate = $('#end').text();     // Assuming #end is the ID of the element holding the end date


        

            $.ajax({
                url: 'deletevisitation.aspx/DataBind3',
                data: "{'startDate':'" + startDate + "', 'endDate':'" + endDate + "'} ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {


                        // Append the row without applying inline style
                        $("#datatablee tbody").append(
                            "<tr  style='cursor:pointer;' onclick='passValue(this)'>" +
                            "<td>" + response.d[i].stdid + "</td>" +
                            "<td>" + response.d[i].name + "</td>" +
                            "<td>" + response.d[i].deptname + "</td>" +
                            "<td>" + response.d[i].facultname + "</td>" +
                            "<td>" + response.d[i].classname + "</td>" +
                            "<td>" + response.d[i].facultclass + "</td>" +
                            "<td>" + response.d[i].semname + "</td>" +
                            "<td>" + response.d[i].datevisited + "</td>" +
                            "<td>" + response.d[i].year + "</td>" +

                            "</tr>"
                        );
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }








        $(document).ready(function () {
         


                $(function () {


                    $.ajax({
                        type: "POST",
                        url: "deletevisitation.aspx/getdepart",
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
                var search = $(this).val();

                $.ajax({
                    type: "POST",
                    url: "deletevisitation.aspx/searchyear",
                    data: "{'search':'" + search + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        console.log(r);
                        var students = r.d; // Assuming it's an array

                        for (var i = 0; i < students.length; i++) {
                            var student = students[i];
                            $("#start").text(student.StartDate);
                            $("#end").text(student.EndDate);
                        }
                        var button = document.getElementById("deleteButton");
                        button.style.display = "block"; // Show the button
                        // Call DataBind3 after retrieving start and end dates
                        DataBind3();
                    },
                    error: function (xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            });
        });







        $(document).ready(function () {
        var button = document.getElementById("deleteButton");
        button.style.display = "none"; // Hide the button initially



        });




















function deleteVisits() {
        // Get values from client-side, replace these with actual values from your form or logic
        var academicYear = $('#dept1 option:selected').text();
    var startDate = $('#start').text();
    var endDate = $('#end').text();

 alert("Academic Year: " + academicYear + "\nStart Date: " + startDate + "\nEnd Date: " + endDate);

        $.ajax({
            type: "POST",
            url: "deletevisitation.aspx/DeleteVisits",
            data: JSON.stringify({ academicYear: academicYear, startDate: startDate, endDate: endDate }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                alert(response.d); // Assuming the response is a string message
  DataBind();
            },
            error: function (error) {
                console.log(error);
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

    </script>
</asp:Content>
