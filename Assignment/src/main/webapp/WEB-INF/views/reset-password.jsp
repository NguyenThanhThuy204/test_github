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
		<div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" style="background-image: url(assets/media/illustrations/sketchy-1/14.png">
			<div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
				<a href="/" class="mb-12">
					<img alt="Logo" src="/assets/img/logo.png" class="h-40px" />
				</a>
				<div class="w-lg-550px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
					<form class="form w-100" novalidate="novalidate" id="kt_new_password_form" action="/reset-password/${username}" method="post">
						<div class="text-center mb-10">
							<h1 class="text-dark mb-3">Setup New Password</h1>
							<div class="text-gray-400 fw-bold fs-4">Already have reset your password ?
							<a href="/sign-in" class="link-primary fw-bolder">Sign in here</a></div>
						</div>
						<div class="mb-10 fv-row" data-kt-password-meter="true">
							<div class="mb-1">
								<label class="form-label fw-bolder text-dark fs-6">Password</label>
								<div class="position-relative mb-3">
									<input class="form-control form-control-lg form-control-solid" type="password" placeholder="" name="password" autocomplete="off" />
									<c:if test="${not empty error_resetPassword_password}">
										<div class="form-text text-danger" >${error_resetPassword_password}</div>
									</c:if>
								</div>
							</div>
						</div>
						<div class="fv-row mb-10">
							<label class="form-label fw-bolder text-dark fs-6">Confirm Password</label>
							<input class="form-control form-control-lg form-control-solid" type="password" placeholder="" name="confirm" autocomplete="off" />
							<c:if test="${not empty error_resetPassword_confirm}">
								<div class="form-text text-danger" >${error_resetPassword_confirm}</div>
							</c:if>
							<c:if test="${not empty success_resetPassword}">
								<div class="form-text text-success" >${success_resetPassword}</div>
							</c:if>
						</div>
						<div class="text-center">
							<button type="submit" id="kt_new_password_submit" class="btn btn-lg btn-primary fw-bolder">
								<span class="indicator-label">Submit</span>
							</button>
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
	<script src="/assets/js/plugins.bundle.js"></script>
	<script src="/assets/js/scripts.bundle.js"></script>
</body>
</html>