

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Boarding Pass</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">

    <style>
      body{
            background-size: cover;
            background-repeat: no-repeat;   
      background-image:linear-gradient(rgba(50,50,50,0.2),rgba(50,50,50,0.2)) ,url(images/943246.png);
        }
        table{
            margin-top:50px;
        }
        .button {
  background-color: #4CAF50; /* Green */
  border: none;
  border-radius:20px;
  color: white;
  padding: 10px 28px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
button,a{
    color:white;
}
.button2 {background-color: #008CBA;} /* Blue */

.para {
      font-size: 65.5px;
      margin-left: 30px;
      color: white;
    }

    </style>
</head>

<body >
<div class="col-md-6" align="margin-left">
    <center><p class="para"><font color="grey">JARVIS</font></p></center>
    <h3><font color="white">Booking Details are: </font></h3>
  </div>
 
<table class="table table-bordered">
<tr>
<th><font color="white">Name</font></th> 
<th><font color="white">Age</font></th> 
<th><font color="white">Gender</font></th> 
<th><font color="white">Flight ID</font></th>
<th><font color="white">PNR Number</font></th>

</tr>
<?php
    include 'connection.php';
    $pnr = $_POST['pnrnum'];
    $sql = "SELECT * FROM passengers WHERE PNRNumber = $pnr";
$result = mysqli_query($conn, $sql);
$num_rows = mysqli_num_rows($result);
if ($num_rows > 0) {
// output data of each row
while($row = mysqli_fetch_assoc($result)) {
  
echo "<tr><td> " ."<font color=white>". $row["name"]."</font>". "</td><td>" ."<font color=white>". $row["age"] . "</font>"."</td><td>"."<font color=white>".$row["gender"]."</font>" ."</td><td>"."<font color=white>".$row["flightID"]."</font>" ."</td><td>"."<font color=white>".$row["PNRNumber"]."</font>"."</td>" ;
}
echo "</table>";
} 
else {
     echo "<script> alert('Go Away Hacker')
     window.location.href='pnr.html';</script>";
     
    }
$conn->close();
?>
</table>
<button class="button button2" onclick="window.print();return false;" >Print Ticket</button>
<button class="button"><a href="homepage.html">Homepage</a></button>

    

</body>

</html>