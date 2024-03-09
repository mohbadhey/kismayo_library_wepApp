<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="imageinsert.aspx.cs" Inherits="library.imageinsert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>
   <form runat="server">
         <div>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        </tr>
        <tr>


            <td colspan="2">
                <asp:Button ID="btnSave" Text="Save" runat="server" CssClass="btn btn-primary" /></td>
        </tr>
    </table>

</div>

   </form>
   
</body>

     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        $(function () {
            var reader = new FileReader();
            var fileName;
            var contentType;
            $('[id*=FileUpload1]').change(function () {
                if (typeof (FileReader) != "undefined") {
                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    $($(this)[0].files).each(function () {
                        var file = $(this);
                        if (regex.test(file[0].name.toLowerCase())) {
                            fileName = file[0].name;
                            contentType = file[0].type;
                            reader.readAsDataURL(file[0]);
                        } else {
                            alert(file[0].name + " is not a valid image file.");
                            return false;
                        }
                    });
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            });

            $("[id*=btnSave]").click(function () {
                var byteData = reader.result;
                byteData = byteData.split(';')[1].replace("base64,", "");
                var obj = {};
                obj.Data = byteData;
                obj.Name = fileName;
                obj.ContentType = contentType;
                $.ajax({
                    type: "POST",
                    url: "imageinsert.aspx/SaveImage",
                    data: '{data : ' + JSON.stringify(obj) + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        alert(r.d);
                    },
                    error: function (r) {
                        alert(r.responseText);
                    },
                    failure: function (r) {
                        alert(r.responseText);
                    }
                });
                return false;
            });
        });
    </script>

</html>
