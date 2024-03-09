<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="book_issue_report.aspx.cs" Inherits="library.book_issue_report" %>
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
            /* Define CSS for right-aligned buttons */
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
                                    <h1>   Book Issue Report</h1>
                                  
                                </div>

                            </div>

                        </div>
   
        <div class="container-fluid text-white ">

                    <div class="row p-4">



                <div class="col-3 flex-row">
                    <input id="txtSearch" placeholder="search students or books ...." onkeydown="Search_id()" type="text" class="form-control form-control-sm border" />
     

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
  

        <th scope="col">Student  ID</th>
<th scope="col">Student  Name</th>
<th scope="col">Book Name</th>
<th scope="col">Issue Date</th>
<th scope="col"> Days</th>
                      



                         

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



    <script>

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

 DataBind();
        function DataBind() {
            $.ajax({
                url: 'book_issue_report.aspx/DataBind2',
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
                            + "<td>" + response.d[i].stdname + "</td>"
                            + "<td>" + response.d[i].bookname + "</td>"

                              + "<td>" + response.d[i].issuedate + "</td>"
                            + "<td>" + response.d[i].days + "</td>"
                        
                    
                
                       


                            + "</tr>")
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }


function Search_id() {
    var search = document.getElementById('txtSearch').value;

    $.ajax({
        url: 'book_issue_report.aspx/Search_id',
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
                            + "<td>" + response.d[i].stdname + "</td>"
                            + "<td>" + response.d[i].bookname + "</td>"

                              + "<td>" + response.d[i].issuedate + "</td>"
                            + "<td>" + response.d[i].days + "</td>" +
                        
                    "</tr>"
                );
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

    </script>
</asp:Content>
