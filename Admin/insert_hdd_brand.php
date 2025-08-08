<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_size = null;
$stmt_monitor = null;

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Start transaction
    mysqli_begin_transaction($conn);

    try {
        // Get form data
        $c_storage = $_POST['c_storage'] ?? null; // Size for capacity table
        $hard_disk = $_POST['hard_disk'] ?? null; // HDD for hdd table

        // Validate form data
        if (empty($c_storage) && empty($hard_disk)) {
            throw new Exception("At least one field is required.");
        }

        // Insert into the 'capacity' table if c_storage is provided
        if (!empty($c_storage)) {
            $sql_size = "INSERT INTO capacity (c_storage) VALUES (?)";
            $stmt_size = $conn->prepare($sql_size);
            if (!$stmt_size) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_size->bind_param("s", $c_storage);
            $stmt_size->execute();
        }

        // Insert into the 'hdd' table if hard_disk is provided
        if (!empty($hard_disk)) {
            $sql_monitor = "INSERT INTO hdd (hard_disk) VALUES (?)";
            $stmt_monitor = $conn->prepare($sql_monitor);
            if (!$stmt_monitor) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_monitor->bind_param("s", $hard_disk);
            $stmt_monitor->execute();
        }

        // Commit the transaction
        mysqli_commit($conn);
        echo "Data inserted successfully!";
    } catch (Exception $e) {
        // Rollback the transaction in case of error
        mysqli_rollback($conn);
        echo "Transaction failed: " . $e->getMessage();
    } finally {
        // Close the statements if they were initialized
        if ($stmt_size) {
            $stmt_size->close();
        }
        if ($stmt_monitor) {
            $stmt_monitor->close();
        }
    }
} else {
    echo "Form not submitted.";
}

// Close the connection
mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Data into capacity and HDD Tables</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Insert Data into capacity and HDD Tables</h1>
        <form action="insert_hdd_brand.php" method="post">
            <!-- capacity Table Fields -->
            <h2>capacity Table</h2>

            <label for="c_storage">Capacity:</label>
            <input type="text" id="c_storage" name="c_storage">

            <!-- hdd Table Fields -->
            <h2>HDD Table</h2>

            <label for="hard_disk">HDD:</label>
            <input type="text" id="hard_disk" name="hard_disk">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>