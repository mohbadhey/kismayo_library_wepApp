<%@ Page Title="" Language="C#" MasterPageFile="~/mobilemaster.Master" AutoEventWireup="true" CodeBehind="userdetails.aspx.cs" Inherits="library.userdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1.0 , maximum-scale=1.0, user-scalable=0">
        <!-- Ensure you include jQuery and Bootstrap's JavaScript files -->

<script src="assets/jquery.min.js"></script>
    <script src="assets2/bootstrap.min.js"></script>
    <link href="assets2/bootstrap.min.css" rel="stylesheet" />
<!-- Ensure you include Bootstrap's CSS file -->

    

    
<style>
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
    font-size: 16px; /* Increased text size */
}

.invoice {

    width: 100%;
    height: 80vh; /* 100% of the viewport height */
   
    background-color: var(--white-color);
 margin-top: 5vh;
 

    min-height: 600px; /* You can adjust this value if needed */
    box-sizing: border-box; /* Include padding and border in width and height */
}

.invoice-foot {
    padding: 30px 0;
}

.invoice-foot p {
    font-size: 16px; /* Increased text size */
}

.invoice-btns {
    margin-top: 10px;
    display: flex;
   justify-content: space-between
    color: white;
}

.invoice-btns button {
    margin-right: 40px; /* Added space between buttons */
    width: 20vw;
    padding: 5px 10px; /* Increased padding */
    font-size: 20px; /* Increased text size */
    color: white;
}

.invoice-btns button:last-child {
    margin-right: 0;
}

@media screen and (max-width: 992px) {
    .invoice {
        padding: 40px;
    }
 .invoice-btns button {
        width: 100%;
        margin-right: 10;
    }
}

@media screen and (max-width: 576px) {
    .invoice {
        padding: 28px;
    }

    .invoice-btns button {
        width: 100%;
        margin-right: 10;
    }
}

@media screen and (max-width: 768px) {
    .f1 {
        font-size: 18px; /* Increased text size */
    }
 .invoice-btns button {
        width: 100%;
        margin-right: 10;
    }
}

@media screen and (max-width: 576px) {
    .f1 {
        font-size: 16px; /* Increased text size */
    }
 .invoice-btns button {
        width: 100%;
        margin-right: 10;
    }
}
  .f1 {
        font-size: 18px; /* Increased text size */
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="cpass">Current Password</label>
                    <input type="password" class="form-control" id="cpass" name="cpass">
                    <label for="passwordError" id="passwordError" class="text-danger" style="display: none;">Password error</label>
                    <label for="less8charac" id="less8charac" class="text-danger" style="display: none;">Enter Minimum 8 characters</label>
                </div>
                <div class="form-group">
                    <label for="npass">New Password</label>
                    <input type="password" class="form-control" id="npass" name="npass" disabled>
                    <label for="less8charac2" id="less8charac2" class="text-danger" style="display: none;">Enter Minimum 8 characters</label>
                </div>
                <div class="form-group">
                    <label for="conpass">Confirm Password</label>
                    <input type="password" class="form-control" id="conpass" name="conpass" disabled>
                    <label for="less8charac3" id="less8charac3" class="text-danger" style="display: none;">Enter Minimum 8 characters</label>
                    <label for="passwordMismatchError" id="passwordMismatchError" class="text-danger" style="display: none;">Password mismatch</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="btnsubmit" class="btn btn-primary" onclick="updatepass()" disabled>Update</button>
            </div>
        </div>
    </div>
</div>

<div class="invoice">
    <div class="row">
        <div class="col-9">
            


            <div class="row">
                <div class="col-12">
                    <p><span class="text-bold f1">STUDENT NAME</span>: <span id="studentName"></span></p>
                </div>

                <div class="col-12">
                    <p><span  class="text-bold f1">STUDENT ID</span>: <span id="studentID"></span></p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                  
                        <p><span class="text-bold f1">DEPARTMENT NAME</span>: <span id="departmentName"></span></p>
                      </div>
                    <div class="col-12">
                        <p><span class="text-bold f1">FACULTY NAME</span>: <span id="facultyName"></span></p>
                    </div>
                    <div class="col-12">
                        <p><span class="text-bold f1">SEMESTER NAME</span>: <span id="semesterName"></span></p>
                    </div>
             
                <div class="col-12">
                    <p><span class="text-bold f1">Class Name </span>: <span id="phonen"></span></p>
                </div>
            </div>
        </div>

        <div class="invoice-foot text-center">
            <div class="invoice-btns">
               <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    <i class="fa-solid fa-unlock"></i>
    <span>Change Password</span>
</button>

                <button type="button" class="btn btn-primary" id="logoutButton">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    <span>Log Out</span>
                </button>
            </div>
        </div>
    </div>
</div>

 <script>

     $(document).ready(function () {
         $("#logoutButton").click(function () {
             // Make AJAX request to clear the session
             $.ajax({
                 type: "POST",
                 url: "userdetails.aspx",
                 success: function (response) {
                     // Check if the logout was successful
                     if (response === "success") {
                         // Redirect the user to the login page
                         window.location.href = "studentlgn.aspx";
                     } else {
                         alert("Logout failed");
                     }
                 },
                 error: function (xhr, status, error) {
                     console.error("AJAX Error: " + error);
                 }
             });
         });
     });



     // Add an event listener to the input field
     $("#cpass").on('blur', function () {
         // Get the entered password value
         var enteredPassword = $(this).val();

         // Check if the entered password has a minimum length of 8 characters
         if (enteredPassword.length >= 8) {
             // Call the checkpass function
             checkpass();
             $('#btnsubmit').prop('disabled', true);
         } else {
             $('#less8charac').show();
             $('#passwordError').hide();
             $('#passwordMismatchError').hide();
             $('#btnsubmit').prop('disabled', true);
         }
     });

     $("#npass").on('blur', function () {
         // Get the entered password value
         var enteredPassword = $(this).val();

         // Check if the entered password has a minimum length of 8 characters
         if (enteredPassword.length >= 8) {
             // Call the checkpass function
             // Password is incorrect, disable the input field
             $('#conpass').prop('disabled', false);

             $('#less8charac2').hide();
             $('#passwordMismatchError').hide();
             $('#btnsubmit').prop('disabled', true);
         } else {
             $('#less8charac2').show();
             $('#conpass').prop('disabled', true);
             $('#passwordMismatchError').hide();
             $('#btnsubmit').prop('disabled', true);
         }
     });
     $("#conpass").on('blur', function () {
         // Get the entered password value
         var enteredPassword = $(this).val();

         // Get the entered confirm password value
         var enteredConfirmPassword = $(this).val();

         // Get the value of the new password
         var newPassword = $("#npass").val();



         if (enteredPassword.length >= 8) {

             // Check if the entered confirm password matches the new password
             if (enteredConfirmPassword === newPassword) {
                 // If they match, hide any error messages related to password mismatch
                 $('#passwordMismatchError').hide();

                 $('#less8charac3').hide();
                 $('#btnsubmit').prop('disabled', false);
             } else {
                 // If they don't match, show an error message indicating password mismatch
                 $('#passwordMismatchError').show();

                 $('#less8charac3').hide();
                 $('#btnsubmit').prop('disabled', true);
             }

         } else {
             $('#less8charac3').show();
             $('#btnsubmit').prop('disabled', true);

         }





     });


     function checkpass() {
         var id = document.getElementById("stdid").innerHTML;
         var enteredPassword = $("#cpass").val();

         $.ajax({
             url: 'userdetails.aspx/CheckPassword',
             data: JSON.stringify({ std_id: id, enteredPassword: enteredPassword }),
             contentType: 'application/json; charset=utf-8',
             dataType: 'json',
             type: 'POST',
             success: function (rentResponse) {
                 console.log(rentResponse);

                 if (rentResponse.d === true) {
                     $('#npass').prop('disabled', false);
                     // Password is correct

                     // Hide the password error label
                     $('#passwordError').hide();
                     $('#less8charac').hide();

                 } else {
                     // Password is incorrect, disable the input field
                     $('#npass').prop('disabled', true);
                     // Show the password error label
                     $('#passwordError').show();
                     $('#less8charac').hide();
                     // Password is incorrect

                 }
             },
             error: function (rentError) {
                 console.log(rentError);
             }
         });
     }

     // Function to hide the modal and remove the backdrop
     function hideModal() {
         var modal = document.getElementById('exampleModal');
         modal.style.display = 'none';

         // Remove the modal backdrop
         var modalBackdrops = document.getElementsByClassName('modal-backdrop');
         // Remove each backdrop element
         for (var i = 0; i < modalBackdrops.length; i++) {
             modalBackdrops[i].parentNode.removeChild(modalBackdrops[i]);
         }
     }




     function updatepass() {
         var id = document.getElementById("stdid").innerHTML;

         var update = $("#conpass").val();

         $.ajax({
             url: 'userdetails.aspx/updatepassword',
             data: "{ 'id':'" + id + "','update':'" + update + "'} ",
             contentType: 'application/json; charset=utf-8',
             dataType: 'json',
             type: 'POST',
             success: function (rentResponse) {
                 console.log(rentResponse);
                 hideModal(); 
                 Swal.fire(
                     'Successfully updated!',
                     'Waat iSKA Badashay  Passwordka!',
                     'success'
                 );
                 $("#cpass").val(''); // Clear current password input
                 $("#npass").val(''); // Clear new password input
                 $("#conpass").val(''); // Clear confirm password input
             },
             error: function (rentError) {
                 console.log(rentError);
             }
         });
     }







     $(document).ready(function () {


         var id = document.getElementById("stdid").innerHTML



         $.ajax({
             url: 'userdetails.aspx/stddetails',
             data: "{'id':'" + id + "'}",
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
     });
 </script>
</asp:Content>
