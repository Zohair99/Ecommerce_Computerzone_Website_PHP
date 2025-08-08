<?php
session_start();

$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$searchQuery = isset($_GET['search']) ? trim(mysqli_real_escape_string($conn, $_GET['search'])) : '';
$highlightId = isset($_GET['highlight']) ? (int)$_GET['highlight'] : 0;

function getRedirectUrl($baseUrl, $currentParams, $searchQuery = '')
{
    $params = [];
    if (!empty($searchQuery)) {
        $params['search'] = $searchQuery;
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
    if (!empty($currentParams['processor'])) {
        $params['processor'] = $currentParams['processor'];
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
        header("Location: " . getRedirectUrl($currentFileName, $_GET, $searchQuery));
        exit();
    }

    if (isset($_POST['remove_item'])) {
        $itemIndex = (int)$_POST['item_index'];
        if (isset($_SESSION['cart'][$itemIndex])) {
            unset($_SESSION['cart'][$itemIndex]);
            $_SESSION['cart'] = array_values($_SESSION['cart']);
        }
        header("Location: " . getRedirectUrl($currentFileName, $_GET, $searchQuery));
        exit();
    }
}

$title = 'PC Casing Price in Pakistan - PC Case';
include_once('navbar/productstyle.php');

$products_per_page = 10;
$current_page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
$offset = ($current_page - 1) * $products_per_page;

$sort_order = "casing.price ASC";
if (isset($_GET['sort'])) {
    switch ($_GET['sort']) {
        case "high":
            $sort_order = "casing.price DESC";
            break;
        case "low":
            $sort_order = "casing.price ASC";
            break;
        case "rating":
            $sort_order = "casing.review DESC";
            break;
    }
}

$selected_brand = isset($_GET['brand']) ? mysqli_real_escape_string($conn, $_GET['brand']) : '';
$selected_type = isset($_GET['processor']) ? mysqli_real_escape_string($conn, urldecode($_GET['processor'])) : '';

$base_product_query = "SELECT casing.*, casing_store.casingstore AS brand_name, casing_brand.casingbrand AS type_name
                       FROM casing
                       INNER JOIN casing_store ON casing.brand = casing_store.casingstore
                       INNER JOIN casing_brand ON casing.processor = casing_brand.casingbrand";

$base_count_query = "SELECT COUNT(*) as total
                     FROM casing
                     INNER JOIN casing_store ON casing.brand = casing_store.casingstore
                     INNER JOIN casing_brand ON casing.processor = casing_brand.casingbrand";

$conditions = [];
if (!empty($selected_brand)) {
    $conditions[] = "casing_store.casingstore = '" . $selected_brand . "'";
}
if (!empty($selected_type)) {
    $conditions[] = "casing_brand.casingbrand = '" . $selected_type . "'";
}
if (!empty($searchQuery)) {
    $conditions[] = "casing.name LIKE '%" . $searchQuery . "%'";
}

$where_clause = empty($conditions) ? "" : " WHERE " . implode(" AND ", $conditions);

$total_products_query = $base_count_query . $where_clause;
$total_products_result = mysqli_query($conn, $total_products_query);
if (!$total_products_result) {
    die("Error counting products: " . mysqli_error($conn));
}
$total_products = mysqli_fetch_assoc($total_products_result)['total'];
$total_pages = ceil($total_products / $products_per_page);

$product_query = $base_product_query . $where_clause . " ORDER BY " . $sort_order . " LIMIT " . $offset . ", " . $products_per_page;
$product_result = mysqli_query($conn, $product_query);
if (!$product_result) {
    die("Error fetching products: " . mysqli_error($conn));
}
$num_rows = mysqli_num_rows($product_result);
?>

<!-- breadcrumb -->

<nav class="breadcrumb">
    <ul>
        <li><a href="index.php">Home</a></li>
        <li>/</li>
        <li><a href="Casing.php" class="active">Casing</a></li>
    </ul>
</nav>

<!-- Main Container with Sidebar and Content -->
<div class="ppcontainer">

    <!-- Left Sidebar -->
    <aside class="sidebar">
        <div class="filter-category">
            <button class="filter-toggle"><i class="fa-solid fa-caret-down"></i> Casing</button>
            <ul class="filter-list" style="display: none;">
                <?php
                $store_query = "SELECT DISTINCT casingstore FROM casing_store ORDER BY casingstore ASC";
                $store_result = mysqli_query($conn, $store_query);

                if (!$store_result) {
                    die("Error fetching casing store options: " . mysqli_error($conn));
                }

                while ($row = mysqli_fetch_assoc($store_result)) {
                    $brand_option = htmlspecialchars($row['casingstore']);
                    echo "<li><a href='?brand=" . urlencode($brand_option) . "'>$brand_option</a></li>";
                }
                ?>
            </ul>
        </div>

        <div class="filter-category">
            <button class="filter-toggle"><i class="fa-solid fa-caret-down"></i> Brands</button>
            <ul class="filter-list" style="display: none;">
                <?php
                $brand_query = "SELECT DISTINCT casingbrand FROM casing_brand ORDER BY created_at DESC";
                $brand_result = mysqli_query($conn, $brand_query);

                if (!$brand_result) {
                    die("Error fetching processor options: " . mysqli_error($conn));
                }

                while ($row = mysqli_fetch_assoc($brand_result)) {
                    $processor_option = htmlspecialchars($row['casingbrand']);
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
                <h3 id="casing-heading">Casing <?php echo $selected_brand ? ">> " . htmlspecialchars($selected_brand) : ''; ?></h3>
            </div>
            <div class="pp">
                <p>Shop a wide selection of Casing in Pakistan including various models at Czone.com.pk</p>
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
                <div class="product-container card" data-category="casing" data-id="<?php echo htmlspecialchars($row['id']); ?>">
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
                        <p class="category"><strong>Category:</strong> Casing > <?php echo $processor; ?></p>
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
                        <button class="add-to-cart" onclick="addToCart(<?php echo htmlspecialchars($row['id']); ?>, 'casing')">
                            <i class="fa-solid fa-cart-shopping"></i> Add To Cart
                        </button>
                        <button class="add-to-wishlist"><i class="fa-solid fa-cart-shopping"></i> Add To Wishlist</button>
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
            <p>Experience sharp text and vivid images with our premium range of Casing. Whether for everyday use or high-quality photo printing, we deliver consistent results you can trust.</p>
        </div>
    </div>
</div>

<!-- Product Popup -->
<div id="productPopup" class="popup" data-category="casing" data-id="<?php echo htmlspecialchars($row['id']); ?>">
    <div class="popup-content">
        <span class="close-popup" id="closePopup">&times;</span>
        <img id="popupImage" src="" alt="">
        <div class="popup-text">
            <h2 id="popupTitle"></h2>
            <div class="reviewes">
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
            <button class="add-to-cart" onclick="addToCart(0, 'casing')">
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