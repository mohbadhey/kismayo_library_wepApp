<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="book_details.aspx.cs" Inherits="library.book_details" %>
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
                                    <h1>   Book Report</h1>
                                  
                                </div>

                            </div>

                        </div>
   
      <%--  <div class="container-fluid text-white ">

            <div class="row p-4">



                <div class="col-4 flex-row">
                    <input id="txtSearch" onkeydown="Search_id()" type="text" class="form-control form-control-sm border" />
     

                </div>
                <div class="col-2">                    <button type="button" class="btn btn-primary " onkeybourd="Search_id()">
<i class="fa-solid fa-magnifying-glass"></i>
</button></div>

                <div class="col-4"></div>
      
             
               
                

            </div>
        </div>--%>
        <div class="container-fluid text-white">
            <div class="row">
                <!-- Table with stripped rows -->
                <table class="table datatable text-white" id="datatablee">
                    <thead>
                        <tr>
                                   <th scope="col">Book ID</th>
    <th scope="col">Book Name</th>
    <th scope="col">Department</th>
    <th scope="col">Faculty</th>
    <th scope="col"> Quantity</th>
    <th scope="col">Available quantity</th>
                         

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
  
    <h4 class="modal-title text-white mx-auto"> Books Reports</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>


            <!-- Modal body -->
            <div class="modal-body ">
                <div class="container border border-info"> 
        <div class="row ">
            
       <div class="col-4">  
                
            <div class="row mt-4 mb-4   border   border-info "> 
                <div class="container d-flex flex-row">
                    <div>

                                <label for="mobile" class="col-sm-2  
        col-form-label">Book Name </label> 
                    </div>
        
                      <div class="col-sm   d-flex align-items-center"> 
     
  
          
      <span   id="name"></span>
       
  </div> 
                </div>
                

              
            </div> 





                       <div class="row mt-4 mb-4   border   border-info "> 
                <div class="container d-flex flex-row">
                    <div>

                                <label for="mobile" class="col-sm-2  
        col-form-label">Book Price </label> 
                    </div>
        
                      <div class="col-sm   d-flex align-items-center"> 
     
  
          
      <span   id="price"></span>
       
  </div> 
                </div>
                

              
            </div> 




           
                       <div class="row mt-4 mb-4   border   border-info "> 
                <div class="container d-flex flex-row">
                    <div>

                                <label for="mobile" class="col-sm-2  
        col-form-label">Book Department </label> 
                    </div>
        
                      <div class="col-sm   d-flex align-items-center"> 
     
  
          
      <span   id="dept"></span>
       
  </div> 
                </div>
                

              
            </div> 











                                <div class="row mt-4 mb-4   border   border-info "> 







              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">Book Faculty </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="facul"></span>
     
</div> 
              </div>
              

            
          </div> 
























              
            
        </div>


            <div class="col-2"></div>
  
       <div class="col-4">  
                




                                <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label">Book Quantity </label> 
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
      col-form-label">Date registered  </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="date1"></span>
     
</div> 
              </div>
              

            
          </div> 






           
                                           <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label"> Available Quantity  </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="aqty"></span>
     
</div> 
              </div>
              

            
          </div> 






           
                                           <div class="row mt-4 mb-4   border   border-info "> 
              <div class="container d-flex flex-row">
                  <div>

                              <label for="mobile" class="col-sm-2  
      col-form-label"> Rent Quantity   </label> 
                  </div>
      
                    <div class="col-sm   d-flex align-items-center"> 
   

        
    <span   id="rqty"></span>
     
</div> 
              </div>
              

            
          </div> 














 

              
            
        </div>
            </div> 
           
  
           
  
    </div> 

            </div>



            <!-- Modal footer -->
            <div class="modal-footer">
               
            </div>

        </div>
    </div>
</div>
    <script>

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


  DataBind();
        function DataBind() {
            $.ajax({
                url: 'book_details.aspx/DataBind2',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatablee tbody").append(
                            "<tr style='cursor:pointer' onclick='passValue(this)'>"
                          



                             + "<td>" + response.d[i].id1 + "</td>"
                            + "<td>" + response.d[i].id + "</td>"
                            + "<td>" + response.d[i].name + "</td>"

                              + "<td>" + response.d[i].dept + "</td>"
                            + "<td>" + response.d[i].facul + "</td>"
                            + "<td>" + response.d[i].class_name + "</td>"
                    
                
                       


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



$.ajax({
    url: 'book_details.aspx/stddetails',
    data: JSON.stringify({ 'celvalue': celvalue }),
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

          

        $("#name").text(student.name);
                $("#price").text(student.price);
                $("#dept").text(student.dept);
                $("#facul").text(student.facul);
                $("#qty").text(student.qty);
                $("#date1").text(student.date);
                $("#aqty").text(student.aqty);
                $("#rqty").text(student.rqty);
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
        url: 'book_details.aspx/Search_id',
        data: "{'search':'" + search + "'}",
        dataType: "json",
        type: 'POST',
        contentType: "application/json",
        success: function (response) {
            console.log(response);

            $("#datatablee tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#datatablee tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].id1 + "</td>" +
                    "<td>" + response.d[i].id + "</td>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].dept + "</td>" +
                    "<td>" + response.d[i].facul + "</td>" +
                    "<td>" + response.d[i].class_name + "</td>" +
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
            var table = $('#datatablee').DataTable({
                lengthChange: false,
                language: {
                    searchPlaceholder: 'Search books ...' // Set the placeholder text
                },
                buttons: [
                    {
                        extend: 'excel',
                        text: 'Export to Excel'
                    }
                ]
            });

            // Select the DataTable button container and append it with margin
            table.buttons().container()
                .appendTo('#datatablee_wrapper .col-md-6:eq(0)')
                .css('margin', '20px'); // Add margin of 10px to the appended container
        });



    </script>
   
</asp:Content>
