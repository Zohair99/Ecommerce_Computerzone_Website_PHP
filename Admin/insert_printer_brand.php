<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_series = null;
$stmt_printer = null;

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Start transaction
    mysqli_begin_transaction($conn);

    try {
        // Get form data
        $series = $_POST['m_series'] ?? null; // Series for series table
        $model = $_POST['model'] ?? null; // Model for printers table

        // Validate form data
        if (empty($series) && empty($model)) {
            throw new Exception("At least one field is required.");
        }

        // Insert into the 'series' table if series is provided
        if (!empty($series)) {
            $sql_series = "INSERT INTO series (m_series) VALUES (?)";
            $stmt_series = $conn->prepare($sql_series);
            if (!$stmt_series) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_series->bind_param("s", $series);
            $stmt_series->execute();
            if ($stmt_series->affected_rows === 0) {
                throw new Exception("Series already exists.");
            }
        }

        // Insert into the 'printers' table if model is provided
        if (!empty($model)) {
            $sql_printer = "INSERT INTO printers (model) VALUES (?)";
            $stmt_printer = $conn->prepare($sql_printer);
            if (!$stmt_printer) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_printer->bind_param("s", $model);
            $stmt_printer->execute();
            if ($stmt_printer->affected_rows === 0) {
                throw new Exception("Printer model already exists.");
            }
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
        if ($stmt_series) {
            $stmt_series->close();
        }
        if ($stmt_printer) {
            $stmt_printer->close();
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
    <title>Insert Data into series and printers Tables</title>
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
        <h1>Insert Data into series and printers Tables</h1>
        <form action="insert_printer_brand.php" method="post">
            <!-- series Table Fields -->
            <h2>series Table</h2>
            <label for="m_series">Series:</label>
            <input type="text" id="m_series" name="m_series">

            <!-- printers Table Fields -->
            <h2>printers Table</h2>
            <label for="model">Model:</label>
            <input type="text" id="model" name="model">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
