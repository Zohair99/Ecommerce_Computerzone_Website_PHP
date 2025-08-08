<?php
session_start();

// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get search query early
$searchQuery = isset($_GET['search']) ? trim(mysqli_real_escape_string($conn, $_GET['search'])) : '';
$highlightId = isset($_GET['highlight']) ? (int)$_GET['highlight'] : 0;

// Function to build redirect URL with existing GET parameters
function getRedirectUrl($baseUrl, $currentParams) {
    $params = [];
    if (!empty($currentParams['search'])) $params['search'] = $currentParams['search'];
    if (!empty($currentParams['brand'])) $params['brand'] = $currentParams['brand'];
    if (!empty($currentParams['sort'])) $params['sort'] = $currentParams['sort'];
    if (!empty($currentParams['page'])) $params['page'] = $currentParams['page'];
    if (!empty($currentParams['processor'])) $params['processor'] = $currentParams['processor'];

    return $baseUrl . (!empty($params) ? '?' . http_build_query($params) : '');
}

// Handle all redirects before any output
if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit();
}

// Handle cart actions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $currentFileName = basename($_SERVER['PHP_SELF']);

    if (isset($_POST['increase_quantity']) || isset($_POST['quantity'])) {
        $itemIndex = (int)$_POST['item_index'];
        $newQuantity = (int)$_POST['quantity'];
        if ($newQuantity > 0 && isset($_SESSION['cart'][$itemIndex])) {
            $_SESSION['cart'][$itemIndex]['quantity'] = $newQuantity;
        }
        header("Location: " . getRedirectUrl($currentFileName, $_GET));
        exit();
    }

    if (isset($_POST['remove_item'])) {
        $itemIndex = (int)$_POST['item_index'];
        if (isset($_SESSION['cart'][$itemIndex])) {
            unset($_SESSION['cart'][$itemIndex]);
            $_SESSION['cart'] = array_values($_SESSION['cart']);
        }
        header("Location: " . getRedirectUrl($currentFileName, $_GET));
        exit();
    }
}

// Now safe to output HTML
$title = 'Used and Refurbished Laptops Prices in Pakistan';
include_once('navbar/productstyle.php');

// Pagination and sorting
$products_per_page = 10;
$current_page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
$offset = ($current_page - 1) * $products_per_page;

$sort_order = "laptopused.price ASC";
if (isset($_GET['sort'])) {
    switch ($_GET['sort']) {
        case "high":
            $sort_order = "laptopused.price DESC";
            break;
        case "low":
            $sort_order = "laptopused.price ASC";
            break;
        case "rating":
            $sort_order = "laptopused.review DESC";
            break;
    }
}

// Filters
$selected_brand = isset($_GET['brand']) ? mysqli_real_escape_string($conn, $_GET['brand']) : ''; // Renamed for clarity
$selected_processor = isset($_GET['processor']) ? mysqli_real_escape_string($conn, urldecode($_GET['processor'])) : ''; // Renamed for clarity

// Base queries
$base_product_query = "SELECT laptopused.*, laptopused_store.laptopused AS brand_name, processor_store.processor AS processor_name
                       FROM laptopused
                       INNER JOIN laptopused_store ON laptopused.brand = laptopused_store.laptopused
                       INNER JOIN processor_store ON laptopused.processor = processor_store.processor";

$base_count_query = "SELECT COUNT(*) as total
                     FROM laptopused
                     INNER JOIN laptopused_store ON laptopused.brand = laptopused_store.laptopused
                     INNER JOIN processor_store ON laptopused.processor = processor_store.processor";

$conditions = [];

if (!empty($selected_brand)) {
    $conditions[] = "laptopused_store.laptopused = '" . $selected_brand . "'";
}
if (!empty($selected_processor)) {
    $conditions[] = "processor_store.processor = '" . $selected_processor . "'";
}
if (!empty($searchQuery)) {
    $conditions[] = "laptopused.name LIKE '%" . $searchQuery . "%'";
}

$where_clause = empty($conditions) ? "" : " WHERE " . implode(" AND ", $conditions);

// Total products query
$total_products_query = $base_count_query . $where_clause;
$total_products_result = mysqli_query($conn, $total_products_query);
if (!$total_products_result) {
    die("Error counting products: " . mysqli_error($conn));
}
$total_products = mysqli_fetch_assoc($total_products_result)['total'];
$total_pages = ceil($total_products / $products_per_page);

// Product query
$product_query = $base_product_query . $where_clause . " ORDER BY $sort_order LIMIT $offset, $products_per_page";
$product_result = mysqli_query($conn, $product_query);
if (!$product_result) {
    die("Error fetching products: " . mysqli_error($conn));
}
$num_rows = mysqli_num_rows($product_result);

?>

    <!-- full navbar ends here -->

    <nav class="breadcrumb">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li>/</li>
            <li><a href="laptopused.php" class="active">Laptops | Used</a></li>
        </ul>
    </nav>

    <!-- Main Container with Sidebar and Content -->
    <div class="ppcontainer">
        <!-- Left Sidebar -->
        <aside class="sidebar">
            <div class="filter-category">
                <button class="filter-toggle"><i class="fa-solid fa-caret-down"></i> Brand</button>
                <ul class="filter-list" style="display: none;">
                    <?php
                    $brand_query = "SELECT DISTINCT laptopused FROM laptopused_store ORDER BY laptopused ASC";
                    $brand_result = mysqli_query($conn, $brand_query);

                    if (!$brand_result) {
                        die("Error fetching brand options: " . mysqli_error($conn));
                    }

                    while ($row = mysqli_fetch_assoc($brand_result)) {
                        $brand_option = htmlspecialchars($row['laptopused']);
                        echo "<li><a href='?brand=" . urlencode($brand_option) . "'>$brand_option</a></li>";
                    }
                    ?>
                </ul>
            </div>

            <div class="filter-category">
                <button class="filter-toggle"><i class="fa-solid fa-caret-down"></i> Processor</button>
                <ul class="filter-list" style="display: none;">
                    <?php
                    $processor_query = "SELECT DISTINCT processor FROM processor_store ORDER BY created_at DESC";
                    $processor_result = mysqli_query($conn, $processor_query);

                    if (!$processor_result) {
                        die("Error fetching processor options: " . mysqli_error($conn));
                    }

                    while ($row = mysqli_fetch_assoc($processor_result)) {
                        $processor_option = htmlspecialchars($row['processor']);
                        echo "<li><a href='?processor=" . urlencode($processor_option) . "'>$processor_option</a></li>";
                    }
                    ?>
                </ul>
            </div>
        </aside>

        <!-- Main Content Area -->
        <div class="main-content">
            <div class="product-grid">
                <div class="mainheading">
                    <h3 id="laptop-heading">Laptops | Used<?php echo $selected_brand ? " >> " . htmlspecialchars($selected_brand) : ''; ?></h3>
                </div>
                <div class="pp">
                    <p>Shop a wide selection of Laptops | Used in Pakistan including various models at Czone.com.pk</p>
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
                    <div class="product-container card" data-category="laptops" data-id="<?php echo htmlspecialchars($row['id']); ?>">
                        <?php if (!empty($row['offer'])): ?>
                            <div class="discount-badge"><?php echo htmlspecialchars($row['offer']); ?>% Off</div>
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
                            <p class="category"><strong>Category:</strong> Laptop | Used > Used Laptops</p>
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
                            <button class="add-to-cart" onclick="addToCart(<?php echo htmlspecialchars($row['id']); ?>, 'laptopused')">
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
                <p style="text-align: center;">We offer the best used and refurbished laptops in Pakistan, carefully tested for quality and performance.</p>
                <p style="text-align: center;">Looking for the Best Deals on Used Laptops in Pakistan?</p>
                <p style="text-align: center;">Explore our wide range of quality-tested used and refurbished laptops, all available with competitive prices and nationwide delivery.</p>
            </div>
        </div>
    </div>

    <!-- Product Popup -->
    <div id="productPopup" class="popup" data-category="laptops">
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
                <button class="add-to-cart" onclick="addToCart(0, 'laptopused')">
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