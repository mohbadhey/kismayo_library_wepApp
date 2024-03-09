<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="Dhashboard.aspx.cs" Inherits="library.Dhashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
    .highlight-row {
        background-color: red;
        color: white;
    }
    table {
  width: 100%;
}

th {
  height: 70px;
}

#uu {
  background-color: white;
}

th, td {
  padding: 9px;
  text-align: left;
}
#bh {
background: hsla(159, 82%, 55%, 1);

background: linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

background: -moz-linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

background: -webkit-linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#2FEAA8", endColorstr="#028CF3", GradientType=1 );
}
#bh2 {
background: hsla(159, 82%, 55%, 1);

background: linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

background: -moz-linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

background: -webkit-linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#2FEAA8", endColorstr="#028CF3", GradientType=1 );
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

   
    <section class="section dashboard" id="bh">


          <div class="container-xl p-0">
			    
			
			    
	
				    
			    <div class="row g-4 mb-4 mt-1">
				  			       <div class="col-6 col-lg-2">
 
			    <div class="app-card app-card-stat bg-danger shadow-sm h-100">
  
        <div class="row ">  
            <div class="col-12 mt-3"> <h4 class="stats-type mb-1 text-white">Total Books </h4></div>
           </div>
              	  
        <div class="row">
                <div class="col-1"></div>
            <div class="col-3"> 
                <img src="images/Iconsmind-Outline-Books-2.512.png"  height="70"/>

            </div>
             <div class="col-1">
                       	    <div class="app-card-body p-3 p-lg-4">

			    <div class="stats-figure text-white">
								<span id="noofbooks"></span>
			    </div>
			    
</div><!--//app-card-body-->
				
             </div>
            <div class="col-5"></div>
        </div>
 
			
			    </div><!--//app-card-->
</div><!--//col-->
				       <div class="col-6 col-lg-2">
     
				    <div class="app-card app-card-stat bg-info shadow-sm h-100">
      
            <div class="row ">  
                <div class="col-12 mt-3"> <h4 class="stats-type mb-1 text-white">Total Books Available</h4></div>
               </div>
               	  
            <div class="row">
                    <div class="col-1"></div>
                <div class="col-3">     <img src="images/Iconsmind-Outline-Books-2.512.png"  height="70"/>   </div>
                 <div class="col-1">
                        	    <div class="app-card-body p-3 p-lg-4">

				    <div class="stats-figure text-white">
									<span id="noofbooks2"></span>
				    </div>
				    
    </div><!--//app-card-body-->
					
                 </div>
                <div class="col-5"></div>
            </div>
     
				
				    </div><!--//app-card-->
    </div><!--//col-->
                    			       <div class="col-6 col-lg-2">
 
			    <div class="app-card app-card-stat bg-info shadow-sm h-100">
  
        <div class="row ">  
            <div class="col-12 mt-3"> <h4 class="stats-type mb-1 text-white">Total Books Rented</h4></div>
           </div>
              	  
        <div class="row">
                <div class="col-1"></div>
            <div class="col-3">     <img src="images/Iconsmind-Outline-Books-2.512.png"  height="70"/>   </div>
             <div class="col-1">
                       	    <div class="app-card-body p-3 p-lg-4">

			    <div class="stats-figure text-white">
								<span id="noofbooks3"></span>
			    </div>
			    
</div><!--//app-card-body-->
				
             </div>
            <div class="col-5"></div>
        </div>
 
			
			    </div><!--//app-card-->
</div><!--//col-->
                 <div class="col-6 col-lg-2"></div>
				    <div class="col-6 col-lg-2">
                     
					    <div class="app-card app-card-stat bg-primary shadow-sm h-100">
                      
                            <div class="row ">  
                                <div class="col-12 mt-3"> <h4 class="stats-type mb-1 text-white">Total Students</h4></div>
                               </div>
                            	  
                            <div class="row">
                                    <div class="col-1"></div>
                                <div class="col-3"> <img src="images/Iconsmind-Outline-Student-Male.512.png" height="70"/>     </div>
                                 <div class="col-1">
                                     	    <div class="app-card-body p-3 p-lg-4">
				
					    <div class="stats-figure text-white">
										<span id="students"></span>
					    </div>
					    
				    </div><!--//app-card-body-->
						
                                 </div>
                                <div class="col-5"></div>
                            </div>
                     
					
					    </div><!--//app-card-->
				    </div><!--//col-->
							       <div class="col-6 col-lg-2">
 
			    <div class="app-card app-card-stat bg-success shadow-sm h-100">
  
        <div class="row ">  
            <div class="col-12 mt-3"> <h4 class="stats-type mb-1 text-white">Total Visitors</h4></div>
           </div>
              	  
        <div class="row">
                <div class="col-1"></div>
            <div class="col-3"> <img src="images/Iconsmind-Outline-Student-Male.512.png" height="70"/>     </div>
             <div class="col-1">
                       	    <div class="app-card-body p-3 p-lg-4">

			    <div class="stats-figure text-white">
								<span id="visitors"></span>
			    </div>
			    
</div><!--//app-card-body-->
				
             </div>
            <div class="col-5"></div>
        </div>
 
			
			    </div><!--//app-card-->
</div><!--//col-->
                 
					
			    </div>

	  <div class="row">


		  <div class="col-8">
             
			   


              <div class="row mb-5">
                  <div class="col-12">
                                <div class="card mb-2">
  <div class="card-body" id="bh2">
    <h1 class="card-title text-white text-center">Picture Of Faculties</h1>

    <!-- Slides with indicators -->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="assets/img/slides-1.jpg" class="d-block w-100" alt="...">

        </div>
        <div class="carousel-item">
          <img src="assets/img/slides-2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="assets/img/slides-3.jpg" class="d-block w-100" alt="...">
        </div>
      </div>

      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>

    </div><!-- End Slides with indicators -->

  </div>
</div>
                  </div>

              
              </div>
              <div class="row">
         <h1 class="text-white"> Most Visitation</h1>

    <div class="col-12">
        		         <div class="container text-white ">
                       
         
           <table class="table datatable text-white" id="datatablee">
    <thead>
        <tr>
            <th scope="col">Student ID</th>
            <th scope="col">Name</th>
            
            <th scope="col">Visitation times</th>

        </tr>
    </thead>
    <tbody>
    </tbody>
</table>
      
      </div>


    </div>
</div>
		  </div>
        
        
          	  
		  <div class="col-4">
			                <div class="row">
                       <h1 class="text-white"> Missing Books</h1>
    <!-- Table with stripped rows -->
    <table  id="datatablee1" class="text-white">
        <thead class="text-white">
            <tr>
  


                 
           <th scope="col">Student Name</th>
            <th scope="col">Book Name</th>
       

              <th scope="col">Days Exceeded</th>
          



             

            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <div id="pagination" class="pagination-container"></div>
    <!-- End Table with stripped rows -->
</div>
              <br />
               <br />
          <!-- Recent Activity -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title">Recent Activity <span>| Today</span></h5>

              <div class="activity">

            

              </div>

            </div>
          </div><!-- End Recent Activity -->



            
		  </div>
	  </div>



	  </div>
    </section>



	<script>




        bookcount();

        function bookcount() {
            $.ajax({
                url: 'Dhashboard.aspx/GetRowCount',
                 dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);



                    // Assuming your response structure
                    var rowCount = response.d;

                    // Update the element where you want to display the count
                    $("#noofbooks").text(rowCount);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }



        bookcount2();

        function bookcount2() {
            $.ajax({
                url: 'Dhashboard.aspx/GetRowCount2',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);



                    // Assuming your response structure
                    var rowCount = response.d;

                    // Update the element where you want to display the count
                    $("#noofbooks2").text(rowCount);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }
        bookcount3();

        function bookcount3() {
            $.ajax({
                url: 'Dhashboard.aspx/GetRowCount3',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);



                    // Assuming your response structure
                    var rowCount = response.d;

                    // Update the element where you want to display the count
                    $("#noofbooks3").text(rowCount);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

        students();

        function students() {
            $.ajax({
                url: 'Dhashboard.aspx/students1',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);



                    // Assuming your response structure
                    var rowCount = response.d;

                    // Update the element where you want to display the count
                    $("#students").text(rowCount);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }


        visitors();

        function visitors() {
            $.ajax({
                url: 'Dhashboard.aspx/visitors',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);



                    // Assuming your response structure
                    var rowCount = response.d;

                    // Update the element where you want to display the count
                    $("#visitors").text(rowCount);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }



        DataBind1();
        function DataBind1() {
            $.ajax({
                url: 'Dhashboard.aspx/DataBind3',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                    $("#datatable tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {


                        // Append the row without applying inline style
                        $("#datatable tbody").append(
                            "<tr  style='cursor:pointer;' onclick='passValue(this)'>" +
                            "<td>" + response.d[i].stdid + "</td>" +
                            "<td>" + response.d[i].name + "</td>" +
                            
                            "<td>" + response.d[i].datevisited + "</td>" +
                       

                            "</tr>"
                        );
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }






        //document.addEventListener('DOMContentLoaded', function () {
        //    // Your JavaScript code here

        //    function DataBind99() {
        //        $.ajax({
        //            url: 'Dhashboard.aspx/DataBind99',
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json",
        //            success: function (response) {

        //                var activities = response.d;
        //                console.log(activities);

        //                // Loop through the activities array and map data into spans
        //                activities.forEach(function (activity) {
        //                    document.getElementById('min').textContent = activity.interval_combined;
        //                    document.getElementById('stdname').textContent = activity.student_name;
        //                    document.getElementById('act').textContent = activity.activity_type;
        //                    document.getElementById('int').textContent = activity.book_name;
        //                });
        //            },
        //            error: function (response) {
        //                alert(response.responseText);
        //            }
        //        });
        //    }
        //    DataBind99();
        //});






        document.addEventListener('DOMContentLoaded', function () {
            // Your JavaScript code here

            function DataBind99() {
                $.ajax({
                    url: 'Dhashboard.aspx/DataBind99',
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        var activities = response.d;
                        console.log(activities);

                        var activityContainer = document.querySelector('.activity');

                        // Loop through each activity and create corresponding HTML elements
                        activities.forEach(function (activity) {
                            var activityItem = document.createElement('div');
                            activityItem.classList.add('activity-item', 'd-flex');

                            var activityLabel = document.createElement('div');
                            activityLabel.classList.add('activite-label');
                            activityLabel.textContent = activity.interval_combined; // Displaying the interval_combined property

                            var activityBadge = document.createElement('i');
                            activityBadge.classList.add('bi', 'bi-circle-fill', 'activity-badge', getActivityBadgeColor(activity.activity_type), 'align-self-start');

                            var activityContent = document.createElement('div');
                            activityContent.classList.add('activity-content');
                            activityContent.innerHTML = '<span id="stdname">' + activity.student_name + '</span> <span id="act">' + activity.activity_type + '</span> <span id="int">' + activity.book_name + '</span>';

                            // Append elements to the activity item
                            activityItem.appendChild(activityLabel);
                            activityItem.appendChild(activityBadge);
                            activityItem.appendChild(activityContent);

                            // Append the activity item to the container
                            activityContainer.appendChild(activityItem);
                        });
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });
            }

            // Function to determine badge color based on activity type
            function getActivityBadgeColor(activityType) {
                switch (activityType) {
                    case 'Visit':
                        return 'text-primary';
                    case 'Returned Book':
                        return 'text-success';
                    case 'Issued Book':
                        return 'text-danger';
                    default:
                        return 'text-warning';
                }
            }

            DataBind99();
        });





        DataBind7();
        function DataBind7() {
            $.ajax({
                url: 'book_return.aspx/DataBind2',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                    $("#datatablee1 tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var rowColorClass = response.d[i].deyex > 0 ? 'highlight-row' : '';
                        console.log("Rent ID: " + response.d[i].rentid + ", Deyex: " + response.d[i].deyex);
                        console.log("Row Color Class: ", rowColorClass);

                        // Append the row without applying inline style
                        $("#datatablee1 tbody").append(
                            "<tr class='" + rowColorClass + "' style='cursor:pointer;' onclick='passValue(this)'>" +
                        
                            "<td>" + response.d[i].stdname + "</td>" +
                            "<td>" + response.d[i].bookname + "</td>" +
                         
                       
                       
                            "<td>" + response.d[i].deyex + "</td>" +
                            "</tr>"
                        );
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }







        DataBind();
        function DataBind() {
            $.ajax({
                url: 'Dhashboard.aspx/DataBind2',
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
                            + "<td>" + response.d[i].name + "</td>"
                          
                            + "<td>" + response.d[i].visted + "</td>"


                            + "</tr>")
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
		}


    </script>

    

</asp:Content>
