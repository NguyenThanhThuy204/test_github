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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">
    
	<link href="/assets/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
	<link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />

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
                        <h4>Profile</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>Profile</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad p-0">
        <div class="container">
            <div class="row">
                <div class="d-flex flex-column flex-root">
					<div class="page d-flex flex-row flex-column-fluid">
						<div class="d-flex flex-column flex-row-fluid" id="kt_wrapper">
							<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
								<div class="post d-flex flex-column-fluid" id="kt_post">
									<div id="kt_content_container" class="container">
										<div class="card mb-5 mb-xl-10">
											<div class="card-body pt-9 pb-0">
												<div class="d-flex flex-wrap flex-sm-nowrap mb-3">
													<div class="me-7 mb-4">
														<div class="symbol symbol-100px symbol-lg-160px symbol-fixed position-relative">
															<img src="/assets/img/avatars/${user.photo}" alt="image" />
															<div class="position-absolute translate-middle bottom-0 start-100 mb-6 bg-success rounded-circle border border-4 border-white h-20px w-20px"></div>
														</div>
													</div>
													<div class="flex-grow-1">
														<div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
															<div class="d-flex flex-column">
																<div class="d-flex align-items-center mb-2">
																	<a href="#" class="text-gray-900 text-hover-primary fs-2 fw-bolder me-1">${user.fullname}</a>
																	<a href="#">
																		<span class="svg-icon svg-icon-1 svg-icon-primary">
																			<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24">
																				<path d="M10.0813 3.7242C10.8849 2.16438 13.1151 2.16438 13.9187 3.7242V3.7242C14.4016 4.66147 15.4909 5.1127 16.4951 4.79139V4.79139C18.1663 4.25668 19.7433 5.83365 19.2086 7.50485V7.50485C18.8873 8.50905 19.3385 9.59842 20.2758 10.0813V10.0813C21.8356 10.8849 21.8356 13.1151 20.2758 13.9187V13.9187C19.3385 14.4016 18.8873 15.491 19.2086 16.4951V16.4951C19.7433 18.1663 18.1663 19.7433 16.4951 19.2086V19.2086C15.491 18.8873 14.4016 19.3385 13.9187 20.2758V20.2758C13.1151 21.8356 10.8849 21.8356 10.0813 20.2758V20.2758C9.59842 19.3385 8.50905 18.8873 7.50485 19.2086V19.2086C5.83365 19.7433 4.25668 18.1663 4.79139 16.4951V16.4951C5.1127 15.491 4.66147 14.4016 3.7242 13.9187V13.9187C2.16438 13.1151 2.16438 10.8849 3.7242 10.0813V10.0813C4.66147 9.59842 5.1127 8.50905 4.79139 7.50485V7.50485C4.25668 5.83365 5.83365 4.25668 7.50485 4.79139V4.79139C8.50905 5.1127 9.59842 4.66147 10.0813 3.7242V3.7242Z" fill="#00A3FF" />
																				<path class="permanent" d="M14.8563 9.1903C15.0606 8.94984 15.3771 8.9385 15.6175 9.14289C15.858 9.34728 15.8229 9.66433 15.6185 9.9048L11.863 14.6558C11.6554 14.9001 11.2876 14.9258 11.048 14.7128L8.47656 12.4271C8.24068 12.2174 8.21944 11.8563 8.42911 11.6204C8.63877 11.3845 8.99996 11.3633 9.23583 11.5729L11.3706 13.4705L14.8563 9.1903Z" fill="white" />
																			</svg>
																		</span>
																	</a>
																</div>
																<div class="d-flex flex-wrap fw-bold fs-6 mb-4 pe-2">
																	<a href="/account/logout" class="d-flex align-items-center text-danger me-5 mb-2">
																		<i class="text-danger bi bi-door-open me-3"></i> Đăng xuất 
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="card mb-5 mb-xl-10" id="kt_profile_details_view">
											<div class="card-header cursor-pointer">
												<div class="card-title m-0">
													<h3 class="fw-bolder m-0">Profile Details</h3>
												</div>
											</div>
											<div class="card-body p-9">
												<div class="row mb-7">
													<label class="col-lg-4 fw-bold text-muted">Full Name</label>
													<div class="col-lg-8">
														<span class="fw-bolder fs-6 text-gray-800">${user.fullname}</span>
													</div>
												</div>
												<div class="row mb-7">
													<label class="col-lg-4 fw-bold text-muted">Contact Email</label>
													<div class="col-lg-8 d-flex align-items-center">
														<span class="fw-bolder fs-6 text-gray-800 me-2">${user.email}</span>
													</div>
												</div>
												<div class="row mb-7">
													<label class="col-lg-4 fw-bold text-muted">Change Password </label>
													<div class="col-lg-8 d-flex align-items-center">
														<a href="#" data-bs-toggle="modal" data-bs-target="#userModal"><i class="bi bi-pencil-square"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
    
    <div class="modal"  id="userModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title ">Change Password</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="/account/change-password" method="post">
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label d-flex">Old Password<span class="ms-3 form-text text-danger">*</span></label>
			    <input name="oldPass" type="password" class="form-control" required="required"/>
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label d-flex">New Password<span class="ms-3 form-text text-danger">*</span></label>
			    <input name="newPass" type="password" class="form-control" required="required"/>
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputEmail1" class="form-label d-flex">Confirm New Password<span class="ms-3 form-text text-danger">*</span></label>
			    <input name="confirm-newPass" type="password" class="form-control" required="required"/>
			  </div>
			  <button type="submit" class="btn btn-primary float-end">Submit</button>
			</form>
	      </div>
	    </div>
	  </div>
	</div>	
    
    <script type="text/javascript">
	    function alertUser(title, message, status){
			swal(
			  title,
			  message,
			  status
	        )
		}
    </script>
    <c:if test="${not empty success_changePassword}">
		<script type="text/javascript">
			alertUser('Success!', '${success_changePassword}', 'success');
		</script>
	</c:if>
	<c:if test="${not empty error_changePassword}">
		<script type="text/javascript">
			alertUser('Error!', '${error_changePassword}', 'error');
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
	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
    <script src="/assets/js/widgets.js"></script>
	<script src="/assets/js/chat.js"></script>
	<script src="/assets/js/create-app.js"></script>
	<script src="/assets/js/upgrade-plan.js"></script>
</body>
</html>