<%@ Page Title="" Language="C#" MasterPageFile="~/mobilemaster.Master" AutoEventWireup="true" CodeBehind="studentvisithistory.aspx.cs" Inherits="library.studentvisithistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="viewport" content="width=device-width, initial-scale=1.0 , maximum-scale=1.0, user-scalable=0">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<br>
    <div class="row">

                        <div class="col-2">
                 <select id="dept1" class="form-control">

</select>
            </div>

    </div>
    <br />
  <div class="row">
    <div class="col-10"></div>
    <div class="col-2 d-flex justify-content-center ">
        <h3>Total Visitation:   </h3>
        <br />
        <span class="text-bold text-center h3" id="numberOfVisits"></span>
    </div>
</div>
<br>
               <div class="row ms-2 ">

                 
               <!-- Table with stripped rows -->
               <table  class="table table-primary "  id="datatablee">
                   <thead>
                       <tr>
 


                              <th scope="col">Date </th>
                      <th scope="col">Rank</th>
                     
                     



                        

                       </tr>
                   </thead>
           
                   <tbody>
          
                   </tbody>
               </table>
              
               <!-- End Table with stripped rows -->
           </div>
             

    <script>



        $(document).ready(function () {



            $(function () {

                var id = document.getElementById("stdid").innerHTML


                $.ajax({
                    type: "POST",
                    url: "studentvisithistory.aspx/getfacul2",
                    data: "{'id':'" + id + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        console.log(r);
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
                var search = $(this).find("option:selected").text();

                var id = document.getElementById("stdid").innerHTML

                $.ajax({
                    url: 'studentvisithistory.aspx/GetRowCount',
                    data: "{'search':'" + search + "','id':'" + id + "'}",
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        console.log(response);



                        // Assuming your response structure
                        var rowCount = response.d;

                        // Update the element where you want to display the count
                        $("#numberOfVisits").text(rowCount);
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });

                $(function () {


                    $.ajax({
                        type: "POST",
                        url: "studentvisithistory.aspx/Search_DataBind",
                        data: "{'search':'" + search + "','id':'" + id + "'} ",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log(response);


                            $("#datatablee tbody").empty();
                            for (var i = 0; i < response.d.length; i++) {


                                // Append the row without applying inline style
                                $("#datatablee tbody").append(
                                    "<tr>" +
                                    "<td>" + response.d[i].date + "</td>" +
                                    "<td>" + response.d[i].rank + "</td>" +

                                    "</tr>"
                                );
                            }
                        }
                    });
                });


            });


        });
    </script>
</asp:Content>
