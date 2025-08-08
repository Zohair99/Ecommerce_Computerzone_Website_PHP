// 
// megamenu
// 

document.addEventListener('DOMContentLoaded', function () {
    const productsDropdown = document.querySelector('.dropdown');
    const productsTrigger = productsDropdown.querySelector('a');
    const megaMenu = productsDropdown.querySelector('.mega-menu');

    function closeDropdown() {
        productsDropdown.classList.remove('active');
    }

    productsTrigger.addEventListener('click', function (e) {
        e.preventDefault();
        e.stopPropagation();

        const isOpening = !productsDropdown.classList.contains('active');

        if (!isOpening) {
            closeDropdown();
            return;
        }

        productsDropdown.classList.add('active');
    });

    document.addEventListener('click', function (e) {
        if (!productsDropdown.contains(e.target)) {
            closeDropdown();
        }
    });

    megaMenu.addEventListener('click', function (e) {
        if (e.target.tagName === 'A') {
            closeDropdown();
        }
    });

    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') {
            closeDropdown();
        }
    });
});

//  
// toggle 
//    

document.addEventListener('DOMContentLoaded', function () {
    const filterToggles = document.querySelectorAll('.filter-toggle');

    filterToggles.forEach((toggle, index) => {
        const filterList = toggle.nextElementSibling;
        const filterCategory = toggle.parentElement;
        const icon = toggle.querySelector('i');

        filterList.style.display = 'block';
        toggle.classList.add('active');
        filterCategory.classList.add('active');
        if (icon) icon.classList.add('fa-rotate-180');

        toggle.addEventListener('click', function () {
            if (filterList.style.display === 'none') {
                filterList.style.display = 'block';
                toggle.classList.add('active');
                filterCategory.classList.add('active');
                if (icon) icon.classList.add('fa-rotate-180');
            } else {
                filterList.style.display = 'none';
                toggle.classList.remove('active');
                filterCategory.classList.remove('active');
                if (icon) icon.classList.remove('fa-rotate-180');
            }
        });
    });
});

// 
//  Searchbar 
//   

document.addEventListener("DOMContentLoaded", function () {
    const searchBar = document.getElementById("searchbar");
    const suggestionBox = document.getElementById("suggestion-box");
    let currentSearchPage = 1;
    let totalSearchResults = 0;
    let currentSearchTerm = '';

    const tableToPageMap = {
        'product': 'laptop.php',
        'laptopused': 'laptopused.php',
        'laptopacc': 'laptopaccessories.php',
        'cameradrone': 'cameradrones.php',
        'carttrones': 'catridges-toners.php',
        'casing': 'Casing.php',
        'cooling': 'CoolingSolutions.php',
        'deskcomp': 'desktopcomputers.php',
        'gamingconsoles': 'gamingconsoles.php',
        'gamingproducts': 'gamingproducts.php',
        'gpu': 'gpu.php',
        'graphictablets': 'graphictablets.php',
        'hdd_data': 'hdd.php',
        'headsetheadphonemic': 'headset-headphone-mic.php',
        'keyboard': 'keyboard.php',
        'monitor': 'monitor.php',
        'memorycards': 'memorycard.php',
        'ram': 'ram.php',
        'motherboard': 'motherboard.php',
        'mouse': 'mouse.php',
        'network': 'network.php',
        'peripheralsmics': 'peripherals-mics.php',
        'pos': 'pointofsales-pos.php',
        'psu': 'psu.php',
        'printer_data': 'printer.php',
        'processors': 'processor.php',
        'projectors': 'projector.php',
        'scanners': 'scanner.php',
        'software': 'software.php',
        'ssd_data': 'ssd.php',
        'speaker': 'speakers.php',
        'stabilizer': 'stabilizer.php',
        'tabletpc': 'tabletpc.php',
        'tabletacc': 'tabletaccessories.php',
        'tvstream': 'tvdevices-streaming.php',
        'ups': 'ups.php',
        'usb': 'usbflashdrrives.php',
        'usedproduct': 'usedproducts.php'
    };

    function loadSearchResults(searchTerm, page = 1) {
        if (searchTerm.length < 2) {
            suggestionBox.style.display = "none";
            return;
        }

        fetch(`search_endpoint.php?term=${encodeURIComponent(searchTerm)}&page=${page}`)
            .then(response => {
                if (!response.ok) throw new Error('Network error');
                return response.json();
            })
            .then(data => {
                const products = data.results;
                currentSearchPage = data.page;
                totalSearchResults = products.length > 0 ? products[0].total_results : 0;

                if (page === 1) {
                    suggestionBox.innerHTML = "";
                }

                if (products.length === 0 && page === 1) {
                    suggestionBox.style.display = "none";
                    return;
                }

                products.forEach(product => {
                    const item = document.createElement("div");
                    item.className = "suggestion-item";

                    const img = document.createElement("img");
                    img.src = `Admin/images/${product.image}`;
                    img.className = "suggestion-image";
                    img.onerror = function () {
                        this.src = 'images/default-product.png';
                    };

                    const info = document.createElement("div");
                    info.className = "suggestion-info";
                    info.innerHTML = `
                        <div class="suggestion-name">${product.name}</div>
                        <div class="suggestion-price">Rs. ${product.price}</div>
                    `;

                    item.appendChild(img);
                    item.appendChild(info);

                    item.addEventListener("click", () => {
                        const page = tableToPageMap[product.table] || 'index.php';
                        window.location.href = `${page}?search=${encodeURIComponent(product.name)}&highlight=${product.id}`;
                    });

                    suggestionBox.appendChild(item);
                });

                const totalPages = Math.ceil(totalSearchResults / data.per_page);
                if (currentSearchPage < totalPages) {
                    const loadMore = document.createElement("div");
                    loadMore.className = "load-more-results";
                    loadMore.innerHTML = `<button>Load More Results (${totalSearchResults - (currentSearchPage * data.per_page)} remaining)</button>`;
                    loadMore.addEventListener("click", () => {
                        loadSearchResults(currentSearchTerm, currentSearchPage + 1);
                    });
                    suggestionBox.appendChild(loadMore);
                }

                suggestionBox.style.display = "block";
            })
            .catch(error => {
                console.error("Search error:", error);
                suggestionBox.style.display = "none";
            });
    }

    searchBar.addEventListener("input", function () {
        currentSearchTerm = this.value.trim();
        currentSearchPage = 1;
        loadSearchResults(currentSearchTerm);
    });

    searchBar.addEventListener("keypress", function (e) {
        if (e.key === "Enter") {
            const searchTerm = this.value.trim();
            if (searchTerm.length > 0) {
                window.location.href = `index.php?search=${encodeURIComponent(searchTerm)}`;
            }
        }
    });

});

// 
// filter High To Low 
// 

document.getElementById("sortOrder").addEventListener("change", function () {
    let selectedValue = this.value;
    let url = new URL(window.location.href);

    url.searchParams.set("sort", selectedValue);

    if (!url.searchParams.has("page")) {
        url.searchParams.set("page", "1");
    }

    window.location.href = url.toString();
});

// 
// popup 
// 

function openPopup(productId) {
    console.log(`Opening popup for product ID: ${productId}`);

    document.querySelectorAll('.popup').forEach(popup => {
        popup.style.display = 'none';
    });

    const popup = document.getElementById('productPopup');
    if (popup) {
        console.log(`Popup found for product ID: ${productId}`);
        popup.style.display = 'flex';

        const productCard = document.querySelector(`.product-container[data-id="${productId}"]`);
        if (productCard) {
            const imageSrc = productCard.querySelector('.product-image').src;
            const title = productCard.querySelector('.product-title').textContent;
            const reviewStars = productCard.querySelector('.rating').textContent;
            const category = productCard.querySelector('.category').textContent;
            const code = productCard.querySelector('.code').textContent;
            const description = productCard.querySelector('.description').textContent;
            const features = Array.from(productCard.querySelectorAll('.features li')).map(li => li.textContent);
            const price = productCard.querySelector('.price').textContent;
            const oldPrice = productCard.querySelector('.old-price') ? productCard.querySelector('.old-price').textContent : '';

            document.getElementById('popupImage').src = imageSrc;
            document.getElementById('popupTitle').textContent = title;
            document.getElementById('popupReview').innerHTML = reviewStars;
            document.getElementById('popupCategory').innerHTML = `<strong>Category:</strong> ${category}`;
            document.getElementById('popupCode').innerHTML = `<strong>Code:</strong> ${code}`;
            document.getElementById('popupDescription').textContent = description;
            document.getElementById('popupFeatures').innerHTML = features.map(feature => `<li>${feature}</li>`).join('');
            document.getElementById('pop-prices').textContent = price;
            document.getElementById('pop-old-prices').innerHTML = oldPrice ? `<span class="old-price">${oldPrice}</span>` : '';

            document.querySelector('.popup .add-to-cart').setAttribute('onclick', `addToCart(${productId}, 'product')`);

        }
    } else {
        console.error(`Popup not found for product ID: ${productId}`);
        alert('Product details not found.');
    }
}

document.querySelectorAll('.product-container').forEach(productCard => {
    const productId = productCard.getAttribute('data-id');
    console.log(`Product card found with ID: ${productId}`);

    productCard.querySelector('.product-image').addEventListener('click', function (event) {
        event.preventDefault();
        openPopup(productId);
    });

    productCard.querySelector('.product-title').addEventListener('click', function (event) {
        event.preventDefault();
        openPopup(productId);
    });
});

document.getElementById('closePopup').addEventListener('click', function () {
    document.getElementById('productPopup').style.display = 'none';
});

window.addEventListener('click', function (event) {
    if (event.target === document.getElementById('productPopup')) {
        document.getElementById('productPopup').style.display = 'none';
    }
});

// 
//  add to cart 
// 

function addToCart(productId, table = 'Home') {
    var quantity = 1;
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'add_to_cart.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert(xhr.responseText);
            window.location.reload();
        }
    };
    xhr.send('table=' + encodeURIComponent(table) + '&product_id=' + encodeURIComponent(productId) + '&quantity=' + encodeURIComponent(quantity));
}
document.addEventListener("DOMContentLoaded", function () {
    const cartIcon = document.getElementById("cart1");
    const cartPopup = document.getElementById("cartPopup");
    const closeCart = document.getElementById("closeCart");
    const body = document.body;

    function toggleCartPopup() {
        if (cartPopup.style.display === "flex") {
            cartPopup.style.display = "none";
            body.style.overflow = "auto";
            body.style.paddingRight = "0";
        } else {
            cartPopup.style.display = "flex";
            body.style.overflow = "hidden";
            body.style.paddingRight = getScrollbarWidth() + "px";
        }
    }

    cartIcon.addEventListener("click", function (event) {
        event.stopPropagation();
        toggleCartPopup();
    });

    closeCart.addEventListener("click", function () {
        cartPopup.style.display = "none";
        body.style.overflow = "auto";
        body.style.paddingRight = "0";
    });

    document.addEventListener("click", function (event) {
        if (!cartPopup.contains(event.target)) {
            cartPopup.style.display = "none";
            body.style.overflow = "auto";
            body.style.paddingRight = "0";
        }
    });

    cartPopup.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    function getScrollbarWidth() {
        const outer = document.createElement("div");
        outer.style.visibility = "hidden";
        outer.style.overflow = "scroll";
        document.body.appendChild(outer);

        const inner = document.createElement("div");
        outer.appendChild(inner);

        const scrollbarWidth = outer.offsetWidth - inner.offsetWidth;
        outer.parentNode.removeChild(outer);

        return scrollbarWidth;
    }
});

// 
// navbar toggle
// 

