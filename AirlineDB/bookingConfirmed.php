<!DOCTYPE html>
<html>
<head>
	<title>Booking confirmed</title>
	<link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">

	<style>
		body{
            background-size: cover;
            background-repeat: no-repeat;   
      background-image:linear-gradient(rgba(50,50,50,0.2),rgba(50,50,50,0.2)) ,url(images/bookconf.jpg);
        }
        td{
			border:0.2px solid black;
			padding: 10px;
		}
		table{
			padding: 5px;
			width: 70%;
			text-align: center;
			

		}

		p{
			font-size: 20px;
			font-family: Lato;
			text-align: center;
			width: 100%;
		}
		a{
			color: black;
			text-align: center;
			width: 100%;
		}
	</style>
</head>
<body>
</body>
</html>


<?php
	include 'session.php';
 include 'connection.php';

 	$departure = $_SESSION["departure"];
	$destination = $_SESSION["destination"];
	$date =  $_SESSION["date"];
	$contact =$_SESSION["contact"];
	
	
	$num = $_SESSION["number"];
	$price =  $_SESSION["finalprice"];
    $today = date('Y-m-d');
    $payment = $_SESSION["payment"];
	
	$query = "select flightID from flights where departure ='$departure' and destination = '$destination' and Date = '$date' limit 1";
	$exec1= mysqli_query($conn, $query);
	$row = mysqli_fetch_assoc($exec1);
	$FlightID = $row["flightID"];

	$query1 = "insert into booking (username, flightID, no_of_tickets, price) values('$login_session', '$FlightID', '$num', '$price') ";
	$exec2 = mysqli_query($conn, $query1);
	
	
    $query2= "select BookingID from booking where username='$login_session' and flightID='$FlightID' limit 1";
	$exec3= mysqli_query($conn, $query2);
	$row1= mysqli_fetch_assoc($exec3);
	$bookid = $row1["BookingID"];

	$query3="insert into transactions (BookingID,booking_date,amount,paymentMethod) values('$bookid','$today','$price','$payment')";
     $exec4= mysqli_query($conn, $query3);
    
	if ($exec2 and $exec4) {

		  echo "<p>Booking confirmed</p>";  
         echo "<a href='welcome.php'>Click here to go back</a>";

         $proc = " call procedure1('$FlightID','$contact')";
         $result=mysqli_query($conn,$proc);

         $num_of_rows = mysqli_num_rows($result);
	     if ($num_of_rows >= 1)
	     {
		  echo "<p>BOOKED DETAILS</p>";
		  echo '<table>';
		  echo '<tr><th>PNRNUMBER</th>';
		  echo '<th>Name</th>';
		  echo '<th>flightID</th>';
		  echo '</tr>';
		while($row=mysqli_fetch_assoc($result))
    	{
    		echo '<tr>';
        	echo '<td>'.$row['PNRNumber'].'</td>';
        	echo '<td>'.$row['name'].'</td>';
        	echo '<td>'.$row['flightID'].'</td>';
        	echo '</tr>';
    	}
    	
	}

     }
	else {
		$message = "There is an error";
         echo "<script type='text/javascript'>alert('$message');</script>";
         header("Location:welcome.php");  
	}

?>
