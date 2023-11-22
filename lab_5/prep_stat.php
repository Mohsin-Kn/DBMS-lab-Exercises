<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>company</title>
</head>
<body>


<form action="prep_stat.php" method="POST">
         <span> search user id</span><br>
         <input type="text" name="user_id">
         <input type="submit" id="user_id"value="Search">
</form>




<?php

if (isset($_POST['user_id'])){
//this code is executed when the form is submitted
$username = "root";
$password = "";
try {
$conn = new PDO("mysql:host=localhost;dbname=company", $username, $password);
// set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "Connected successfully";
}
catch(PDOException $e) {
echo "Connection failed: " . $e->getMessage();
}

$user_id=$_POST["user_id"];
    
$query1=$conn->query("select * from profile  where user_id =$user_id");


// $query1=$conn->prepare("select * from profile  where user_id =?");
// $query1->excute([$user_id]);


?>
<table>
    <thead>
        <th>user id </th>
        <th>first name</th>
        <th>last name </th>
        <th>email</th>
        <th>passward</th>
        
    </thead>
    <tbody>
        <?php
        while($row=$query1->fetch(PDO::FETCH_OBJ)){
            echo "<tr>
            <td>$row->user_id</td>
            <td>$row->first_name</td>
            <td>$row->last_name</td>
            <td>$row->passward</td>
            <td>$row->email</td>
            </tr>";

        
        }
}
        ?>
    <tbody>
     
</table>
</body>
</html>