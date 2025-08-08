<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_capacity = null;
$stmt_memory = null;

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Start transaction
    mysqli_begin_transaction($conn);

    try {
        // Get form data
        $capacity = $_POST['capacity'] ?? null; // For r_capacity table
        $module = $_POST['module'] ?? null; // For memory table

        // Validate form data
        if (empty($capacity) && empty($module)) {
            throw new Exception("At least one field is required.");
        }

        // Insert into the 'r_capacity' table if capacity is provided
        if (!empty($capacity)) {
            $sql_capacity = "INSERT INTO r_capacity (capacity) VALUES (?)";
            $stmt_capacity = $conn->prepare($sql_capacity);
            if (!$stmt_capacity) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_capacity->bind_param("s", $capacity);
            $stmt_capacity->execute();
        }

        // Insert into the 'memory' table if module is provided
        if (!empty($module)) {
            $sql_memory = "INSERT INTO memory (module) VALUES (?)";
            $stmt_memory = $conn->prepare($sql_memory);
            if (!$stmt_memory) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_memory->bind_param("s", $module);
            $stmt_memory->execute();
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
        if ($stmt_memory) {
            $stmt_memory->close();
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
    <title>Insert Data into Memory and Capacity Tables</title>
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
        input[type="text"] {
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
        <h1>Insert Data into Memory and Capacity Tables</h1>
        <form action="insert_ram_brand.php" method="post">
            <!-- Capacity Table Fields -->
            <h2>Capacity Table</h2>
            <label for="capacity">Capacity:</label>
            <input type="text" id="capacity" name="capacity">

            <!-- Memory Table Fields -->
            <h2>Memory Table</h2>
            <label for="module">Module:</label>
            <input type="text" id="module" name="module">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>