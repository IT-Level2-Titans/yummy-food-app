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
    <link href="css/path.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <!--<a class="navbar-brand" href="#"><img alt="Brand" src="images/logo1.png" height="80px" width="160px" ></a>-->
            <a class="navbar-brand" href="#"><img alt="Brand" src="images/logo1.png" height="40px"></a>
            <a class="navbar-brand" href="#"><i><b>YUmmy</b></i></a>
        </div>
        <div class="navd">
            <ul class="nav navbar-nav">

                <li><a href="index.jsp">Home</a></li>
                <li><a href="RatingHome.jsp">Restaurants</a></li>
                <li><a href="path.jsp#sign">Add My Restaurant</a></li>
                <li class="active"><a href="path.jsp">Path</a></li>
            </ul>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#sign"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="#sign"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>

<div class="fixed-bg">
    <div class="col-md-12">
        <h3>Do you wanna see the location?</h3>
    </div>
    <div class="row">
        <div class="col-md-4">
            <!--<div class = "thumbnail">
                    <table border="0" cellpadding="0" cellspacing="3">
                    <tr>
                    <td colspan="2">
                    Source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                    <input type="text" id="txtSource" value="Bandra, Mumbai, India" style="width: 200px" /></br></br></br>
                    Destination:
                    <input type="text" id="txtDestination" value="Andheri, Mumbai, India" style="width: 200px" />
                    <br /></br>
                    <input type="button" value="Get Route" onclick="GetRoute()" />
                    <hr />
                    </td>
                    </tr>

                    <tr>
                    <td colspan="2">
                    <div id="dvDistance">
                </div>
              </td>

            </table>


            </div>-->
            <div class="circular">
                <form>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 text_field">
                            <label>Source</label>
                            <input type="txt" class="form-control" id="txtSource"
                                   value="Colombo, Western Province, Sri Lanka">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 text_field">
                            <label>Destination</label>
                            <input type="txt" class="form-control" id="txtDestination"
                                   value="Kandy, Central Province, Sri Lanka">
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12 btn_field">
                        <input type="button" value="Get Route" onclick="GetRoute()"/>
                    </div>
                </form>

            </div>
            <div id="dvDistance">
            </div>
        </div>

        <div class="col-md=8">
            <div
            " div id="dvMap">
            <script type="text/javascript"
                    src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
            <script type="text/javascript">
                var source, destination;
                var directionsDisplay;
                var directionsService = new google.maps.DirectionsService();
                google.maps.event.addDomListener(window, 'load', function () {
                    new google.maps.places.SearchBox(document.getElementById('txtSource'));
                    new google.maps.places.SearchBox(document.getElementById('txtDestination'));
                    directionsDisplay = new google.maps.DirectionsRenderer({'draggable': true});
                });

                function GetRoute() {
                    var mumbai = new google.maps.LatLng(18.9750, 72.8258);
                    var mapOptions = {
                        zoom: 7,
                        center: mumbai
                    };
                    map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
                    directionsDisplay.setMap(map);
                    directionsDisplay.setPanel(document.getElementById('dvPanel'));

                    //*********DIRECTIONS AND ROUTE**********************//
                    source = document.getElementById("txtSource").value;
                    destination = document.getElementById("txtDestination").value;

                    var request = {
                        origin: source,
                        destination: destination,
                        travelMode: google.maps.TravelMode.DRIVING
                    };
                    directionsService.route(request, function (response, status) {
                        if (status == google.maps.DirectionsStatus.OK) {
                            directionsDisplay.setDirections(response);
                        }
                    });


                    //*********DISTANCE AND DURATION**********************//
                    var service = new google.maps.DistanceMatrixService();
                    service.getDistanceMatrix({
                        origins: [source],
                        destinations: [destination],
                        travelMode: google.maps.TravelMode.DRIVING,
                        unitSystem: google.maps.UnitSystem.METRIC,
                        avoidHighways: false,
                        avoidTolls: false
                    }, function (response, status) {
                        if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                            var distance = response.rows[0].elements[0].distance.text;
                            var duration = response.rows[0].elements[0].duration.text;
                            var dvDistance = document.getElementById("dvDistance");
                            dvDistance.innerHTML = "";
                            dvDistance.innerHTML += "Distance: " + distance + "<br />";
                            dvDistance.innerHTML += "Duration:" + duration;

                        } else {
                            alert("Unable to find the distance via road.");
                        }
                    });
                }
            </script>


        </div>
    </div>
</div>
<div class="row1">
    <div class="col-md-4">
        <input type="button" class="btns" value="Delivery Rate" onclick="GetDeliveryRate()"/>
        <div id="deliveryrate"></div>
    </div>
    <div class="col-md-4">
        <input type="button" class="btns" value="Delivery Cost" onclick="GetDeliveryCost()"/>
        <div id="deliverycost"></div>
    </div>
    <div class="col-md-4">
        <input type="button" class="btns" value="Order Cost" onclick="GetOrderCost()"/>
        <div id="ordercost"></div>
    </div>
</div>
<div class="row2">
    <div class="col-md-12">
        <div class="row2">

            <a href="#" class="btn">Verify Order</a>
        </div>
    </div>
</div>

</div>
<a id="sign">
    <div class="cont">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <!--<a class="navbar-brand" href="#"><img alt="Brand" src="images/logo1.png" height="80px" width="160px" ></a>-->
                    <a class="navbar-brand" href="#"><img alt="Brand" src="images/logo1.png" height="40px"></a>
                    <a class="navbar-brand" href="#"><i><b>YUmmy</b><i></a>
                </div>
                <div class="navd">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="RatingHome.jsp">Restaurants</a></li>
                        <li class="active"><a href="#sign">Add My Restaurant</a></li>
                        <li><a href="#">Path</a></li>
                    </ul>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#sign"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a href="#sign"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row5">
                <div class="col-md-6">
                    <h3>Do you already have an account?</h3>
                    <div class="row">
                        <!--<div class="col-xs-4">
                        <img class="img-responsive" src="images/burger.png">
                        </div>-->
                        <div class="col-xs-12">
                            <div class="circular2">

                                <form action="validation.php" method="post">

                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12 text_field">
                                            <label>UserName:</label>
                                            <input type="text" name="un" class="form-control" placeholder="User name">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12 text_field">
                                            <label>Password:</label>
                                            <input type="txt" class="form-control" name="pw" placeholder="Password">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12 btn_field">
                                        <input type="submit" value="Submit"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <h3>If not create an account</h3>
                    <div class="col-sm-2">
                        <img class="img-responsive" src="images/horse.gif">
                    </div>
                    <div class="col-sm-10">
                        <div class="circular3">

                            <form action="InsertRestaurant.php" method="post">

                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 text_field">
                                        <label>Username:</label>
                                        <input type="text" name="username" class="form-control" placeholder="Username">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 text_field">
                                        <label>Restaurant Name:</label>
                                        <input type="text" name="RestaurantName" class="form-control"
                                               placeholder="Restaurant name">
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 text_field">
                                        <label>Location:</label>
                                        <input type="txt" class="form-control" name="location" placeholder="Location">
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 text_field">
                                        <label>Password:</label>
                                        <input type="password" class="form-control" name="password"
                                               placeholder="Password">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6 col-xs-12 text_field">
                                        <label>Confirm Password:</label>
                                        <input type="password" class="form-control" name="confirmpassword"
                                               placeholder="Confirm Password">
                                    </div>
                                </div>

                                <div class="col-sm-6 col-xs-12 btn_field">
                                    <input type="submit" value="Submit"/>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

</a>
<div class="footer">
    <div class="col-sm-3 col-xs-6">
        <a href="#">
            <img class="img-responsive portfolio-item" src="images/call.png" alt="">
        </a>
    </div>
    <div class="col-sm-3 col-xs-6">
        <a href="#">
            <img class="img-responsive portfolio-item" src="images/facebook.png" alt="">
        </a>
    </div>
    <div class="col-sm-3 col-xs-6">
        <a href="#">
            <img class="img-responsive portfolio-item" src="images/skype.png" alt="">
        </a>
    </div>
    <div class="col-sm-3 col-xs-6">
        <a href="#">
            <img class="img-responsive portfolio-item" src="images/google-plus.png" alt="">
        </a>
    </div>
    <div class="col-lg-12">
        <p><b>
            <center>Copyright &copy; 2016-Online Ordering - Faculty Of Information Technology</center>
        </b></p>
    </div>
</div>


<script src="js/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
