<!DOCTYPE html>
<html lang="en">

<head>
    <title>Ticket</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
    body{
            background-size: cover;
            background-repeat: no-repeat;   
      background-image:linear-gradient(rgba(50,50,50,0.2),rgba(50,50,50,0.2)) ,url(images/408193.jpg);
        }
    button,
    a {
        color: white;
    }
    .btn {
         width: 25%;
        background: none;
        padding: 6px 10px 6px 10px;
      height: 35px;
      border: 1px solid black;
      font-size: 15px;
      font-weight: bold;
      }
</style>

<body>

    <div class="container">
        <h1>&nbsp</h1>
        <center><h2>Booking Confirmed</h2></center>
    </div>

</body>

</html>
<?php
include 'connection.php';
session_start();
//web price is the price shown on website
// pass price a parameter from database
   $departure = $_SESSION["departure"];
    $destination = $_SESSION["destination"];
    $date =  $_SESSION["date"];
   $contact = $_SESSION["contact"];


$query = "select Price from flights where departure ='$departure' and destination = '$destination' and Date = '$date'  limit 1";
    $exec1= mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($exec1);
    $newprice = $row["Price"];
    $_SESSION["contact"]=$contact;


// create a coupon code variable in database
$coupon = $_SESSION["couponcode"];


$rs1 = mysqli_query( $conn,"call Discount('$newprice','$coupon',@final)");
$rs = mysqli_query( $conn,'SELECT @final as final' ) or die(mysql_error());
    while($row1 = mysqli_fetch_array($rs))
    {
    $finalprice=$row1['final'];
    }
$_SESSION["finalprice"] = $finalprice;
$_SESSION["contact"]=$contact;


//alert button to display final price
// final amount is stored in finalprice variable
echo "<font size='18'>"."The Total Fare:"."</font>";
echo "<font size='18'>".$_SESSION["finalprice"]."</font>";
    ?>
<form action="bookingConfirmed.php" method="post">
                
               <center><button class="btn" type="submit"><font color='Black'>Confirm</font></button></center>
                
        </form>
