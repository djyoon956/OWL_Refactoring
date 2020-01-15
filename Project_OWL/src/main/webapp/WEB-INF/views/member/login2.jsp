\<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<title>Matrix Template - The Ultimate Multipurpose admin template</title>
	<!-- Custom CSS -->
	<jsp:include page="../include/headTag.jsp" />

	
</head>

<body>
	<div class="main-wrapper">
		<!-- ============================================================== -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- ============================================================== -->
		<div class="preloader">
			<div class="lds-ripple">
				<div class="lds-pos"></div>
				<div class="lds-pos"></div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Login box.scss -->
		<!-- ============================================================== -->
		<div class="auth-wrapper d-flex no-block justify-content-center align-items-center"
			style="background-color: #326295">
			<div class="login-page">
				<div class="form">
					<c:url value="/login" var="loginurl" />
					<form action="${loginurl }" method="post" class="mt-5 mb-5 login-input">
						<div class="form-group">
							<input type="email" name="email" class="form-control email" placeholder="Email"
								value="${email }">
						</div>
						<div class="form-group">
							<input type="password" name="password" class="form-control pwd" placeholder="Password"
								value="${password }">
						</div>
						<div class="form-check mb-3">
							<label class="form-check-label">
								<input type="checkbox" class="form-check-input" name="remember-me" id="remember-me">
								Remember me</label>
						</div>
						<input type="submit" class="btn login-form__btn submit w-100" value="LOGIN">
					</form>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- Login box.scss -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper scss in scafholding.scss -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper scss in scafholding.scss -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Right Sidebar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Right Sidebar -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- All Required js -->
	<!-- ============================================================== -->
</body>

</html>