<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style_main.css">
</head>
<html>
<body>
	<h1 id="Logo">Photos</h1>

	<?php
		// Connect to the database
		$db = new mysqli('localhost', 'root', '', 'cms_js');

		// Get the list of photos from the database, ordered by timestamp in descending order
		$q = "SELECT * FROM post ORDER BY timestamp DESC";
		$result = $db->query($q);

		// Loop through the list of photos and display them
		while ($row = $result->fetch_assoc()) {
			$filename = $row['filename'];
			$url = "img/" . $filename;
			echo "<img src='$url' alt='$filename'>";
		}
	?>
</body>
</html>