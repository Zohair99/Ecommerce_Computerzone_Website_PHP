<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_POST['btn'])) {  
    $Brand = mysqli_real_escape_string($conn, $_POST['Brand']);

    // Insert Query inside the if block
    $insert_query = "INSERT INTO Brand (brand) VALUES ('$Brand')";

    if (mysqli_query($conn, $insert_query)) {
        echo "Brand inserted successfully!";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}

// Close the connection
mysqli_close($conn);
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h2>Insert New Record</h2>
    <form action="" method="POST" >

    <label for="brand">BRAND</label>
        <input type="text" id="Brand" name="Brand" >

        <button type="submit" name="btn">Insert</button>
</body>
</html>