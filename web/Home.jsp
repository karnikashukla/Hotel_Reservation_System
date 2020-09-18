<%-- 
    Document   : Home
    Created on : 18 Sep, 2020, 3:04:59 AM
    Author     : karnika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | Hotel Reservation </title>

        <link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <script>
            function CheckDates(form) {
                date1 = form.check_in_date.value;
                date2 = form.check_out_date.value;
                var d1 = new Date(date1);
                var d2 = new Date(date2);
                if (date1 == '')
                    alert("Please enter Password");

                else if (date2 == '')
                    alert("Please enter confirm password");

                else if (d2 < d1) {
                    alert("\nPlease enter valid dates!")
                    return false;
                }
                else {
                    return true;
                }
            }

            function Redirect() {
                window.location.href = "search.jsp";
            }
        </script> 
    </head>
    <body style="background:url('images/banner.jpg');background-size:cover;background-attachment: fixed;font-family: serif;">

        <div style="margin-top:120px">
            <h1 style="text-align:center">Welcome, <%=session.getAttribute("currentSessionUser")%></h1>
            <h3 style="text-align:center">Please select your reservation details!</h3>
        </div>
        <div class="" style="margin-left:401px;margin-top:50px">


            <div class="container" >

                <form action="BookingServlet" method="post">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="check_in_date">CheckIn Date</label>
                            <input type="date" class="form-control" id="check_in_date" name="check_in_date">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="check_out_date">CheckOut Date</label>
                            <input type="date" class="form-control" id="check_out_date" name="check_out_date">
                        </div>                
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="guests">Total Guest</label>
                            <input type="number" id="guests" name="guests" class="form-control" min="1" max="10"/>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="roomType">Room Type</label>
                            <select id="roomType" name="roomType" class="form-control">
                                <option selected>Choose...</option>
                                <option name='standard' value="Standard">Standard</option>
                                <option name='deluxe' value="Deluxe">Deluxe</option>
                                <option name='luxury' value="Luxury">Luxury</option>                            </select>
                        </div>                   
                    </div>
                    <div class="form-row" style="margin-left:105px">
                        <button type="submit" name='book' value="Book" class="btn btn-outline-dark col-md-6" style=" color: white">Book</button>
                    </div>
                    <div style="padding:10px" ></div>
                  </form>
                <div class="form-row" style="margin-left:105px">
                        <button type="submit" class="btn btn-outline-dark col-md-6" style="color: white"name='search' onclick="Redirect()">Search Available Bookings</button>
                    </div>
            </div>
    </body>
</html>
