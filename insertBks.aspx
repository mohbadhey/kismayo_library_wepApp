<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="insertBks.aspx.cs" Inherits="library.insertBks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


.photo{
    width: 7em; 
    height: 9em; 
    border: 1px solid rgb(197, 197, 197); 
    border-radius: 4px 4px 4px 4px; 
    float:right;
}
.dataTables_info {
    color: black; /* Change the color to black */
}
</style>
   

    

       
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
                                    <h1>  Insert  Books </h1>
                                  
                                </div>

                            </div>

                        </div>
   
        <div class="container-fluid text-white ">

            <div class="row p-4">



            

                <div class="col-4">
                           <button type="button" class="btn btn-primary pull-right" onclick="addNew()">
  <i class="fas fa-plus"></i>  Add Books
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
<div class="modal" id="myModal3">
    <div class=" modal-dialog  modal-xl border-1 "> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

            <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert Books</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>


            <!-- Modal body -->
            <div class="modal-body ">
                <div class="container border border-info"> 
                    <section class="section">


                           <div class="row">
                
  
                         
    <div class="col-4">
    



          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Book Name</label>
                  <div class="col-sm-10">
                    <input type="text"  id="name" class="form-control">
                  </div>
                </div>




        
          <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">Book Price</label>
                  <div class="col-sm-10">
                    <input type="number"  id="price" class="form-control">
                  </div>
                </div>



         <div class="row mb-3">
         <label for="inputText" class="col-sm-2 col-form-label">Book Department</label>
         <div class="col-sm-10">
                 <select id="dept" class="form-control"></select>
         </div>
       </div>








        

        <div class="row mt-4 mb-4">
            <label for="facul" class="col-sm-2 col-form-label">Book Faculty</label>
            <div class="col-sm">
                
               <select id="drpsem2" class="form-control"></select>
            </div>
        </div>
    </div>
                                      <div class="col-2"></div>

    <div class="col-4">
        <div class="row mt-4 mb-4">
            <label for="qty" class="col-sm-2 col-form-label">Book Quantity</label>
            <div class="col-sm">
                <input type="number" id="qty" class="form-control">
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="date" class="col-sm-2 col-form-label">Date registered</label>
            <div class="col-sm">
                <input type="date" id="date" class="form-control">
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="aqty" class="col-sm-2 col-form-label">Available Quantity</label>
            <div class="col-sm">
                <input type="number" id="aqty" class="form-control">
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="aqty" class="col-sm-2 col-form-label">Book Details</label>
            <div class="col-sm">
                <input type="text" id="dtls" class="form-control">
            </div>
        </div>
    </div>
</div>

                    </section>
 

  
           
  
    </div> 

            </div>



            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                <a href="#" class="btn btn-success" onclick="submitInfo()" id="btnSubmit">Submit</a>

                <%--  <asp:Button ID="btnSave" Text="Save" runat="server" CssClass="btn btn-primary" />--%>

             <%--   <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
                <a href="#" class="btn btn-danger" onclick="deleteInfo()" id="btnDelete">Delete</a>--%>

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>
            </div>

        </div>
    </div>
</div>
        
          <!-- The Modal -->
<div class="modal" id="myModal6">
    <div class=" modal-dialog  modal-xl border-1 "> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Edit and Delete Books</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body ">
                <div class="container border border-info"> 
   <div class="row">


    <div class="col-4">
        <div class="row mt-4 mb-4">
            <label for="name" class="col-sm-2 col-form-label">Book Name</label>
            <div class="col-sm">
                <input type="text" id="name1" class="form-control">
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="price" class="col-sm-2 col-form-label">Book Price</label>
            <div class="col-sm">
                <input type="number" id="price1" class="form-control">
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="dept2" class="col-sm-2 col-form-label">Book Department</label>
            <div class="col-sm">
            
             <select id="dept1" class="form-control"></select>
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="facul" class="col-sm-2 col-form-label">Book Faculty</label>
            <div class="col-sm">
                
               <select id="drpsem21" class="form-control"></select>
            </div>
        </div>
    </div>
       <div class="col-2"></div>

    <div class="col-4">
        <div class="row mt-4 mb-4">
            <label for="qty" class="col-sm-2 col-form-label">Book Quantity</label>
            <div class="col-sm">
                <input type="number" id="qty1" class="form-control">
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="date" class="col-sm-2 col-form-label">Date registered</label>
            <div class="col-sm">
                <input type="date" id="date1" class="form-control">
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="aqty" class="col-sm-2 col-form-label">Available Quantity</label>
            <div class="col-sm">
                <input type="number" id="aqty1" class="form-control">
            </div>
        </div>

        <div class="row mt-4 mb-4">
            <label for="aqty" class="col-sm-2 col-form-label">Book Details</label>
            <div class="col-sm">
                <input type="text" id="dtls1" class="form-control">
            </div>
        </div>
         <div class="row mt-4 mb-4">
            <label for="aqty" class="col-sm-2 col-form-label">Book id</label>
            <div class="col-sm">
   <span id="bookid" class="form-control"></span>
        
            </div>
        </div>
    </div>
</div>

  
           
  
    </div> 

            </div>



            <!-- Modal footer -->
            <div class="modal-footer">
                     
                 <a href="#" class="btn btn-success"  onclick="updateinfo()">Update</a>
                       <a href="#" class="btn btn-danger" id="btndelete1">Delete</a>
            </div>

        </div>
    </div>
</div>

      <script>


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
            var reader = new FileReader();
            var fileName;
            var contentType;

            $('[id*=FileUpload1]').change(function () {
                if (typeof (FileReader) != "undefined") {
                    var input = this;

                    reader.onload = function (e) {
                        $('#selectedImage22').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);

                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    $($(this)[0].files).each(function () {
                        var file = $(this);
                        if (regex.test(file[0].name.toLowerCase())) {
                            fileName = file[0].name;
                            contentType = file[0].type;
                            reader.readAsDataURL(file[0]);
                        } else {
                            alert(file[0].name + " is not a valid image file.");
                            return false;
                        }
                    });
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            });

            // Additional Event Handling (if needed)
            // $("#FileUpload2").change(function () {
            //     readURL(this);
            // });
 
    $("[id*=btnSave]").click(function () {
        var byteData = reader.result;
        byteData = byteData.split(';')[1].replace("base64,", "");

        // Get values from other form fields
        var bookName = $("#name").val();
        var bookPrice = $("#price").val();
        var bookDept =  $("#dept option:selected").text();
        var bookFaculty =  $("#drpsem2 option:selected").text();
        var bookQuantity = $("#qty").val();
        var dateRegistered = $("#date").val();
        var availableQuantity = $("#aqty").val();
     var bookDetails = $("#dtls").val();

        // Create a JSON object
        var jsonData = {
            Data: byteData,
            Name: fileName,
            ContentType: contentType,
            BookName: bookName,
            BookPrice: bookPrice,
            BookDept: bookDept,
            BookFaculty: bookFaculty,
            BookQuantity: bookQuantity,
            DateRegistered: dateRegistered,
            AvailableQuantity: availableQuantity,
             bookDetails:bookDetails
        };

        // Convert JSON object to string
        var jsonString = JSON.stringify(jsonData);
console.log(jsonString);


console.log(bookName);
        // Send data to server using AJAX
        $.ajax({
            type: "POST",
            url: "insertBks.aspx/SaveImage",
            data: '{data : ' + jsonString + ' }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                console.log(r.d);
                alert(r.d);

 DataBind();
            },
            error: function (r) {
                alert(r.responseText);
            },
            failure: function (r) {
                alert(r.responseText);
            }
        });

        return false;
    });
});





       
          $(document).ready(function () {
              // Get the current date
              var currentDate = new Date();

              // Format the date as yyyy-mm-dd
              var year = currentDate.getFullYear();
              var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
              var day = currentDate.getDate().toString().padStart(2, '0');
              var formattedDate = `${year}-${month}-${day}`;

              // Set the formatted date as the selected value for the date input field
              $("#date").val(formattedDate);
          });



       function submitInfo() {

   var bookName = $("#name").val();
        var bookPrice = $("#price").val();
        var bookDept =  $("#dept option:selected").text();
        var bookFaculty =  $("#drpsem2 option:selected").text();
        var bookQuantity = $("#qty").val();
        var dateRegistered = $("#date").val();
        var availableQuantity = $("#aqty").val();
     var bookDetails = $("#dtls").val();


   

           // Set the formatted date as the default value for the date input field
           document.getElementById('date').value = formattedDate;


           // Get the current date
           var currentDate = new Date();

           // Format the date as yyyy-mm-dd
           var year = currentDate.getFullYear();
           var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
           var day = currentDate.getDate().toString().padStart(2, '0');
           var formattedDate = `${year}-${month}-${day}`;



           // Set the formatted date as the default value for the date input field
           $("#date").val(formattedDate);

        

           // Check if the search input is blank
           if (bookPrice.trim() === '') {
               // Display a SweetAlert for an empty input
               Swal.fire({
                   icon: 'error',
                   title: 'Input is blank for bookPrice',
                   text: 'Please enter a search value.',
               });
               return; // Exit the function to prevent the AJAX request
           }
           // Check if the search input contains non-numeric characters

           if (!/^\d+$/.test(bookPrice)) {
               Swal.fire({
                   icon: 'error',
                   title: 'Invalid Input for bookPrice',
                   text: 'Please enter a valid numeric search value.',
               });
               return;
           }

           // Check if the search input is blank
           if (bookName.trim() === '') {
               // Display a SweetAlert for an empty input
               Swal.fire({
                   icon: 'error',
                   title: 'Input is blank for bookName',
                   text: 'Please enter a search value.',
               });
               return; // Exit the function to prevent the AJAX request
           }
           // Check if the search input contains only letters
          
           // Check if the search input is blank
           if (bookDetails.trim() === '') {
               // Display a SweetAlert for an empty input
               Swal.fire({
                   icon: 'error',
                   title: 'Input is blank for bookDetails',
                   text: 'Please enter a search value.',
               });
               return; // Exit the function to prevent the AJAX request
           }


           // Check if the search input is blank
           if (bookQuantity.trim() === '') {
               // Display a SweetAlert for an empty input
               Swal.fire({
                   icon: 'error',
                   title: 'Input is blank for bookQuantity',
                   text: 'Please enter a search value.',
               });
               return; // Exit the function to prevent the AJAX request
           }
           // Check if the search input contains non-numeric characters

           if (!/^\d+$/.test(bookQuantity)) {
               Swal.fire({
                   icon: 'error',
                   title: 'Invalid Input for bookQuantity',
                   text: 'Please enter a valid numeric search value.',
               });
               return;
           }

           // Check if the search input is blank
           if (availableQuantity.trim() === '') {
               // Display a SweetAlert for an empty input
               Swal.fire({
                   icon: 'error',
                   title: 'Input is blank for availableQuantity',
                   text: 'Please enter a search value.',
               });
               return; // Exit the function to prevent the AJAX request
           }
           // Check if the search input contains non-numeric characters

           if (!/^\d+$/.test(availableQuantity)) {
               Swal.fire({
                   icon: 'error',
                   title: 'Invalid Input for availableQuantity',
                   text: 'Please enter a valid numeric search value.',
               });
               return;
           }


           if (bookDept.trim() === '0') {
               Swal.fire({
                   icon: 'error',
                   title: 'Department is not selected',
                   text: 'Please select a department.',
               });
               return;
           }



           if (bookFaculty.trim() === '0') {
               Swal.fire({
                   icon: 'error',
                   title: 'faculty is not selected',
                   text: 'Please select a faculty.',
               });
               return;
           }

         






            $.ajax({
                url: 'insertBks.aspx/sbmitbook',
            data: "{ 'bookName':'" + bookName + "' , 'bookPrice':'" + bookPrice + "','bookDept':'" + bookDept + "' , 'bookFaculty':'" + bookFaculty + "', 'bookQuantity':'" + bookQuantity + "' , 'dateRegistered':'" + dateRegistered + "' , 'availableQuantity':'" + availableQuantity + "', 'bookDetails':'" + bookDetails + "'} ",

                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {




                    $("#myModal3").modal("hide");
                    Swal.fire(
                        'Successfully Saved !',
                        'You Added a new Book!',
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
              var table = $('#datatablee').DataTable({
                  lengthChange: false,
                  searching: false
              });

              // Select the DataTable button container and append it with margin
              table.buttons().container()
                  .appendTo('#datatablee_wrapper ')
                  .css('margin', '20px'); // Add margin of 10px to the appended container
          });



function updateinfo() {
       var bookName = $("#name1").val();
        var bookPrice = $("#price1").val();
        var bookDept = $("#dept1 option:selected").text();
        var bookFaculty = $("#drpsem21 option:selected").text();
        var bookQuantity = $("#qty1").val();
        var dateRegistered = $("#date1").val();
        var availableQuantity = $("#aqty1").val();
    var bookDetails = $("#dtls1").val();


    var bookId = $("#bookid").text();

    $.ajax({
        url: 'insertBks.aspx/updatebook1',
     data: "{ 'bookName':'" + bookName + "' , 'bookPrice':'" + bookPrice + "','bookDept':'" + bookDept + "' , 'bookFaculty':'" + bookFaculty + "', 'bookQuantity':'" + bookQuantity + "' , 'dateRegistered':'" + dateRegistered + "' , 'availableQuantity':'" + availableQuantity + "', 'bookDetails':'" + bookDetails + "', 'bookId':'" + bookId + "'} ",
        dataType: "json",
        type: 'POST',
        contentType: "application/json",
        success: function (response) {
console.log(response);
            $("#myModal6").modal("hide");
            Swal.fire(
                'Successfully updated !',
                'You updated a new Book!',
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
    var reader = new FileReader();
    var fileName;
    var contentType;

    $('[id*=FileUpload2]').change(function () {
        if (typeof (FileReader) != "undefined") {
            var input = this;

            reader.onload = function (e) {
                $('#selectedImage').attr('src', e.target.result);

            }

            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
            $($(this)[0].files).each(function () {
                var file = $(this);
                if (regex.test(file[0].name.toLowerCase())) {
                    fileName = file[0].name;
                    contentType = file[0].type;
                    reader.readAsDataURL(file[0]);
                } else {
                    alert(file[0].name + " is not a valid image file.");
                    return false;
                }
            });
        } else {
            alert("This browser does not support HTML5 FileReader.");
        }
    });

    $("[id*=btnupdate]").click(function () {
        // Fetch book ID from the span
        var bookId = $("#bookid").text();

        // Check if a file is selected
        var byteData = "";
        if (reader.result) {
            byteData = reader.result.split(';')[1].replace("base64,", "");
        }

        // Get values from other form fields
        var bookName = $("#name1").val();
        var bookPrice = $("#price1").val();
        var bookDept = $("#dept1 option:selected").text();
        var bookFaculty = $("#drpsem21 option:selected").text();
        var bookQuantity = $("#qty1").val();
        var dateRegistered = $("#date1").val();
        var availableQuantity = $("#aqty1").val();
        var bookDetails = $("#dtls1").val();

        // Create a JSON object
        var jsonData = {
            BookId: bookId, // Include the book ID in the data
            Data: byteData,
            Name: fileName,
            ContentType: contentType,
            BookName: bookName,
            BookPrice: bookPrice,
            BookDept: bookDept,
            BookFaculty: bookFaculty,
            BookQuantity: bookQuantity,
            DateRegistered: dateRegistered,
            AvailableQuantity: availableQuantity,
            BookDetails: bookDetails
        };

        console.log(bookId);
        console.log(jsonData);

        // Send data to server using AJAX
        $.ajax({
            type: "POST",
            url: "insertBks.aspx/UpdateBook", // Change the URL to your update endpoint
            data: JSON.stringify({ data1: jsonData }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                console.log(r.d);
                alert(r.d);

 DataBind();
            },
            error: function (r) {
                alert(r.responseText);
            },
            failure: function (r) {
                alert(r.responseText);
            }
        });

        return false;
    });
});



$("[id*=btndelete1]").click(function () {
    // Fetch book ID from the span
    var bookId = $("#bookid").text();
   

    // Send book ID to server using AJAX
    $.ajax({
        type: "POST",
        url: "insertBks.aspx/DeleteBook",
        data: JSON.stringify({ bookId: bookId }), // Convert data to JSON format
        contentType: "application/json; charset=utf-8", // Set content type to JSON
        dataType: "json", // Expect JSON response
        success: function (response) {
            console.log(response);
        
            $("#myModal6").modal("hide");
            Swal.fire(
                'Successfully Deleted !',
                'You Deleted  a Book!',
                'success'
            )

               
 DataBind();
        },
        error: function (error) {
            alert(error.responseText);
           alert("deleted successfully");

 DataBind();
        },
        failure: function (failure) {
            alert(failure.responseText);
        }
    });

    return false;
});














 DataBind();
        function DataBind() {
            $.ajax({
                url: 'insertBks.aspx/DataBind2',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatablee tbody").append(
                            "<tr style='cursor:pointer' >"
                          



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
//function passValue(row) {
//    console.log("clicked");
//    var cell = row.cells;
//    var celvalue = cell[0].innerHTML;


























// $("#selectedImage").attr("src", "");






//    $.ajax({
//        url: 'insertBks.aspx/stddetails',
//        data: JSON.stringify({ 'celvalue': celvalue }),
//        dataType: "json",
//        type: 'POST',
//        contentType: "application/json",
//        success: function (response) {
//            console.log(response);

//            // Assuming your response structure
//            var bookDetails = response.d[0]; // Accessing the first (and only) object in the array

//            // Update image source
//          $("#img").html('<img src="' + bookDetails.image + '" alt="Book Image">');


//            $("#name1").val(bookDetails.name);
//            $("#price1").val(bookDetails.price);

//            // Set the selected option for dept1 select
//            $("#dept1 option").each(function () {
//                if ($(this).text() === bookDetails.dept) {
//                    $(this).prop('selected', true);
//                }
//            });

//            // Clear existing options for drpsem21
//            $("#drpsem21").empty();

//            // Assuming bookDetails.facul is the value you want to set
//            var facultyValue = bookDetails.facul.trim();

//            // Add a new option with the facultyValue as both value and text
//            $("#drpsem21").append('<option value="' + facultyValue + '">' + facultyValue + '</option>');

//            $("#qty1").val(bookDetails.qty);

//            // Format the date as "yyyy-MM-dd"
//            var formattedDate = new Date(bookDetails.date);
//            var formattedDateString = formattedDate.toISOString().split('T')[0];
//            $("#date1").val(formattedDateString);

//            $("#aqty1").val(bookDetails.aqty);
//            $("#rqty1").val(bookDetails.rqty);
//  $("#dtls1").val(bookDetails.bookDetails);
//   $("#bookid").text(bookDetails.bookid);
//            $("#myModal6").modal("show");
//        },
//        error: function (response) {
//            console.error("Error:", response);
//            // Handle errors more gracefully, e.g., display an error message to the user
//        }
//    });
//}


        function addNew() {
            //document.getElementById("txtID").value = "";
            //document.getElementById("txtFirstname").value = "";
            //document.getElementById("txtLastname").value = "";

           // document.getElementById("btnSubmit").style.display = "block";
            //document.getElementById("btnUpdate").style.display = "none";
            //document.getElementById("btnDelete").style.display = "none";

            $("#myModal3").modal("show")

            DataBind();
         //   Search_DataBind();
        }




function Search_id() {
    var search = document.getElementById('txtSearch').value;

    $.ajax({
        url: 'insertBks.aspx/Search_id',
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
         


                $(function () {


                    $.ajax({
                        type: "POST",
                        url: "insertStudents.aspx/getdepart",
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
                        url: "insertStudents.aspx/getfacul2",
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


      </script>

</asp:Content>
