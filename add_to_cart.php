<?php
session_start();

$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$table = $_POST['table'];
$product_id = intval($_POST['product_id']);
$quantity = intval($_POST['quantity']);

$valid_tables = [
    'Home',
    'New_Home',
    'product',
    'gpu',
    'monitor',
    'printer_data',
    'hdd_data',
    'ssd_data',
    'network',
    'ram',
    'psu',
    'laptopused',
    'laptopacc',
    'cameradrone',
    'carttrones',
    'casing',
    'cooling',
    "deskcomp",
    'gamingconsoles',
    'gamingproducts',
    'graphictablets',
    'headsetheadphonemic',
    'keyboard',
    'memorycards',
    'motherboard',
    'mouse',
    'peripheralsmics',
    'pos',
    'processors',
    'projectors',
    'scanners',
    'software',
    'speaker',
    'stabilizer',
    'tabletpc',
    'tabletacc',
    'tvstream',
    'ups',
    'usb',
    'usedproduct'
];

if (!in_array($table, $valid_tables)) {
    die("Invalid table name.");
}

$query = "SELECT * FROM $table WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $product = $result->fetch_assoc();

    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = [];
    }

    $found = false;
    foreach ($_SESSION['cart'] as &$item) {
        if ($item['table'] === $table && $item['id'] === $product_id) {
            $item['quantity'] += $quantity;
            $found = true;
            break;
        }
    }

    if (!$found) {
        $_SESSION['cart'][] = [
            'table' => $table,
            'id' => $product_id,
            'name' => $product['name'],
            'price' => $product['price'],
            'quantity' => $quantity,
            'image' => $product['image']
        ];
    }

    echo "Product added to cart successfully!";
} else {
    echo "Product not found.";
}

$stmt->close();
mysqli_close($conn);
