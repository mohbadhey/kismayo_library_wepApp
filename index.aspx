<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="library.loginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>  <script defer src="assets2/plugins/fontawesome/js/all.min.js"></script>
    
    <!-- App CSS -->  
    <link  rel="stylesheet" href="assets2/css/portal.css">
	<script src="js/sweetalert2.min.js"></script>
    <link href="css/sweetalert2.css" rel="stylesheet" />
 
	
</head>
<body class="app app-login p-0">
    <form id="form2" runat="server">
           <div class="row g-0 app-auth-wrapper">
	    <div class="col-12 col-md-7 col-lg-6 auth-main-col text-center p-5">
		    <div class="d-flex flex-column align-content-end">
			    <div class="app-auth-body mx-auto">	
				    <div class="app-auth-branding mb-4"><a class="app-logo" href="index.html">
						<img class="logo-icon me-2" src="klogo-removebg-preview.png" alt="logo">

				                                        </a></div>
					<h2 class="auth-heading text-center mb-5">Log in to KU-lab</h2>
			        <div class="auth-form-container text-start">
						<form class="auth-form login-form">         
							<div class="email mb-3">
								<label class="sr-only" for="signin-email">Email</label>
							<asp:TextBox ID="TextBox3" runat="server"  class="form-control signin-email" placeholder="Username" required="required"></asp:TextBox>
							</div><!--//form-group-->
							<div class="password mb-3">
								<label class="sr-only" for="signin-password">Password</label>
								 <asp:TextBox ID="TextBox4" runat="server"  class="form-control signin-password" placeholder="Password" required="required"></asp:TextBox>
								<div class="extra mt-3 row justify-content-between">
									<div class="col-6">
										
									</div><!--//col-6-->
								
								</div><!--//extra-->
							</div><!--//form-group-->
							<div class="text-center">
								  <asp:Button ID="Button1" runat="server" class="btn app-btn-primary w-100 theme-btn mx-auto" Text="Log In"   OnClick="Button1_Click1" />
							
							</div>
						</form>
						
						<div class="auth-option text-center pt-5"> <a class="text-link" href="signup.html" ></a>.</div>
					</div><!--//auth-form-container-->	

			    </div><!--//auth-body-->
		    
			    <footer class="app-auth-footer">
				    <div class="container text-center py-3">
				         <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
			        <small class="copyright">Designed by <span class="sr-only">love</span>BIT07 for kU-LAB</small>
				       
				    </div>
			    </footer><!--//app-auth-footer-->	
		    </div><!--//flex-column-->   
	    </div><!--//auth-main-col-->
	    <div class="col-12 col-md-5 col-lg-6 h-100 auth-background-col">
		    <div class="auth-background-holder">
		    </div>
		    <div class="auth-background-mask"></div>
		    <div class="auth-background-overlay p-3 p-lg-5">
			    <div class="d-flex flex-column align-content-end h-100">
				    <div class="h-100"></div>
				 
				</div>
		    </div><!--//auth-background-overlay-->
	    </div><!--//auth-background-col-->
    
    </div><!--//row-->


    </form>
</body>
</html>
