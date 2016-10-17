<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Module6.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script>
        var asyncRequest;

        function registerListeners() {
            document.getElementById("all").addEventListener("click", function() { getImages("all.xml") }, false);
        }

        function getImages(url) {
          

            try {
                asyncRequest = new XMLHttpRequest();
                asyncRequest.addEventListener("readystatechange", processResponse, false);
                asyncRequest.open("GET", url, true);
                asyncRequest.send(null);
            } catch (e) {
                alert(e.message);
            } 
        }

        function processResponse() {
            if (asyncRequest.readyState == 4 && asyncRequest.status == 200 && asyncRequest.responseXML) {
                clearImages();

                var covers = asyncRequest.responseXML.getElementsByTagName("cover");
                var baseUrl = asyncRequest.responseXML.getElementsByTagName("baseurl").item(0).firstChild.nodeValue;
                var output = document.getElementById("covers");
                var titles = document.getElementById("titles");
                var images = [];
                var titlesArray = [];
                var imagesUL = document.createElement("ul");

                for (var i = 0; i < covers.length; i++) {
                    var cover = covers.item(i);
                    var image = cover.getElementsByTagName("image").item(0).firstChild.nodeValue;
                    var title = cover.getElementsByTagName("title").item(0).firstChild.nodeValue;
                    var image_url = baseUrl + escape(image);
                    images.push(image_url);
                    titlesArray.push(title);
                    console.log(image_url);
                    console.log(title);
                    //var imageLi = document.createElement("li");
                    //var imageTag = document.createElement("img");

                    //imageTag.setAttribute("src", baseUrl + escape(image));
                    //imageLi.appendChild(imageTag);
                    
                    //imagesUL.appendChild(imageLi);

                } // eend for loop

                //output.appendChild(imagesUL);
            }
        }

        function clearImages() {
            document.getElementById("covers").innerHTML = "";
        }

        window.addEventListener("load",registerListeners,false);
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:RadioButton id="all" runat="server" Text="all" GroupName="Books"/>
        <asp:RadioButton id="simply" runat="server" Text="Simple Books" GroupName="Books"/>
        <asp:RadioButton id="howto" runat="server" Text="How To Program books" GroupName="Books"/>
        <asp:RadioButton id="dotnet" runat="server" Text=".NET Books" GroupName="Books"/>
        <asp:RadioButton id="javaccpp" runat="server" Text="Java/C/C++ Books" GroupName="Books"/>
        <asp:RadioButton id="none" runat="server" Text="None" GroupName="Books"/>
        
   <div id = "covers"></div>
        <div id="titles"></div>
    </div>
        
    </form>
</body>
</html>
