<?php
include("../include/url_users.php");

/* If already logged in then redirect to previous page */
if(isset($_SESSION['username'])) {
		header('Location:../index.php');
}

if(isset($_POST['submit'])) {
	$username=$_POST['username'];
	$firstname=$_POST['firstname'];
	$emailid=$_POST['emailid'];
	$password=$_POST['password'];

	if ($username == "" || $firstname == "" || $emailid == "" || $password == "") {
		echo "Please enter all information!";
	}
	else{
	include("../db/dbconnect.php");

	/* CHECK if same user or email exists or not ? */
	$query="SELECT * FROM users WHERE username='$username' OR emailid='$emailid'";
	$result=mysqli_query($conn , $query);
	$rows=mysqli_num_rows($result);

	if($rows > 0) {
		echo "
		<div class=\"alert alert-danger container\" role=\"alert\">
	  <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span>
	  <span class=\"sr-only\">Error:</span>
	  Username or email already exists
		</div>
		";
	}
	else {
		$query="INSERT INTO users_buffer (username, firstname, password, emailid)
				VALUES ('$username','$firstname','$password','$emailid')";
		mysqli_query($conn , $query);
		header("location:../index.php");
	}
}


}

/* * * * * Registeration Form * * * * */
else {
	include("../include/frame_register.php");

}


?>
