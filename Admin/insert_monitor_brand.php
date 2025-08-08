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
        $size = $_POST['size'] ?? null; // Size for inches table
        $monitor = $_POST['monitor'] ?? null; // Monitor for lcdmonitor table

        // Validate form data
        if (empty($size) && empty($monitor)) {
            throw new Exception("At least one field is required.");
        }

        // Insert into the 'inches' table if size is provided
        if (!empty($size)) {
            $sql_size = "INSERT INTO inches (size) VALUES (?)";
            $stmt_size = $conn->prepare($sql_size);
            if (!$stmt_size) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_size->bind_param("s", $size);
            $stmt_size->execute();
        }

        // Insert into the 'lcdmonitor' table if monitor is provided
        if (!empty($monitor)) {
            $sql_monitor = "INSERT INTO lcdmonitor (monitor) VALUES (?)";
            $stmt_monitor = $conn->prepare($sql_monitor);
            if (!$stmt_monitor) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_monitor->bind_param("s", $monitor);
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
    <title>Insert Data into inches and lcdmonitor Tables</title>
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
        <h1>Insert Data into inches and lcdmonitor Tables</h1>
        <form action="insert_inche.php" method="post">
            <!-- inches Table Fields -->
            <h2>inches Table</h2>

            <label for="size">Size:</label> <!-- Updated to 'size' -->
            <input type="text" id="size" name="size"> <!-- Updated to 'size' -->

            <!-- lcdmonitor Table Fields -->
            <h2>lcdmonitor Table</h2>

            <label for="monitor">Monitor:</label>
            <input type="text" id="monitor" name="monitor">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>