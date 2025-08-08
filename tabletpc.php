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
    if (!empty($currentParams['search'])) $params['search'] = $currentParams['search'];
    if (!empty($currentParams['processor'])) $params['processor'] = $currentParams['processor'];
    if (!empty($currentParams['brand'])) $params['brand'] = $currentParams['brand'];
    if (!empty($currentParams['sort'])) $params['sort'] = $currentParams['sort'];
    if (!empty($currentParams['page'])) $params['page'] = $currentParams['page'];
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

$title = 'Tablet PC Prices in Pakistan - Find the Best Deals';
include_once('navbar/productstyle.php');

$products_per_page = 10;
$current_page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
$offset = ($current_page - 1) * $products_per_page;

$sort_order = "tabletpc.price ASC";
if (isset($_GET['sort'])) {
    switch ($_GET['sort']) {
        case "high":
            $sort_order = "tabletpc.price DESC";
            break;
        case "low":
            $sort_order = "tabletpc.price ASC";
            break;
        case "rating":
            $sort_order = "tabletpc.review DESC";
            break;
        default:
            $sort_order = "tabletpc.price ASC";
    }
}

$selected_processor = isset($_GET['processor']) ? $_GET['processor'] : '';
$selected_brand = isset($_GET['brand']) ? urldecode($_GET['brand']) : '';

$where_clauses = [];
$params = [];
$types = '';

if (!empty($selected_processor)) {
    $where_clauses[] = "tabletpc_brand.tabletpcbrand = ?";
    $params[] = $selected_processor;
    $types .= 's';
}

if (!empty($selected_brand)) {
    $where_clauses[] = "tabletpc_store.tabletpcstore = ?";
    $params[] = $selected_brand;
    $types .= 's';
}

if (!empty($searchQuery)) {
    $where_clauses[] = "tabletpc.name LIKE ?";
    $params[] = '%' . $searchQuery . '%';
    $types .= 's';
}

$where_clause_string = empty($where_clauses) ? "" : " WHERE " . implode(" AND ", $where_clauses);

// Total count query
$total_products_query = "SELECT COUNT(*) as total
    FROM tabletpc
    INNER JOIN tabletpc_brand ON tabletpc.processor = tabletpc_brand.tabletpcbrand
    INNER JOIN tabletpc_store ON tabletpc.brand = tabletpc_store.tabletpcstore"
    . $where_clause_string;

$stmt_total = $conn->prepare($total_products_query);
if (!$stmt_total) {
    die("Prepare failed (total): " . $conn->error);
}
if (!empty($params)) {
    $stmt_total->bind_param($types, ...$params);
}
$stmt_total->execute();
$total_products_result = $stmt_total->get_result();
$total_products = $total_products_result->fetch_assoc()['total'];
$total_pages = ceil($total_products / $products_per_page);
$stmt_total->close();

// Fetch paginated products
$product_query = "SELECT tabletpc.*,
    tabletpc_brand.tabletpcbrand AS processor_name,
    tabletpc_store.tabletpcstore AS brand_name
    FROM tabletpc
    INNER JOIN tabletpc_brand ON tabletpc.processor = tabletpc_brand.tabletpcbrand
    INNER JOIN tabletpc_store ON tabletpc.brand = tabletpc_store.tabletpcstore"
    . $where_clause_string
    . " ORDER BY $sort_order LIMIT ?, ?";

$params_for_products = $params;
$params_for_products[] = $offset;
$params_for_products[] = $products_per_page;
$types_for_products = $types . 'ii';

$stmt_products = $conn->prepare($product_query);
if (!$stmt_products) {
    die("Prepare failed (products): " . $conn->error);
}
$stmt_products->bind_param($types_for_products, ...$params_for_products);
$stmt_products->execute();
$product_result = $stmt_products->get_result();
$num_rows = mysqli_num_rows($product_result);
$stmt_products->close();
?>


<body>

    <nav class="breadcrumb">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li>/</li>
            <li><a href="tabletpc.php" class="active"> Tablet PC</a></li>
        </ul>
    </nav>

    <div class="ppcontainer">
        <aside class="sidebar">
            <div class="filter-category">
                <button class="filter-toggle"><i class="fa-solid fa-caret-down"></i> Tablet PC</button>
                <ul class="filter-list" style="display: none;">
                    <?php
                    $store_query = "SELECT DISTINCT tabletpcstore FROM tabletpc_store ORDER BY tabletpcstore ASC";
                    $store_result = mysqli_query($conn, $store_query);

                    if (!$store_result) {
                        echo "<li>Error fetching categories: " . htmlspecialchars(mysqli_error($conn)) . "</li>";
                    } else {
                        while ($row = mysqli_fetch_assoc($store_result)) {
                            $original_value = $row['tabletpcstore'];
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
                    $brand_query = "SELECT DISTINCT tabletpcbrand FROM tabletpc_brand ORDER BY tabletpcbrand ASC";
                    $brand_result = mysqli_query($conn, $brand_query);

                    if (!$brand_result) {
                        echo "<li>Error fetching brand options: " . htmlspecialchars(mysqli_error($conn)) . "</li>";
                    } else {
                        while ($row = mysqli_fetch_assoc($brand_result)) {
                            $original_value = $row['tabletpcbrand'];
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


        <div class="main-content">
            <div class="product-grid">
                <div class="mainheading">
                    <h3 id="pos-heading">Tablet PC <?php echo $selected_brand ? " >> " . htmlspecialchars($selected_brand) : ''; ?></h3>
                </div>
                <div class="pp">
                    <p>Shop a wide selection of Tablet PC in Pakistan including various models at Czone.com.pk</p>
                </div>

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

                <?php while ($row = mysqli_fetch_assoc($product_result)): ?>
                    <div class="product-container card" data-category="projectors" data-id="<?php echo htmlspecialchars($row['id']); ?>">
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
                            <p class="category"><strong>Category:</strong> Tablet PC > <?php echo htmlspecialchars($row['brand_name']); ?></p>
                            <p class="code"><strong>Code: </strong> <?php echo htmlspecialchars($row['code']); ?></p>
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
                            <button class="add-to-cart" onclick="addToCart(<?php echo htmlspecialchars($row['id']); ?>, 'tabletpc')">
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
            <div class="endpara">
                <p>Enhance your digital lifestyle with our premium range of tablet PCs. Whether you're working on the go, streaming your favorite shows, or managing daily tasks, find the perfect tablet to match your performance and portability needs.</p>
                <p>From sleek designs for casual users to powerful models for professionals, our collection offers cutting-edge technology, stunning displays, and long-lasting battery life. Discover tablets that combine versatility with style. Shop now and upgrade your tech experience.</p>
            </div>

        </div>
    </div>

    <div id="productPopup" class="popup" data-category="pos">
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
                <button class="add-to-cart" onclick="addToCart(0, 'pos')"> <i class="fa-solid fa-cart-shopping"></i> Add To Cart
                </button>
                <button class="add-to-wishlist">Add To Wishlist</button>
                <div class="prices">
                    <p id="pop-prices"></p>
                    <p id="pop-old-prices"></p>
                </div>
            </div>
        </div>
    </div>

    <?php
    include_once('footer/footer.php');
    ?>

</body>

</html>

<script src="javascript/products.js"></script>