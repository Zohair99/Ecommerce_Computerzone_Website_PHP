<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title ?></title>
    <link rel="shortcut icon" type="image" href="images/tab.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/products.css">
    <style>
        .dropdown-menu {
            display: none;
            position: absolute;
            background-color:#064f88;
            width: 140px;
            height: 110px;
            box-shadow: 0px 10px 20px 0px rgba(0, 0, 0, 0.15);
            z-index: 1000;
            overflow: hidden;
            top: 100%;
            left: 0;
            padding: 5px 0;
            transform: translateY(10px);
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s ease, transform 0.3s ease, visibility 0.3s ease;
        }

        .dropdown-menu.active {
            display: block;
            opacity: 1;
            transform: translateY(0);
            visibility: visible;
        }

        .dropdown-menu a {
            color: rgb(124, 0, 0);
            padding: 6px 10px;
            text-decoration: none;
            display: block;
            font-size: 15px;
            transition: background-color 0.2s ease, color 0.2s ease;
            white-space: nowrap;
        }

    </style>
</head>

<body>

    <!-- full navbar starts from here -->

    <!-- top bar -->

    <header>
        <div class="topbar">
            <div class="cont1">
                <ul>
                    <li><a href="about.php">About Computer Zone</a></li>
                    <li><a href="contact.php">Feedbacks & Suggestions</a></li>
                    <li><a href="contact.php">Contact Us</a></li>
                    <li><a href="faqs.php">FAQs</a></li>
                    <li><a href="policies.php">Policies</a></li>
                </ul>
            </div>
            <div class="cont2">
                <ul>
                    <li id="my-accounts-dropdown">
                        <a href="#" class="dropdown-toggle">My Accounts <i class="fa-solid fa-caret-down"></i></a>
                        <div class="dropdown-menu">
                            <a href="profile.php">Profile</a>
                            <a href="orderhistory.php">Orders History</a>
                            <a href="passcode.php">Change Password</a>
                        </div>
                    </li>
                    <?php if (isset($_SESSION['user_name'])): ?>
                        <li><a href="profile.php"><?php echo htmlspecialchars($_SESSION['user_name']); ?></a></li>
                        <li><a href="?logout=true">Logout</a></li>
                    <?php else: ?>
                        <li><a href="create-account.php">Log In</a></li>
                        <li><a href="create-account.php">Create Account</a></li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>

        <!-- top bar end -->

        <!-- second bar -->

        <div class="navbar">
            <div class="cont3">
                <a href="index.php"><img src="images/logo.webp" alt="not available" class="logo1"></a>
            </div>
            <div class="cont4">
                <input placeholder="Search entire store here" id="searchbar">
                <select id="cate1">
                    <option value="">Categories</option>
                    <option value="support">Laptops</option>
                    <option value="support">Laptop | Used</option>
                    <option value="support">Laptop Accessories</option>
                    <option value="support">Cameras | Drones</option>
                    <option value="support">Cartridges & Toners</option>
                    <option value="support">Casing</option>
                    <option value="support">Cooling Solutions</option>
                    <option value="support">Desktop Computers</option>
                    <option value="support">Gaming Consoles</option>
                    <option value="support">Gaming Products</option>
                    <option value="support">Graphic Cards</option>
                    <option value="support">Graphic Tablets</option>
                    <option value="support">Hard Drives</option>
                    <option value="support">Headsets | Headphones | Mic</option>
                    <option value="support">Keyboards</option>
                    <option value="support">LCD/LED Monitors</option>
                    <option value="support">Memory Cards</option>
                    <option value="support">Memory Module / RAM</option>
                    <option value="support">Motherboards</option>
                    <option value="support">Mouse</option>
                    <option value="support">Network Products</option>
                    <option value="support">Peripherals / Misc</option>
                    <option value="support">Point of Sale POS</option>
                    <option value="support">Power Supply</option>
                    <option value="support">Presenters</option>
                    <option value="support">Printers</option>
                    <option value="support">Processors</option>
                    <option value="support">Projectors</option>
                    <option value="support">Scanners</option>
                    <option value="support">Softwares</option>
                    <option value="support">Solid-State Drives (SSD)</option>
                    <option value="support">Speakers</option>
                    <option value="support">Stabilizers</option>
                    <option value="support">Tablet PC</option>
                    <option value="support">Tablet Accessories</option>
                    <option value="support">TV Devices | Streaming Media Players</option>
                    <option value="support">UPS</option>
                    <option value="support">USB Flash Drives</option>
                    <option value="support">Used Products</option>
                    <option value="support">Other</option>
                </select>
                <i class="fa-solid fa-magnifying-glass" id="search-icon"></i>
                <i class="fa-solid fa-cart-shopping" id="cart1" style="cursor: pointer;"></i>
                <div class="cart-popup" id="cartPopup">
                    <div class="cart-header">
                        <h2>Shopping Cart</h2>
                        <span class="close-btn" id="closeCart">&times;</span>
                    </div>

                    <div class="cart-items">
                        <?php if (empty($_SESSION['cart'])): ?>
                            <div class="cart-item">
                                <p style="margin-left: 15px"> Your cart is empty.</p>
                            </div>
                        <?php else: ?>
                            <?php
                            $totalPrice = 0;
                            foreach ($_SESSION['cart'] as $index => $item):
                                $itemTotal = $item['price'] * $item['quantity'];
                                $totalPrice += $itemTotal;
                            ?>
                                <div class="cart-item">
                                    <img src="Admin/images/<?php echo htmlspecialchars($item['image']); ?>" alt="Product 1">
                                    <div class="cartdetails">
                                        <div class="cart-item-info">
                                            <p class="cart-item-name"><?php echo htmlspecialchars($item['name']); ?></p>
                                            <p class="cart-item-price">Rs. <?php echo number_format($item['price']); ?> x <?php echo $item['quantity']; ?></p>
                                        </div>
                                        <div class="cartquantity">
                                            <form method="post" style="display:inline;">
                                                <input type="hidden" name="item_index" value="<?php echo $index; ?>">
                                                <input type="hidden" name="quantity" value="<?php echo max(1, $item['quantity'] - 1); ?>">
                                                <button type="submit" name="update_quantity" style="background: none; border: none; cursor: pointer;">
                                                    <i class="fa-solid fa-minus"></i>
                                                </button>
                                            </form>
                                            <p style="display:inline; margin: 0 10px;"><?php echo $item['quantity']; ?></p>
                                            <form method="post" style="display:inline;">
                                                <input type="hidden" name="item_index" value="<?php echo $index; ?>">
                                                <input type="hidden" name="quantity" value="<?php echo $item['quantity'] + 1; ?>">
                                                <button type="submit" name="update_quantity" style="background: none; border: none; cursor: pointer;">
                                                    <i class="fa-solid fa-plus"></i>
                                                </button>
                                            </form>
                                        </div>
                                        <div class="cartprice">
                                            <p>Rs. <?php echo number_format($itemTotal); ?></p>
                                        </div>
                                        <div class="cartdelete">
                                            <form method="post" style="display:inline;">
                                                <input type="hidden" name="item_index" value="<?php echo $index; ?>">
                                                <button type="submit" name="remove_item" style="background: none; border: none; cursor: pointer;">
                                                    <i class="fa-solid fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </div>

                    <div class="cart-footer">
                        <p>Sub-Total: <span id="cartTotal">Rs. <?php echo isset($totalPrice) ? number_format($totalPrice) : '0'; ?></span></p>
                        <div class="cartbtn">
                            <button class="checkout-btn" onclick="window.location.href='add_details.php'">View Details</button>
                            <button class="checkout-btn" onclick="window.location.href='checkout.php'">Checkout</button>
                        </div>
                    </div>
                </div>
                <div id="suggestion-box"></div>
            </div>
        </div>

        <!-- menu bar -->

        <nav class="menubar">
            <ul class="menu">
                <li><a href="index.php">HOME</a></li>
                <li class="dropdown">
                    <a href="#">PRODUCTS <i class="fa-solid fa-caret-down"></i></a>
                    <div class="mega-menu">
                        <div class="mega-column">
                            <a href="laptop.php" class="a">Laptops</a>
                            <a href="laptopused.php" class="a">Laptops | Used</a>
                            <a href="laptopaccessories.php" class="a">Laptop Accessories</a>
                            <a href="cameradrones.php" class="a">Cameras | Drones</a>
                            <a href="catridges-toners.php" class="a">Cartridges & Toners</a>
                            <a href="Casing.php" class="a">Casing</a>
                            <a href="CoolingSolutions.php" class="a">Cooling Solutions</a>
                        </div>
                        <div class="mega-column">
                            <a href="desktopcomputers.php" class="a">Desktop Computers</a>
                            <a href="gamingconsoles.php" class="a">Gaming Consoles</a>
                            <a href="gamingproducts.php" class="a">Gaming Products</a>
                            <a href="gpu.php" class="a">Graphic Cards</a>
                            <a href="graphictablets.php" class="a">Graphic Tablets</a>
                            <a href="hdd.php" class="a">Hard Drives</a>
                            <a href="headset-headphone-mic.php" class="a">Headsets | Headphones | Mic</a>
                        </div>
                        <div class="mega-column">
                            <a href="keyboard.php" class="a">Keyboard</a>
                            <a href="monitor.php" class="a">LCD/LED Monitors</a>
                            <a href="memorycard.php" class="a">Memory Cards</a>
                            <a href="ram.php" class="a">Memory Module / RAM</a>
                            <a href="motherboard.php" class="a">Motherboards</a>
                            <a href="mouse.php" class="a">Mouse</a>
                            <a href="network.php" class="a">Network Products</a>
                        </div>
                        <div class="mega-column">
                            <a href="peripherals-mics.php" class="a">Peripherals / Misc</a>
                            <a href="pointofsales-pos.php" class="a">Point Of Sale POS</a>
                            <a href="psu.php" class="a">Power Supply</a>
                            <a href="printer.php" class="a">Printers</a>
                            <a href="processor.php" class="a">Processors</a>
                            <a href="projector.php" class="a">Projectors</a>
                            <a href="scanner.php" class="a">Scanner</a>
                        </div>
                        <div class="mega-column">
                            <a href="software.php" class="a">Softwares</a>
                            <a href="ssd.php" class="a">Solid-State Drives (SSD)</a>
                            <a href="speakers.php" class="a">Speakers</a>
                            <a href="stabilizer.php" class="a">Stabilizer</a>
                            <a href="tabletpc.php" class="a">Tablet PC</a>
                            <a href="tabletaccessories.php" class="a">Tablet Accessories</a>
                            <a href="tvdevices-streaming.php" class="a">TV Devices | Streaming Media Players</a>
                        </div>
                        <div class="mega-column">
                            <a href="ups.php" class="a">UPS</a>
                            <a href="usbflashdrrives.php" class="a">USB Flash Drives</a>
                            <a href="usedproducts.php" class="a">Used Products</a>
                        </div>
                    </div>
                </li>
                <li><a href="laptop.php">LAPTOPS</a></li>
                <li><a href="gpu.php">GPU</a></li>
                <li><a href="monitor.php">MONITORS</a></li>
                <li><a href="printer.php">PRINTERS</a></li>
                <li><a href="hdd.php">HDD</a></li>
                <li><a href="ssd.php">SSD</a></li>
                <li><a href="network.php">NETWORK</a></li>
                <li><a href="ram.php">RAM</a></li>
                <li><a href="psu.php">PSU</a></li>
            </ul>
            <div class="cont6">
                <a href="https://www.facebook.com/login.php/"><i class="fa-brands fa-facebook-f" id="logo2"></i></a>
            </div>
        </nav>

        <!-- menu bar end -->

        <!-- second bar end -->

    </header>

    <!-- full navbar ends here -->

    <script src="javascript/product.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const dropdownToggle = document.querySelector('.dropdown-toggle');
            const dropdownMenu = document.querySelector('.dropdown-menu');
            const myAccountsDropdown = document.getElementById('my-accounts-dropdown');

            // Toggle dropdown on click
            dropdownToggle.addEventListener('click', function(event) {
                event.preventDefault(); // Prevent default link behavior
                dropdownMenu.classList.toggle('active'); // Toggle 'active' class
            });

            // Close dropdown when clicking outside
            document.addEventListener('click', function(event) {
                // If the click is outside the dropdown menu and the toggle button
                if (!myAccountsDropdown.contains(event.target)) {
                    dropdownMenu.classList.remove('active'); // Hide the dropdown
                }
            });
        });
    </script>