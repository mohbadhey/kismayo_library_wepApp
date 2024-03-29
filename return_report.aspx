﻿<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="return_report.aspx.cs" Inherits="library.return_report" %>
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
    margin-top: 20px; 
}

                .dataTables_filter {
    display: none; 
}
 
   .buttons-excel {
       color: white; 
       background-color: blue; 
       border-color: blue; 
   }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



  





         <div class="container">
        <div class="card card-header">
            <div class="card-body">
                    <div class="container border-1 border-black " id="uu">


                        <div class="row">
                            <div class="col-12">
                                <div class="container text-center">
                                    <h1>   Book Return Report</h1>
                                  
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
        <div class="container-fluid ">
            <div class="row">
                <!-- Table with stripped rows -->
                <table class="table datatable text-white" id="datatablee">
                    <thead>
                        <tr>
  


                                   <th scope="col">Rent ID</th>
<th scope="col">Student Name</th>
 <th scope="col">Book Name</th>
    <th scope="col">Extra Days</th>
<th scope="col">Return Date</th>
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


              <!-- The Modal -->
<div class="modal" id="myModal">
    <div class=" modal-dialog  modal-xl border-1 "> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                                 <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto"> Book Returned Details</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>


            <!-- Modal body -->
            <div class="modal-body ">
                      <div class="container border border-info"> 
        <div class="row p-2">


            <div class="col-3">
                          <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">Rent ID </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="rent_id"></span>
     
</div> 
              </div>
              

            
          </div> 





                                          <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">Student Name </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="sname"></span>
     
</div> 
              </div>
              

            
          </div> 



                                                          <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">Book ID </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="bookid"></span>
     
</div> 
              </div>
              

            
          </div> 





               
           <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">Book Name </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="bname"></span>
     
</div> 
              </div>
              

            
          </div> 

            </div>
            <div class="col-1"></div>
         
       <div class="col-3">  
                
          



                     <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row justify-content-between">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">  Total  Days Given       </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="days"></span>
     
</div> 
              </div>
              

            
          </div> 



                                <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">Remaining Days  </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="remdays"></span>
     
</div> 
              </div>
              

            
          </div> 
               
   
      


                                           <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label"> Days Exceded  </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="exdate"></span>
     
</div> 
              </div>
              

            
          </div> 











                                                      <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label"> Book Quantity   </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="qty"></span>
     
</div> 
              </div>
              

            
          </div> 









           
                                                      <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label"> Available Quantity    </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="aqty"></span>
     
</div> 
              </div>
              

            
          </div> 




              
            
        </div>

               <div class="col-1"></div>
  
       <div class="col-4">  
                
         


           

           
                                                      <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label"> Rent Quantity  </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="rqty"></span>
     
</div> 
              </div>
              

            
          </div> 









                                                                 <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label"> Return Date   </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="rdate"></span>
     
</div> 
              </div>
              

            
          </div> 




           
                                                                 <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label"> Expected Return Date    </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="edate"></span>
     
</div> 
              </div>
              

            
          </div> 









                                                                            <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">Issue Date  </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="idate"></span>
     
</div> 
              </div>
              

            
          </div> 






        
 


              
            
        </div>
            </div> 
           
                  
          
                       <br />
                    <br />
  
    </div> 

            </div>



            <!-- Modal footer -->
            <div class="modal-footer">
         
               <%-- <a href="#" class="btn btn-success" onclick="bookreturn()" id="btnSubmit">Return Book</a>--%>
               

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>
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


        $(document).ready(function () {
            // This code ensures the DOM is fully loaded before executing
            // Bind the click event to the close button
            $('.close').on('click', function () {
                $('#myModal').modal('hide'); // Hide the modal when the button is clicked
            });

            $('.close').on('click', function () {
                $('#myModal6').modal('hide'); // Hide the modal when the button is clicked
            });
        });





           
        function bookreturn() {
        
            document.getElementById("btnSubmit").style.display = "none";
            document.getElementById("btnspinner").style.display = "block";

        
            var rent_id = document.getElementById("rent_id").innerHTML;
    
            var bookid = document.getElementById("bookid").innerHTML;

            
            
    
     




            $.ajax({
                url: 'return_report.aspx/submitissue',
                data: "{ 'rent_id':'" + rent_id + "','bookid':'" + bookid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {

                    console.log(response)
                    document.getElementById("btnSubmit").style.display = "block";
                    document.getElementById("btnspinner").style.display = "none";

                 
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
                url: 'return_report.aspx/DataBind2',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatablee tbody").append(
                            "<tr style='cursor:pointer' onclick='passValue(this)'>"
                          



                             + "<td>" + response.d[i].rentid + "</td>"
                            + "<td>" + response.d[i].stdname + "</td>"
                            + "<td>" + response.d[i].bookname + "</td>"

                              + "<td>" + response.d[i].extra_days + "</td>"
                              + "<td>" + response.d[i].returndate + "</td>"
                         + "<td>" + response.d[i].issue_date + "</td>"
                          + "<td>" + response.d[i].days + "</td>"
                  
                    
                
                       


                            + "</tr>")
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

     function passValue(row) {
console.log("clicked");


            var cell = row.cells;

  var celvalue = cell[0].innerHTML;

  var rdate = cell[4].innerHTML;




$.ajax({
    url: 'return_report.aspx/stddetails',
    data: JSON.stringify({ 'celvalue': celvalue , 'rdate': rdate }),
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

            // Update image source
            $("#img").html('<img src="' + student.bookImage + '" alt="Book Image" style="width: 100%;">');
$("#bookid").text(student.id);
  $("#name").text(student.name);
// Set the data to the respective HTML elements using jQuery
$("#rent_id").text(student.rent_id);
$("#sname").text(student.student_name);
$("#bname").text(student.book_name);
$("#idate").text(student.issuedate);
$("#days").text(student.days);
$("#remdays").text(student.rem_days);
$("#exdate").text(student.days_exceeded);
$("#qty").text(student.bookQuantity);
$("#bqty").text(student.bqty);
$("#bookid").text(student.bookid);
$("#aqty").text(student.available_qty);
$("#rqty").text(student.rent_qty);
$("#rdate").text(student.actual_returndate);
$("#edate").text(student.expected_returndate);
        }
    },
    error: function (response) {
        console.error("Error:", response);
        // Handle errors more gracefully, e.g., display an error message to the user
    }
});




            $("#myModal").modal("show")
        }




function Search_id() {
    var search = document.getElementById('txtSearch').value;

    $.ajax({
        url: 'return_report.aspx/Search_id',
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
                          



                            
                             + "<td>" + response.d[i].rentid + "</td>"
                            + "<td>" + response.d[i].stdname + "</td>"
                            + "<td>" + response.d[i].bookname + "</td>"

                              + "<td>" + response.d[i].extra_days + "</td>"
                              + "<td>" + response.d[i].returndate + "</td>"
                         + "<td>" + response.d[i].issue_date + "</td>"
                          + "<td>" + response.d[i].days + "</td>"
                    
                
                       


                            + "</tr>"












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
