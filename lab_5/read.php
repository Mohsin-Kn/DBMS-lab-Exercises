<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>themepark</title>
<style>
    table {
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 20px;
}

th {
  background-color: #f2f2f2;
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

td {
  border: 1px solid #ddd;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}

/* Table head styles */
th.park_code {
  width: 10%;
}

th.park_name {
  width: 30%;
}

th.park_city {
  width: 30%;
}

th.park_country {
  width: 30%;
}
</style>

</head>
<body>

<?php
//this code is executed when the form is submitted
$username = "root";
$password = "";
try {
$conn = new PDO("mysql:host=localhost;dbname=themepark", $username, $password);
// set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "Connected successfully";
}
catch(PDOException $e) {
echo "Connection failed: " . $e->getMessage();
}
    
$query1=$conn->query("select * from THEMEPARK");
?>

<h1>themepark records <h1>
<table>
    <thead>
        <th>Park Code</th>
        <th>Park Name</th>
        <th>Park City</th>
        <th>Park Country</th>
    </thead>
    <tbody>


<?php
while($row=$query1->fetch(PDO::FETCH_OBJ)){
    echo "<tr>
    <td>$row->PARK_CODE</td>
    <td>$row->PARK_NAME</td>
    <td>$row->PARK_CITY</td>
    <td>$row->PARK_COUNRTY</td>
    </tr>";
}

    ?>
      </tbody>
</table>
</body>
</html>