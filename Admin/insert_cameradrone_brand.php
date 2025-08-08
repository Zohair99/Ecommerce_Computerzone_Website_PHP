<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_camdrone = null;
$stmt_cambrand = null;
$message = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    mysqli_begin_transaction($conn);

    try {
        $camdrone = $_POST['camdrone'] ?? null;
        $cambrand = $_POST['cambrand'] ?? null;

        if (empty($camdrone) && empty($cambrand)) {
            throw new Exception("At least one field is required.");
        }

        if (!empty($camdrone)) {
            $sql_camdrone = "INSERT INTO camdrone_store (camdrone) VALUES (?)";
            $stmt_camdrone = $conn->prepare($sql_camdrone);
            if (!$stmt_camdrone) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_camdrone->bind_param("s", $camdrone);
            $stmt_camdrone->execute();
        }

        if (!empty($cambrand)) {
            $sql_cambrand = "INSERT INTO cambrand_store (cambrand) VALUES (?)";
            $stmt_cambrand = $conn->prepare($sql_cambrand);
            if (!$stmt_cambrand) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_cambrand->bind_param("s", $cambrand);
            $stmt_cambrand->execute();
        }

        mysqli_commit($conn);
        $message = "Data inserted successfully!";
    } catch (Exception $e) {
        mysqli_rollback($conn);
        $message = "Transaction failed: " . $e->getMessage();
    } finally {
        if ($stmt_camdrone) $stmt_camdrone->close();
        if ($stmt_cambrand) $stmt_cambrand->close();
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Camera Drone and Brand</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }
        h1 {
            text-align: center;
        }
        label {
            margin-top: 10px;
            display: block;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            margin-top: 5px;
            padding: 10px;
        }
        input[type="submit"] {
            background: #28a745;
            color: white;
            border: none;
            margin-top: 20px;
            cursor: pointer;
        }
        .message {
            margin-top: 15px;
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Insert Camera Drone & Brand</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="camdrone">Camera Drone:</label>
        <input type="text" id="camdrone" name="camdrone">

        <label for="cambrand">Camera Brand:</label>
        <input type="text" id="cambrand" name="cambrand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
