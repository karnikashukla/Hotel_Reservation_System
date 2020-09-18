<%-- 
    Document   : Registration
    Created on : 18 Sep, 2020, 1:35:00 AM
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

        <script>

            // Function to check Whether both passwords 
            // is same or not. 
            function checkPassword(form) {
                password1 = form.psw.value;
                password2 = form.confirm_psw.value;

                // If password not entered 
                if (password1 == '')
                    alert("Please enter Password");

                // If confirm password not entered 
                else if (password2 == '')
                    alert("Please enter confirm password");

                // If Not same return False.     
                else if (password1 != password2) {
                    alert("\nPassword did not match: Please try again...")
                    return false;
                }

                // If same return True. 
                else {
                    return true;
                }
            }
        </script> 

    </head>

    <body>
        <h2 style="color: black;font-style: italic">Hotel Reservation</h2>
        <form action="RegistrationServlet" method="post" onSubmit = "return checkPassword(this)">

            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <label for="uname"><b>Name</b></label><br>
                        <input type="text" placeholder="Enter your name" name="uname" required autofocus><br><br>
                    </div>
                    <div class="col-md-6">
                        <label for="uname"><b>Contact Number</b></label><br>
                        <input type="text" placeholder="Enter your contact number" name="contact" maxlength = "10" minlength = "10" required><br><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label for="uname"><b>Email</b></label><br>
                        <input type="email" placeholder="Enter your email address" name="email" required><br><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="psw"><b>Create Password</b></label><br>
                        <input type="password" placeholder="Create Password" name="psw" maxlength = "8" minlength = "6" required><br><br>
                    </div>
                    <div class="col-md-6">
                        <label for="psw"><b>Confirm Password</b></label><br>
                        <input type="password" placeholder="Re-enter Password" name="confirm_psw" required><br><br>
                    </div>
                </div>
                <button type="submit" style='color: white'>Register</button><br><br>
            </div>

            <div class="container" style="background-color:#f1f1f1">
                <span class="psw" style="color: red">Password must contain one capital letter,one special character(!,@,#,$,%,^,&,*),one numeric value and length must be between 6 to 8\ne.g. Abc@123</span>
            </div>
        </form>
    </body>
</html>
