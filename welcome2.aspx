<%@ Page Title="" Language="C#" MasterPageFile="~/website.Master" AutoEventWireup="true" CodeBehind="welcome2.aspx.cs" Inherits="library.welcome2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />
    <style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.container4 {
    margin: 30px auto;
    padding: 0 15px;
    max-width: 1200px;
}

.app-icon {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    margin-bottom: 20px;
}

.description {
    color: #444;
    line-height: 1.6;
    margin-bottom: 30px;
}

.btn-download {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.btn-download:hover {
    background-color: #0056b3;
}

footer {
    margin-top: 30px;
    text-align: center;
}

.social-icons {
    list-style: none;
    padding: 0;
}

.social-icons li {
    display: inline-block;
    margin: 0 10px;
}

.social-icons a {
    color: #007bff;
    text-decoration: none;
    font-size: 24px;
}

.social-icons a:hover {
    color: #0056b3;
}
h1.text-white{
     display: inline-block;
    padding: 20px 20px;
    background-color: #12e366;
    color: #12e366;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container4">
        <header class="row justify-content-center">
            <div class="col-12 text-center">
                <h1 class="text-center text-white">Welcome To Kismayo Library App</h1>
            </div>
        </header>
        <main class="row justify-content-center">
            <div class="col-12 col-md-8 text-center">
                <img src="klogo-removebg-preview.png" alt="App Icon" class="app-icon mx-auto d-block"/>
                <p class="description">Welcome to the Kismayo University Online Library! Dive into a wealth of knowledge with our user-friendly platform,
                    where you can explore, borrow, and track your book visits effortlessly.
                    Enhance your academic journey with easy access to diverse resources and personalized recommendations. Start exploring today!</p>
                <a href="#" class="btn-download d-block mx-auto">Download Now</a>
            </div>
        </main>
        <footer class="row">
            <div class="col-12 text-center">
                <ul class="social-icons">
                    <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                </ul>
            </div>
        </footer>
        <br />
        <p class="text-center">Developed By BIT07 Students </p>
    </div>

</asp:Content>
