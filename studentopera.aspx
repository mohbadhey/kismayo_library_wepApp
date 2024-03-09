<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="studentopera.aspx.cs" Inherits="library.studentopera" %>
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
                                    <h1>   Update  Students </h1>
                                  
                                </div>

                            </div>

                        </div>
   
        <div class="container-fluid text-white ">

            <div class="row p-4">



                <div class="col-4 flex-row">
                    <input id="txtSearch" placeholder="Search Students" onkeydown="Search_id()" type="text" class="form-control form-control-sm border" />
     

                </div>
                <div class="col-2">                    <button type="button" class="btn btn-primary " onclick="Search_id()">
<i class="fa-solid fa-magnifying-glass"></i> Search
</button></div>

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
 <th scope="col" >First name</th>
       <th scope="col" > Middle Name</th>
       <th scope="col" > Last Name</th>
<th scope="col">faculty</th>
 <th scope="col">classname</th>
 <th scope="col">semesters</th>
      <th scope="col">department</th>
         
         <th scope="col">gender</th>
   
         <th scope="col">Number</th>
                         

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
  
    <h4 class="modal-title text-white mx-auto">Update Students</h4>
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
                    <input  type="number"   class="form-control"
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
                    <input type="text"   class="form-control"
                        id="mname" placeholder="middle Name"> 
                </div> 
            </div> 
  
            <div class="row mt-4"> 
                <label for="lname" class="col-sm-2  
                col-form-label">Last Name</label> 
                <div class="col-sm"> 
                    <input type="text"   class="form-control"
                        id="lname" placeholder="Last Name"> 
                </div> 
            </div> 
  
            <div class="row mt-4"> 
                <label for="email" class="col-sm-2  
                col-form-label">phone numner</label> 
                <div class="col-sm"> 
                    <input type="number"  class="form-control"
                        id="snumber" placeholder="phone number"> 
                </div> 
            </div> 


            </div>
            <div class="col-6">  

                
   <div class="row mt-4 mb-4"> 
                <label for="mobile" class="col-sm-2  
                col-form-label"> faculty </label> 
                <div class="col-sm"> 
                   
                    <select id="dept"  class="form-control">

                    </select>
                </div> 

       <span class="row1"></span>
            </div> 


                
            <div class="row mt-4 mb-4"> 
                <label for="mobile" class="col-sm-2  
                col-form-label">department </label> 
                <div class="col-sm"> 
                   
                    <select id="drpsem2"  class="form-control">

                    </select>
       
                </div> 
            </div> 

               
                  <div class="row mt-4 mb-4"> 
                <label for="mobile" class="col-sm-2  
                col-form-label">faculty class </label> 
                <div class="col-sm"> 
                   
                    <select id="drpfacult2"  class="form-control">

                    </select>
                </div> 
           </div>

                   <div class="row mt-4 mb-4"> 
                <label for="mobile" class="col-sm-2  
                col-form-label">genders </label> 
                <div class="col-sm"> 
                   
     <select id="gen"  class="form-control">
    <option value="" selected disabled>Select gender</option>
    <option value="male">Male</option>
    <option value="female">Female</option>
</select>

                </div> 
           </div>
              <div class="row mt-6"> 
                <label for="mobile" class="col-sm-2  
                col-form-label">Password </label> 
                <div class="col-sm"> 
                       <input type="text"  class="form-control"
        id="pass" placeholder="Password" minlength="8"> 
    

                </div> 
           </div>
        </div>
  
  
            </div> 
           
  
           
  
    </div> 

            </div>



            <!-- Modal footer -->
            <div class="modal-footer">
                         <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>

                <a href="#" class="btn btn-success" onclick="updateinfo()" id="btnUpdate">Update</a>
       

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
            // This code ensures the DOM is fully loaded before executing
            // Bind the click event to the close button
            $('.close').on('click', function () {
                $('#myModal').modal('hide'); // Hide the modal when the button is clicked
            });

            $('.close').on('click', function () {
                $('#myModal6').modal('hide'); // Hide the modal when the button is clicked
            });
        });








//function updateinfo() {
//var id = $("#stdid").val();
//var fname = $("#fname").val();
//var mname = $("#mname").val();
//var lname = $("#lname").val();
//var snumber = $("#snumber").val();
//var facul = $("#dept").val(); // Use .val() directly for getting the selected value
//    var cls = parseInt($("#drpsem2").val()); // Use .val() directly for getting the selected value
//    var sem = parseInt($("#drpfacult2").val());// Use .val() directly for getting the selected value
//var gen = $("#gen").val(); // Use .val() directly for getting the selected value

//    if (isNaN(cls)) {
//         If the value is not a number, set it to 0
//        cls = 0;
//    }
   
//    if (isNaN(sem)) {
//         If the value is not a number, set it to 0
//        sem = 0;
//    }


//    alert(cls);
//    if (facul.trim() === '0') {
//        Swal.fire({
//            icon: 'error',
//            title: 'faculty is not selected',
//            text: 'Please select a department.',
//        });
//        return;
//    }



//    if (cls.trim() === '0') {
//        Swal.fire({
//            icon: 'error',
//            title: 'department is not selected',
//            text: 'Please select a department.',
//        });
//        return;
//    }




//    if (sem.trim() === '0') {
//        Swal.fire({
//            icon: 'error',
//            title: 'class  is not selected',
//            text: 'Please select a class.',
//        });
//        return;
//    }




//    var data = {
//        id: id,
//        fname: fname,
//        mname: mname,
//        lname: lname,
//        snumber: snumber,
//        facul: facul,
//        cls: cls,
//        sem: sem,
//        gen: gen
//    };
//console.log("Sending data:", data);

//    $.ajax({
//        url: 'studentopera.aspx/updateData',
//       data: JSON.stringify(data),
//        dataType: "json",
//        type: 'POST',
//        contentType: "application/json",
//        success: function (response) {
//console.log(response);
//            $("#myModal").modal("hide");
//            Swal.fire(
//                'Successfully Updated !',
//                'You Updated a new Student!',
//                'success'
//            )
//            DataBind();
//        },
//        error: function (response) {
//            alert(response.responseText);
//        }
//    });
//}



        function updateinfo() {
            var id = $("#stdid").val();
            var fname = $("#fname").val();
            var mname = $("#mname").val();
            var lname = $("#lname").val();
            var pass = $("#pass").val();
            var snumber = $("#snumber").val();
            var facul = $("#dept").val();
            var cls = parseInt($("#drpsem2").val());
            var sem = parseInt($("#drpfacult2").val());
            var gen = $("#gen").val();




            if (isNaN(cls)) {
                cls = 0;
            }

            if (isNaN(sem)) {
                sem = 50;
            }

            if (pass.length < 8) {
                Swal.fire({
                    icon: 'error',
                    title: 'Invalid Input',
                    text: 'Please enter a number Greater than 8 Charactors.',
                });
            } else {

                var data = {
                    id: id,
                    fname: fname,
                    mname: mname,
                    lname: lname,
                    pass: pass,
                    snumber: snumber,
                    facul: facul,
                    cls: cls,
                    sem: sem,
                    gen: gen
                };

                console.log("Sending data:", data);

                if (cls === 0) {





                    $.ajax({
                        url: 'studentopera.aspx/updateData1',
                        data: JSON.stringify(data),
                        dataType: "json",
                        type: 'POST',
                        contentType: "application/json",
                        success: function (response) {
                            console.log(response);
                            $("#myModal").modal("hide");
                            Swal.fire(
                                'Successfully Updated !',
                                'You Updated a new Student!',
                                'success'
                            )
                            $("#stdid").val(''); // Clear student id input
                            $("#fname").val(''); // Clear first name input
                            $("#mname").val(''); // Clear middle name input
                            $("#lname").val(''); // Clear last name input
                            $("#snumber").val(''); // Clear phone number input
                            $("#dept").val(''); // Clear department select input
                            $("#drpsem2").val(''); // Clear semester select input
                            $("#drpfacult2").val(''); // Clear faculty class select input
                            $("#gen").val(''); // Clear gender select input
                            $("#pass").val(''); // Clear password input
                            DataBind();
                        },
                        error: function (response) {
                            alert(response.responseText);
                        }
                    });
                } else {


                    // Check if sem is '0' or contains non-letter characters
                    if (sem === 0) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Input',
                            text: 'Please select a valid class.',
                        });
                        return;
                    }
                    else {
                        $.ajax({
                            url: 'studentopera.aspx/updateData',
                            data: JSON.stringify(data),
                            dataType: "json",
                            type: 'POST',
                            contentType: "application/json",
                            success: function (response) {
                                console.log(response);
                                $("#myModal").modal("hide");
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

                }
            }

        
        }








       DataBind();
        function DataBind() {
            $.ajax({
                url: 'studentopera.aspx/DataBind',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                 console.log(response)
              
           /*         swal("Good job!", "You clicked the button!", "success");*/
                    $("#datatablee tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#datatablee tbody").append(
                            "<tr style='cursor:pointer' onclick='passValue(this)'>"
                            + "<td>" + response.d[i].id + "</td>"
                             + "<td>" + response.d[i].fist + "</td>"
                           + "<td>" + response.d[i].middle + "</td>"
                            + "<td>" + response.d[i].last + "</td>"
                            + "<td>" + response.d[i].facults + "</td>"
                            + "<td>" + response.d[i].classname + "</td>"
                            + "<td>" + response.d[i].semesters + "</td>"
                            + "<td>" + response.d[i].departments + "</td>"
                    
                            + "<td>" + response.d[i].gender + "</td>"
                        
                            + "<td>" + response.d[i].number + "</td>"
                          
                    











                   



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
                url: 'studentopera.aspx/Search_id',
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
                            + "<td>" + response.d[i].fist + "</td>"
                            + "<td>" + response.d[i].middle + "</td>"
                            + "<td>" + response.d[i].last + "</td>"
                            + "<td>" + response.d[i].facults + "</td>"
                            + "<td>" + response.d[i].classname + "</td>"
                            + "<td>" + response.d[i].semesters + "</td>"
                            + "<td>" + response.d[i].departments + "</td>"

                            + "<td>" + response.d[i].gender + "</td>"

                            + "<td>" + response.d[i].number + "</td>"

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


    document.getElementById("stdid").value = cell[0].innerHTML;
    document.getElementById("gen").value = cell[8].innerHTML;
  document.getElementById("fname").value = cell[1].innerHTML;
  document.getElementById("mname").value = cell[2].innerHTML;
  document.getElementById("lname").value = cell[3].innerHTML;


    document.getElementById("snumber").value = cell[9].innerHTML;







    $.ajax({
        url: 'studentopera.aspx/stddetails',
        data: JSON.stringify({ 'celvalue': celvalue }),
        dataType: "json",
        type: 'POST',
        contentType: "application/json",
        success: function (response) {
            console.log(response);

            // Assuming your response structure
            var bookDetails = response.d[0]; // Accessing the first (and only) object in the array

            $("#pass").val(bookDetails.pass);

            $("#dept option").each(function () {
                if ($(this).text().trim() === bookDetails.facul.trim()) {
                    $(this).prop('selected', true);
                }
            });


            // Clear existing options for drpsem21
            $("#drpsem2").empty();

            // Assuming bookDetails.facul is the value you want to set
            var facultyValue = bookDetails.department.trim();

            // Add a new option with the facultyValue as both value and text
            $("#drpsem2").append('<option value="' + facultyValue + '">' + facultyValue + '</option>');

            $("#drpfacult2").empty();
            // Assuming bookDetails.facul is the value you want to set
            var facultyValue1 = bookDetails.classname.trim();

            // Add a new option with the facultyValue as both value and text
            $("#drpfacult2").append('<option value="' + facultyValue1 + '">' + facultyValue1 + '</option>');



        

            $("#myModal").modal("show");
        },
        error: function (response) {
            console.error("Error:", response);
            // Handle errors more gracefully, e.g., display an error message to the user
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
