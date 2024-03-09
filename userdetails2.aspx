<%@ Page Title="" Language="C#" MasterPageFile="~/website.Master" AutoEventWireup="true" CodeBehind="userdetails2.aspx.cs" Inherits="library.userdetails2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/jquery.min.js"></script>
    <script src="assets2/bootstrap.min.js"></script>
    <link href="assets2/bootstrap.min.css" rel="stylesheet" />
<!-- Ensure you include Bootstrap's CSS file -->

    

        <style>
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
    min-height: 100vh;
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
    margin-top: 10px;
    display: flex;
    justify-content: center;
color: white;
}

.invoice-btns button {
    margin-right:80px; /* Adjust as needed */
      width: 150px; /* Adjust the width as needed */
    padding: 5px 10px; /* Adjust padding as needed */
    font-size: 11px; /* Adjust font size as needed */
color: white;
}

.invoice-btns button:last-child {
    margin-right: 0; /* Reset margin for the last button */
}


.invoice-btn {
    padding: 9px 12px;
    color: white;
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
    <div class="invoice-container">
        <div class="invoice-head student">
            <div class="invoice-head-middle">
                <div class="invoice-head-middle-left text-start">
                    <p><span class="text-bold">STUDENT NAME</span>: <span id="studentName"></span></p>
                </div>
                <div class="invoice-head-middle-right text-end">
                    <p><span class="text-bold">STUDENT ID</span>: <span id="studentID"></span></p>
                </div>
            </div>
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
                </div>
                <div class="invoice-head-middle-right text-end">
                    <p><span class="text-bold">Class Name </span>: <span id="phonen"></span></p>
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
             url: 'userdetails2.aspx/CheckPassword',
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

     function updatepass() {
         var id = document.getElementById("stdid").innerHTML;

         var update = $("#conpass").val();

         $.ajax({
             url: 'userdetails2.aspx/updatepassword',
             data: "{ 'id':'" + id + "','update':'" + update + "'} ",
             contentType: 'application/json; charset=utf-8',
             dataType: 'json',
             type: 'POST',
             success: function (rentResponse) {
                 console.log(rentResponse);
                 $('#exampleModal').modal('hide');
                 Swal.fire(
                     'Successfully updated!',
                     'Book Ayaa Soo Celise!',
                     'success'
                 );
             
             },
             error: function (rentError) {
                 console.log(rentError);
             }
         });
     }





     document.getElementById('logoutButton').addEventListener('click', function () {
         // Perform logout action (e.g., clear session, reset authentication state, etc.)

         // Clear session variables
         // Example code assuming the session variables are named "std_id" and "otherSessionVariable"
         sessionStorage.removeItem('std_id');
         sessionStorage.removeItem('otherSessionVariable');

         // Redirect to studentlogin.aspx
         window.location.href = 'studentlgn.aspx';
     });



     $(document).ready(function () {

       
         var id = document.getElementById("stdid").innerHTML
         
      

     $.ajax({
         url: 'userdetails2.aspx/stddetails',
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
