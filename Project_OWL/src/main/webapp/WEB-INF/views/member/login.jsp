<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta name="google-signin-client_id"
		content="266293759218-1i2o19cvv8p80i4q4a9q94d1dner0ksg.apps.googleusercontent.com.apps.googleusercontent.com">
	<title>OWL</title>
	<jsp:include page="../include/headTag.jsp" />
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
	<link href="resources/css/member.css" rel="stylesheet">
	<script type="text/javascript" src="resources/js/member.js"></script>
	<!-- Kakao -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script type="text/javascript" src="resources/js/commonSweetAlert.js"></script>
	
	<script type="text/javascript">
		$(function () {
			initLoginController("${errorMessage}");
		})
	</script>
</head>

<body class="max">
    <div id="main-wrapper">
        <div class="text-center mt-5">
            <a href="Index.do"><img src="resources/images/owl_plz_beige.png" alt=""></a>
        </div>

        <!-- Content -->
        <div class="content-main mt-5">
            <div class="container-fluid ">
                <div class="login-form-bg">
                    <div class="container h-100">
                        <div class="row justify-content-center h-100">
                            <div class="col-xl-6">
                                <!-- Start 로그인 화면 -->
                                <div id="loginBox" class="roundBox p-4">
                                    <div class="text-center mt-4">
                                        <h4>LOGIN</h4>
                                    </div>
                                    <c:url value="/login" var="loginurl" />
                                    <form action="${loginurl }" method="post" class="mt-5 mb-5 login-input">
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-control email"
                                                placeholder="Email" value="${email }">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" class="form-control pwd"
                                                placeholder="Password" value="${password }">
                                        </div>
                                        <div class="form-check mb-3" style="padding-left: 0px;">
                                            <div class="custom-control custom-checkbox mr-sm-2">
                                                <input type="checkbox" class="custom-control-input" id="remember_me"
                                                    name="remember-me">
                                                <label class="custom-control-label" for="remember_me">Remember
                                                    me</label>
                                            </div>
                                        </div>
                                        <input type="submit" class="btn loginButton btn-block waves-effect waves-light"
                                            value="LOGIN">
                                    </form>
                                    <hr />

                                    <div class="text-center">
                                        <h5>SNS LOGIN</h5>
                                        <button id="naverLoginButton" class="snsLoginButton mt-2 mr-3"
                                            onclick="location.href='${naverUrl}'">
                                            <img src='resources/images/login/naver.png' style="width: 50px;">
                                        </button>
                                        <button id="kakaoLoginButton" class="snsLoginButton mr-3"
                                            onclick="location.href='${kakaoUrl}'">
                                            <img src='resources/images/login/kakao.png' style="width: 50px;">
                                        </button>
                                        <button id="googleLoginButton" class="snsLoginButton mr-3"
                                            onclick="location.href='${googleUrl}'">
                                            <img src='resources/images/login/google.png' style="width: 50px;">
                                        </button>
                                    </div>

                                    <div class="mt-5 login-form__footer text-center">
                                        <b class="login-form__footer">
                                            <a href="#" data-toggle="modal" data-target="#findPwdModal"
                                                class="text-secondary">Forgot password?</a>
                                        </b>
                                        <p>
                                            Don't have account? <a href="javascript:void(0);"
                                                onclick="changeView(false);" class="text-primary">Sign
                                                Up</a> now
                                        </p>
                                    </div>
                                </div>
                                <!-- End 로그인 화면 -->

                                <!-- Start 회원가입 화면 -->
                                <div id="joinBox" class="roundBox p-4 hidden">
                                    <div class="text-center mt-4">
                                        <h4>JOIN </h4>
                                    </div>
                                    <c:choose>
                                        <c:when test="${joinProjectIdx == null}">
                                            <form action="EmailConfirm.do" method="post" class="mt-4 mb-3 login-input"
                                                enctype="multipart/form-data">
                                        </c:when>
                                        <c:otherwise>
                                            <form action="EmailConfirmPass.do" method="post"
                                                class="mt-4 mb-3 login-input" enctype="multipart/form-data">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="text-center mb-3">
                                        <img id="profileImage" src="resources/images/login/profile.png"
                                            onerror="this.src='resources/images/login/profile.png'"
                                            style="width: 150px; height: 150px; cursor: pointer;" data-toggle="tooltip"
                                            data-placement="top" title="Please upload image." class="rounded-circle">
                                        <input type="file" name="multipartFile" id="multipartFile" accept="image/*"
                                            style="display: none;" onchange="previewProfile()" />

                                    </div>
                                    <div class="form-group">
                                        <input id="name" type="text" name="name" class="form-control name"
                                            placeholder="* Name">
                                        <span class="text-danger" style="display: none;">Please enter your name.</span>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-8">
                                                <input type="email" name="email" id="email" class="form-control email"
                                                    placeholder="* Email">
                                                <span class="text-danger" style="display: none;">Please enter your
                                                    email.</span>
                                            </div>
                                            <div class="col-4">
                                                <button id="duplicateBtn" type="button"
                                                    class="btn mb-1 btn-outline-primary" disabled>Duplicate
                                                    Check</button>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" class="form-control pwd"
                                            placeholder="* Password">
                                        <span class="text-danger" style="display: none;">Please enter your password at
                                            least 8.</span>
                                    </div>
                                    <input id="joinBtn" type="submit"
                                        class="btn loginButton btn-block waves-effect waves-light" value="JOIN IN">

                                    </form>
                                    <p class="mt-3 login-form__footer">
                                        Do you have account? <a href="javascript:void(0);" onclick="changeView(true);"
                                            class="text-primary">Login</a>
                                        now
                                    </p>
                                </div>
                                <!-- End 회원가입 화면 -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--  Modal  -->
    <jsp:include page="modal/forgotPassword.jsp" />
    <jsp:include page="modal/joinConfirm.jsp" />
    <jsp:include page="modal/joinOk.jsp" />

    <!--Scripts-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
</body>

</html>