<?php

include 'connection.php';

//declare variables
 $username = $_POST["username"];
 $password = $_POST["password"];
 $firstname = $_POST["firstname"];
 $lastname = $_POST["lastname"];
 $contact = $_POST["contact"];
 $email = $_POST["email"];

//store query in a variable
 $query = "select * from users where username ='$username'";
 //execute the query stored in variable $query and store result in variable $exec
 $exec = mysqli_query($conn,$query); 
// return number of rows
 $result = mysqli_num_rows($exec); 


 
   if($result == 1)
       {
	    echo "<font size=18>User Already Exists</font>";
       }
   
    else
    {
 	$query1 = "insert into users(username, password, Fname, Lname, Contact,email) values ('$username', '$password', '$firstname', '$lastname', '$contact','$email')";
 	$exec1 = mysqli_query($conn,$query1);
 	if($exec1)
      echo "<center><font size=18>User Created </font></center>";
     }

  

?>

<!DOCTYPE html>
<html>
<head>
	<title>UserCreated</title>
	<meta charset="utf-8" meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>

	<style>
		body{
			background-size: cover;
			background-repeat: no-repeat;	
      background-image:linear-gradient(rgba(50,50,50,0.2),rgba(50,50,50,0.2)) ,url(images/hello.jpg);
		}
		form
		{
			text-align: center;
			font-size: 30px; 
			color: black;
			margin-left: 270px;
		}
		 .flight{
      width: 50%;
      margin-left: 400px;
      margin-top: 21px;
      border-radius: 10px;
       }
		
		input[type = text], input[type = password]{
  width: 55%;
  height: auto;
  border: 0.5px solid #B9B9BA;
  padding: 10px;

}
.para{
	font-size: 85px;
	margin-left: 40px;
}

       
		input[type=submit]{
			background-color: #4CAF50;
  			color: black;
  			padding: 1px 5px;
  			border: none;
  			border-radius: 8px;
  			cursor: pointer;
  			width: 30%;
 			margin-bottom:1px;
 			
		}
		h2{
			text-align: center;
		}
		.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  width: 38%;
  opacity: 0.8;
}

	</style>

</head>
<body>
	<br/>
<a href="demo2.html">
 	  <center> <button class="btn">Go Back</button></center>
       </a>
       <br>
 <a href="login.php">
 	<center><button class="btn">Login </button></center>
 </a>
	
</form>
</body>
</html>