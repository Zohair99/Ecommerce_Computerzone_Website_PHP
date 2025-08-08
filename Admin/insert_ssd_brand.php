<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_capacity = null;
$stmt_ssd = null;

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Start transaction
    mysqli_begin_transaction($conn);

    try {
        // Get form data
        $c_storage = $_POST['c_storage'] ?? null; // Capacity for s_capacity table
        $solid_disk = $_POST['solid_disk'] ?? null; // SSD for ssd table

        // Validate form data
        if (empty($c_storage) && empty($solid_disk)) {
            throw new Exception("At least one field is required.");
        }

        // Insert into the 's_capacity' table if c_storage is provided
        if (!empty($c_storage)) {
            $sql_capacity = "INSERT INTO s_capacity (c_storage) VALUES (?)";
            $stmt_capacity = $conn->prepare($sql_capacity);
            if (!$stmt_capacity) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_capacity->bind_param("s", $c_storage);
            $stmt_capacity->execute();
        }

        // Insert into the 'ssd' table if solid_disk is provided
        if (!empty($solid_disk)) {
            $sql_ssd = "INSERT INTO ssd (solid_disk) VALUES (?)";
            $stmt_ssd = $conn->prepare($sql_ssd);
            if (!$stmt_ssd) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_ssd->bind_param("s", $solid_disk);
            $stmt_ssd->execute();
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
        if ($stmt_capacity) {
            $stmt_capacity->close();
        }
        if ($stmt_ssd) {
            $stmt_ssd->close();
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
    <title>Insert Data into s_capacity and ssd Tables</title>
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
        <h1>Insert Data into s_capacity and ssd Tables</h1>
        <form action="insert_ssd_brand.php" method="post">
            <!-- s_capacity Table Fields -->
            <h2>s_capacity Table</h2>

            <label for="c_storage">Capacity:</label>
            <input type="text" id="c_storage" name="c_storage">

            <!-- ssd Table Fields -->
            <h2>SSD Table</h2>

            <label for="solid_disk">Solid Disk:</label>
            <input type="text" id="solid_disk" name="solid_disk">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>