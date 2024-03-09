<%@ Page Title="" Language="C#" MasterPageFile="~/website.Master" AutoEventWireup="true" CodeBehind="thestudent2.aspx.cs" Inherits="library.thestudent2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
/* Basic Reset and Mobile Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f6f8fa; /* Light background color */
    color: #333; /* Text color */
}

.container1 {
    max-width: 100%;
    margin: 0 auto;
    padding: 0 15px; /* Add some padding to prevent content from touching the edges */
}

header {
    
    padding: 10px; /* Padding around the header content */
    text-align: center; /* Center align header content */
 border-radius: 5px;
background-color: #48e03a;
    color: #fff;
padding: 10px 20px;
}

header > div {
    margin-bottom: 10px; /* Add some space below the header content */

}

section {
    padding: 20px; /* Add padding around section content */
}

h3 {
    
    margin-bottom: 15px; /* Add space below the section heading */

}

.table {
    width: 100%; /* Make the table fill its container */
    border-collapse: collapse; /* Collapse table borders */
}

/* Apply table styles as needed */

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container1">
   <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>

    <header>
        <div>
            <span>Total Visitation</span><br />
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
            </div>


</asp:Content>
