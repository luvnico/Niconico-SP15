<?php
	require '../secure/database.php';

	//if (isset($_POST['username']))
	//{	
		$username = htmlspecialchars($_POST['username']);
		/*	$user_type = htmlspecialchars($_POST['user-type']);
		$institution_name = htmlspecialchars($_POST['institution_name']);
		$firstname = htmlspecialchars($_POST['firstname']);
		$lastname = htmlspecialchars($_POST['firstname']);
		$email = htmlspecialchars($_POST['email']);
		$address = htmlspecialchars($_POST['address']);
		$city = htmlspecialchars($_POST['city']);
		$state = htmlspecialchars($_POST['state']);
		$zipcode = htmlspecialchars($_POST['zipcode']);*/
		$username_exists = 0;
	
		try 
		{
			$conn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			// prepare sql and bind parameters
			$stmt = $conn->prepare("SELECT username FROM User WHERE username LIKE :uname");
			$stmt->execute(array(':uname'=> $username));
			//print_r($_POST);
			//exit();
			$row = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			if (!empty($row))
			{
				echo "1";
			}
			else{
				echo "0";
			}
		}
		catch(PDOException $e)
		{
			echo "Error: " . $e->getMessage();
		}
		$conn = null;		

	//}
		
	
?>
