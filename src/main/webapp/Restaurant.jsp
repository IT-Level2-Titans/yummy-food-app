<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Restaurant Details</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/my_styles2.css" rel="stylesheet">
    <style>
        body {
            background-image: url(Images/pic5.jpg);
            background-repeat: repeat-y;
        }
    </style>

</head>

<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <img alt="Brand" src="Images/logo1.png" height="40px">

            </a>
        </div>
        <ul class="nav navbar-nav">

            <li><a href="index.jsp">Home</a></li>
            <li><a href="RatingHome.jsp">Restaurants</a></li>
            <li><a href="path.jsp#sign">Add My Restaurant</a></li>
            <li><a href="path.jsp">Path</a></li>

        </ul>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-sm-5">
            <div id="restaurant-slider" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="Images/hotel7.jpg" alt="first hotel"/>
                    </div>
                    <div class="item">
                        <img src="Images/hotel8.jpg" alt="first hotel"/>
                    </div>
                    <div class="item">
                        <img src="Images/hotel9.jpg" alt="first hotel"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-7">
            <h1>Restaurant 1</h1>
            <h5>We only use fresh, carefully sourced and seasonal ingredients to make all our beautiful, rustic
                dishes.</h5>
            <h5>You can take a look at our vegetarian, vegan, gluten free and healthy options by checking the boxes
                below.
                Just make sure you check the nutritional and allergy details, as some dishes may require small changes -
                you
                can find these by clicking on the name of a dish you want to look at. Always speak to your server if you
                have
                any dietary requirements or allergies.
            </h5>
            <hr color="#8B4513">
            <div class="col-sm-4">
                <h3>Location</h3>
                <h5></h5>
                <h3>Contact us</h3>
                <h3>The Menu</h3>
            </div>
            <div class="col-sm-3">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">

        </div>
    </div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>


</html>