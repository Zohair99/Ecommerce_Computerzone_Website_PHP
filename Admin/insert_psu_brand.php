<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_power = null;
$stmt_wattage = null;

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Start transaction
    mysqli_begin_transaction($conn);

    try {
        // Get form data
        $supply = $_POST['supply'] ?? null; // For power table
        $watt = $_POST['watt'] ?? null; // For wattage table

        // Validate form data
        if (empty($supply) && empty($watt)) {
            throw new Exception("At least one field is required.");
        }

        // Insert into the 'power' table if supply is provided
        if (!empty($supply)) {
            $sql_power = "INSERT INTO power (supply) VALUES (?)";
            $stmt_power = $conn->prepare($sql_power);
            if (!$stmt_power) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_power->bind_param("s", $supply);
            $stmt_power->execute();
        }

        // Insert into the 'wattage' table if watt is provided
        if (!empty($watt)) {
            $sql_wattage = "INSERT INTO wattage (watt) VALUES (?)";
            $stmt_wattage = $conn->prepare($sql_wattage);
            if (!$stmt_wattage) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_wattage->bind_param("s", $watt);
            $stmt_wattage->execute();
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
        if ($stmt_power) {
            $stmt_power->close();
        }
        if ($stmt_wattage) {
            $stmt_wattage->close();
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
    <title>Insert Data into Power and Wattage Tables</title>
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
        <h1>Insert Data into Power and Wattage Tables</h1>
        <form action="insert_psu_brand.php" method="post">
            <!-- Power Table Fields -->
            <h2>Power Table</h2>
            <label for="supply">Supply:</label>
            <input type="text" id="supply" name="supply">

            <!-- Wattage Table Fields -->
            <h2>Wattage Table</h2>
            <label for="watt">Watt:</label>
            <input type="text" id="watt" name="watt">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
