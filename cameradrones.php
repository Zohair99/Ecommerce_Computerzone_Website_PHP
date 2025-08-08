<?php
session_start();

// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize search query early
$searchQuery = isset($_GET['search']) ? trim(mysqli_real_escape_string($conn, $_GET['search'])) : '';
$highlightId = isset($_GET['highlight']) ? (int)$_GET['highlight'] : 0; // Not used in this particular script's logic, but good to keep if needed elsewhere

// Function to build redirect URL with existing GET parameters
function getRedirectUrl($baseUrl, $currentParams, $searchQuery = '')
{
    $params = [];
    if (!empty($searchQuery)) {
        $params['search'] = $searchQuery; // Include search query in redirects
    }
    if (!empty($currentParams['brand'])) {
        $params['brand'] = $currentParams['brand'];
    }
    if (!empty($currentParams['sort'])) {
        $params['sort'] = $currentParams['sort'];
    }
    if (!empty($currentParams['page'])) {
        $params['page'] = $currentParams['page'];
    }
    if (!empty($currentParams['processor'])) { // This might be "type" or "category" for cameras
        $params['processor'] = $currentParams['processor'];
    }

    return $baseUrl . (!empty($params) ? '?' . http_build_query($params) : '');
}

// Handle all redirects before any output
if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit();
}

// Handle cart actions (POST requests)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $currentFileName = basename($_SERVER['PHP_SELF']); // Get the current script's filename

    if (isset($_POST['increase_quantity']) || isset($_POST['quantity'])) {
        $itemIndex = (int)$_POST['item_index'];
        $newQuantity = (int)$_POST['quantity'];
        if ($newQuantity > 0 && isset($_SESSION['cart'][$itemIndex])) {
            $_SESSION['cart'][$itemIndex]['quantity'] = $newQuantity;
        }
        // Redirect back to the current page with existing GET parameters and search query
        header("Location: " . getRedirectUrl($currentFileName, $_GET, $searchQuery));
        exit();
    }

    if (isset($_POST['remove_item'])) {
        $itemIndex = (int)$_POST['item_index'];
        if (isset($_SESSION['cart'][$itemIndex])) {
            unset($_SESSION['cart'][$itemIndex]);
            $_SESSION['cart'] = array_values($_SESSION['cart']); // Re-index array
        }
        // Redirect back to the current page with existing GET parameters and search query
        header("Location: " . getRedirectUrl($currentFileName, $_GET, $searchQuery));
        exit();
    }
}

// Set page title and include common product styling
$title = 'Webcam, Wi-Fi Camera Price in Pakistan';
include_once('navbar/productstyle.php');

// Pagination setup
$products_per_page = 10;
$current_page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
$offset = ($current_page - 1) * $products_per_page;

// Sorting logic
$sort_order = "cameradrone.price ASC"; // Default sort
if (isset($_GET['sort'])) {
    switch ($_GET['sort']) {
        case "high":
            $sort_order = "cameradrone.price DESC";
            break;
        case "low":
            $sort_order = "cameradrone.price ASC";
            break;
        case "rating":
            $sort_order = "cameradrone.review DESC";
            break;
    }
}

// Filtering logic (renamed variables for clarity and consistency)
$selected_brand = isset($_GET['brand']) ? mysqli_real_escape_string($conn, $_GET['brand']) : '';
$selected_type = isset($_GET['processor']) ? mysqli_real_escape_string($conn, urldecode($_GET['processor'])) : ''; // 'processor' often means 'type' or 'category' for cameras

// Base queries for counting and fetching products
$base_product_query = "SELECT cameradrone.*, camdrone_store.camdrone AS brand_name, cambrand_store.cambrand AS type_name
                       FROM cameradrone
                       INNER JOIN camdrone_store ON cameradrone.brand = camdrone_store.camdrone
                       INNER JOIN cambrand_store ON cameradrone.processor = cambrand_store.cambrand"; // Assuming 'processor' column in cameradrone links to 'cambrand' in cambrand_store

$base_count_query = "SELECT COUNT(*) as total
                     FROM cameradrone
                     INNER JOIN camdrone_store ON cameradrone.brand = camdrone_store.camdrone
                     INNER JOIN cambrand_store ON cameradrone.processor = cambrand_store.cambrand";

// Build WHERE clause based on filters and search query
$conditions = [];
if (!empty($selected_brand)) {
    $conditions[] = "camdrone_store.camdrone = '" . $selected_brand . "'";
}
if (!empty($selected_type)) { // Use selected_type for the 'processor' filter
    $conditions[] = "cambrand_store.cambrand = '" . $selected_type . "'";
}
if (!empty($searchQuery)) {
    $conditions[] = "cameradrone.name LIKE '%" . mysqli_real_escape_string($conn, $searchQuery) . "%'";
}

$where_clause = empty($conditions) ? "" : " WHERE " . implode(" AND ", $conditions);

// Execute total products query
$total_products_query = $base_count_query . $where_clause;
$total_products_result = mysqli_query($conn, $total_products_query);
if (!$total_products_result) {
    die("Error counting products: " . mysqli_error($conn));
}
$total_products = mysqli_fetch_assoc($total_products_result)['total'];
$total_pages = ceil($total_products / $products_per_page);

// Execute product list query
$product_query = $base_product_query . $where_clause . " ORDER BY " . $sort_order . " LIMIT " . $offset . ", " . $products_per_page;
$product_result = mysqli_query($conn, $product_query);
if (!$product_result) {
    die("Error fetching products: " . mysqli_error($conn));
}
$num_rows = mysqli_num_rows($product_result);

// The rest of your HTML output to display products, pagination, and filters would go here.
// Example HTML structure (not part of the PHP block to be generated, but for context):
?>

<!-- breadcrumb -->

<nav class="breadcrumb">
    <ul>
        <li><a href="index.php">Home</a></li>
        <li>/</li>
        <li><a href="cameradrones.php" class="active">Cameras | Drones</a></li>
    </ul>
</nav>

<!-- Main Container with Sidebar and Content -->
<div class="ppcontainer">
    <!-- Left Sidebar -->
    <aside class="sidebar">
        <!-- Camera Drone Filter -->
        <div class="filter-category">
            <button class="filter-toggle">
                <i class="fa-solid fa-caret-down"></i> Camera Drones
            </button>
            <ul class="filter-list" style="display: none;">
                <?php
                $camdrone_query = "SELECT DISTINCT camdrone FROM camdrone_store ORDER BY camdrone ASC";
                $camdrone_result = mysqli_query($conn, $camdrone_query);

                if (!$camdrone_result) {
                    echo "<li>Error fetching options: " . htmlspecialchars(mysqli_error($conn)) . "</li>";
                } else {
                    while ($row = mysqli_fetch_assoc($camdrone_result)) {
                        $original_value = $row['camdrone'];
                        $display_value = htmlspecialchars($original_value, ENT_QUOTES);
                        $url_value = urlencode($original_value);
                        $is_active = (isset($_GET['brand']) && urldecode($_GET['brand']) === $original_value) ? 'active' : '';
                        echo "<li class='$is_active'><a href='?brand=$url_value'>$display_value</a></li>";
                    }
                }
                ?>
            </ul>
        </div>

        <!-- Brand Filter -->
        <div class="filter-category">
            <button class="filter-toggle">
                <i class="fa-solid fa-caret-down"></i> Brands
            </button>
            <ul class="filter-list" style="display: none;">
                <?php
                $cambrand_query = "SELECT DISTINCT cambrand FROM cambrand_store ORDER BY created_at DESC";
                $cambrand_result = mysqli_query($conn, $cambrand_query);

                if (!$cambrand_result) {
                    echo "<li>Error fetching brand options: " . htmlspecialchars(mysqli_error($conn)) . "</li>";
                } else {
                    while ($row = mysqli_fetch_assoc($cambrand_result)) {
                        $original_value = $row['cambrand'];
                        $display_value = htmlspecialchars($original_value, ENT_QUOTES);
                        $url_value = urlencode($original_value);
                        $is_active = (isset($_GET['processor']) && urldecode($_GET['processor']) === $original_value) ? 'active' : '';
                        echo "<li class='$is_active'><a href='?processor=$url_value'>$display_value</a></li>";
                    }
                }
                ?>
            </ul>
        </div>
    </aside>

    <!-- Main Content Area -->
    <div class="main-content">
        <div class="product-grid">
            <div class="mainheading">
                <h3 id="laptop-heading">Cameras | Drones<?php echo $selected_brand ? " >> " . htmlspecialchars($selected_brand) : ''; ?></h3>
            </div>
            <div class="pp">
                <p>Shop a wide selection of Cameras | Drones in Pakistan including various models at Czone.com.pk</p>
            </div>

            <!-- Top Pagination -->
            <div class="pagination-container">
                <div class="results-info">
                    Showing <strong><?php echo ($offset + 1); ?> - <?php echo min($offset + $products_per_page, $total_products); ?></strong> of
                    <strong><?php echo $total_products; ?></strong> Results
                </div>
                <div class="pagination">
                    <button class="page-btn" <?php echo ($current_page > 1) ? "onclick=\"window.location='?page=1'\"" : "disabled"; ?>>&laquo;&laquo;</button>
                    <button class="page-btn" <?php echo ($current_page > 1) ? "onclick=\"window.location='?page=" . ($current_page - 1) . "'\"" : "disabled"; ?>>&laquo;</button>
                    <?php for ($page = 1; $page <= $total_pages; $page++): ?>
                        <button class="page-btn <?php echo ($page == $current_page) ? 'active' : ''; ?>" onclick="window.location='?page=<?php echo $page; ?>'">
                            <?php echo $page; ?>
                        </button>
                    <?php endfor; ?>
                    <button class="page-btn" <?php echo ($current_page < $total_pages) ? "onclick=\"window.location='?page=" . ($current_page + 1) . "'\"" : "disabled"; ?>>&raquo;</button>
                    <button class="page-btn" <?php echo ($current_page < $total_pages) ? "onclick=\"window.location='?page=$total_pages'\"" : "disabled"; ?>>&raquo;&raquo;</button>
                </div>
                <div class="dropoff">
                    <div class="dropdowns">
                        <label for="resultsPerPage">Results Per Page:</label>
                        <select id="resultsPerPage">
                            <option selected>10</option>
                            <option>20</option>
                            <option>50</option>
                        </select>
                    </div>
                    <div class="dropdownss">
                        <select id="sortOrder">
                            <option value="low" <?php if (isset($_GET['sort']) && $_GET['sort'] == "low") echo "selected"; ?>>Price Low - High</option>
                            <option value="high" <?php if (isset($_GET['sort']) && $_GET['sort'] == "high") echo "selected"; ?>>Price High - Low</option>
                            <option value="rating" <?php if (isset($_GET['sort']) && $_GET['sort'] == "rating") echo "selected"; ?>>Best Rating</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Product Cards -->
            <?php while ($row = mysqli_fetch_assoc($product_result)): {
                    $brand = isset($row['brand']) ? htmlspecialchars($row['brand']) : 'N/A';
                    $processor = isset($row['processor']) ? htmlspecialchars($row['processor']) : 'N/A';
                } ?>
                <div class="product-container card" data-category="camera-drones" data-id="<?php echo htmlspecialchars($row['id']); ?>">
                    <?php if (!empty($row['offer'])): ?>
                        <div class="discount-badge"><?php echo htmlspecialchars($row['offer']); ?>% OFF</div>
                    <?php endif; ?>
                    <img src="Admin/images/<?php echo htmlspecialchars($row['image']); ?>" alt="<?php echo htmlspecialchars($row['name']); ?>" class="product-image">
                    <div class="product-details">
                        <h2 class="product-title"><?php echo htmlspecialchars($row['name']); ?></h2>
                        <p class="rating">
                            <?php
                            $review_stars = intval($row['review']);
                            echo str_repeat("⭐", $review_stars);
                            ?>
                            (<?php echo $review_stars; ?> Stars)
                        </p>
                        <p class="category"><strong>Category:</strong> Cameras | Drones > <?php echo $brand; ?></p>
                        <p class="code"><strong>Code:</strong> <?php echo htmlspecialchars($row['code']); ?></p>
                        <p class="description"><?php echo htmlspecialchars($row['description']); ?></p>
                        <?php if (!empty($row['spec1']) || !empty($row['spec2']) || !empty($row['spec3']) || !empty($row['spec4'])): ?>
                            <ul class="features">
                                <?php if (!empty($row['spec1'])): ?><li><?php echo htmlspecialchars($row['spec1']); ?></li><?php endif; ?>
                                <?php if (!empty($row['spec2'])): ?><li><?php echo htmlspecialchars($row['spec2']); ?></li><?php endif; ?>
                                <?php if (!empty($row['spec3'])): ?><li><?php echo htmlspecialchars($row['spec3']); ?></li><?php endif; ?>
                                <?php if (!empty($row['spec4'])): ?><li><?php echo htmlspecialchars($row['spec4']); ?></li><?php endif; ?>
                            </ul>
                        <?php endif; ?>
                    </div>
                    <div class="product-right">
                        <p class="availability"><strong>Availability:</strong> <span class="in-stock">In Stock</span></p>
                        <p class="price">Rs. <?php echo number_format($row['price']); ?></p>
                        <?php if (!empty($row['old_price'])) { ?>
                            <span class="old-price">Rs.<?php echo number_format($row['old_price']); ?></span>
                        <?php } ?>
                        <button class="add-to-cart" onclick="addToCart(<?php echo htmlspecialchars($row['id']); ?>, 'cameradrone')">
                            <i class="fa-solid fa-cart-shopping"></i> Add To Cart
                        </button>
                        <button class="add-to-wishlist">
                            <i class="fa-solid fa-cart-shopping"></i> Add To Wishlist
                        </button>
                    </div>
                </div>
            <?php endwhile; ?>

            <!-- Bottom Pagination -->
            <div class="pagination-containers">
                <div class="results-info">
                    Showing <strong><?php echo ($offset + 1); ?> - <?php echo min($offset + $products_per_page, $total_products); ?></strong> of
                    <strong><?php echo $total_products; ?></strong> Results
                </div>
                <div class="pagination">
                    <button class="page-btn" <?php echo ($current_page > 1) ? "onclick=\"window.location='?page=1'\"" : "disabled"; ?>>&laquo;&laquo;</button>
                    <button class="page-btn" <?php echo ($current_page > 1) ? "onclick=\"window.location='?page=" . ($current_page - 1) . "'\"" : "disabled"; ?>>&laquo;</button>
                    <?php for ($page = 1; $page <= $total_pages; $page++): ?>
                        <button class="page-btn <?php echo ($page == $current_page) ? 'active' : ''; ?>" onclick="window.location='?page=<?php echo $page; ?>'">
                            <?php echo $page; ?>
                        </button>
                    <?php endfor; ?>
                    <button class="page-btn" <?php echo ($current_page < $total_pages) ? "onclick=\"window.location='?page=" . ($current_page + 1) . "'\"" : "disabled"; ?>>&raquo;</button>
                    <button class="page-btn" <?php echo ($current_page < $total_pages) ? "onclick=\"window.location='?page=$total_pages'\"" : "disabled"; ?>>&raquo;&raquo;</button>
                </div>
                <div class="dropoff">
                    <div class="dropdowns">
                        <label for="resultsPerPage">Results Per Page:</label>
                        <select id="resultsPerPage">
                            <option selected>10</option>
                            <option>20</option>
                            <option>50</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <!-- End Paragraph -->
        <div class="endpara">
            <p>Camera drones are revolutionizing photography and videography, offering a unique perspective that traditional cameras simply can't match. With their ability to capture stunning aerial shots, these drones are perfect for everything from professional filmmaking to casual photography. Whether you're filming breathtaking landscapes, taking aerial selfies, or creating high-quality video content, a camera drone provides the freedom and flexibility to bring your creative vision to life from the sky.</p>
            <p>We offer a variety of camera drones from top brands like DJI, Parrot, and Autel, equipped with advanced features, all at competitive prices in Pakistan.</p>
        </div>
    </div>
</div>

<!-- Product Popup -->
<div id="productPopup" class="popup" data-category="camera-drones">
    <div class="popup-content">
        <span class="close-popup" id="closePopup">&times;</span>
        <img id="popupImage" src="" alt="">
        <div class="popup-text">
            <h2 id="popupTitle"></h2>
            <div class="reviews">
                <p id="popupReview" class="para"></p>
                <p id="popupCategory" class="para"><strong>Category:</strong></p>
                <p id="popupCode" class="para"><strong>Code:</strong></p>
                <p id="popupDescription" class="para"></p>
            </div>
            <ul id="popupFeatures">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
            <div class="links">
                <a href="#"><img src="images/facebook.jpeg" alt=""></a>
                <a href="#"><img src="images/google plus.jpeg" alt=""></a>
            </div>
        </div>
        <div class="aside">
            <span class="in-stock">In Stock</span>
            <p class="warranty">Warranty:<strong> International warranty</strong></p>
            <button class="add-to-cart" onclick="addToCart(0, 'cameradrone')">
                <i class="fa-solid fa-cart-shopping"></i> Add To Cart
            </button>
            <button class="add-to-wishlist">Add To Wishlist</button>
            <div class="prices">
                <p id="pop-prices"></p>
                <p id="pop-old-prices"></p>
            </div>
        </div>
    </div>
</div>

<!-- Start All Products  -->

<!-- End All Products  -->
<?php
include_once('footer/footer.php');
?>

</body>

</html>

<script src="javascript/products.js"></script>