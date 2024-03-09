<%@ Page Title="" Language="C#" MasterPageFile="~/homePage.Master" AutoEventWireup="true" CodeBehind="updatesemesters.aspx.cs" Inherits="library.updatesemesters" %>
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
        #bh {
background: hsla(159, 82%, 55%, 1);

background: linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

background: -moz-linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

background: -webkit-linear-gradient(90deg, hsla(159, 82%, 55%, 1) 0%, hsla(206, 98%, 48%, 1) 100%);

filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#2FEAA8", endColorstr="#028CF3", GradientType=1 );
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1>update semesters </h1>

        <section class="p-4" id="bh">

              <div class="row">
      <div class="col-md-4 mb-3">
             <a href="#" class="btn btn-success" onclick=" updatesem()" id="btnUpdate">Update semesters </a> <br /> <br />
      </div>
         <div class="col-md-4 mb-3"></div>
      <div class="col-md-4 mb-3">
                 <a href="#" class="btn btn-danger" onclick="deleteInfo()" id="btnDelete">Roll Back </a>
      </div>

  </div>
  <div class="row">
      <div class="col-md-3 mb-3">
          <div class="card text-center" style="width: 18rem;">
              <h6>IT class</h6>
              <div class="card-body" id="ItclassTableDiv">
                  <!-- Table for Itclass will be appended here -->
                  <table class="table text-white classTable" id="ItclassTable">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                           
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="addNew()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>

      </div>
      <div class="col-md-3 mb-3">
          <div class="card text-center" style="width: 18rem;">
                 <h6>education class</h6>
              <div class="card-body" id="educationclassTableDiv">
                  <!-- Table for educationclass will be appended here -->
                  <table class="table text-white classTable" id="educationclassTable">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="added()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>
      </div>
      <div class="col-md-3 mb-3">
          <div class="card text-center" style="width: 18rem;">
                 <h6>general nursing  class</h6>
              <div class="card-body" id="generalnursingclassTableDiv">
                  <!-- Table for generalnursingclass will be appended here -->
                  <table class="table text-white classTable" id="generalnursingclassTable">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="addgn()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>
      </div>
      <div class="col-md-3 mb-3">
          <div class="card text-center" style="width: 18rem;">
                 <h6>general fiqhi  class</h6>
              <div class="card-body" id="generalfiqhiclassTableDiv">
                  <!-- Table for generalfiqhiclass will be appended here -->
                  <table class="table text-white classTable" id="generalfiqhiclassTable">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="addgf()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>
      </div>
  </div>
  <br />


  <div class="row">
      <div class="col-md-3 mb-3">
          <div class="card text-center" style="width: 18rem;">
                 <h6>medicne class</h6>
              <div class="card-body" id="medclassTableDiv">
                  <!-- Table for medclass will be appended here -->
                  <table class="table text-white classTable" id="medclassTable">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="addmed()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>
      </div>
      <div class="col-md-3 mb-3">
          <div class="card text-center" style="width: 18rem;">
              <div class="card-body" id="publicadministrationclassTableDiv">
                     <h6>public administration class</h6>
                  <!-- Table for publicadministrationclass will be appended here -->
                  <table class="table text-white classTable" id="publicadministrationclassTable">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="addpa()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>
      </div>
          <div class="col-md-3 mb-3">
          <div class="card text-center" style="width: 18rem;">
              <div class="card-body" id="publichealthdiv">
                     <h6>public health class</h6>
                  <!-- Table for publicadministrationclass will be appended here -->
                  <table class="table text-white classTable" id="publichealth">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="addph()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>
      </div>
         <div class="col-md-3 mb-3">
          <div class="card text-center" style="width: 18rem;">
              <div class="card-body" id="badiv">
                     <h6>Business Administration class</h6>
                  <!-- Table for publicadministrationclass will be appended here -->
                  <table class="table text-white classTable" id="baclass">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="addba()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>
      </div>
      <!-- Add more divs for additional classes -->
  </div>
  <br />
  <div class="row">
     
              <div class="col-md-3 mb-3">
                   <div class="card text-center" style="width: 18rem;">
              <div class="card-body" id="shdiv">
                     <h6>Sharia Law  class</h6>
                  <!-- Table for publicadministrationclass will be appended here -->
                  <table class="table text-white classTable" id="shclass">
                      <thead>
                          <tr>
                              <th scope="col">classname</th>
                              <th scope="col">current semester</th>
                          </tr>
                      </thead>
                      <tbody></tbody>
                  </table>
                                 <button type="button" class="btn btn-primary pull-right" onclick="addsl()">    <i class="fas fa-plus"></i>  </button> 
              </div>
          </div>
              </div>
              <div class="col-md-3 mb-3"></div>
             <div class="col-md-3 mb-3">
            <div class="card text-center" style="width: 18rem;">
       <div class="card-body" id="acdiv">
              <h6>Accounting Class  </h6>
           <!-- Table for publicadministrationclass will be appended here -->
           <table class="table text-white classTable" id="actable">
               <thead>
                   <tr>
                       <th scope="col">classname</th>
                       <th scope="col">current semester</th>
                   </tr>
               </thead>
               <tbody></tbody>
           </table>
                          <button type="button" class="btn btn-primary pull-right" onclick="addac()">    <i class="fas fa-plus"></i>  </button> 
       </div>
   </div>
       </div>
       <div class="col-md-3 mb-3"></div>
  </div>


            </section>
  
                      <!-- The Modal -->
                            <div class="modal" id="myModal20">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  Accounting    Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="acname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="acsem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertac()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
                        <div class="modal" id="myModal19">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  Sharia Law    Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="slname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="slsem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertsl()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
                    <div class="modal" id="myModal18">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  Business   Administration  Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="baname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="basem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertba()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
                <div class="modal" id="myModal17">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  Public Health   Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="phname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="phsem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertph()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
            <div class="modal" id="myModal16">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  Public Administration   Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="paname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="pasem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertpa()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
            <div class="modal" id="myModal15">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  Medicine   Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="medname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="medsem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertmed()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
        <div class="modal" id="myModal14">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  General Fiqhi  Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="gfname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="gfsem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertgf()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
    <div class="modal" id="myModal13">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  General Nursing  Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="gnname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="gnsem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertgn()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
        
<div class="modal" id="myModal12">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Insert  Edcuation Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="edname2" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="edsem2" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertedcn()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
    
<div class="modal" id="myModal11">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update IT Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="itname1" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="itsem1" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                
                <a href="#" class="btn btn-success" onclick="insertit()" >SUBMIT</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>

                  <!-- The Modal -->
    <div class="modal" id="myModal21">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update Accounting  Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label"> class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="acid" class="form-control " readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="acname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="acsem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                    <a href="#" class="btn btn-danger" onclick="deleteac()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updateac()" id="btnadd">Update</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>
    
<div class="modal" id="myModal2">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update IT Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label"> class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="itid" class="form-control " readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="itname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="itsem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                    <a href="#" class="btn btn-danger" onclick="deleteit()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updateinfo()" id="btnadd">Update</a>
            <%--    <a href="#" class="btn btn-success" onclick="updateInfo()" id="btnUpdate">Update</a>
            

                <button class="btn btn-success" id="btnspinner" style="display: none" disabled>
                    <span class="spinner-border spinner-border-sm"></span>
                    Loading..
                </button>--%>
            </div>

        </div>
    </div>
</div>


    <div class="modal" id="myModal3">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update  Education class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="edid" class="form-control" readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="edname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="edsem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                 <a href="#" class="btn btn-danger" onclick="deleteed()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updateed()" >Update</a>
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
        <div class="modal" id="myModal4">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto"> Update General Nursing Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="gnid" class="form-control" readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="gnname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="gnsem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                 <a href="#" class="btn btn-danger" onclick="deletegn()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updategn()" >Update</a>
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
         

        <div class="modal" id="myModal5">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update General Fiqhi Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="gfid" class="form-control" readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label">class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="gfname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="gfsem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                 <a href="#" class="btn btn-danger" onclick="deletegf()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updategf()">Update</a>
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
        <div class="modal" id="myModal6">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update Medicine Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label"> class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="mid" class="form-control" readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label"> Class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="mname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="msem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                 <a href="#" class="btn btn-danger" onclick="deletemed()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updatem()" >Update</a>
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


        <div class="modal" id="myModal7">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update Public Adminstration class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label"> class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="paid" class="form-control" readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label">  class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="paname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="pasem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                 <a href="#" class="btn btn-danger" onclick="deletepa()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updatepa()" >Update</a>
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
         
        <div class="modal" id="myModal8">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update Public Health Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label"> class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="phid" class="form-control" readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label">  class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="phname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="phsem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                 <a href="#" class="btn btn-danger" onclick="deleteph()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updateba()" >Update</a>
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

        <div class="modal" id="myModal9">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update Business Administration</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label"> ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="baid" class="form-control" readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label">  class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="baname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="basem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                 <a href="#" class="btn btn-danger" onclick="deleteba()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updateba()" id="btadd">Update</a>
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
        <div class="modal" id="myModal10">
    <div class="modal-dialog modal-lg"> <!-- Use the modal-lg class to make it larger -->
        <div class="modal-content">

            <!-- Modal Header -->

                   <div class="modal-header bg-primary text-center">
  
    <h4 class="modal-title text-white mx-auto">Update Sharia Class</h4>
                  <button type="button" class="btn btn-danger close" data-dismiss="modal">&times;</button>
</div>
            <!-- Modal body -->
            <div class="modal-body">
     
            <div class="row p-2">


          <div class="row mt-4  mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label"> class ID</label>
                  <div class="col-sm-10">
                    <input type="text"  id="slid" class="form-control" readonly>
                  </div>
                </div>
                   <div class="row mb-3">
           <label for="inputText" class="col-sm-2 col-form-label">  class Name</label>
           <div class="col-sm-10">
             <input type="text"  id="slname" class="form-control">
           </div>
         </div>



  <div class="row mb-3">
  <label for="inputText" class="col-sm-2 col-form-label"> Semester</label>
  <div class="col-sm-10">
               <input type="number"  id="slsem" class="form-control">
  </div>
</div>



            </div> 
 
                



  </div>

            <div>


            </div>
 
    


            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger close" data-dismiss="modal">Close</button>
                 <a href="#" class="btn btn-danger" onclick="deletesl()" >Delete</a>
                <a href="#" class="btn btn-success" onclick="updatesl()" >Update</a>
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
                $('#myModal1').modal('hide'); // Hide the modal when the button is clicked
            });

            $('.close').on('click', function () {
                $('#myModal2').modal('hide'); // Hide the modal when the button is clicked
            });
            $('.close').on('click', function () {
                $('#myModal2').modal('hide'); // Hide the modal when the button is clicked
            });
            $('.close').on('click', function () {
                $('#myModal4').modal('hide'); // Hide the modal when the button is clicked
            });
            $('.close').on('click', function () {
                $('#myModal5').modal('hide'); // Hide the modal when the button is clicked
            });
            $('.close').on('click', function () {
                $('#myModal6').modal('hide'); // Hide the modal when the button is clicked
                $('.close').on('click', function () {
                    $('#myModal7').modal('hide'); // Hide the modal when the button is clicked
                    $('.close').on('click', function () {
                        $('#myModal8').modal('hide'); // Hide the modal when the button is clicked
                        $('.close').on('click', function () {
                            $('#myModal9').modal('hide'); // Hide the modal when the button is clicked

                        });
                    });
                });
            });
            $('.close').on('click', function () {
                $('#myModal7').modal('hide'); // Hide the modal when the button is clicked
            }); $('.close').on('click', function () {
                $('#myModal8').modal('hide'); // Hide the modal when the button is clicked
            });
            $('.close').on('click', function () {
                $('#myModal9').modal('hide'); // Hide the modal when the button is clicked
            });
            $('.close').on('click', function () {
                $('#myModal10').modal('hide'); // Hide the modal when the button is clicked

            });
            $('.close').on('click', function () {
                $('#myModal11').modal('hide'); // Hide the modal when the button is clicked
            });
        });

        function addNew() {
        

            $("#myModal11").modal("show")


         
        }

        function added() {


            $("#myModal12").modal("show")



        }





        function addgn() {


            $("#myModal13").modal("show")



        }

        function addgf() {


            $("#myModal14").modal("show")



        }

        function addmed() {


            $("#myModal15").modal("show")



        }
        function addpa() {


            $("#myModal16").modal("show")



        }

        function addph() {


            $("#myModal17").modal("show")



        }
        function addba() {


            $("#myModal18").modal("show")



        }
        function addsl() {


            $("#myModal19").modal("show")



        }

        function addac() {


            $("#myModal20").modal("show")



        }






        function insertit() {


            var itname = $("#itname1").val();
            var itsem = $("#itsem1").val();
            
          


            $.ajax({
                url: 'updatesemesters.aspx/CheckIdExists',
                data: "{ 'itname':'" + itname + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/SubmitVisit',
                            data: "{ 'itname':'" + itname + "', 'itsem':'" + itsem + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal11").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )
                                
                              
                                    DataBindItClass();

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


        function insertac() {


            var acname2 = $("#acname2").val();
            var acsem2 = $("#acsem2").val();




            $.ajax({
                url: 'updatesemesters.aspx/checkac',
                data: "{ 'acname2':'" + acname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/insertac',
                            data: "{ 'acname2':'" + acname2 + "', 'acsem2':'" + acsem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal20").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )

                                    DataBindACClass();

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



        function insertedcn() {


            var edname2 = $("#edname2").val();
            var edsem2 = $("#edsem2").val();

            alert(edname2);
            alert(edsem2);


            $.ajax({
                url: 'updatesemesters.aspx/checkedcn',
                data: "{ 'edname2':'" + edname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/submitedcn',
                            data: "{ 'edname2':'" + edname2 + "', 'edsem2':'" + edsem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal12").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )


                                    DataBindEducationClass();

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





        function insertgn() {


            var gnname2 = $("#gnname2").val();
            var gnsem2 = $("#gnsem2").val();




            $.ajax({
                url: 'updatesemesters.aspx/checkgn',
                data: "{ 'gnname2':'" + gnname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/submitgn',
                            data: "{ 'gnname2':'" + gnname2 + "', 'gnsem2':'" + gnsem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal13").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )


                                    DataBindGeneralNursingClass();

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



        function insertgf() {


            var gfname2 = $("#gfname2").val();
            var gfsem2 = $("#gfsem2").val();




            $.ajax({
                url: 'updatesemesters.aspx/checkgf',
                data: "{ 'gfname2':'" + gfname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/submitgf',
                            data: "{ 'gfname2':'" + gfname2 + "', 'gfsem2':'" + gfsem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal14").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )


                                    DataBindMedClass();

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





        function insertmed() {


            var medname2 = $("#medname2").val();
            var medsem2 = $("#medsem2").val();




            $.ajax({
                url: 'updatesemesters.aspx/checkmed',
                data: "{ 'medname2':'" + medname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/submitmed',
                            data: "{ 'medname2':'" + medname2 + "', 'medsem2':'" + medsem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal15").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )


                                    DataBindMedClass();

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




        function insertpa() {


            var paname2 = $("#paname2").val();
            var pasem2 = $("#pasem2").val();




            $.ajax({
                url: 'updatesemesters.aspx/checkpa',
                data: "{ 'paname2':'" + paname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/submitpa',
                            data: "{ 'paname2':'" + paname2 + "', 'pasem2':'" + pasem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal16").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )


                                    DataBindPublicAdministrationClass();

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




        function insertph() {


            var phname2 = $("#phname2").val();
            var phsem2 = $("#phsem2").val();




            $.ajax({
                url: 'updatesemesters.aspx/checkph',
                data: "{ 'phname2':'" + phname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/submitph',
                            data: "{ 'phname2':'" + phname2 + "', 'phsem2':'" + phsem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal17").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )


                                    databindphealth();

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




        function insertba() {


            var baname2 = $("#baname2").val();
            var basem2 = $("#basem2").val();




            $.ajax({
                url: 'updatesemesters.aspx/checkba',
                data: "{ 'baname2':'" + baname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/submitba',
                            data: "{ 'baname2':'" + baname2 + "', 'basem2':'" + basem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal18").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )


                                    databindba();

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




        function insertsl() {











            var slname2 = $("#slname2").val();
            var slsem2 = $("#slsem2").val();




            $.ajax({
                url: 'updatesemesters.aspx/checksl',
                data: "{ 'slname2':'" + slname2 + "' } ",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response.d === true) {
                        // ID already exists, display an error message
                        Swal.fire({
                            icon: 'error',
                            title: 'Class Name already exists',
                            text: 'The selected Class already exists in the database.',
                        });
                    } else {
                        // ID does not exist, proceed with the data insertion
                        $.ajax({
                            url: 'updatesemesters.aspx/submitsl',
                            data: "{ 'slname2':'" + slname2 + "', 'slsem2':'" + slsem2 + "'}",
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            type: 'POST',
                            success: function (response) {
                                console.log(response);
                                $("#myModal19").modal("hide");
                                if (response.d === 'true') {
                                    Swal.fire(
                                        'Successfully Saved !',
                                        'You Added a new Class!',
                                        'success'
                                    )


                                    databindsh();

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








function updatesem() {
    $.ajax({
        url: 'updatesemesters.aspx/updatesem',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
          
alert(" waad update gareese ");
 DataBindItClass();
    DataBindEducationClass();
    DataBindGeneralNursingClass();
    DataBindGeneralfiqhiclass();
    DataBindMedClass();
    DataBindPublicAdministrationClass();
databindphealth();
databindba();
databindsh() ;
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}
function databindsh() {
    $.ajax({
        url: 'updatesemesters.aspx/databindsh',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#shclass tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#shclass tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deletesl btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this)'><i class='fas fa-edit'></i></button></td>" +

                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
        }



        function updatesl() {

            var slid = $("#slid").val();
            var slname = $("#slname").val();

            var slsem = $("#slsem").val();
            
            $.ajax({
                url: 'updatesemesters.aspx/updatesl',
                data: "{ 'slid':'" + slid + "' , 'slname':'" + slname + "','slsem':'" + slsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal10").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        function deletesl() {

            var slid = $("#slid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deletesl',
                data: "{ 'slid':'" + slid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal10").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#shclass').on('click', '.deletesl', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("slname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("slsem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("slid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal10").modal("show");
            });
        });

function databindba() {
    $.ajax({
        url: 'updatesemesters.aspx/databindba',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#baclass tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#baclass tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deleteba btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +
                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
        }




        function updateba() {

            var itid = $("#baid").val();
            var itname = $("#baname").val();

            var itsem = $("#basem").val();
            $.ajax({
                url: 'updatesemesters.aspx/updateba',
                data: "{ 'itid':'" + itid + "' , 'itname':'" + itname + "','itsem':'" + itsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal9").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        function deleteba() {

            var baid = $("#baid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deleteba',
                data: "{ 'baid':'" + baid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal9").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#baclass').on('click', '.deleteba', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("baname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("basem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("baid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal9").modal("show");
            });
        });

function databindphealth() {
    $.ajax({
        url: 'updatesemesters.aspx/databindpublichealth',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#publichealth tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#publichealth tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deleteph btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +
                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
        }




        function updateph() {

            var itid = $("#phid").val();
            var itname = $("#phname").val();

            var itsem = $("#phsem").val();
            $.ajax({
                url: 'updatesemesters.aspx/updateph',
                data: "{ 'itid':'" + itid + "' , 'itname':'" + itname + "','itsem':'" + itsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal8").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }
        function deleteph() {

            var phid = $("#phid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deleteph',
                data: "{ 'phid':'" + phid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal8").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }


        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#publichealth').on('click', '.deleteph', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("phname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("phsem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("phid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal8").modal("show");
            });
        });



// Client-side code for Itclass
function DataBindItClass() {
    $.ajax({
        url: 'updatesemesters.aspx/DataBindItClass',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#ItclassTable tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#ItclassTable tbody").append(
                    "<tr style='cursor:pointer'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deleteButton btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +
                 
                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}



        function updateinfo() {

            var itid = $("#itid").val();
            var itname = $("#itname").val();
         
            var itsem = $("#itsem").val();
            $.ajax({
            url: 'updatesemesters.aspx/updateit',
                data: "{ 'itid':'" + itid + "' , 'itname':'" + itname + "','itsem':'" + itsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal2").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

            
        }
        function deleteit() {

            var itid = $("#itid").val();
         
            $.ajax({
                url: 'updatesemesters.aspx/deleteit',
                data: "{ 'itid':'" + itid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal2").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }



      

        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#ItclassTable').on('click', '.deleteButton', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("itname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("itsem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("itid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal2").modal("show");
            });
        });



       

        // Client-side code for accounting
        function DataBindACClass() {
            $.ajax({
                url: 'updatesemesters.aspx/DataBindACClass',
                dataType: 'json',
                type: 'POST',
                contentType: 'application/json',
                success: function (response) {
                    console.log(response);
                    $("#actable tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        $("#actable tbody").append(
                            "<tr style='cursor:pointer'>" +
                            "<td>" + response.d[i].name + "</td>" +
                            "<td>" + response.d[i].sem + "</td>" +
                            "<td><button class='acbtn btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +

                            "</tr>"
                        );
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }



        function updateac() {

            var acid = $("#acid").val();
            var acname = $("#acname").val();

            var acsem = $("#acsem").val();
            $.ajax({
                url: 'updatesemesters.aspx/updateac',
                data: "{ 'acid':'" + acid + "' , 'acname':'" + acname + "','acsem':'" + acsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal21").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                    DataBindACClass();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }
        function deleteac() {

            var acid = $("#acid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deleteac',
                data: "{ 'acid':'" + acid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal21").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                    DataBindACClass();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }





        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#actable').on('click', '.acbtn', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("acname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("acsem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("acid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal21").modal("show");
            });
        });







        



// Client-side code for educationclass
function DataBindEducationClass() {
    $.ajax({
        url: 'updatesemesters.aspx/DataBindEducationClass',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#educationclassTable tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#educationclassTable tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deleteedu btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +
                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}

        function updateed() {

            var edid = $("#edid").val();
            var edname = $("#edname").val();

            var edsem = $("#edsem").val();
            $.ajax({
                url: 'updatesemesters.aspx/updateedu',
                data: "{ 'edid':'" + edid + "' , 'edname':'" + edname + "','edsem':'" + edsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal3").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }


        function deleteed() {

            var edid = $("#edid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deleteed',
                data: "{ 'edid':'" + edid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal3").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                    DataBindACClass();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#educationclassTable').on('click', '.deleteedu', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("edname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("edsem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("edid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal3").modal("show");
            });
        });


// Client-side code for generalnursingclass
function DataBindGeneralNursingClass() {
    $.ajax({
        url: 'updatesemesters.aspx/DataBindGeneralNursingClass',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#generalnursingclassTable tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#generalnursingclassTable tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deletegn btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +
                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
        }

        function updategn() {

            var itid = $("#gnid").val();
            var itname = $("#gnname").val();

            var itsem = $("#gnsem").val();
            $.ajax({
                url: 'updatesemesters.aspx/updategn',
                data: "{ 'itid':'" + itid + "' , 'itname':'" + itname + "','itsem':'" + itsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal4").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }
        function deletegn() {

            var gnid = $("#gnid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deletegn',
                data: "{ 'gnid':'" + gnid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal4").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }
      

        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#generalnursingclassTable').on('click', '.deletegn', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("gnname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("gnsem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("gnid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal4").modal("show");
            });
        });








// Client-side code for generalfiqhiclass
function DataBindGeneralfiqhiclass() {
    $.ajax({
        url: 'updatesemesters.aspx/DataBindGeneralfiqhiclass',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#generalfiqhiclassTable tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#generalfiqhiclassTable tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deletegf btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +
                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
        }



        function updategf() {

            var itid = $("#gfid").val();
            var itname = $("#gfname").val();

            var itsem = $("#gfsem").val();
            $.ajax({
                url: 'updatesemesters.aspx/updategf',
                data: "{ 'itid':'" + itid + "' , 'itname':'" + itname + "','itsem':'" + itsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal5").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        function deletegf() {

            var gfid = $("#gfid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deletegf',
                data: "{ 'gfid':'" + gfid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal5").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#generalfiqhiclassTable').on('click', '.deletegf', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("gfname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("gfsem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("gfid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal5").modal("show");
            });
        });


// Client-side code for medclass
function DataBindMedClass() {
    $.ajax({
        url: 'updatesemesters.aspx/DataBindMedClass',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#medclassTable tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#medclassTable tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deletem btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +
                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
        }



        function updatem() {

            var itid = $("#mid").val();
            var itname = $("#mname").val();

            var itsem = $("#msem").val();
            $.ajax({
                url: 'updatesemesters.aspx/updatem',
                data: "{ 'itid':'" + itid + "' , 'itname':'" + itname + "','itsem':'" + itsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal6").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        function deletemed() {

            var medid = $("#mid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deletemed',
                data: "{ 'medid':'" + medid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal6").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                    DataBindACClass();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#medclassTable').on('click', '.deletem', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("mname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("msem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("mid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal6").modal("show");
            });
        });






// Client-side code for publicadministrationclass
function DataBindPublicAdministrationClass() {
    $.ajax({
        url: 'updatesemesters.aspx/DataBindPublicAdministrationClass',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        success: function (response) {
            console.log(response);
            $("#publicadministrationclassTable tbody").empty();

            for (var i = 0; i < response.d.length; i++) {
                $("#publicadministrationclassTable tbody").append(
                    "<tr style='cursor:pointer' onclick='passValue(this)'>" +
                    "<td>" + response.d[i].name + "</td>" +
                    "<td>" + response.d[i].sem + "</td>" +
                    "<td><button class='deletepa btn btn-info' data-id='" + response.d[i].id + "' onclick='passedit(this) '><i class='fas fa-edit'></button></td>" +
                    "</tr>"
                );
            }
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
        }

        function updatepa() {

            var itid = $("#paid").val();
            var itname = $("#paname").val();

            var itsem = $("#pasem").val();
            $.ajax({
                url: 'updatesemesters.aspx/updatepa',
                data: "{ 'itid':'" + itid + "' , 'itname':'" + itname + "','itsem':'" + itsem + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal7").modal("hide");
                    Swal.fire(
                        'Successfully Updated !',
                        'You Updated a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        function deletepa() {

            var paid = $("#paid").val();

            $.ajax({
                url: 'updatesemesters.aspx/deletepa',
                data: "{ 'paid':'" + paid + "' } ",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                    $("#myModal7").modal("hide");
                    Swal.fire(
                        'Successfully Deleted !',
                        'You Deleted a class!',
                        'success'
                    )
                    DataBindItClass();
                    DataBindEducationClass();
                    DataBindGeneralNursingClass();
                    DataBindGeneralfiqhiclass();
                    DataBindMedClass();
                    DataBindPublicAdministrationClass();
                    databindphealth();
                    databindba();
                    databindsh();
                    DataBindACClass();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


        }

        $(document).ready(function () {
            // Set up event delegation for the delete button within the table
            $('#publicadministrationclassTable').on('click', '.deletepa', function (event) {
                event.preventDefault();

                // Retrieve data from the clicked element or table row
                var visitId = $(this).data("id");
                var row = $(this).closest('tr');
                var cell = row.find('td');

                // Populate the input fields with data from the table row
                document.getElementById("paname").value = cell.eq(0).text().trim(); // Assuming first cell is classname
                document.getElementById("pasem").value = cell.eq(1).text().trim(); // Assuming second cell is current semester
                document.getElementById("paid").value = visitId;

                // Show the modal with the id "myModal2"
                $("#myModal7").modal("show");
            });
        });



// Call the functions on document ready
$(document).ready(function () {
    DataBindItClass();
    DataBindEducationClass();
    DataBindGeneralNursingClass();
    DataBindGeneralfiqhiclass();
    DataBindMedClass();
    DataBindPublicAdministrationClass();
databindphealth();
databindba();
    databindsh();
    DataBindACClass();
    // Add calls for additional classes if needed
});

   
    </script>


</asp:Content>
