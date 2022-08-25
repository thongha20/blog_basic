<?php

/* search.php?q='dp' */

include("../include/url_posts.php");

if(isset($_POST['submit'])) {
	$q=$_POST['q'];
} else {
	// echo "Do not be empty!";
	$q='';
}
$q = stripslashes($q);
$q = $conn -> real_escape_string($q);

$query="SELECT *
		FROM posts
		WHERE postTitle like '% $q %' OR
					postTag like '$q' OR
					postDesc like '$q' OR
					postAuthor like '$q'
		";

$result=mysqli_query($conn , $query);
// echo $kq=mysqli_num_rows($result);

if(mysqli_num_rows($result)) {
	while($post=mysqli_fetch_assoc($result)) {
		$id=$post['postID'];
		$title=$post['postTitle'];
		$desc=$post['postDesc'];
		$tags=$post['postTag'];
		$author=$post['postAuthor'];
		$time=$post['postTime'];
		$shortpost=1;  /* short post with read more  */

		include("../include/frame_post.php");
	}
}
else {
	echo "No search Result found";
}

?>