<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="library.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="style.css" />
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
       <script defer src="assets2/plugins/fontawesome/js/all.min.js"></script>
   
    <!-- App CSS -->  
    <link  rel="stylesheet" href="assets2/css/portal.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    

         <style>
 body {
        margin: 0;
        font-family: "Poppins", sans-serif;
        background-color: var(--bg-color);
        color: var(--text-color);
    }

    main {
        max-width: 100%;
        margin: 1rem auto 0;
        background-color: #fff;
        padding: 1rem;
        box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
    }

    .bottom-bar {
        background-color: #e7edf9;
        text-align: center;
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: 100;
        border-radius: 20px 20px 0 0;
    }

    .icon {
        font-size: 1.5em;
        padding: .5em;
        margin: .5em;
        margin-top: 0;
        transition: .5s ease-in-out;
        border-radius: 100%;
        border: 7px solid #eee;
    }

    .active {
        transform: scale(1.25) translateY(-1em);
        background: linear-gradient(135deg, rgb(17, 16, 40), #250c1a);
        border: 7px solid #9a9ac3;
        color: white;
    }

    /* Mobile-first media query */
    @media (max-width: 768px) {
        main {
            padding: 0.5rem;
        }
    }
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap");

:root {
  --bg-color: #f6f8fa;
  --text-color: #1d1f27;
  --main-color: #3a3dbe;
}

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

body {
  padding: 2rem;
  font-family: "Poppins", sans-serif;
  background-color: var(--bg-color);
  color: var(--text-color);
}

h1 {
  text-align: center;
  font-size: 1.5rem;
}

h3,
header,
ul {
  margin-bottom: 0.5rem;
}

main {
  max-width:10000px;
  margin: 1rem auto;
  background-color: #fff;
  padding: 1rem;
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
}

header {
  background-color: var(--main-color);
  color: #fff;
  padding: 1rem;
  text-align: center;
  border-radius: 5px;
  display: flex;
  flex-wrap: wrap;
}

header div {
  padding: 5px;
}

header div:first-child {
  flex-basis: 100%;
  font-size: 2.25rem;
  font-weight: 600;
}

header div:nth-child(n + 2) {
  flex-basis: 50%;
  font-size: 1.25rem;
  font-weight: 500;
}

header h5 {
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
}

form {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

form input:not(#type),
form button {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  margin-bottom: 5px;
  height: 42px;
  font-family: "Poppins", sans-serif;
  font-size: 1rem;
}

form button {
  background-color: var(--main-color);
  color: #fff;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
}

form label {
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
}

form div:nth-child(-n + 2) {
  flex-basis: 100%;
}

form div:nth-child(n + 3) {
  flex-basis: calc(50% - 5px);
}

input#type {
  appearance: none;
  position: absolute;
}

.option {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px;
  background: #eee;
  border-radius: 5px;
  position: relative;
}

.option span {
  width: 50%;
  text-align: center;
  cursor: pointer;
  z-index: 2;
}

.option::before {
  content: "";
  position: absolute;
  top: 5px;
  left: 0;
  background-color: #fff;
  height: calc(100% - 10px);
  width: calc(50% - 10px);
  transform: translateX(5px);
  border-radius: inherit;
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
  transition: all 200ms;
}

input#type:checked ~ .option::before {
  left: 50%;
}

ul {
  list-style-type: none;
}

ul li {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  padding: 5px 10px;
  position: relative;
}

ul li:hover {
  background: rgba(0, 0, 0, 0.1);
}

.name {
  flex: 1;
}

.name h4 {
  font-size: 1rem;
  font-weight: 600;
  text-transform: capitalize;
}

.name p {
  font-size: 0.8rem;
  color: #555;
}

.amount {
  font-weight: 600;
}

.amount.income {
  color: yellowgreen;
}

.amount.expense {
  color: indianred;
}

.action {
  position: absolute;
  top: 0;
  right: 0;
  background-color: #f00;
  color: #fff;
  height: 100%;
  width: 50px;
  display: grid;
  place-items: center;
  transform: scaleX(0);
  transform-origin: right;
  transition: all 300ms;
}

ul li:hover .action {
  transform: scaleX(1);
}

.action svg {
  width: 36px;
  height: 36px;
  cursor: pointer;
}

#status {
  text-align: center;
  margin-bottom: 0.5rem;
}
 </style>

</head>


    
<body>
    <form id="form1" runat="server">
          

        <!-- Modal for inserting new message -->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="insertModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="insertModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="insertForm">
                    <div class="form-group">
                        <label for="std_id">Student ID:</label>
                        <input type="text" class="form-control" id="std_id" name="std_id">
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <input type="text" class="form-control" id="description" name="description">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Button trigger for modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertModal" style="display:none">
   
</button>

      <main>
          	
		 <div class="app-utility-item app-notifications-dropdown dropdown" onclick="dropdownMenuClicked()">    
				            <a class="dropdown-toggle no-toggle-arrow" id="notifications-dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" title="Notifications">
					            <!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
<i class="bi bi-bell-fill" style="font-size: 26px;"></i>

					            <span class="icon-badge"><asp:Label ID="Label3" runat="server" Text=""></asp:Label></span>
					        </a><!--//dropdown-toggle-->
					        
					        <div class="dropdown-menu p-0" aria-labelledby="notifications-dropdown-toggle">
					            <div class="dropdown-menu-header p-3">
						            <h5 class="dropdown-menu-title mb-0">Notifications</h5>
						        </div><!--//dropdown-menu-title-->

						        <div class="dropdown-menu-content">
                                      <asp:ListView ID="transactionsListView" runat="server" >
                <ItemTemplate>
							       <div class="item p-3">
								        <div class="row gx-2 justify-content-between align-items-center">
									        <div class="col-auto">
										   
                                                <img  class="profile-image" src="klogo-removebg-preview.png" />
									        </div><!--//col-->
									        <div class="col">
										        <div class="info"> 
											  <div class="desc">
    <%# TruncateDescription(Eval("description").ToString(), 50) %>
</div>

											        <div class="meta"><%# FormatDate(Eval("date")) %></div>
										        </div>
									        </div><!--//col--> 
								        </div><!--//row-->
								        <a class="link-mask" href="notifications.html"></a>
							       </div><!--//item-->
							           </ItemTemplate>
            </asp:ListView>
						        </div><!--//dropdown-menu-content-->
						        
						        <div class="dropdown-menu-footer p-2 text-center">
							        <a href="notifications.html">View all</a>
						        </div>
															
							</div><!--//dropdown-menu-->					        
				       
      </div>
          <asp:Label ID="Label1" runat="server" Text="455"></asp:Label>
      <header>
        <div>
        <span>total visitation</span>
            <br />
          <span id="balance"><asp:Label ID="Label2" runat="server" Text=""></asp:Label></span>
        </div>
    
      </header>

      <section>
        <h3>Transactions</h3>
        <asp:GridView ID="GridView1" runat="server" Class="table" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound">


                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5f27cd" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />

    </asp:GridView>
      
      </section>
            

      

    </main>
                <div class="bottom-bar">
      <ion-icon name="home-outline" class="icon" onclick="change(this)">
      </ion-icon>
      <ion-icon name="folder-outline" class="icon" onclick="change(this)">
      </ion-icon>
      <ion-icon name="add-circle-outline" class="icon active" onclick="change(this)">
      </ion-icon>
      <ion-icon name="person-outline" class="icon" onclick="change(this)">
      </ion-icon>
      <ion-icon name="image-outline" class="icon" onclick="change(this)">
      </ion-icon>
    </div>
<script>
    function change(item) {
        const buttons = document.querySelectorAll('ion-icon');
        buttons.forEach(function (obj) {
            obj.classList.remove("active");
        });
        item.classList.add("active");
    }
</script>
          </form>

    <script>
    DataBind();
       function DataBind() {
           $.ajax({
               url: 'costomerreg.aspx/DataBind',
               dataType: "json",
               type: 'POST',
               contentType: "application/json",
               success: function (response) {
                   $("#tableStudents tbody").empty();

                   for (var i = 0; i < response.d.length; i++) {
                       $("#tableStudents tbody").append(
                       
                           "<tr style='cursor:pointer' onclick='passValue(this)'>"
                           + "<td>" + response.d[i].id + "</td>"
                           + "<td>" + response.d[i].name + "</td>"
                           + "<td>" + response.d[i].phone+ "</td>"
                      
                           + "</tr>")
                   }

               },
               error: function (response) {
                   alert(response.responseText);
               }
           });
       };
    </script>
            <script src="assets2/plugins/popper.min.js"></script>
    <script src="assets2/plugins/bootstrap/js/bootstrap.min.js"></script>  

    <!-- Charts JS -->
    <script src="assets2/plugins/chart.js/chart.min.js"></script> 
    <script src="assets2/js/index-charts.js"></script> 
    
    <!-- Page Specific JS -->
    <script src="assets2/js/app.js"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="script.js"></script>

    <script>
    // Function to handle dropdown menu click
    function dropdownMenuClicked() {
        // Assuming you have jQuery available
        $.ajax({
            type: "POST",
            url: "student.aspx/UpdateIsUnread",
            data: "{}", // You can pass data here if needed
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                // Handle success response if needed
                console.log("IsUnread updated successfully.");
            },
            error: function(xhr, status, error) {
                // Handle error if needed
                console.error("Error updating IsUnread:", error);
            }
        });
    }
    </script>

</body>












</html>
