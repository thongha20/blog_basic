<?php
include("../include/url_users.php");
 ?>

<?php
    if (isset($_POST["submit"])) {
        $name=$_POST['name'];
        $name = stripslashes($name);
        $name = $conn -> real_escape_string($name);
        $email=$_POST['email'];
        $email = stripslashes($email);
        $email = $conn -> real_escape_string($email);
        $msg=$_POST['message'];
        $msg = stripslashes($msg);
        $msg = $conn -> real_escape_string($msg);

        if ($name == "" || $email == "" || $msg == "") {
          echo "Please enter all information!";
        }
        else{
        // include("../db/dbconnect.php");

          $query="INSERT INTO messages (name , email , message )
          VALUES (' $name' , '$email' , '$msg' )";

          $result=mysqli_query($conn , $query);

          if($result) {
            echo "Message sent successfully";
          } else {
            echo "Some error occured.... :-(";
          }
      }}

      else {
          include("../include/frame_contact_us.php");
      }
?>
