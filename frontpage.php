<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style_main.css">
</head>
<body>
<div id="Navtool">
		<div id="navbar">
			<a href="#" class="navlink">Home</a>
			<a href="#" class="navlink">Contact</a>
			<a href="#" class="navlink">About Us</a>
			<a href="#" class="navlink">FAQ</a>
		</div>
	</div>
	</div>
	<?php
		// Connect to the database
		$db = new mysqli('localhost', 'root', '', 'cms_js');

		// Get the list of photos from the database, ordered by timestamp in descending order
		$q = "SELECT * FROM post ORDER BY timestamp DESC";
		$result = $db->query($q);

		// Loop through the list of photos and display them
		while ($row = $result->fetch_assoc()) {
			$filename = $row['filename'];
			$url = "pub/img/" . $filename;
			$date = date('F j, Y', strtotime($row['timestamp']));
			echo "<div class='photo'>
				  <img src='$url' alt='$filename'>
				  <div class='date'>$date</div>
				  <div class='comments'>
				    <h2>Comments</h2>
				    <ul>
				      <li>Comment 1</li>
				      <li>Comment 2</li>
				      <li>Comment 3</li>
				    </ul>
					<div class='vote'>
                    <button class='upvote' type='button'>▲</button>
                    <div class='votecounter'>69</div>
                    <button class='downvote' type='button'>▼</button>
                    
                </div>
				  </div>
				  <input type='button' value='Pokaż więcej'> 
			    </div>";
		}
	?>

</body>
</html>
