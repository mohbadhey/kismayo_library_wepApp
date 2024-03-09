<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="adminaccount.aspx.cs" Inherits="library.adminaccount" %>
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
                                    <h1>  Admin Details </h1>
                                  
                                </div>

                            </div>

                        </div>
   
        <div class="container-fluid text-white ">

  
            <div class="row p-4">



            

       <%--         <div class="col-4">
                           <button type="button" class="btn btn-primary pull-right" onclick="addNew()">
  <i class="fas fa-plus"></i>  change Password
</button>
  </div>  --%>
             
              
            
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
   <th scope="col" >username</th>
  <th scope="col">password</th>


                         

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
  
    <h4 class="modal-title text-white mx-auto"> Admin Operation</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
       

            <!-- Modal body -->
            <div class="modal-body ">
                <div class="container border border-info"> 
   <div class="row">
 

  <div class="col-4">
   
    <div class="row mt-4 mb-4">
        <label for="firstname" class="col-sm-3 col-form-label">ID</label>
        <div class="col-sm">
            <input type="text" id="id" class="form-control" disabled="disabled">
        </div>
    </div>

    <div class="row mt-4 mb-4">
        <label for="middlename" class="col-sm-3 col-form-label">UserName</label>
        <div class="col-sm">
            <input type="text" id="user" class="form-control">
        </div>
    </div>

    <div class="row mt-4 mb-4">
        <label for="lastname" class="col-sm-3 col-form-label">PassWord</label>
        <div class="col-sm">
            <input type="text" id="pass" class="form-control">
        </div>
    </div>
</div>



</div>

  
           
  
    </div> 

            </div>



            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                <a href="#" class="btn btn-success" onclick="updateinfo()" id="btnSubmit">Update</a>



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
                $('#myModal3').modal('hide'); // Hide the modal when the button is clicked
            });
        });




        DataBind();
        function DataBind() {
            $.ajax({
                url: 'adminaccount.aspx/DataBind2',
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
                            + "<td>" + response.d[i].username + "</td>"
                            + "<td>" + response.d[i].password + "</td>"
             






                            + "</tr>")
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }


        function updateinfo() {
            var user = $("#user").val();
            var pass = $("#pass").val();
          



            var id = $("#id").val();



            $.ajax({
                url: 'adminaccount.aspx/updatepass',
                data: "{ 'id':'" + id + "' , 'user':'" + user + "','pass':'" + pass + "' } ",

                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal3").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a your Data!',
                        'success'
                    )
                    DataBind();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }





        function passValue(row) {

            var cell = row.cells;
            var celvalue = cell[0].innerHTML;


            document.getElementById("id").value = cell[0].innerHTML;
            document.getElementById("user").value = cell[1].innerHTML;
            document.getElementById("pass").value = cell[2].innerHTML;
         


            
            $("#myModal3").modal("show");
        }





    </script>

</asp:Content>
