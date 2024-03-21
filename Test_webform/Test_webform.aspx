<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test_webform.aspx.cs" Inherits="Test_webform.Test_webform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
        
    <title>My introduction</title>
    <style>
        #form1
        {
          height: 600px;
          width: 500px;
          background-color: lightgreen;
          margin-left: auto;  /*Creates a space on the left side of the box */
          margin-right: auto;  /*Creates a space on the right side of the box */

        }
        #button {
            display: flex;
            text-align: center;
            justify-content: center; 
            align-items: center; 
            height: 100vh;
        }
        #button_size {
           font-size: 100px;
           padding: 10px 20px;

        }

    </style>

</head>
<body> 
    <form id="form1" runat="server"> 
         <div id="button">
         <button id="button_size">HELLO</button>
     </div>
    </form>

</body>
</html>

