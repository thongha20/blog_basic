<?php
	include("bootstrap_cdn.php");
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
	</head>
<body>
	<div class="col-md-3"></div>
	<div class="col-md-6 well">
		<h3 class="text-primary">Upload and Download File</h3>
		<hr style="border-top:1px dottec #ccc;">
		<form class="form-inline" method="POST" action="uploads.php" enctype="multipart/form-data">
			<input class="form-control" type="file" name="upload"/>
			<button type="submit" class="btn btn-success form-control" name="submit"><span class="glyphicon glyphicon-upload"></span> Upload</button>
		</form>
		<br /><br />
		<table class="table table-bordered">
			<thead class="alert-warning">
				<tr>
					<th>Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody class="alert-success">
				<?php

					$row = $conn->query("SELECT * FROM `file`") or die(mysqli_connect_error());
					while($fetch = $row->fetch_array()){
				?>
					<tr>
						<td><?php echo $fetch['name']?></td>
						<td><a href="downloads.php?file=<?php echo $name[1]?>" class="btn btn-primary"><span class="glyphicon glyphicon-download"></span> Download</a></td>
					</tr>
				<?php
					}
				?>
			</tbody>
		</table>
	</div>
</body>
</html>