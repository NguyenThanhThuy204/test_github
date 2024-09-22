<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
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
		<div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" style="background-image: url(assets/media/illustrations/sketchy-1/14.png">
			<div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
				<a href="/" class="mb-12">
					<img alt="Logo" src="/assets/img/logo.png" class="h-40px" />
				</a>
				<div class="w-lg-600px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
					<form:form modelAttribute="account" class="form w-100" novalidate="novalidate" id="kt_sign_up_form" action="/sign-up" method="post">
						<div class="mb-10 text-center">
							<h1 class="text-dark mb-3">Create an Account</h1>
							<div class="text-gray-400 fw-bold fs-4">Already have an account?
							<a href="/sign-in" class="link-primary fw-bolder">Sign in here</a></div>
						</div>
						<button type="button" class="btn btn-light-primary fw-bolder w-100 mb-10">
							<img alt="Logo" src="/assets/img/icon/google-icon.svg" class="h-20px me-3" />
							Sign in with Google
						</button>
						<div class="d-flex align-items-center mb-10">
							<div class="border-bottom border-gray-300 mw-50 w-100"></div>
							<span class="fw-bold text-gray-400 fs-7 mx-2">OR</span>
							<div class="border-bottom border-gray-300 mw-50 w-100"></div>
						</div>
						<div class="row fv-row mb-7">
							<label class="form-label fw-bolder text-dark fs-6">Username</label>
							<form:input path="username" class="form-control form-control-lg form-control-solid" type="text" />
							<form:errors path="username" class="form-text text-danger" />
							<c:if test="${not empty error_signup_username}">
								<div class="form-text text-danger" >${error_signup_username}</div>
							</c:if>
						</div>
						<div class="fv-row mb-7">
							<label class="form-label fw-bolder text-dark fs-6">Email</label>
							<form:input path="email" class="form-control form-control-lg form-control-solid" type="email" placeholder="" />
							<form:errors path="email" class="form-text text-danger" />
						</div>
						<div class="mb-10 fv-row" data-kt-password-meter="true">
							<div class="mb-1">
								<label class="form-label fw-bolder text-dark fs-6">Password</label>
								<div class="position-relative mb-3">
									<form:input path="password" class="form-control form-control-lg form-control-solid" type="password" placeholder=""/>
									<form:errors path="password" class="form-text text-danger" />
								</div>
							</div>
						</div>
						<div class="fv-row mb-5">
							<label class="form-label fw-bolder text-dark fs-6">Confirm Password</label>
							<input class="form-control form-control-lg form-control-solid" type="password" placeholder="" name="confirm" autocomplete="off" />
							<c:if test="${not empty error_signup_confirm}">
								<div class="form-text text-danger" >${error_signup_confirm}</div>
							</c:if>
						</div>
						<div class="text-center">
							<button type="submit" id="kt_sign_up_submit" class="btn btn-lg btn-primary">
								<span class="indicator-label">Sign Up</span>
							</button>
						</div>
					</form:form>
				</div>
			</div>
			<div class="d-flex flex-center flex-column-auto p-10">
				<!--begin::Links-->
				<div class="d-flex align-items-center fw-bold fs-6">
					<a href="https://keenthemes.com" class="text-muted text-hover-primary px-2">About</a>
					<a href="mailto:support@keenthemes.com" class="text-muted text-hover-primary px-2">Contact</a>
					<a href="https://1.envato.market/EA4JP" class="text-muted text-hover-primary px-2">Contact Us</a>
				</div>
			</div>
		</div>
	</div>
	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
	<script src="/assets/js/general.js"></script>
</body>
</html>