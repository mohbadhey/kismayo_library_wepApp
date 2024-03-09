<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_report.aspx.cs" Inherits="library.student_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   
                   <div class="invoice-wrapper" id="print-area">
        <div class="invoice">
            <div class="invoice-container">
                <div class="invoice-head student" id="studentsContainer">
                    <div class="invoice-head-top">
                        <div class="invoice-head-top-left text-start">
                         
                            <img src="images/download%20(2).png" />
                        </div>
                        <div class="invoice-head-top-right text-end">
                            <h3>STUDENT VISITATION REPORT</h3>
                        </div>
                    </div>
                    <div class="hr"></div>
                    <div class="invoice-head-middle">
                        <div class="invoice-head-middle-left text-start">
                            <p><span class="text-bold">STUDENT NAME</span>: <span id="studentName"></span></p>
                        </div>
                        <div class="invoice-head-middle-right text-end">
                            <p><span class="text-bold">STUDENT ID</span>: <span id="studentID"></span></p>
                        </div>
                    </div>
                    <div class="hr"></div>
                    <div class="invoice-head-bottom">
                        <div class="invoice-head-bottom-left">
                            <div class="invoice-head-middle-left text-start">
                                <p><span class="text-bold">DEPARTMENT NAME</span>: <span id="departmentName"></span></p>
                            </div>
                            <div class="invoice-head-middle-left text-start">
                                <p><span class="text-bold">FACULTY NAME</span>: <span id="facultyName"></span></p>
                            </div>
                            <div class="invoice-head-middle-left text-start">
                                <p><span class="text-bold">SEMESTER NAME</span>: <span id="semesterName"></span></p>
                            </div>
                           <div class="invoice-head-middle-left text-start">
    <p><span class="text-bold">Date</span>: <span id="date"></span></p>
</div>

                        </div>
                        <div class="invoice-head-middle-right text-end">
                            <p><span class="text-bold">PHONE NUMBER </span>: <span id="phonen"></span></p>
                        </div>
                        <div class="invoice-head-middle-right text-end">
                            <p><span class="text-bold">NUMBER OF VISITS</span>: <span id="numberOfVisits"></span></p>
                        </div>
                    </div>
                </div>
                <div class="overflow-view">
                    <div class="invoice-body">
                           <table id="visit">
                                <thead>
                                    <tr>
                                        <td class = "text-bold">DATE RECORDED </td>
                                        <td class = "text-bold">ORDER OF TIME VISITED  </td>
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                
                                       <tr>
                                        <td >10</td>
                                        <td>$500.00</td>
                                    </tr>
                                </tbody>
                            </table>
                    </div>
                </div>
                <div class="invoice-foot text-center">
                    <p><span class="text-bold text-center">NOTE:&nbsp;</span>waxaa hagaajiye MOHAMED BADHEY .</p>

                    <div class="invoice-btns">
                        <button type="button" class="invoice-btn" onclick="window.print()">
                            <span>
                                <i class="fa-solid fa-print"></i>
                            </span>
                            <span>Print</span>
                        </button>
                        <button type="button" class="invoice-btn">
                            <span>
                                <i class="fa-solid fa-download"></i>
                            </span>
                            <span>Download</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
