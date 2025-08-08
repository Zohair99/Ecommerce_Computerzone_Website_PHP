<?php
session_start();

$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['item_index']) && isset($_SESSION['cart'][$_POST['item_index']])) {
        $itemIndex = (int)$_POST['item_index'];

        if (isset($_POST['remove_item'])) {
            unset($_SESSION['cart'][$itemIndex]);
            $_SESSION['cart'] = array_values($_SESSION['cart']);
            header("Location: index.php");
            exit();
        } elseif (isset($_POST['quantity']) || isset($_POST['increase_quantity'])) {
            $newQuantity = isset($_POST['quantity']) ? (int)$_POST['quantity'] :
                $_SESSION['cart'][$itemIndex]['quantity'] + 1;

            if ($newQuantity > 0) {
                $_SESSION['cart'][$itemIndex]['quantity'] = $newQuantity;
            }
            header("Location: " . $_SERVER['PHP_SELF']);
            exit();
        }
    }
}

$title = 'ComputerZone | Pakistan';

$searchQuery = isset($_GET['search']) ? trim(mysqli_real_escape_string($conn, $_GET['search'])) : '';
$highlightId = isset($_GET['highlight']) ? (int)$_GET['highlight'] : 0;

include_once('navbar/productstyle.php');

$fetch_query = "SELECT * FROM Home";
$result = mysqli_query($conn, $fetch_query);
if (!$result) {
    die("Query failed: " . mysqli_error($conn));
}
?>

<!-- slider -->

<div class="slider">
    <div class="list">
        <div class="item">
            <img src="images/slider1.jpg" alt="">
        </div>
        <div class="item">
            <img src="images/slider2.jpg" alt="">
        </div>
        <div class="item">
            <img src="images/slider3.jpg" alt="">
        </div>
        <div class="item">
            <img src="images/slider4.jpg" alt="">
        </div>
        <div class="item">
            <img src="images/slider5.jpg" alt="">
        </div>
        <div class="item">
            <img src="images/slider6.jpg" alt="">
        </div>
    </div>
    <div class="buttons">
        <button id="prev">
            < </button>
                <button id="next"> > </button>
    </div>
    <ul class="dots">
        <li class="active"></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>

<!-- slider end -->

<!-- features -->

<div class="featured">
    <h3>FEATURED PRODUCTS</h3>
</div>

<!-- features end -->

<!-- card 1 -->

<div class="card-containers">
    <?php
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
    ?>
            <div class="cards">
                <?php if (!empty($row['offer'])) { ?>
                    <!-- <div class="discount-badges"><?php echo $row['offer']; ?>% OFF</div> -->
                <?php } ?>

                <img src="Admin/images/<?php echo htmlspecialchars($row['image']); ?>" alt="Laptop Image">

                <div class="card-contents">
                    <h3 class="card-title"><?php echo htmlspecialchars($row['name']); ?></h3>
                    <p class="card-description"><?php echo htmlspecialchars($row['description']); ?></p>

                    <ul class="spec-list">
                        <?php if (!empty($row['spec1'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec1']); ?></li><?php } ?>
                        <?php if (!empty($row['spec2'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec2']); ?></li><?php } ?>
                        <?php if (!empty($row['spec3'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec3']); ?></li><?php } ?>
                        <?php if (!empty($row['spec4'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec4']); ?></li><?php } ?>
                    </ul>

                    <p class="price">
                    <div class="price-divider"></div>
                    Rs.<?php echo number_format($row['price']); ?>

                    <?php if (!empty($row['old_price'])) { ?>
                        <span class="old-price">Rs.<?php echo number_format($row['old_price']); ?></span>
                    <?php } ?>
                    </p>

                    <a href="?id=<?php echo $row['id']; ?>" class="button view-detail">
                        <i class="fa-solid fa-link"></i> View Detail
                    </a>
                </div>
            </div>
    <?php
        }
    }
    ?>
</div>

<!-- Popup -->

<?php
if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $productId = intval($_GET['id']);

    $stmt = $conn->prepare("SELECT * FROM Home WHERE id = ?");
    $stmt->bind_param("i", $productId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
?>
        <div id="productPopup" class="popup" style="display: flex;">
            <div class="popup-content">
                <span class="close-popup" id="closePopup">&times;</span>
                <img src="Admin/images/<?php echo htmlspecialchars($row['image']); ?>" alt="Product Image">
                <div class="popup-text">
                    <h2><?php echo htmlspecialchars($row['name']); ?></h2>
                    <p><?php echo htmlspecialchars($row['description']); ?></p>
                    <ul>
                        <?php if (!empty($row['spec1'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec1']); ?></li><?php } ?>
                        <?php if (!empty($row['spec2'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec2']); ?></li><?php } ?>
                        <?php if (!empty($row['spec3'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec3']); ?></li><?php } ?>
                        <?php if (!empty($row['spec4'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec4']); ?></li><?php } ?>
                    </ul>
                    <span class="in-stock">InStock</span>
                    <p class="warrent"><strong>Warrenty:</strong> <span class="warrenty">International warrenty</span></p>
                    <button class="add-to-cart" onclick="addToCart(<?php echo htmlspecialchars($row['id']); ?>, 'Home')">
                        <i class="fa-solid fa-cart-shopping"></i> Add To Cart
                    </button>
                    <button class="add-to-wishlist">add to wishlist</button>
                    <div class="pricees">
                        <div class="price-divider"></div>
                        Rs.<?php echo number_format($row['price']); ?>

                        <?php if (!empty($row['old_price'])) { ?>
                            <span class="old-price">Rs.<?php echo number_format($row['old_price']); ?></span>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
<?php
    } else {
        echo "Product not found.";
    }

    $stmt->close();
    mysqli_close($conn);
}
?>


<!-- popup ends -->

<!-- card 1 end -->

<!-- new arrivals -->

<br><br>
<div class="featured">
    <h3>NEW ARRIVALS</h3>
</div>

<!-- new arrivals end -->

<!-- Card 2 -->

<div class="card-containers">
    <?php
    $conn = mysqli_connect("localhost", "root", "", "computerzone");

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $fetch_query = "SELECT * FROM new_home ";
    $result = mysqli_query($conn, $fetch_query);
    ?>
    <?php
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $offer = !empty($row['offer']) ? htmlspecialchars($row['offer']) : '';
            $old_price = !empty($row['old_price']) ? "Rs." . number_format($row['old_price'], 2) : '';
    ?>
            <div class="cards">
                <?php if ($offer) { ?>
                    <div class="discount-badges"><?php echo $offer; ?>% OFF</div>
                <?php } ?>

                <img src="Admin/images/<?php echo htmlspecialchars($row['image']); ?>" alt="Laptop Image">

                <div class="card-contents">
                    <h3 class="card-title"><?php echo htmlspecialchars($row['name']); ?></h3>
                    <p class="card-description"><?php echo htmlspecialchars($row['description']); ?></p>

                    <ul class="spec-list">
                        <?php if (!empty($row['spec1'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec1']); ?></li><?php } ?>
                        <?php if (!empty($row['spec2'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec2']); ?></li><?php } ?>
                        <?php if (!empty($row['spec3'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec3']); ?></li><?php } ?>
                        <?php if (!empty($row['spec4'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec4']); ?></li><?php } ?>
                    </ul>

                    <p class="price">
                    <div class="price-divider"></div>
                    Rs.<?php echo number_format($row['price']); ?>
                    <?php if (!empty($row['old_price'])) { ?>
                        <span class="old-price">Rs.<?php echo number_format($row['old_price']); ?></span>
                    <?php } ?>
                    </p>

                    <a href="?new_home_id=<?php echo $row['id']; ?>" class="button view-detail">
                        <i class="fa-solid fa-link"></i> View Detail
                    </a>
                </div>
            </div>
    <?php
        }
    }
    ?>
</div>

<!-- card 2 end -->

<!-- Popup -->

<?php

if (isset($_GET['new_home_id']) && is_numeric($_GET['new_home_id'])) {
    $productId = intval($_GET['new_home_id']);

    $stmt = $conn->prepare("SELECT * FROM New_Home WHERE id = ?");
    $stmt->bind_param("i", $productId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
?>
        <div id="productPopup2" class="popup" style="display: flex;">
            <div class="popup-content">
                <span class="close-popup" id="closePopup2">&times;</span>
                <img src="Admin/images/<?php echo htmlspecialchars($row['image']); ?>" alt="Product Image">
                <div class="popup-text">
                    <h2><?php echo htmlspecialchars($row['name']); ?></h2>
                    <p><?php echo htmlspecialchars($row['description']); ?></p>
                    <ul>
                        <?php if (!empty($row['spec1'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec1']); ?></li><?php } ?>
                        <?php if (!empty($row['spec2'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec2']); ?></li><?php } ?>
                        <?php if (!empty($row['spec3'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec3']); ?></li><?php } ?>
                        <?php if (!empty($row['spec4'])) { ?>
                            <li><?php echo htmlspecialchars($row['spec4']); ?></li><?php } ?>
                    </ul>
                    <span class="in-stock">InStock</span>
                    <p class="warrent"><strong>Warranty:</strong> <span class="warranty">International warranty</span></p>
                    <button class="add-to-cart" onclick="addToCart(<?php echo htmlspecialchars($row['id']); ?>, 'New_Home')">
                        <i class="fa-solid fa-cart-shopping"></i> Add To Cart
                    </button>

                    <button class="add-to-wishlist">Add to Wishlist</button>
                    <div class="pricees">
                        <div class="price-divider"></div>
                        Rs.<?php echo number_format($row['price']); ?>

                        <?php if (!empty($row['old_price'])) { ?>
                            <span class="old-price">Rs.<?php echo number_format($row['old_price']); ?></span>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
<?php
    } else {
        echo "Product not found in New_Home.";
    }

    $stmt->close();
}

mysqli_close($conn);
?>

<!-- popup ends -->

<!-- card 2 end -->

<!-- details -->

<div class="details">
    <p>Store Timings: Monday - Thursday and Saturday: 11:00 am to 8:00 pm, Friday: 11:00 am to 1:00 pm and 3:00 pm
        to 8:00 pm, Sunday Closed.<br>
        Note: The prices listed are subject to change based on fluctuations in currency. For more information,
        please contact us.</p>
</div>

<!-- details end -->

<?php
// 
include_once('footer/footer.php');
// 
?>

</body>

</html>

<script src="javascript/script.js"></script>