<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
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
                        <a href="/"><img src="<c:url value="/assets/img/logo.png" />" alt=""></a>
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
                        <a href="#" class="search-switch"><img src="<c:url value="/assets/img/icon/search.png" />" alt=""></a>
                        <a href="/shop/cart"><img src="<c:url value="/assets/img/icon/cart.png" />" alt=""> <span id="numberCart">${numberCart}</span></a>
                        <div class="price" id="totalCart"><fmt:formatNumber value="${totalCart}" pattern="#,###"/> &#8363;</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <a href="/shop">Shop</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${products}" var="item">
                                	<tr id="product${item.key.productId}">
	                                    <td class="d-flex product__cart__item">
	                                        <div class="w-25 product__cart__item__pic">
	                                            <img class="w-100" src="<c:url value="/assets/img/product/${item.value[1][3][0]}" />" alt="">
	                                        </div>
	                                        <div class="product__cart__item__text">
	                                            <h6>${item.value[1][1]}</h6>
	                                            <h5 id="price${item.key.productId}"><fmt:formatNumber value="${item.value[1][2]}" pattern="#,###"/> &#8363;</h5>
	                                        </div>
	                                    </td>
	                                    <td class="quantity__item">
	                                        <div class="quantity">
	                                            <div class="pro-qty-2">
	                                                <input id="qty${item.key.productId}" min="1" max="${item.value[3].quantity}" onblur="changeQty('${item.key.productId}','${item.value[2]}')" type="number" value="${item.value[2]}">
	                                            </div>
	                                        </div>
	                                    </td>
	                                    <td id="sumPrice${item.key.productId}" class="cart__price"><fmt:formatNumber value="${item.value[1][2] * item.value[2]}" pattern="#,###"/> &#8363;</td>
	                                    <td class="cart__close"><i onclick="changeDelete('${item.key.productId}')" style="cursor: pointer;" class="fa fa-close"></i></td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="/shop">Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__discount">
                        <h6>Address</h6>
                        <form action="${totalCart > 0 ? '/shop/order' : '/shop'}" method="${totalCart>0?'post':'get'}">
                            <input type="text" name="address" placeholder="Address" required="required">
                            <button type="submit">Order</button>
                        </form>
                    </div>
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span><fmt:formatNumber value="${totalCart}" pattern="#,###"/> &#8363;</span></li>
                            <li>Total <span><fmt:formatNumber value="${totalCart}" pattern="#,###"/> &#8363;</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="<c:url value="/assets/img/footer-logo.png" />" alt=""></a>
                        </div>
                        <p>The customer is at the heart of our unique business model, which includes design.</p>
                        <a href="#"><img src="<c:url value="/assets/img/payment.png" />" alt=""></a>
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
                            </script>2020
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
	    function changeQty(id, qty) {
	    	location.assign("http://localhost:8080/shop/cart/update?id="+id+"&qty="+document.getElementById('qty'+id).value);  
	    }
	    function changeDelete(id) {
	    	location.assign("http://localhost:8080/shop/cart/delete?id="+id);
	    }
	    function alertUser(title, message, status){
			swal(
			  title,
			  message,
			  status
	        )
		}
    </script>
    <c:if test="${not empty order_success}">
		<script type="text/javascript">
			alertUser('Success!', 'Order success!', 'success');
		</script>
	</c:if>

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