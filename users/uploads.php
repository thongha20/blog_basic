<?php
include("../include/url_users.php");
?>

<?php
	if(ISSET($_POST['submit'])){
		if($_FILES['upload']['name'] != "") {
			// $file = $_FILES['upload'];
 
			// $file_name = $file['name'];
			// $file_temp = $file['tmp_name'];
			// $name = explode('.', $file_name);
			// $path = "files/".$file_name;
 
			// $conn->query("INSERT INTO `file` VALUES('', '$name[0]', '$path')") or die(mysqli_connect_error());
 
			// move_uploaded_file($file_temp, $path);


			// File information
			$uploaded_name = $_FILES[ 'upload' ][ 'name' ];
			$uploaded_ext  = substr( $uploaded_name, strrpos( $uploaded_name, '.' ) + 1);
			$uploaded_size = $_FILES[ 'upload' ][ 'size' ];
			$uploaded_type = $_FILES[ 'upload' ][ 'type' ];
			$uploaded_tmp  = $_FILES[ 'upload' ][ 'tmp_name' ];

			// Where are we going to be writing to?
			$target_path   = '../uploads/';
			//$target_file   = basename( $uploaded_name, '.' . $uploaded_ext ) . '-';
			$target_file   =  md5( uniqid() . $uploaded_name ) . '.' . $uploaded_ext;
			$temp_file     = ( ( ini_get( 'upload_tmp_dir' ) == '' ) ? ( sys_get_temp_dir() ) : ( ini_get( 'upload_tmp_dir' ) ) );
			$temp_file    .= DIRECTORY_SEPARATOR . md5( uniqid() . $uploaded_name ) . '.' . $uploaded_ext;

			// Is it an image?
			if( ( strtolower( $uploaded_ext ) == 'jpg' || strtolower( $uploaded_ext ) == 'jpeg' || strtolower( $uploaded_ext ) == 'png' ) &&
				( $uploaded_size < 100000 ) &&
				( $uploaded_type == 'image/jpeg' || $uploaded_type == 'image/png' ) &&
				getimagesize( $uploaded_tmp ) ) {

				// Strip any metadata, by re-encoding image (Note, using php-Imagick is recommended over php-GD)
				// if( $uploaded_type == 'image/jpeg' ) {
				// 	$img = imagecreatefromjpeg( $uploaded_tmp );
				// 	imagejpeg( $img, $temp_file, 100);
				// }
				// else {
				// 	$img = imagecreatefrompng($uploaded_tmp );
				// 	imagepng( $img, $temp_file, 9);
				// }
				// imagedestroy( $img );

				// Can we move the file to the web root from the temp folder?
				// if( rename( $temp_file, ( getcwd() . DIRECTORY_SEPARATOR . $target_path . $target_file ) ) ) {
				// 	// Yes!
				// 	$html .= "<pre><a href='${target_path}${target_file}'>${target_file}</a> succesfully uploaded!</pre>";
				// }
				// else {
				// 	// No
				// 	$html .= '<pre>Your image was not uploaded.</pre>';
				// }

				// Delete any temp files
				if( file_exists( $temp_file ) )
					unlink( $temp_file );

				$conn->query("INSERT INTO `file` VALUES('', '$uploaded_name', '$uploaded_size')") or die(mysqli_connect_error());
				move_uploaded_file($uploaded_tmp, $uploaded_size);
				header("location:uploads.php");	
			}
			
			else {
				// Invalid file
				echo '<pre>Your image was not uploaded. We can only accept JPEG or PNG images.</pre>';
			}

			
		
		}else{
			echo "<script>alert('Required Field!')</script>";
			echo "<script>window.location='uploads.php'</script>";
		}
	}

	else {
		include("../include/frame_uploads.php");
	}
?>