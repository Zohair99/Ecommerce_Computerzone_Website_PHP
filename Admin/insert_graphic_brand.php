<?php
    // Database connection
    $conn = mysqli_connect("localhost", "root", "", "computerzone");

    if (! $conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Initialize variables
    $stmt_card = null;
    $stmt_gpu  = null;

    // Check if form is submitted
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Start transaction
        mysqli_begin_transaction($conn);

        try {
            // Get form data
            $chip_set = $_POST['chip_set'] ?? null;
            $gpu_name = $_POST['gpu_name'] ?? null;

            // Validate form data (at least one field must be provided)
            if (empty($chip_set) && empty($gpu_name)) {
                throw new Exception("At least one field (Chip Set or GPU Name) is required.");
            }

            // Insert into the 'chipset' table if chip_set is provided
            if (!empty($chip_set)) {
                $sql_card  = "INSERT INTO chipset (chip_set) VALUES (?)";
                $stmt_card = $conn->prepare($sql_card);
                if (! $stmt_card) {
                    throw new Exception("Prepare failed: " . $conn->error);
                }
                $stmt_card->bind_param("s", $chip_set);
                $stmt_card->execute();
            }

            // Insert into the 'graphic_card' table if gpu_name is provided
            if (!empty($gpu_name)) {
                $sql_gpu  = "INSERT INTO graphic_card (gpu_name) VALUES (?)";
                $stmt_gpu = $conn->prepare($sql_gpu);
                if (! $stmt_gpu) {
                    throw new Exception("Prepare failed: " . $conn->error);
                }
                $stmt_gpu->bind_param("s", $gpu_name);
                $stmt_gpu->execute();
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
            if ($stmt_card) {
                $stmt_card->close();
            }
            if ($stmt_gpu) {
                $stmt_gpu->close();
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
    <title>Insert Data into Card and GPU Tables</title>
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
        <h1>Insert Data into Card and GPU Tables</h1>
        <form action="insert_graphic_brand.php" method="post">
            <!-- Chipset Table Fields -->
            <h2>Chipset Table</h2>

            <label for="chip_set">Chip Set:</label>
            <input type="text" id="chip_set" name="chip_set">

            <!-- GPU Table Fields -->
            <h2>GPU Table</h2>

            <label for="gpu_name">GPU Name:</label>
            <input type="text" id="gpu_name" name="gpu_name">

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>