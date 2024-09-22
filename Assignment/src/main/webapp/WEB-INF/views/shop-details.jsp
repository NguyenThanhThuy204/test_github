<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment</title>
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/assets/css/font-awesome.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/assets/css/elegant-icons.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/assets/css/magnific-popup.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/assets/css/nice-select.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/assets/css/owl.carousel.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/assets/css/slicknav.min.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />" type="text/css">
</head>
<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="/"><img src="<c:url value="/assets/img/logo.png"/> " alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li class="active"><a href="/shop">Shop</a></li>
                            <c:if test="${not empty user}">
                            	<li><a href="/account/index">${user.fullname}</a></li>
                            </c:if>
                            <c:if test="${user.admin}">
                            	<li><a href="/admin/product">Admin</a></li>
                            </c:if>
                            <c:if test="${empty user}">
                            	<li><a href="/sign-in">Login</a></li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="<c:url value="/assets/img/icon/search.png"/> " alt=""></a>
                        <a href="/shop/cart"><img src="<c:url value="/assets/img/icon/cart.png"/> " alt=""> <span>${numberCart}</span></a>
                        <div class="price"><fmt:formatNumber value="${totalCart}" pattern="#,###"/> &#8363;</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="/">Home</a>
                            <a href="/shop">Shop</a>
                            <span>Product Details</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                        	<c:forEach items="${detailProduct[3]}" var="item">
                        		<li class="nav-item">
	                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
	                                    <div class="product__thumb__pic set-bg" data-setbg="<c:url value="/assets/img/product/${item}"/> ">
	                                    </div>
	                                </a>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content h-100">
                            <div class="tab-pane active h-100" id="tabs-1" role="tabpanel">
                                <div class="product__details__pic__item h-100">
                                    <img class="h-100" src="<c:url value="/assets/img/product/${detailProduct[3][0]}"/> " alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4>${detailProduct[1]}</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div>
                            <h3><fmt:formatNumber value="${detailProduct[2]}" pattern="#,###"/> &#8363;</h3>
                            <div class="product__details__cart__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input id="quantity" type="number" value="1" min="1" max="${detailProduct[5]}">
                                    </div>
                                </div>
                                <div style="cursor: pointer;" onclick="addToCart(${detailProduct[0]})" class="primary-btn">add to cart</div>
                            </div>
                            <div class="product__details__btns__option">
                                <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                                <a href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
                            </div>
                            <div class="product__details__last__option">
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="<c:url value="/assets/img/shop-details/details-payment.png"/> " alt="">
                                <ul>
                                    <li><span>SKU:</span> ${detailProduct[0]}</li>
                                    <li><span>Categories:</span> ${detailProduct[4].name}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
                <c:forEach items="${relatedProducts}" var="item">
                	<div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" onclick="detail(${item.key})" data-setbg="<c:url value="/assets/img/product/${item.value[3][1]}"/> ">
	                            <ul class="product__hover">
	                                <li><a href="#"><img src="<c:url value="/assets/img/icon/heart.png"/> " alt=""></a></li>
	                                <li><a href="#"><img src="<c:url value="/assets/img/icon/compare.png"/> " alt=""> <span>Compare</span></a></li>
	                                <li><a href="#"><img src="<c:url value="/assets/img/icon/search.png"/> " alt=""></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6>${item.value[0]}</h6>
	                            <div onclick="addToCartOne(${item.key})" class="add-cart">+ Add To Cart</div>
	                            <div class="rating">
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                                <i class="fa fa-star-o"></i>
	                            </div>
	                            <h5><fmt:formatNumber value="${item.value[1]}" pattern="#,###"/> &#8363;</h5>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="<c:url value="/assets/img/footer-logo.png"/> " alt=""></a>
                        </div>
                        <p>The customer is at the heart of our unique business model, which includes design.</p>
                        <a href="#"><img src="<c:url value="/assets/img/payment.png"/> " alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="#">Clothing Store</a></li>
                            <li><a href="#">Trending Shoes</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Sale</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Payment Methods</a></li>
                            <li><a href="#">Delivary</a></li>
                            <li><a href="#">Return & Exchanges</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>NewLetter</h6>
                        <div class="footer__newslatter">
                            <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                            <form action="#">
                                <input type="text" placeholder="Your email">
                                <button type="submit"><span class="icon_mail_alt"></span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="footer__copyright__text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <p>Copyright ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>
                            All rights reserved | This template is made with <i class="fa fa-heart-o"
                            aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        </p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->
    
    <script type="text/javascript">
	    function detail(id) {
	    	location.assign("http://localhost:8080/shop/detail/"+id);
		}
		
	    async function addToCart(id) {
    	  	if(${not empty user}){
    	  		const response = await fetch("http://localhost:8080/shop/cart/add?id="+id+"&qty="+document.getElementById("quantity").value);
			}
		    else {
	    	  location.assign("http://localhost:8080/sign-in");
			}
      	}

	    async function addToCartOne(id) {
	    	if(${not empty user}){
	    	  const response = await fetch("http://localhost:8080/shop/cart/add?id="+id+"&qty=1");
			}
		    else {
	    	  location.assign("http://localhost:8080/sign-in");
			}
  		}
    </script>

    <!-- Js Plugins -->
    <script src="<c:url value="/assets/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/assets/js/bootstrap.min.js"/> "></script>
    <script src="<c:url value="/assets/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/assets/js/jquery.magnific-popup.min.js"/> "></script>
    <script src="<c:url value="/assets/js/jquery.countdown.min.js"/> "></script>
    <script src="<c:url value="/assets/js/jquery.slicknav.js"/> "></script>
    <script src="<c:url value="/assets/js/mixitup.min.js"/> "></script>
    <script src="<c:url value="/assets/js/owl.carousel.min.js"/> "></script>
    <script src="<c:url value="/assets/js/main.js"/> "></script>
</body>
</html>