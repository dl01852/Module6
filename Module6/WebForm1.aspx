<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Module6.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .box{ border: 1px solid black; padding: 10px}
    </style>
    <script>
        var asyncRequest;
        // set up event handlers
        function registerListeners() {

            var img;
            img = document.getElementById("cpphtp");
            img.addEventListener("mouseover", function () { getContent("cpphtp8.html"); }, false);
            img.addEventListener("mouseout", clearContent, false);

            img = document.getElementById("vcshtp");
            img.addEventListener("mouseover", function () { getContent("vcshtp.html"); }, false);
            img.addEventListener("mouseout", clearContent, false);
        }

        function getContent(url) {
            try {
                asyncRequest = new XMLHttpRequest();
                // REGISTER EVENT HANDLER
                asyncRequest.addEventListener("readystatechange", stateChange, false);
                asyncRequest.open("GET", url, false);
                asyncRequest.send(null);
            } catch (e) {

                alert(e.message);
            } 
        }

        function stateChange() {
            
            if (asyncRequest.readyState === 4 && asyncRequest.status === 200) {
                document.getElementById("contentArea").innerHTML = asyncRequest.responseText;
               
            }
        }

        function clearContent() {
            document.getElementById("contentArea").innerHTML = "";
        }

        window.addEventListener("load", registerListeners, false);
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Mouse over a book for more information</h1>
        <%--<img id="cpphtp" src="http://test.deitel.com/images/thumbs/cpphtp8.jpg"/>
        <img id="vcshtp" src="http://test.deitel.com/images/thumbs/vcsharp2010htp.jpg"/>--%>
        <asp:Image runat="server" ID="cpphtp" AlternateText="C++ How to Program book Cover" ImageUrl="http://test.deitel.com/images/thumbs/cpphtp8.jpg"/>
        <asp:Image runat="server" ID="vcshtp" AlternateText="Visual C# 2010 How to Program book cover" ImageUrl="http://test.deitel.com/images/thumbs/vcsharp2010htp.jpg"/>
        <div class="box" id="contentArea"></div>
    </div>
    </form>
</body>
</html>
