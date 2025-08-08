<?php
session_start();
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die(json_encode(['error' => 'Database connection failed']));
}

$searchTerm = isset($_GET['term']) ? trim($_GET['term']) : '';
$page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
$perPage = 10;

if (empty($searchTerm)) {
    die(json_encode([]));
}

$valid_tables = [
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
    'tvstream',
    'ups',
    'usb',
    'usedproduct'
];

$allResults = [];

foreach ($valid_tables as $table) {
    try {
        $countQuery = "SELECT COUNT(*) as total FROM $table WHERE name LIKE ?";
        $countStmt = $conn->prepare($countQuery);
        $searchParam = "%$searchTerm%";
        $countStmt->bind_param("s", $searchParam);
        $countStmt->execute();
        $totalResults = $countStmt->get_result()->fetch_assoc()['total'];
        $countStmt->close();

        $offset = ($page - 1) * $perPage;
        $query = "SELECT id, name, price, image FROM $table WHERE name LIKE ? LIMIT $offset, $perPage";
        $stmt = $conn->prepare($query);
        if (!$stmt) {
            throw new Exception("Prepare failed for table $table");
        }

        $stmt->bind_param("s", $searchParam);
        $stmt->execute();
        $result = $stmt->get_result();

        while ($row = $result->fetch_assoc()) {
            $row['table'] = $table;
            $row['total_results'] = $totalResults;
            $allResults[] = $row;
        }
        $stmt->close();
    } catch (Exception $e) {
        continue;
    }
}

echo json_encode([
    'results' => $allResults,
    'page' => $page,
    'per_page' => $perPage
]);
mysqli_close($conn);
