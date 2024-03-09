<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentwebsitelogin.aspx.cs" Inherits="library.studentwebsitelogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="assets/bootstrap.css" rel="stylesheet" />



    <title>Student Login</title> 
<style>
    .center-text {
        text-align: center; /* Center-align text within the input field */
    }
  
    .center-placeholder::-webkit-input-placeholder {
   text-align: center;
}

.center-placeholder:-moz-placeholder {
   text-align: center;
}

.center-placeholder::-moz-placeholder {
   text-align: center;
}

.center-placeholder:-ms-input-placeholder {
   text-align: center;
}

    body{
    background: radial-gradient(circle, rgba(238,174,202,1) 7%, rgba(26,190,242,1) 73%);

background-image: linear-gradient(
  55deg,
  hsl(240deg 100% 34%) 0%,
  hsl(225deg 100% 41%) 6%,
  hsl(220deg 100% 46%) 10%,
  hsl(216deg 100% 50%) 14%,
  hsl(212deg 100% 50%) 17%,
  hsl(208deg 100% 50%) 20%,
  hsl(204deg 100% 50%) 24%,
  hsl(198deg 100% 47%) 29%,
  hsl(189deg 100% 42%) 36%,
  hsl(177deg 100% 39%) 44%,
  hsl(164deg 100% 41%) 54%,
  hsl(152deg 100% 44%) 67%,
  hsl(141deg 100% 46%) 82%,
  hsl(127deg 95% 49%) 100%
);
}
</style>

</head>
<body>
    <form id="form1" runat="server">
                   <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-white text-white" style="border-radius: 1rem; box-shadow: 0 4px 6px rgb(0, 0, 0);" >
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

            
          
                <img src="klogo-removebg-preview.png" />
              <div class="form-outline form-white mb-4">
                  <asp:TextBox Class="form-control form-control-lg" Placeholder="                         Enter Your ID" ID="TextBox2" runat="server"></asp:TextBox>
                <label class="form-label" for="typeEmailX">ID </label>
                
              </div>

              <div class="form-outline form-white mb-4">
         <asp:TextBox type="password" class="form-control form-control-lg" Placeholder="                    Enter Your Password" ID="TextBox3" runat="server"></asp:TextBox>
            <%--    <label class="form-label" for="typePasswordX">Password</label>--%>
                    <asp:Label ID="Label1" runat="server" Text="Label">Password</asp:Label>

              </div>

            
                       <asp:Button class="btn btn-success btn-lg px-5" type="submit" ID="Button1" runat="server" Text="login" OnClick="Button1_Click"  /> 
     

              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

            </div>

           

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    </form>
</body>
</html>
