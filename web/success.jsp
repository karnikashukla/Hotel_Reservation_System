<%-- 
    Document   : success
    Created on : 18 Sep, 2020, 11:37:34 AM
    Author     : karnika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Successful Reservation</title>
        <style>
            button{
                margin-left: 510px;
                background-color: black;
                padding: 10px;
                width: 30%;
                color: white;
            }
        </style>
        <script>
            function Redirect(){
                window.location.href="Home.jsp";
            }
        </script>
    </head>
    <body>
        <h1 style="text-align: center;font-family: serif">Reservation Successful!<br>Thank you for choosing us!<br>Happy Holidays!</h1>
        <button type="submit" onclick="Redirect()" style=" text-align: center; font-family: serif">Go Back</button>
    </body>
</html>
