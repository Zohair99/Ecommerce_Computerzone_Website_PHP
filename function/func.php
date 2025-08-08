<?php

function filterBrandProduct()
{
    global $conn; // Use correct variable name for database connection

    if (isset($_GET['brand'])) {
        $brand_id = intval($_GET['brand']); // Sanitize input

        // Prepared statement to prevent SQL injection
        $stmt = $conn->prepare("SELECT * FROM products WHERE brand_id = ?");
        $stmt->bind_param("i", $brand_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $num_of_rows = $result->num_rows;

        if ($num_of_rows == 0) {
            echo "<h2 class='text-center'>No Stock for this brand</h2>";
        }

        while ($row = $result->fetch_assoc()) {
            $product_id = htmlspecialchars($row['product_id']);
            $product_title = htmlspecialchars($row['product_title']);
            $product_image_one = htmlspecialchars($row['product_image_one']);
            $product_price = number_format($row['product_price']);
            $review_stars = intval($row['review']);

            echo "
                <div class='product-container'>
                    <img src='./admin/product_images/$product_image_one' alt='$product_title' class='product-image'>
                    
                    <div class='product-details'>
                        <h2 class='product-title'>$product_title</h2>
                        <p class='rating'>" . str_repeat("⭐", $review_stars) . " ($review_stars Stars)</p>
                        <p class='price'>Rs. $product_price</p>
                        <button class='add-to-cart'><a href='products.php?add_to_cart=$product_id' class='text-light'>Add To Cart</a></button>
                        <button class='view-more'><a href='product_details.php?product_id=$product_id' class='text-light'>View More</a></button>
                    </div>
                </div>
            ";
        }
    }
}


?>
