<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Highest Rated Resturents</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/my_styles1.css" rel="stylesheet">


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
                <li><a href="index.jsp">Home</a></li>
                <li class="active"><a href="RatingHome.jsp#AllRestaurants">Restaurants</a></li>
                <li><a href="path.jsp#sign">Add My Restaurant</a></li>
                <li><a href="path.jsp">Path</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
        </div>
    </div>


</nav>


<div class="container" >
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-2">
                <a href="Restaurant1.php"> <img src="images/<%=request.getParameter("returnmsg1")%>.jpg" class="img-rounded" alt="First Hotel"
                                                width="304" height="220"></a>
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <h2><%= request.getParameter("returnmsg1") %></h2>
                <h5></h5>
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
                <div>
                    <button type="button" class="btn">Comment</button>
                    <button type="button" class="btn">Like</button>
                </div>
            </div>
        </div>
    </div>
</div>

</br>


</br>


<!--View all restaurants just clicking  this button-->
<form action="http://localhost:8080/rest/foodservice/loadallrestaurants">
<input type="submit" value="View All Restaurants" >
</form>

<a id="AllRestaurants">

<div class="container" >
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-2">
                <a href="Restaurant1.php"> <img src="images/hotel1.jpg" class="img-rounded" alt="First Hotel"
                                                width="304" height="220"></a>
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <h2><%= request.getParameter("R1") %></h2>
                <h2><%= request.getParameter("C1") %></h2>
                <h5>(Here goes a brief description by one or two lines) </br> Enjoy our seated, multi-course Wine & Food
                    Pairing by Executive Chef Bryan Jones, who creates an assortment of small dishes paired with our
                    hand-selected Artisan Collection wines.</h5>
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
                <div>
                    <button type="button" class="btn">Comment</button>
                    <button type="button" class="btn">Like</button>
                </div>
            </div>
        </div>
    </div>
</div>

</br>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-2">
                <img src="images/hotel2.jpg" class="img-rounded" alt="First Hotel" width="304" height="220">
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <h2><%= request.getParameter("R2") %></h2>
                <h2><%= request.getParameter("C2") %></h2>
                <h5>(Here goes a brief description by one or two lines) </br> Enjoy our seated, multi-course Wine & Food
                    Pairing by Executive Chef Bryan Jones, who creates an assortment of small dishes paired with our
                    hand-selected Artisan Collection wines. </h5>
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
                <div class="button">
                    <button type="button" class="btn">Comment</button>
                    <button type="button" class="btn">Like</button>
                </div>
            </div>
        </div>
    </div>
</div>

</br>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-2">
                <img src="images/hotel3.jpg" class="img-rounded" alt="First Hotel" width="304" height="220">
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <h2><%= request.getParameter("R3") %></h2>
                <h2><%= request.getParameter("C3") %></h2>
                <h5>(Here goes a brief description by one or two lines) </br> Enjoy our seated, multi-course Wine & Food
                    Pairing by Executive Chef Bryan Jones, who creates an assortment of small dishes paired with our
                    hand-selected Artisan Collection wines. </h5>
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
                <div class="button">
                    <button type="button" class="btn">Comment</button>
                    <button type="button" class="btn">Like</button>
                </div>
            </div>
        </div>
    </div>
</div>

</br>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-2">
                <img src="images/hotel4.jpg" class="img-rounded" alt="First Hotel" width="304" height="220">
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <h2><%= request.getParameter("R4") %></h2>
                <h2><%= request.getParameter("C4") %></h2>
                <h5>(Here goes a brief description by one or two lines) </br> Enjoy our seated, multi-course Wine & Food
                    Pairing by Executive Chef Bryan Jones, who creates an assortment of small dishes paired with our
                    hand-selected Artisan Collection wines. </h5>
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
                <div>
                    <button type="button" class="btn">Comment</button>
                    <button type="button" class="btn">Like</button>
                </div>
            </div>
        </div>
    </div>
</div>

</br>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-2">
                <img src="images/hotel5.jpg" class="img-rounded" alt="First Hotel" width="304" height="220">
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <h2><%= request.getParameter("R5") %></h2>
                <h2><%= request.getParameter("C5") %></h2>
                <h5>(Here goes a brief description by one or two lines) </br> Enjoy our seated, multi-course Wine & Food
                    Pairing by Executive Chef Bryan Jones, who creates an assortment of small dishes paired with our
                    hand-selected Artisan Collection wines. </h5>
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
                <div>
                    <button type="button" class="btn">Comment</button>
                    <button type="button" class="btn">Like</button>
                </div>
            </div>
        </div>
    </div>
</div>

</br>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-2">
                <img src="images/hotel6.jpg" class="img-rounded" alt="First Hotel" width="304" height="220">
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <h2><%= request.getParameter("R6") %></h2>
                <h2><%= request.getParameter("C6") %></h2>
                <h5>(Here goes a brief description by one or two lines) </br> Enjoy our seated, multi-course Wine & Food
                    Pairing by Executive Chef Bryan Jones, who creates an assortment of small dishes paired with our
                    hand-selected Artisan Collection wines. </h5>
                <div class="rating">
                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                </div>
                <div>
                    <button type="button" class="btn">Comment</button>
                    <button type="button" class="btn">Like</button>
                </div>
            </div>
        </div>
    </div>
</div>

</a>

</br>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>