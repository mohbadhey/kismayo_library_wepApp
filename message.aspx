<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="library.message" %>
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
    .table-responsive {
        overflow-x: auto;
    }

    #messageTable td {
        word-wrap: break-word;
        white-space: normal; /* This will allow the content to wrap */
        max-width: 200px; /* You can adjust the maximum width as needed */
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <!-- Modal for inserting new message -->
<!-- Button trigger for modal -->
   <div class="container">
    <h2>Insert Message</h2>
    <br />
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="add()">SEND Message</button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                                  <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert Visitation</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="std_id">Student ID:</label>
                        <input type="text" class="form-control" id="std_id" name="std_id">
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <input type="text" class="form-control" id="description" name="description">
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="submitForm()">Send</button>
                
                </div>
            </div>
        </div>
    </div>

    <h2>Messages</h2>
    <div class="table-responsive">
        <table class="table table-bordered" id="messageTable">
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="messageTableBody">
                <!-- Data will be displayed here -->
            </tbody>
        </table>
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
               $('#exampleModal').modal('hide'); // Hide the modal when the button is clicked
           });
       });


       function add() {

           $('#exampleModal').modal('show');
       }
        function submitForm() {
            var std_id = $("#std_id").val();
            var description = $("#description").val();

            $.ajax({
                type: "POST",
                url: "message.aspx/InsertMessage",
                data: JSON.stringify({ std_id: std_id, description: description }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    $("#std_id").val("");
                    $("#description").val("");

                    $('#exampleModal').modal('hide');
                    Swal.fire(
                        'Good job!',
                        'You Sent  A Message!',
                        'success'
                    )
                    loadMessages();
                },
                error: function () {
                    alert("Error while inserting message.");
                }
            });
        }

        function loadMessages() {
            $.ajax({
                type: "POST",
                url: "message.aspx/GetMessages",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var tbody = $("#messageTableBody");
                    tbody.empty();
                    $.each(response.d, function (index, message) {
                        var row = "<tr>" +
                                      "<td>" + message.std_id + "</td>" +
                                      "<td>" + message.description + "</td>" +
                                      "<td>" + message.date + "</td>" +
                                      "<td>" +
                                          "<button class='btn btn-danger' onclick='deleteMessage(" + message.m_id + ")'>Delete</button>" +
                                       
                                      "</td>" +
                                  "</tr>";
                        tbody.append(row);
                    });
                },
                error: function () {
                    alert("Error while loading messages.");
                }
            });
        }

        function deleteMessage(messageId) {
            $.ajax({
                type: "POST",
                url: "message.aspx/DeleteMessage",
                data: JSON.stringify({ messageId: messageId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    loadMessages();
                },
                error: function () {
                    alert("Error while deleting message.");
                }
            });
        }

    function updateMessage(messageId) {
    // Find the message with the given ID
    var messageToUpdate = messages.find(message => message.m_id === messageId);

    // Populate the form fields with message details
    $("#updateMessageId").val(messageToUpdate.m_id);
    $("#updateStudentId").val(messageToUpdate.std_id);
    $("#updateDescription").val(messageToUpdate.description);

    // Display the update form
    $("#updateForm").show();
}

// Submit handler for update form
$("#updateMessageForm").submit(function (event) {
    event.preventDefault();

    // Get form data
    var formData = $(this).serializeArray();
    var updatedMessage = {};
    $(formData).each(function(index, obj){
        updatedMessage[obj.name] = obj.value;
    });

    // Send AJAX request to update message
    $.ajax({
        type: "POST",
        url: "message.aspx/UpdateMessage",
        data: JSON.stringify(updatedMessage),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function () {
            // Reload messages after update
            loadMessages();
            // Hide the update form
            $("#updateForm").hide();
        },
        error: function () {
            alert("Error while updating message.");
        }
    });
});

$(document).ready(function () {
    loadMessages();
});

   </script>



</asp:Content>
