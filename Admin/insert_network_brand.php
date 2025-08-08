<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_type = null;
$stmt_np = null;

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Start transaction
    mysqli_begin_transaction($conn);

    try {
        // Get form data
        $n_type = $_POST['n_type'] ?? null; // For type table
        $network = $_POST['network'] ?? null; // For np table

        // Validate form data
        if (empty($n_type) && empty($network)) {
            throw new Exception("At least one field is required.");
        }

        // Insert into the 'type' table if n_type is provided
        if (!empty($n_type)) {
            $sql_type = "INSERT INTO type (n_type) VALUES (?)";
            $stmt_type = $conn->prepare($sql_type);
            if (!$stmt_type) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_type->bind_param("s", $n_type);
            $stmt_type->execute();
        }

        // Insert into the 'np' table if network is provided
        if (!empty($network)) {
            $sql_np = "INSERT INTO np (network) VALUES (?)";
            $stmt_np = $conn->prepare($sql_np);
            if (!$stmt_np) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_np->bind_param("s", $network);
            $stmt_np->execute();
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
        if ($stmt_type) {
            $stmt_type->close();
        }
        if ($stmt_np) {
            $stmt_np->close();
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
    <title>Insert Data into Type and NP Tables</title>
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
        <h1>Insert Data into Type and NP Tables</h1>
        <form action="insert_network_brand.php" method="post">
            <!-- Type Table Fields -->
            <h2>Type Table</h2>
            <label for="n_type">Type:</label>
            <input type="text" id="n_type" name="n_type">

            <!-- NP Table Fields -->
            <h2>NP Table</h2>
            <label for="network">Network:</label>
            <input type="text" id="network" name="network">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>