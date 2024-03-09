<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="insertvisitors.aspx.cs" Inherits="library.insertvisitors" %>
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
                                    <h1>  Insert Visitors</h1>
                                  
                                </div>

                            </div>

                        </div>
   
        <div class="container-fluid text-white ">

                    <div class="row p-4">



            

                <div class="col-4">
                           <button type="button" class="btn btn-primary pull-right" onclick="addNew()">
  <i class="fas fa-plus"></i>  Add Visitor
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
  <th scope="col">visit ID</th>
          <th scope="col">firstname</th>
  <th scope="col">middlename</th>
  <th scope="col">lastname</th>
  <th scope="col">phonenumber</th>
  <th scope="col"> details</th>
                         

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
<div class="modal" id="myModal3">
    <div class=" modal-dialog  modal-xl border-1 "> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->
                         <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto"> Insert Visitor</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
       

            <!-- Modal body -->
            <div class="modal-body ">
                <div class="container border border-info"> 
   <div class="row">
 

  <div class="col-4">
   
    <div class="row mt-4 mb-4">
        <label for="firstname" class="col-sm-2 col-form-label">First Name</label>
        <div class="col-sm">
            <input type="text" id="firstname" class="form-control">
        </div>
    </div>

    <div class="row mt-4 mb-4">
        <label for="middlename" class="col-sm-2 col-form-label">Middle Name</label>
        <div class="col-sm">
            <input type="text" id="middlename" class="form-control">
        </div>
    </div>

    <div class="row mt-4 mb-4">
        <label for="lastname" class="col-sm-2 col-form-label">Last Name</label>
        <div class="col-sm">
            <input type="text" id="lastname" class="form-control">
        </div>
    </div>
</div>

<div class="col-4">
    <div class="row mt-4 mb-4">
        <label for="phoneNumber" class="col-sm-2 col-form-label">Phone Number</label>
        <div class="col-sm">
            <input type="text" id="phoneNumber" class="form-control">
        </div>
    </div>

    <div class="row mt-4 mb-4">
        <label for="details" class="col-sm-2 col-form-label">Details</label>
        <div class="col-sm">
            <input type="text" id="details" class="form-control">
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



                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>
            </div>

        </div>
    </div>
</div>


                  <!-- The Modal -->
<div class="modal" id="myModal5">
    <div class=" modal-dialog  modal-xl border-1 "> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->
                         <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto"> Edit and Delete Visitor</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
       

            <!-- Modal body -->
            <div class="modal-body ">
                <div class="container border border-info"> 
   <div class="row">
 

  <div class="col-4">
    <div class="row mt-4 mb-4">
     <label for="firstname" class="col-sm-2 col-form-label"> visitid</label>
     <div class="col-sm">
         <input type="number" id="visitid" class="form-control">
     </div>
 </div>
    <div class="row mt-4 mb-4">
        <label for="firstname" class="col-sm-2 col-form-label">First Name</label>
        <div class="col-sm">
            <input type="text" id="firstname1" class="form-control">
        </div>
    </div>

    <div class="row mt-4 mb-4">
        <label for="middlename" class="col-sm-2 col-form-label">Middle Name</label>
        <div class="col-sm">
            <input type="text" id="middlename1" class="form-control">
        </div>
    </div>

    <div class="row mt-4 mb-4">
        <label for="lastname" class="col-sm-2 col-form-label">Last Name</label>
        <div class="col-sm">
            <input type="text" id="lastname1" class="form-control">
        </div>
    </div>
</div>

<div class="col-4">
    <div class="row mt-4 mb-4">
        <label for="phoneNumber" class="col-sm-2 col-form-label">Phone Number</label>
        <div class="col-sm">
            <input type="number" id="phoneNumber1" class="form-control">
        </div>
    </div>

    <div class="row mt-4 mb-4">
        <label for="details" class="col-sm-2 col-form-label">Details</label>
        <div class="col-sm">
            <input type="text" id="details1" class="form-control">
        </div>
    </div>
</div>

</div>

  
           
  
    </div> 

            </div>



            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                    <a href="#" class="btn btn-danger" id="btndelete1">Delete</a>
                <a href="#" class="btn btn-success" onclick="updateinfo()" id="btnSubmit1">Update</a>



                <button class="btn btn-success" id="btnspinner1" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>
            </div>

        </div>
    </div>
</div>


    <script>
        $(document).ready(function () {
            // This code ensures the DOM is fully loaded before executing
            // Bind the click event to the close button
            $('.close').on('click', function () {
                $('#myModal5').modal('hide'); // Hide the modal when the button is clicked
            });

            $('.close').on('click', function () {
                $('#myModal3').modal('hide'); // Hide the modal when the button is clicked
            });
        });



        $("[id*=btndelete1]").click(function () {
            // Fetch book ID from the span
            var visitid = $("#visitid").val();
          

            // Send book ID to server using AJAX
            $.ajax({
                type: "POST",
                url: "insertvisitors.aspx/deletevisitor",
                data: JSON.stringify({ visitid: visitid }), // Convert data to JSON format
                contentType: "application/json; charset=utf-8", // Set content type to JSON
                dataType: "json", // Expect JSON response
                success: function (response) {
                    console.log(response);
             
                    $("#myModal5").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted  a Visitor!',
                        'success'
                    )


                    DataBind();
                },
                error: function (error) {
                    alert(error.responseText);
                  

                    DataBind();
                },
                failure: function (failure) {
                    alert(failure.responseText);
                }
            });

            return false;
        });





        function updateinfo() {
            var firstName = $("#firstname1").val();
            var middleName = $("#middlename1").val();
            var lastName = $("#lastname1").val();
            var phoneNumber = $("#phoneNumber1").val();
            var details = $("#details1").val();



            var visitid = $("#visitid").val();
         



            $.ajax({
                url: 'insertvisitors.aspx/updateVisitor',
                data: "{ 'firstName':'" + firstName + "' , 'middleName':'" + middleName + "','lastName':'" + lastName + "' , 'phoneNumber':'" + phoneNumber + "', 'details':'" + details + "', 'visitid':'" + visitid + "'} ",

                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal5").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a new Student!',
                        'success'
                    )
                    DataBind();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }













        $(document).ready(function () {
            // This code ensures the DOM is fully loaded before executing
            // Bind the click event to the close button
            $('.close').on('click', function () {
                $('#myModal3').modal('hide'); // Hide the modal when the button is clicked
            });

            $('.close').on('click', function () {
                $('#myModal6').modal('hide'); // Hide the modal when the button is clicked
            });
        });

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

   function addNew() {
            //document.getElementById("txtID").value = "";
            //document.getElementById("txtFirstname").value = "";
            //document.getElementById("txtLastname").value = "";

            $("#myModal3").modal("show")

       
         //   Search_DataBind();
        }

  function submitInfo() {


        var firstname = $("#firstname").val();
        var middlename = $("#middlename").val();
        var lastname = $("#lastname").val();
        var phoneNumber = $("#phoneNumber").val();
        var details = $("#details").val();



            $.ajax({
                url: 'insertvisitors.aspx/CheckIdExists',
                data: "{ 'phoneNumber':'" + phoneNumber + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Phone Number already exists',
                            text: 'The selected Number already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'insertvisitors.aspx/SubmitVisit',
                          data: "{ 'firstname':'" + firstname + "', 'middlename':'" + middlename + "', 'lastname':'" + lastname + "', 'phoneNumber':'" + phoneNumber + "', 'details':'" + details + "' }",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal3").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Student!',
                                        'success'
                                    )
                                    $("#firstname").val("");
                                    $("#middlename").val("");
                                    $("#lastname").val("");
                                    $("#phoneNumber").val("");
                                    $("#details").val("");

                                    DataBind();
                              
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

}











 DataBind();
        function DataBind() {
            $.ajax({
                url: 'insertvisitors.aspx/DataBind2',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatablee tbody").append(
                            "<tr>"
                          


                            + "<td>" + response.d[i].visit_id + "</td>"
                             + "<td>" + response.d[i].firstname + "</td>"
                            + "<td>" + response.d[i].middlename + "</td>"
                            + "<td>" + response.d[i].lastname + "</td>"

                              + "<td>" + response.d[i].phone_number + "</td>"
                            + "<td>" + response.d[i].details + "</td>"
                    
                    
                
                       


                            + "</tr>")
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }



        //function passValue(row) {
        //    console.log("clicked");
        //    var cell = row.cells;
        //    var celvalue = cell[0].innerHTML;
        //    var firstName = $("#firstname1").val();
        //    var middleName = $("#middlename1").val();
        //    var lastName = $("#lastname1").val();
        //    var phoneNumber = $("#phoneNumber1").val();
        //    var details = $("#details1").val();



        //    var visitid = $("#visitid").text();

        //    document.getElementById("visitid").value = cell[0].innerHTML;
        //    document.getElementById("details1").value = cell[5].innerHTML;
        //    document.getElementById("firstname1").value = cell[1].innerHTML;
        //    document.getElementById("middlename1").value = cell[2].innerHTML;
        //    document.getElementById("lastname1").value = cell[3].innerHTML;


        //    document.getElementById("phoneNumber1").value = cell[4].innerHTML;













        //    $("#myModal5").modal("show");
        //}


    </script>

</asp:Content>
