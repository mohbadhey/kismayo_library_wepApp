<%@ Page Title="" Language="C#" MasterPageFile="~/mobilemaster.Master" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="library.welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1.0 , maximum-scale=1.0, user-scalable=0">
<style>
/* Base styles for body and HTML */
body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: Arial, sans-serif;
}

/* Container styles */
.container4 {
    margin: 0 auto;
  
    max-width: 90vw;
    height: 100vh;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

/* App icon styles */
.app-icon {
    width: 35vw;
    max-width: 350px;
    height: auto;
    border-radius: 50%;
    margin-bottom: 5vh;
}

/* Description styles */
.description {
    color: #444;
    line-height: 1.6;
    margin-bottom: 2vh;
    font-size: 4vh;
}

/* Download button styles */
.btn-download {
    display: inline-block;
    padding: 2vh 4vw;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    font-size: 3vh;
}

.btn-download:hover {
    background-color: #0056b3;
}

/* Footer styles */
footer {
    margin-top: 4vh;
    text-align: center;
}

/* Social icons styles */
.social-icons {
    list-style: none;
    padding: 0;
}

.social-icons li {
    display: inline-block;
    margin: 0 1vw;
}

.social-icons a {
    color: #007bff;
    text-decoration: none;
    font-size: 4vh;
}

.social-icons a:hover {
    color: #0056b3;
}

/* H1 text-white styles */
h1.text-white {
    display: inline-block;
    padding: 2vh 4vw;
    background-color: #12e366;
    color: #12e366;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    font-size: 4vh;
}

/* Media Queries for Responsive Design */
@media only screen and (min-width: 992px) and (max-width: 1200px) {
    /* Adjustments for large devices */
    .app-icon {
        width: 80%;
        max-width: 200px;
    }

    .description {
        font-size: 3.5vh;
        margin-top: 0;
    }

    main1 {
        margin-top: 0; /* Setting top margin of main to 0 */
    }

    .btn-download {
        font-size: 2vh;
        padding: 1.5vh 2vw;
    }

    .social-icons a {
        font-size: 3vh;
    }

    footer {
        text-align: center;
        margin-top: auto;
        padding: 2vh 0;
        position: relative;
        z-index: 1;
    }

    .btn-download,
    h1.text-white {
        width: 100%;
        display: block;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        padding: 2.5vh 0;
        font-size: 2vh;
    }

    .container4 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 70vh;
        margin-bottom: 30vh;
        margin: 0 auto;
        padding: 0;
    }
}

@media only screen and (min-width: 768px) and (max-width: 992px) {
    /* Adjustments for medium devices */
    . .app-icon {
        width: 80%;
        max-width: 200px;
    }

    .description {
        font-size: 3vh;
        margin-top: 0;
    }

    main1 {
        margin-top: 0; /* Setting top margin of main to 0 */
    }

    .btn-download {
        font-size: 2vh;
        padding: 1.5vh 2vw;
    }

    .social-icons a {
        font-size: 3vh;
    }

    footer {
        text-align: center;
        margin-top: auto;
        padding: 2vh 0;
        position: relative;
        z-index: 1;
    }

    .btn-download,
    h1.text-white {
        width: 100%;
        display: block;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        padding: 2.5vh 0;
        font-size: 3vh;
    }

    .container4 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 70vh;
        margin-bottom: 30vh;
        margin: 0 auto;
        padding: 0;
    }
}

@media only screen and (min-width: 576px) and (max-width: 768px) {
    /* Adjustments for small devices */
    .app-icon {
        width: 60%;
        max-width: 250px;
    }

    .description {
        font-size: 2vh;
margin-top: auto;
    }

    main1 {
        margin-top: 0; /* Setting top margin of main to 0 */
    
    }
    .btn-download {
        font-size: 2vh;
        padding: 2vh 3vw;
    }

    .social-icons a {
        font-size: 3.5vh;
    }


     .container4 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 80vh;
        margin-bottom: 20vh;
        margin: 0 auto;
        padding: 0;
    }

    footer {
        text-align: center;
        margin-top: auto;
        padding: 2vh 0;
        position: relative;
        z-index: 1;
    }

    .btn-download,
    h1.text-white {
        width: 100%;
        display: block;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        padding: 2vh 0;
        font-size: 1.5vh;
    }

    .btn-download {
        font-size: 2vh;
        padding: 2vh 0;
    }
}

@media only screen and (min-width: 480pxpx) and (max-width: 576px) {
    /* Adjustments for extra small devices */
    .app-icon {
        width: 80%;
        max-width: 200px;
    
    }

    .description {
        font-size: 1.5vh;
margin-top: 0;
      
    }
    main1 {
        margin-top: 0; /* Setting top margin of main to 0 */
    
    }
    .btn-download {
        font-size: 2vh;
        padding: 1.5vh 2vw;
    }

    .social-icons a {
        font-size: 3vh;
    }

    footer {
        text-align: center;
        margin-top: auto;
        padding: 2vh 0;
        position: relative;
        z-index: 1;
    }

    .btn-download,
    h1.text-white {
        width: 100%;
        display: block;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        padding: 1.5vh 0;
        font-size: 2vh;
    }

    .container4 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 80vh;
        margin-bottom: 20vh;
        margin: 0 auto;
        padding: 0;
    }
}
@media only screen and (min-width: 480px) and (max-width: 576px) {
    /* Adjustments for extra small devices */
    .app-icon {
        width: 60%;
        max-width: 200px;
    }

    .description {
        font-size: 2vh;
        margin-top: 0;
    }

    main1 {
        margin-top: 0; /* Setting top margin of main to 0 */
    }

    .btn-download {
        font-size: 2vh;
        padding: 1.5vh 2vw;
    }

    .social-icons a {
        font-size: 3vh;
    }

    footer {
        text-align: center;
        margin-top: auto;
        padding: 1vh 0;
        position: relative;
        z-index: 1;
    }

    .btn-download,
    h1.text-white {
        width: 100%;
        display: block;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        padding: 1.5vh 0;
        font-size: 2vh;
    }

    .container4 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 70vh;
        margin-bottom: 30vh;
        margin: 0 auto;
        padding: 0;
    }
}
@media only screen and (min-width: 360px) and (max-width: 480px) {
    /* Adjustments for extra small devices */
    .app-icon {
        width: 60%;
        max-width: 200px;
    }

    .description {
        font-size: 1.5vh;
        margin-top: 0;
    }

    main1 {
        margin-top: 0; /* Setting top margin of main to 0 */
    }

    .btn-download {
        font-size: 2vh;
        padding: 1.5vh 2vw;
    }

    .social-icons a {
        font-size: 3vh;
    }

    footer {
        text-align: center;
        margin-top: auto;
        padding: 1vh 0;
        position: relative;
        z-index: 1;
    }

    .btn-download,
    h1.text-white {
        width: 100%;
        display: block;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        padding: 1.5vh 0;
        font-size: 1.5vh;
    }

    .container4 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 70vh;
        margin-bottom: 30vh;
        margin: 0 auto;
        padding: 0;
    }
}
@media only screen and (min-width: 0px) and (max-width: 360px) {
    /* Adjustments for extra small devices */
    .app-icon {
        width: 60%;
        max-width: 200px;
    }

    .description {
        font-size: 1.vh;
        margin-top: 0;
    }

    main1 {
        margin-top: 0; /* Setting top margin of main to 0 */
    }

    .btn-download {
        font-size: 1vh;
        padding: 1.5vh 2vw;
    }

    .social-icons a {
        font-size: 3vh;
    }

    footer {
        text-align: center;
        margin-top: auto;
        padding: 1vh 0;
        position: relative;
        z-index: 1;
    }

    .btn-download,
    h1.text-white {
        width: 100%;
        display: block;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        padding: 1vh 0;
        font-size: 1vh;
    }

    .container4 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 70vh;
        margin-bottom: 30vh;
        margin: 0 auto;
        padding: 0;
    }
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container4">
        <header>
            <h1 class="text-white">Welcome To Kismayo Library App</h1>
        </header>
        <main class="main1">
            <div class="text-center">
                <img src="klogo-removebg-preview.png" alt="App Icon" class="app-icon"/>
                <p class="description">Welcome to the Kismayo University Online Library! Dive into a wealth of knowledge with our user-friendly platform,
                    where you can explore, borrow, and track your book visits effortlessly.
                    Enhance your academic journey with easy access to diverse resources and personalized recommendations. Start exploring today!</p>
                <a href="#" class="btn-download">Download Now</a>
            </div>
        </main>
        <footer>
            <ul class="social-icons">
                <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
            </ul>
            <p>Developed By BIT07 Students</p>
        </footer>
    </div>
</asp:Content>
