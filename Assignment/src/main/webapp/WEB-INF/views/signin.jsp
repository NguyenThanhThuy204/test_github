<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
	<!--begin::Fonts-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
	<!--end::Fonts-->
	<!--begin::Global Stylesheets Bundle(used by all pages)-->
	<link href="/assets/css/plugins.bundle.css" rel="stylesheet" type="text/css" />
	<link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
	<!--end::Global Stylesheets Bundle-->
</head>
<body>
	<div class="d-flex flex-column flex-root">
		<div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" style="background-image: url(assets/img/icon/etchy-1/14.png">
			<div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
				<a href="/" class="mb-12">
					<img alt="Logo" src="/assets/img/logo.png" class="h-40px" />
				</a>
				<div class="w-lg-500px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
					<form class="form w-100" novalidate="novalidate" id="kt_sign_in_form" action="/sign-in" method="post">
						<div class="text-center mb-10">
							<h1 class="text-dark mb-3">Sign In to Female fashion</h1>
							<div class="text-gray-400 fw-bold fs-4">New Here?
							<a href="/sign-up" class="link-primary fw-bolder">Create an Account</a></div>
						</div>
						<div class="fv-row mb-10">
							<label class="form-label fs-6 fw-bolder text-dark">Username</label>
							<input class="form-control form-control-lg form-control-solid" type="text" name="username" value="${username}" autocomplete="off" required="required"/>
							<c:if test="${not empty error_signin_username}">
								<div class="form-text text-danger" >${error_signin_username}</div>
							</c:if>
						</div>
						<div class="fv-row mb-10">
							<div class="d-flex flex-stack mb-2">
								<label class="form-label fw-bolder text-dark fs-6 mb-0">Password</label>
								<a href="/forgot-password" class="link-primary fs-6 fw-bolder">Forgot Password ?</a>
							</div>
							<input class="form-control form-control-lg form-control-solid" type="password" name="password" autocomplete="off" required="required"/>
							<c:if test="${not empty error_signin_password}">
								<div class="form-text text-danger" >${error_signin_password}</div>
							</c:if>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-lg btn-primary w-100 mb-5">
								<span class="indicator-label">Continue</span>
							</button>
							<div class="text-center text-muted text-uppercase fw-bolder mb-5">or</div>
							<a href="#" class="btn btn-flex flex-center btn-light btn-lg w-100 mb-5">
							<img alt="Logo" src="/assets/img/icon/google-icon.svg" class="h-20px me-3" />Continue with Google</a>
							<a href="#" class="btn btn-flex flex-center btn-light btn-lg w-100 mb-5">
							<img alt="Logo" src="/assets/img/icon/facebook-4.svg" class="h-20px me-3" />Continue with Facebook</a>
							<a href="#" class="btn btn-flex flex-center btn-light btn-lg w-100">
							<img alt="Logo" src="/assets/img/icon/apple-black.svg" class="h-20px me-3" />Continue with Apple</a>
						</div>
					</form>
				</div>
			</div>
			<div class="d-flex flex-center flex-column-auto p-10">
				<div class="d-flex align-items-center fw-bold fs-6">
					<a href="https://keenthemes.com" class="text-muted text-hover-primary px-2">About</a>
					<a href="mailto:support@keenthemes.com" class="text-muted text-hover-primary px-2">Contact</a>
					<a href="https://1.envato.market/EA4JP" class="text-muted text-hover-primary px-2">Contact Us</a>
				</div>
			</div>
		</div>
	</div>
	<script src="/assets/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script src="/assets/js/general.js"></script>
</body>
</html>