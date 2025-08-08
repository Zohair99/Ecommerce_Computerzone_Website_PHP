<?php
session_start();

$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$searchQuery = isset($_GET['search']) ? trim(mysqli_real_escape_string($conn, $_GET['search'])) : '';
$highlightId = isset($_GET['highlight']) ? (int)$_GET['highlight'] : 0;

function getRedirectUrl($baseUrl, $currentParams)
{
    $params = [];
    if (!empty($currentParams['search'])) {
        $params['search'] = $currentParams['search'];
    }
    if (!empty($currentParams['processor'])) {
        $params['processor'] = $currentParams['processor'];
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
    return $baseUrl . (!empty($params) ? '?' . http_build_query($params) : '');
}

if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit();
}

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

$title = 'Peripherals / Mics in Pakistan | Computer Zone';
include_once('navbar/productstyle.php');

$products_per_page = 10;
$current_page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
$offset = ($current_page - 1) * $products_per_page;

$sort_order = "peripheralsmics.price ASC";

if (isset($_GET['sort'])) {
    switch ($_GET['sort']) {
        case "high":
            $sort_order = "peripheralsmics.price DESC";
            break;
        case "low":
            $sort_order = "peripheralsmics.price ASC";
            break;
        case "rating":
            $sort_order = "peripheralsmics.review DESC";
            break;
        default:
            $sort_order = "peripheralsmics.price ASC";
    }
}

$selected_processor = isset($_GET['processor']) ? $_GET['processor'] : '';
$selected_brand = isset($_GET['brand']) ? urldecode($_GET['brand']) : '';

$where_clauses = [];
$params = [];
$types = '';

if (!empty($selected_processor)) {
    $where_clauses[] = "peripheralsmics_brand.peripheralsmicsbrand = ?";
    $params[] = $selected_processor;
    $types .= 's';
}

if (!empty($selected_brand)) {
    $where_clauses[] = "peripheralsmics_store.peripheralsmicsstore = ?";
    $params[] = $selected_brand;
    $types .= 's';
}

if (!empty($searchQuery)) {
    $where_clauses[] = "peripheralsmics.name LIKE ?";
    $params[] = '%' . $searchQuery . '%';
    $types .= 's';
}

$where_clause_string = empty($where_clauses) ? "" : " WHERE " . implode(" AND ", $where_clauses);

$total_products_query = "SELECT COUNT(*) as total
                         FROM peripheralsmics
                         INNER JOIN peripheralsmics_brand ON peripheralsmics.processor = peripheralsmics_brand.peripheralsmicsbrand
                         INNER JOIN peripheralsmics_store ON peripheralsmics.brand = peripheralsmics_store.peripheralsmicsstore"
    . $where_clause_string;

$stmt_total = $conn->prepare($total_products_query);
if ($stmt_total === false) {
    die("Prepare failed (total_products_query): " . htmlspecialchars($conn->error));
}
if (!empty($params)) {
    $stmt_total->bind_param($types, ...$params);
}
$stmt_total->execute();
$total_products_result = $stmt_total->get_result();
$total_products = $total_products_result->fetch_assoc()['total'];
$total_pages = ceil($total_products / $products_per_page);
$stmt_total->close();

$product_query = "SELECT peripheralsmics.*,
                    peripheralsmics_brand.peripheralsmicsbrand AS processor_name,
                    peripheralsmics_store.peripheralsmicsstore AS brand_name
                  FROM peripheralsmics
                  INNER JOIN peripheralsmics_brand ON peripheralsmics.processor = peripheralsmics_brand.peripheralsmicsbrand
                  INNER JOIN peripheralsmics_store ON peripheralsmics.brand = peripheralsmics_store.peripheralsmicsstore"
    . $where_clause_string
    . " ORDER BY $sort_order LIMIT ?, ?";

$params_for_products = $params;
$params_for_products[] = $offset;
$params_for_products[] = $products_per_page;

$types_for_products = $types . 'ii';

$stmt_products = $conn->prepare($product_query);
if ($stmt_products === false) {
    die("Prepare failed (product_query): " . htmlspecialchars($conn->error));
}
if (!empty($params_for_products)) {
    $stmt_products->bind_param($types_for_products, ...$params_for_products);
}
$stmt_products->execute();
$product_result = $stmt_products->get_result();
$num_rows = mysqli_num_rows($product_result);
$stmt_products->close();
?>

<!-- breadcrumb -->

<nav class="breadcrumb">
    <ul>
        <li><a href="index.php">Home</a></li>
        <li>/</li>
        <li><a href="peripherals-mics.php" class="active">Peripherals / Misc</a></li>
    </ul>
</nav>

<!-- Main Container with Sidebar and Content -->
<div class="ppcontainer">
    <!-- Left Sidebar -->
    <aside class="sidebar">
        <div class="filter-category">
            <button class="filter-toggle"><i class="fa-solid fa-caret-down"></i> Peripherals / Misc</button>
            <ul class="filter-list" style="display: none;">
                <?php
                $store_query = "SELECT DISTINCT peripheralsmicsstore FROM peripheralsmics_store ORDER BY peripheralsmicsstore ASC";
                $store_result = mysqli_query($conn, $store_query);

                if (!$store_result) {
                    echo "<li>Error fetching categories: " . htmlspecialchars(mysqli_error($conn)) . "</li>";
                } else {
                    while ($row = mysqli_fetch_assoc($store_result)) {
                        $original_value = $row['peripheralsmicsstore'];
                        $display_value = htmlspecialchars($original_value, ENT_QUOTES);
                        $url_value = urlencode($original_value);
                        $is_active = (isset($_GET['brand']) && urldecode($_GET['brand']) === $original_value) ? 'active' : '';
                        echo "<li class='$is_active'><a href='?brand=$url_value'>$display_value</a></li>";
                    }
                }
                ?>
            </ul>
        </div>

        <div class="filter-category">
            <button class="filter-toggle"><i class="fa-solid fa-caret-down"></i> Brands</button>
            <ul class="filter-list" style="display: none;">
                <?php
                // Query for brands of Peripherals/Misc (previously 'np' table, now 'peripheralsmics_brand')
                $brand_query = "SELECT DISTINCT peripheralsmicsbrand FROM peripheralsmics_brand ORDER BY peripheralsmicsbrand ASC";
                $brand_result = mysqli_query($conn, $brand_query);

                if (!$brand_result) {
                    echo "<li>Error fetching brand options: " . htmlspecialchars(mysqli_error($conn)) . "</li>";
                } else {
                    while ($row = mysqli_fetch_assoc($brand_result)) {
                        $original_value = $row['peripheralsmicsbrand'];
                        $display_value = htmlspecialchars($original_value, ENT_QUOTES);
                        $url_value = urlencode($original_value);
                        // Updated GET parameter to 'processor' to match the PHP script
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
                <h3 id="network-heading">Peripherals / Misc<?php echo $selected_processor ? " >> " . htmlspecialchars($selected_processor) : ''; ?></h3>
            </div>
            <div class="pp">
                <p>Shop a wide selection of Peripherals / Misc in Pakistan including various models at Czone.com.pk</p>
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
                    $np = isset($row['np']) ? htmlspecialchars($row['np']) : 'N/A';
                    $n_type = isset($row['n_type']) ? htmlspecialchars($row['n_type']) : 'N/A';
                } ?>
                <div class="product-container card" data-category="network" data-id="<?php echo htmlspecialchars($row['id']); ?>">
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
                        <p class="category"><strong>Category:</strong> Peripherals / Misc > <?php echo htmlspecialchars($row['brand']); ?></p>
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
                        <?php if (!empty($row['old_price']) && $row['old_price'] > 0): ?>
                            <span class="old-price">Rs. <?php echo number_format($row['old_price']); ?></span>
                        <?php endif; ?>
                        <button class="add-to-cart" onclick="addToCart(<?php echo htmlspecialchars($row['id']); ?>, 'peripheralsmics')">
                            <i class="fa-solid fa-cart-shopping"></i> Add To Cart
                        </button>
                        <button class="add-to-wishlist">
                            <i class="fa-solid fa-heart"></i> Add To Wishlist
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
            <p>Explore our wide selection of **peripherals and miscellaneous accessories** to enhance your computing experience. From essential input devices like **keyboards and mice** to versatile **webcams, headsets, and speakers**, we have everything you need to complete your setup.</p>
            <p>Discover top brands such as Logitech, Razer, SteelSeries, and more, all available at competitive prices in Pakistan.</p>
            <p>Upgrade your workspace, elevate your entertainment—find the perfect peripheral to match your needs.</p>
        </div>
    </div>
</div>

<!-- Product Popup -->
<div id="productPopup" class="popup" data-category="network">
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
            <button class="add-to-cart" onclick="addToCart(0, 'network')">
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