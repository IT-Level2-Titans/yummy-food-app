<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Online Food Searching</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/home.css" rel="stylesheet">

    <!-- Form Validation -->
    <script>
        function validateForm_1() {
            var fo = document.forms["FoodWise"]["fo"].value;
            var ci = document.forms["FoodWise"]["ci"].value;
            if (fo == "" ||  ci=="") {
                alert("ENTER YOUR CHOICE.WE WILL FIND OUT THE SUITABLE RESTAURANTS");
                return false;
            }
        }
    </script>

    <script>
        function validateForm_2() {
            var res = document.forms["RestaurantWise"]["res"].value;

            if (res == "") {
                alert("ENTER YOUR CHOICE.WE WILL FIND OUT YOUR FAVOURITE ONE");
                return false;
            }
        }
    </script>

    <script>
        function validateForm_3() {
            var loc = document.forms["LocationWise"]["loc"].value;

            if (loc == "" ) {
                alert("ENTER YOUR CHOICE.WE WILL FIND OUT THE SUITABLE RESTAURANTS");
                return false;
            }
        }
    </script>

</head>
<body>

<nav class="navbar navbar-inverse">

    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><img alt="Brand" src="images/logo1.png" height="40px"></a>
            <a class="navbar-brand" href="#"><i><b>YUmmy</b></i></a>
        </div>
        <div class="navd">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="RatingHome.jsp">Restaurants</a></li>
                <li><a href="path.jsp#sign">Add My Restaurant</a></li>
                <li><a href="path.jsp">Path</a></li>

            </ul>

        </div>
    </div>
</nav>

<div class="container">
    <div class="row1">
        <div class="col-md-9">

            <div class="row carousel-holder">
                <div class="col-md-12">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>

                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img class="slide-image" src="images/slider1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="images/slider2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="images/slider3.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="images/slider4.jpg" alt="">
                            </div>
                        </div>
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>

        </div>


        <div class="col-md-3">
            <div class="corner">
                <img class="img-responsive" src="images/hand.png" alt="" height="350" width="200">
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn">Search</button>
                    <div id="myDropdown" class="dropdown-content">
                        <a href="#row4"><h6 style="color:blue">Food Wise</h6></a>
                        <a href="#row5"><h6 style="color:blue">Restaurant Wise</h6></a>
                        <a href="#row7"><h6 style="color:blue">Location Wise</h6></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row2">
    <div class="col-md-12">
        <h3><b>Get The YUmmy Food Finder Mobile App!</b></h3>
        <p>
        <center>Download our free app to find delicious food anywhere you go...It is now available on Apple Store and
            Google Play.
        </center>
        </p>
    </div>
    <div class="row3">
        <div class="col-md-6">
            <img class="img-responsive" src="images/mobile1.png" height="600px" width="300px" alt="">
        </div>

        <div class="col-sm-3 col-xs-6">
            <img class="img-responsive" src="images/appstore.png" alt="">
        </div>

        <div class="col-sm-3 col-xs-6">
            <img class="img-responsive" src="images/playstore.png" alt="">
        </div>
    </div>
</div>
<hr></hr>
<div class="container1">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Search by
                <small>Food Wise</small>
            </h1>
        </div>

        <!-- /.row -->
        <!-- Portfolio Item Row -->
        <a id="row4">
            <div class="row4">
                <div class="col-md-4">
                    <img class="img-responsive1" src="images/food.jpg" alt="">
                </div>
                <div class="col-md-8">
                    <h3>Find Your Favourite Restaurant</h3>

                    <form name="FoodWise" action="http://localhost:8080/rest/hello/FoodWise" method="post" onsubmit="return validateForm_1()">
                        <div class="row">
                            <div class="col-sm-6 col-xs-12 text_field">
                                <input type="txt" class="form-control" name="fo" placeholder="Enter Food">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-xs-12 text_field">
                                <input type="txt" class="form-control" name="ci" placeholder="Enter Your Current City">
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12 btn_field">
                            <input type="submit" value="Search_Restaurants" class="btn btn-danger">
                            <!--<a href="" class="btn btn-danger">Submit</a>-->
                        </div>
                    </form>
                    <h5><%= request.getParameter("returnmsg1") %></h5>
                </div>
            </div>
        </a>

    </div>
    <hr></hr>

    <div class="row6">
        <div class="col-lg-12">
            <h3 class="page-header">Find Your Favorite Food</h3>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/1.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/2.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/3.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/4.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
    </div>
    <hr></hr>

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Search by
                <small>Restaurant Wise</small>
            </h1>
        </div>

        <!-- /.row -->
        <!-- Portfolio Item Row -->
        <a id="row5">
            <div class="row5">
                <div class="col-md-4">
                    <img class="img-responsive1" src="images/rest.jpg" alt="">
                </div>
                <div class="col-md-8">
                    <h3>Find Your Favourite Restaurant</h3>

                    <form name="RestaurantWise" action="http://localhost:8080/rest/hello/RestaurantWise" method="post" onsubmit="return validateForm_2()">
                        <div class="row">
                            <div class="col-sm-6 col-xs-12 text_field">
                                <input type="txt" class="form-control" name="res" placeholder="Enter Restaurant Name">
                            </div>
                        </div>

                        <div class="col-sm-6 col-xs-12 btn_field">
                            <input type="submit" value="Search_Restaurants" class="btn btn-danger">
                        </div>
                    </form>
                    <h5><%= request.getParameter("returnmsg2") %></h5>
                </div>
            </div>
        </a>
    </div>


    <div class="row6">
        <div class="col-lg-12">
            <h3 class="page-header">Find Your Favorite Food</h3>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/1.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/2.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/3.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/4.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
    </div>
    <hr></hr>


    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Search by
                <small>Location Wise</small>
            </h1>
        </div>

        <!-- /.row -->
        <!-- Portfolio Item Row -->
        <a id="row7">
            <div class="row5">
                <div class="col-md-4">
                    <img class="img-responsive1" src="images/hotel5.jpg" alt="">
                </div>
                <div class="col-md-8">
                    <h3>Find Your Favourite Restaurant</h3>

                    <form name="LocationWise" action="http://localhost:8080/rest/hello/LocationWise" method="post" onsubmit="return validateForm_3()">
                        <div class="row">
                            <div class="col-sm-6 col-xs-12 text_field">
                                <input type="txt" class="form-control" name="loc" placeholder="Enter Your Town">
                            </div>
                        </div>

                        <div class="col-sm-6 col-xs-12 btn_field">
                            <input type="submit" value="Search_Restaurants" class="btn btn-danger">
                        </div>
                    </form>
                    <h5><%= request.getParameter("returnmsg3") %></h5>
                </div>
            </div>
        </a>
    </div>
    <hr>
    <div class="row6">
        <div class="col-lg-12">
            <h3 class="page-header"></h3>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/5.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/6.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/7.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
        <div class="col-sm-3 col-xs-6">
            <a href="#">
                <img class="img-responsive portfolio-item" src="images/8.jpg" height="250px" width="250px" alt="">
            </a>
        </div>
    </div>
</div>
<hr></hr>

<div class="footer">
    <div class="row7">
        <div class="col-lg-12">
            <p><b>
                <center>Copyright &copy; 2016-Online Ordering - Faculty Of Information Technology</center>
            </b></p>
        </div>
    </div>
</div>

</footer>


<script>
    /* When the user clicks on the button,
     toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {

            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }

</script>
<script src="js/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
