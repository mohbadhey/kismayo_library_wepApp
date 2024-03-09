<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="insertStudents.aspx.cs" Inherits="library.insertStudents" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


                  


         <div class="container">
        <div class="card card-header">
            <div class="card-body">
                    <div class="container border-1 border-black ">


                        <div class="row">
                            <div class="col-12">
                                <div class="container text-center">
                                    <h1>  Insert Students </h1>
                                  
                                </div>

                            </div>

                        </div>
   
        <div class="container-fluid text-white ">

  
            <div class="row p-4">



            

                <div class="col-4">
                           <button type="button" class="btn btn-primary pull-right" onclick="addNew()">
  <i class="fas fa-plus"></i>  Add Students
</button>
  </div>  
             
              
            
                <div class="col-3"></div>    

            </div>
        </div>
        <div class="container-fluid text-white">
            <div class="row">
                <!-- Table with stripped rows -->
                <table class="table datatable text-white" id="datatablee">
                    <thead>
                        <tr>
                      <th scope="col">id</th>
   <th scope="col" >Name</th>
  <th scope="col">faculty</th>
   <th scope="col">classname</th>
   <th scope="col">semesters</th>
        <th scope="col">department</th>
            
           <th scope="col">gender</th>
                         

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
  
    <h4 class="modal-title text-white mx-auto">Insert Students</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body ">
                <div class="container border border-info"> 
        <div class="row ">
            <div class="col-6">
                
              <div class="row mt-4"> 
                <label for="lname" class="col-sm-2  
                col-form-label"> Student id </label> 
                <div class="col-sm"> 
                    <input  type="number"  class="form-control"
                        id="stdid" > 
                </div> 
            </div> 
            <div class="row"> 
                
                <label for="fname" class="col-sm-2  
                col-form-label">First Name</label> 
                <div class="col-sm"> 
                    <input type="text"  class="form-control"
                        id="fname" placeholder="First Name"> 
                </div> 
            </div> 
                          <div class="row mt-4"> 
                <label for="lname" class="col-sm-2  
                col-form-label">Last Name</label> 
                <div class="col-sm"> 
                    <input type="text"  class="form-control"
                        id="mname" placeholder="middle Name"> 
                </div> 
            </div> 
  
            <div class="row mt-4"> 
                <label for="lname" class="col-sm-2  
                col-form-label">Last Name</label> 
                <div class="col-sm"> 
                    <input type="text"  class="form-control"
                        id="lname" placeholder="Last Name"> 
                </div> 
            </div> 
  
            <div class="row mt-4"> 
                <label for="email" class="col-sm-2  
                col-form-label">phone numner</label> 
                <div class="col-sm"> 
                    <input type="number" class="form-control"
                        id="snumber" placeholder="phone number"> 
                </div> 
            </div> 


            </div>
            <div class="col-6">  

                
   <div class="row mt-4 mb-4"> 
                <label for="mobile" class="col-sm-2  
                col-form-label"> faculty </label> 
                <div class="col-sm"> 
                   
                    <select id="dept" class="form-control">

                    </select>
                </div> 
            </div> 


                
            <div class="row mt-4 mb-4"> 
                <label for="mobile" class="col-sm-2  
                col-form-label">department </label> 
                <div class="col-sm"> 
                   
                    <select id="drpsem2" class="form-control">

                    </select>
       
                </div> 
            </div> 

               
                  <div class="row mt-4 mb-4"> 
                <label for="mobile" class="col-sm-2  
                col-form-label">faculty class </label> 
                <div class="col-sm"> 
                   
                    <select id="drpfacult2" class="form-control">

                    </select>
                </div> 
           </div>

                   <div class="row mt-4 mb-4"> 
                <label for="mobile" class="col-sm-2  
                col-form-label">genders </label> 
                <div class="col-sm"> 
                   
     <select id="gen" class="form-control">
    <option value="" selected disabled>Select gender</option>
    <option value="male">Male</option>
    <option value="female">Female</option>
</select>

                </div> 
           </div>
                              <br />     <div class="row mt-6"> 
                <label for="mobile" class="col-sm-2  
                col-form-label">Password </label> 
                <div class="col-sm"> 
                       <input type="text"  class="form-control"
        id="pass" placeholder="Password"> 
    

                </div> 
           </div>
            
        </div>
  
  
            </div> 
           
  
           
  
    </div> 

            </div>



            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
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
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert Visitation</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
        <div class="row ">
            <div class="col-6">
                 <div class="col-md-6 form-group">
    <label for="inputEmail4" class="form-label">student id</label> <br />
    <input type="text" readonly  id="stdid2">
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">student name</label><br />
    <input type="text"  readonly id="stdname2">
  </div>
                <div class="col-md-6 form-group">
    <label for="inputEmail4" class="form-label">class name</label> <br />
    <input type="text" readonly  id="stdclass">
  </div>
                 <div class="col-md-6">
    <label for="inputPassword4" class="form-label">faculty classes</label><br />
    <input type="text"  readonly id="stdfaculcl">
  </div>

                
            </div>
            <div class="col-6">
                 
 
   <div class="col-md-6">
    <label for="inputPassword4" class="form-label">faculty </label><br />
    <input type="text"  readonly id="stdfacul">
  </div>
                  <div class="col-md-6">
    <label for="inputPassword4" class="form-label"> department</label><br />
    <input type="text"  readonly id="stddep">
  </div>
        <div class="col-md-6">
    <label for="inputPassword4" class="form-label"> semesters</label><br />
    <input type="text"  readonly id="stdsem">
  </div>
                 <div class="col-md-6">
    <label for="inputPassword4" class="form-label">date visited</label><br />
    <input type="date"  readonly id="stddate">
  </div>
            </div>

        </div>
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                <a href="#" class="btn btn-success" onclick="insertvisit()" id="btnadd">add</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
                <a href="#" class="btn btn-danger" onclick="deleteInfo()" id="btnDelete">Delete</a>

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>

    <script>

        $(document).ready(function () {
            // This code ensures the DOM is fully loaded before executing
            // Bind the click event to the close button
            $('.close').on('click', function () {
                $('#myModal2').modal('hide'); // Hide the modal when the button is clicked
            });

            $('.close').on('click', function () {
                $('#myModal').modal('hide'); // Hide the modal when the button is clicked
            });
        });



        function submitInfo() {


            var id = document.getElementById("stdid").value;
            var fname = document.getElementById("fname").value;
            var mname = document.getElementById("mname").value;
            var lname = document.getElementById("lname").value;
            var pass = document.getElementById("pass").value;
            var dept = document.getElementById("dept").value;
            var sem = document.getElementById("drpfacult2").value;
            var gen = document.getElementById("gen").value;
            var snumber = document.getElementById("snumber").value;
            var cls = document.getElementById("drpsem2").value;




            // Check if the search input is blank
            if (id.trim() === '') {
                // Display a SweetAlert for an empty input
                Swal.fire({
                    icon: 'error',
                    title: 'Input is blank for ID',
                    text: 'Please enter a search value.',
                });
                return; // Exit the function to prevent the AJAX request
            }
            // Check if the search input contains non-numeric characters

            if (!/^\d+$/.test(id)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Invalid Input for ID',
                    text: 'Please enter a valid numeric  value.',
                });
                return;
            }

            // Check if the search input is blank
            if (fname.trim() === '') {
                // Display a SweetAlert for an empty input
                Swal.fire({
                    icon: 'error',
                    title: 'Input is blank for FirstName',
                    text: 'Please enter a search value.',
                });
                return; // Exit the function to prevent the AJAX request
            }
            // Check if the search input contains only letters
            if (!/^[A-Za-z]+$/.test(fname)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Invalid Input for Firstname',
                    text: 'Please enter a valid alphabetic search value (letters only).',
                });
                return;
            }

            // Check if the search input is blank
            if (mname.trim() === '') {
                // Display a SweetAlert for an empty input
                Swal.fire({
                    icon: 'error',
                    title: 'Input is blank for MiddleName',
                    text: 'Please enter a search value.',
                });
                return; // Exit the function to prevent the AJAX request
            }

            // Check if the search input contains only letters
            if (!/^[A-Za-z]+$/.test(mname)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Invalid Input for MiddleName',
                    text: 'Please enter a valid alphabetic search value (letters only).',
                });
                return;
            }

            // Check if the search input is blank
            if (lname.trim() === '') {
                // Display a SweetAlert for an empty input
                Swal.fire({
                    icon: 'error',
                    title: 'Input is blank for LastName',
                    text: 'Please enter a search value.',
                });
                return; // Exit the function to prevent the AJAX request
            }




            // Check if the search input contains only letters
            if (!/^[A-Za-z]+$/.test(lname)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Invalid Input for LastName',
                    text: 'Please enter a valid alphabetic search value (letters only).',
                });
                return;
            }


            // Check if the search input is blank
            if (snumber.trim() === '') {
                // Display a SweetAlert for an empty input
                Swal.fire({
                    icon: 'error',
                    title: 'Input is blank for PhoneNumber',
                    text: 'Please enter a search value.',
                });
                return; // Exit the function to prevent the AJAX request
            }
            // Check if the search input contains non-numeric characters

            if (!/^\d+$/.test(snumber)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Invalid Input for PhoneNumber',
                    text: 'Please enter a valid numeric search value.',
                });
                return;
            }


            if (gen.trim() === '0') {
                Swal.fire({
                    icon: 'error',
                    title: 'Department is not selected',
                    text: 'Please select a department.',
                });
                return;
            }

            if (dept.trim() === '0') {
                Swal.fire({
                    icon: 'error',
                    title: 'Department is not selected',
                    text: 'Please select a department.',
                });
                return;
            }

      

            if (sem.trim() === '0') {
                Swal.fire({
                    icon: 'error',
                    title: 'Semester is not selected',
                    text: 'Please select a semester.',
                });
                return;
            }

            var selectedGender = $("#gen").val();
            if (selectedGender === null || selectedGender === "") {
                Swal.fire({
                    icon: 'error',
                    title: 'Gender not selected',
                    text: 'Please select a gender from the dropdown.',
                });
                return;
            }

      
                document.getElementById("btnSubmit").style.display = "none";
                document.getElementById("btnspinner").style.display = "block";






            $.ajax({
                url: 'insertStudents.aspx/CheckIdExists',
                data: "{ 'id':'" + id + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'ID already exists',
                            text: 'The selected ID already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'insertStudents.aspx/submitData',
                            data: "{ 'id':'" + id + "' , 'pass':'" + pass + "' , 'fname':'" + fname + "','mname':'" + mname + "' ,  'lname':'" + lname + "', 'snumber':'" + snumber + "' , 'gen':'" + gen + "' , 'sem':'" + sem + "' , 'cls':'" + cls + "'} ",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                document.getElementById("btnSubmit").style.display = "block";
                                document.getElementById("btnspinner").style.display = "none";
                                $("#myModal").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Student!',
                                        'success'
                                    )

                                    DataBind();
                                    clearInputFields(); // Clear input fields
                                } else {
                                    // Handle errors in the response
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Data Insertion Failed',
                                        text: 'There was an error while inserting the data.',
                                    });
                                }
                            },
                            error: function (response) {
                                alert(response.responseText);
                            }
                        });
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });


            function clearInputFields() {
                // Replace these lines with code to clear the input fields
                $("#idInput").val('');
                $("#fnameInput").val('');
                $("#mnameInput").val('');
                $("#lnameInput").val('');
                $("#snumberInput").val('');
                $("#genInput").val('');
                $("#semInput").val('');
            }




     

            //    $.ajax({
            //        url: 'insertStudents.aspx/submitData1',
            //        data: "{ 'id':'" + id + "' ,  'fname':'" + fname + "','mname':'" + mname + "' ,  'lname':'" + lname + "', 'snumber':'" + snumber + "' , 'gen':'" + gen + "' , 'sem':'" + sem + "'} ",
            //        dataType: "json",
            //        type: 'POST',
            //        contentType: "application/json",
            //        success: function (response) {



            //            document.getElementById("btnSubmit").style.display = "block";
            //            document.getElementById("btnspinner").style.display = "none";

            //            $("#myModal").modal("hide");
            //            Swal.fire(
            //                'Good job!',
            //                'You Added a new Student!',
            //                'success'
            //            )
            //            DataBind();
            //        },
            //        error: function (response) {
            //            alert(response.responseText);
            //        }
            //    });


            //}











        }



    
        function insertvisit() {
        
            document.getElementById("btnSubmit").style.display = "none";
            document.getElementById("btnspinner").style.display = "block";

            var id = document.getElementById("stdid2").value;
            var name = document.getElementById("stdname2").value;
            var classname = document.getElementById("stdclass").value;
            var faculclass = document.getElementById("stdfaculcl").value;
            var facul = document.getElementById("stdfacul").value;
            var dept = document.getElementById("stddep").value;
            var sem = document.getElementById("stdsem").value;
       /*     var date = document.getElementById("stddate").value;*/
           
        /*    var sname = document.getElementById("stdname2").value;*/
           
          
     




            $.ajax({
                url: 'insertStudents.aspx/submitvisit',
                data: "{ 'id':'" + id + "','name':'" + name + "','classname':'" + classname + "','faculclass':'" + faculclass + "','dept':'" + dept + "','sem':'" + sem + "','facul':'" + facul + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {

                    console.log(response)
                    document.getElementById("btnSubmit").style.display = "block";
                    document.getElementById("btnspinner").style.display = "none";

                    $("#myModal2").modal("hide");
                    Swal.fire(
                        'Good job!',
                        'You saved  the visitation!',
                        'success'
                    )

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
                url: 'insertStudents.aspx/DataBind',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                 console.log(response)
              
           /*         swal("Good job!", "You clicked the button!", "success");*/
                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatablee tbody").append(
                            "<tr>"
                            + "<td>" + response.d[i].id + "</td>"
                            + "<td>" + response.d[i].sname + "</td>"
                            + "<td>" + response.d[i].facults + "</td>"
                            + "<td>" + response.d[i].classname + "</td>"
                            + "<td>" + response.d[i].semesters + "</td>"
                            + "<td>" + response.d[i].departments + "</td>"
                    
                            + "<td>" + response.d[i].gender + "</td>"
                      
                          
                    











                   



                            + "</tr>")
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        } 







        //function DataBind() {
        //    $.ajax({
        //        url: 'insertStudents.aspx/DataBind',
        //        dataType: 'json',
        //        type: 'POST',
        //        contentType: 'application/json',
        //     //   data: JSON.stringify({ 'currentPage': page }), // Send the current page to the server
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
        //            /*      currentPage = page;*/
        //            /*       updatePagination(response.d.length);*/
        //            // Update the pagination controls
        //            /*        updatePagination();*/
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
        //        url: 'insertStudents.aspx/GetTotalRecords',
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










        function passValue(row) {
            var cell = row.cells;

            document.getElementById("stdid2").value = cell[0].innerHTML;
            document.getElementById("stdname2").value = cell[1].innerHTML;
            document.getElementById("stdclass").value = cell[6].innerHTML;
            document.getElementById("stdsem").value = cell[4].innerHTML;
            document.getElementById("stdfacul").value = cell[2].innerHTML;
            document.getElementById("stddep").value = cell[5].innerHTML;
            document.getElementById("stdfaculcl").value = cell[3].innerHTML;
  

            document.getElementById("btnSubmit").style.display = "none";
            document.getElementById("btnUpdate").style.display = "block";
            document.getElementById("btnDelete").style.display = "block";
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
                        url: "insertStudents.aspx/getdepart",
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
            $('#drpsem222').change(function () {
                var selectedValue = $(this).val();

                $(function () {


                    $.ajax({
                        type: "POST",
                        url: "insertStudents.aspx/fff",
                        data: "{'selectedValue':'" + selectedValue + "'} ",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var drpclass = $("[id*=drpclass]");
                            drpclass.empty().append('<option selected="selected" value="0">Please select</option>');
                            $.each(r.d, function () {
                                drpclass.append($("<option></option>").val(this['Value']).html(this['Text']));
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
                $(function () {
                $.ajax({
                    type: "POST",
                    url: "insertStudents.aspx/GetSemesterData",
                    //  data: JSON.stringify({ selectedValue: selectedValue }), // Send selected value as a parameter
                    data: "{'selectedValue':'" + selectedValue + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
console.log(r)
                      
                    

                        var drpfacult2 = $("[id*=drpfacult2]");
                       

                        drpfacult2.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            drpfacult2.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });
                });
            });
        });


        $(document).ready(function () {



            $(function () {


                $.ajax({
                    type: "POST",
                    url: "insertStudents.aspx/getdepart",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var depts = $("[id*=depts]");
                        depts.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            depts.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });



            });

        });
        $(document).ready(function () {
            // When the first dropdown changes
            $('#depts').change(function () {
                var selectedValue = $(this).val();


                $(function () {


                    $.ajax({
                        type: "POST",
                        url: "insertStudents.aspx/getfacul2",
                        data: "{'selectedValue':'" + selectedValue + "'} ",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var faculs = $("[id*=faculs]");
                            faculs.empty().append('<option selected="selected" value="0">Please select</option>');
                            $.each(r.d, function () {
                                faculs.append($("<option></option>").val(this['Value']).html(this['Text']));
                            });
                        }
                    });
                });


            });


        });

        $(document).ready(function () {
            // When the first dropdown changes
            $('#faculs').change(function () {
                var selectedValue = $(this).val(); // Get the selected value
            
                // Call a server-side method to get data for the second dropdown based on the selected value
                $.ajax({
                    type: "POST",
                    url: "insertStudents.aspx/classes",
                    //  data: JSON.stringify({ selectedValue: selectedValue }), // Send selected value as a parameter
                    data: "{'selectedValue':'" + selectedValue + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        var classs = $("[id*=classs]");

                        classs.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            classs.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });
            });
        });

        $(document).ready(function () {
            // When the first dropdown changes
            $('#classs').change(function () {
                var selectedValue = $(this).val(); // Get the selected value

                // Call a server-side method to get data for the second dropdown based on the selected value
                $.ajax({
                    type: "POST",
                    url: "insertStudents.aspx/GetSemesterData",
                    //  data: JSON.stringify({ selectedValue: selectedValue }), // Send selected value as a parameter
                    data: "{'selectedValue':'" + selectedValue + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        var classfaculs = $("[id*=classfaculs]");

                        classfaculs.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            classfaculs.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });
            });
        });
        $(document).ready(function () {
            // When the first dropdown changes
            $('#sems').change(function () {
                var selectedValue = $(this).val(); // Get the selected value
          
                // Call a server-side method to get data for the second dropdown based on the selected value
                $.ajax({
                    type: "POST",
                    url: "insertStudents.aspx/GetSemesterData1",
                    //  data: JSON.stringify({ selectedValue: selectedValue }), // Send selected value as a parameter
                    data: "{'selectedValue':'" + selectedValue + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        var sems = $("[id*=sems]");

                        sems.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            sems.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });
            });
        });
    //    Search_DataBind();
        function Search_DataBind() {

            //var dept = $(depts).val(); // Get the selected value
            //var facul = $(faculs).val(); // Get the selected value
            var cls = $(classs).val();
            var clsf = $(classfaculs).val();
 
          

           

          
            $.ajax({
                url: 'insertStudents.aspx/Search_DataBind',
                data: "{'cls':'" + cls + "','clsf':'" + clsf + "'}",
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
                            + "<td>" + response.d[i].sname + "</td>"
                            + "<td>" + response.d[i].facults + "</td>"
                            + "<td>" + response.d[i].classname + "</td>"
                            + "<td>" + response.d[i].semesters + "</td>"
                            + "<td>" + response.d[i].departments + "</td>"
                     
                            + "<td>" + response.d[i].gender + "</td>"


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
                url: 'insertStudents.aspx/Search_id',
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
                            + "<td>" + response.d[i].sname + "</td>"
                            + "<td>" + response.d[i].facults + "</td>"
                            + "<td>" + response.d[i].classname + "</td>"
                            + "<td>" + response.d[i].semesters + "</td>"
                            + "<td>" + response.d[i].departments + "</td>"
                          + "<td>" + response.d[i].gender + "</td>"


                            + "</tr>")
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
                searching: false
            });

            // Select the DataTable button container and append it with margin
            table.buttons().container()
                .appendTo('#datatablee_wrapper ')
                .css('margin', '20px'); // Add margin of 10px to the appended container
        });


    </script>
</asp:Content>
