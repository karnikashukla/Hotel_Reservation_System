<%-- 
    Document   : Admin_Login
    Created on : 18 Sep, 2020, 1:15:49 PM
    Author     : karnika
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Reservation System</title>
         <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
         
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>

    <body>
        <h2 style="color: black;font-style: italic;font-size: 20px">Admin</h2>
        <form action="AdminLoginServlet" method="post">

            <div class="container">
                <label for="uname"><b>Username</b></label><br>
                <input type="text" placeholder="Enter Username" name="uname" required autofocus ><br><br>

                <label for="psw"><b>Password</b></label><br>
                <input type="password" placeholder="Enter Password" name="psw" required><br><br>

                <button type="submit" style='color: white'>Login</button><br><br>
            </div>

            <div class="container" style="background-color:#f1f1f1">
                <span class="psw"><a href="#">Forgot password?</a></span>
            </div>
        </form>
    </body>
</html>
