// 
// slider / megamenu
// 

document.addEventListener('DOMContentLoaded', function () {
    const slider = document.querySelector('.slider .list');
    const items = document.querySelectorAll('.slider .list .item');
    const next = document.getElementById('next');
    const prev = document.getElementById('prev');
    const dots = document.querySelectorAll('.slider .dots li');
    const dropdown = document.querySelector('.dropdown');

    let lengthItems = items.length - 1;
    let active = 0;
    let refreshInterval;
    let isMenuOpen = false;

    function setupMegaMenu() {
        document.querySelectorAll('.dropdown > a').forEach(trigger => {
            trigger.addEventListener('click', function (e) {
                e.preventDefault();
                const dropdown = this.parentElement;
                isMenuOpen = !dropdown.classList.contains('active');

                dropdown.classList.toggle('active', isMenuOpen);

                if (isMenuOpen) {
                    stopSlider();
                } else {
                    startSlider();
                }
            });
        });

        document.addEventListener('click', function (e) {
            if (!e.target.closest('.dropdown')) {
                document.querySelectorAll('.dropdown').forEach(d => {
                    d.classList.remove('active');
                });
                if (isMenuOpen) {
                    isMenuOpen = false;
                    startSlider();
                }
            }
        });
    }

    function setupSlider() {
        reloadSlider();

        startSlider();

        next.addEventListener('click', function () {
            if (isMenuOpen) return;
            active = active + 1 <= lengthItems ? active + 1 : 0;
            reloadSlider();
        });

        prev.addEventListener('click', function () {
            if (isMenuOpen) return;
            active = active - 1 >= 0 ? active - 1 : lengthItems;
            reloadSlider();
        });

        dots.forEach((li, key) => {
            li.addEventListener('click', () => {
                if (isMenuOpen) return;
                active = key;
                reloadSlider();
            });
        });

        window.addEventListener('resize', reloadSlider);
    }

    function startSlider() {
        if (isMenuOpen) return;
        stopSlider();
        refreshInterval = setInterval(() => {
            if (!isMenuOpen) {
                active = active + 1 <= lengthItems ? active + 1 : 0;
                reloadSlider();
            }
        }, 3000);
    }

    function stopSlider() {
        clearInterval(refreshInterval);
    }

    function reloadSlider() {
        slider.style.left = -items[active].offsetLeft + 'px';

        const activeDot = document.querySelector('.slider .dots li.active');
        if (activeDot) activeDot.classList.remove('active');
        dots[active]?.classList.add('active');

        if (!isMenuOpen) startSlider();
    }

    setupMegaMenu();
    setupSlider();
});

// 
//  Searchbar 
//   

document.addEventListener("DOMContentLoaded", function () {
    const searchBar = document.getElementById("searchbar");
    const suggestionBox = document.getElementById("suggestion-box");

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

    searchBar.addEventListener("input", function () {
        const searchTerm = this.value.trim();
        if (searchTerm.length < 2) {
            suggestionBox.style.display = "none";
            return;
        }

        fetch(`search_endpoint.php?term=${encodeURIComponent(searchTerm)}`)
            .then(response => {
                if (!response.ok) throw new Error('Network error');
                return response.json();
            })
            .then(products => {
                suggestionBox.innerHTML = "";

                if (products.length === 0) {
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

                suggestionBox.style.display = "block";
            })
            .catch(error => {
                console.error("Search error:", error);
                suggestionBox.style.display = "none";
            });
    });

    document.addEventListener("click", function (e) {
        if (!searchBar.contains(e.target) && !suggestionBox.contains(e.target)) {
            suggestionBox.style.display = "none";
        }
    });

    searchBar.addEventListener("keypress", function (e) {
        if (e.key === "Enter") {
            const searchTerm = this.value.trim();
            if (searchTerm.length > 0) {
                window.location.href = `index.php?search=${encodeURIComponent(searchTerm)}`;
            }
        }
    });

    const urlParams = new URLSearchParams(window.location.search);
    const highlightId = urlParams.get('highlight');
    if (highlightId) {
        setTimeout(() => {
            const productElement = document.querySelector(`.product-container[data-id="${highlightId}"]`);
            if (productElement) {
                productElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'center'
                });
                productElement.style.animation = "highlight 2s";

                const style = document.createElement('style');
                style.innerHTML = `
                    @keyframes highlight {
                        0% { background-color: rgba(255, 255, 0, 0.5); }
                        100% { background-color: transparent; }
                    }
                `;
                document.head.appendChild(style);
            }
        }, 500);
    }
});

// 
// popup
// 

document.addEventListener('DOMContentLoaded', function () {
    const closePopupButton = document.getElementById('closePopup');
    const popup = document.getElementById('productPopup');

    if (closePopupButton && popup) {
        closePopupButton.addEventListener('click', function () {
            popup.style.display = 'none';
        });

        window.addEventListener('click', function (event) {
            if (event.target === popup) {
                popup.style.display = 'none';
            }
        });
    }
});


document.addEventListener("DOMContentLoaded", function () {
    function setupPopupHandlers() {
        var popup = document.getElementById("productPopup2");
        if (!popup) {
            console.warn("Popup not found: productPopup2");
            return;
        }

        var closeBtn = popup.querySelector(".close-popup");

        if (!closeBtn) {
            console.warn("Close button not found inside: productPopup2");
            return;
        }

        closeBtn.addEventListener("click", function () {
            popup.style.display = "none";
        });

        popup.addEventListener("click", function (event) {
            if (event.target === popup) {
                popup.style.display = "none";
            }
        });

        console.log("Popup handlers set for productPopup2");
    }

    setTimeout(setupPopupHandlers, 200);
});

// 
// add to cart 
// 

document.addEventListener("DOMContentLoaded", function () {
    const cartIcon = document.getElementById("cart1");
    const cartPopup = document.getElementById("cartPopup");
    const closeCart = document.getElementById("closeCart");
    const body = document.body;

    let isCartOpen = false;

    function toggleCartPopup() {
        if (cartPopup.style.display === "flex") {
            cartPopup.style.display = "none";
            body.style.overflow = "auto";
            body.style.paddingRight = "0";
            isCartOpen = false;

            startSliderInterval();
        } else {
            cartPopup.style.display = "flex";
            body.style.overflow = "hidden";
            body.style.paddingRight = getScrollbarWidth() + "px";
            isCartOpen = true;

            stopSliderInterval();
        }
        console.log("Popup display:", cartPopup.style.display);
    }

    if (cartIcon) {
        cartIcon.addEventListener("click", function (event) {
            event.stopPropagation();
            toggleCartPopup();
        });
    }

    if (closeCart) {
        closeCart.addEventListener("click", function () {
            cartPopup.style.display = "none";
            body.style.overflow = "auto";
            body.style.paddingRight = "0";
            isCartOpen = false;

            startSliderInterval();
        });
    }

    document.addEventListener("click", function (event) {
        if (isCartOpen && !cartPopup.contains(event.target)) {
            cartPopup.style.display = "none";
            body.style.overflow = "auto";
            body.style.paddingRight = "0";
            isCartOpen = false;

            startSliderInterval();
        }
    });

    if (cartPopup) {
        cartPopup.addEventListener("click", function (event) {
            event.stopPropagation();
        });
    }

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

function addToCart(productId, table = 'Home') {
    var quantity = 1;
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'add_to_cart.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert(xhr.responseText);
            window.location.href = 'index.php';
        }
    };

    xhr.send('table=' + encodeURIComponent(table) + '&product_id=' + encodeURIComponent(productId) + '&quantity=' + encodeURIComponent(quantity));
}

//
// faqs
// 

document.addEventListener("DOMContentLoaded", function () {
    const faqQuestions = document.querySelectorAll(".faq-question");

    faqQuestions.forEach((question, index) => {
        const answer = question.nextElementSibling;

        if (index === 0) {
            question.classList.add("active");
            answer.style.display = "block";
        }

        question.addEventListener("click", function () {
            this.classList.toggle("active");

            if (answer.style.display === "block") {
                answer.style.display = "none";
            } else {
                answer.style.display = "block";
            }
        });
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
// navbar toggle
// 

