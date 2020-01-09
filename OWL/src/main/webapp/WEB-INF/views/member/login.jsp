<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>OWL</title>
	<jsp:include page="../include/headTag.jsp" />
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">

	<!-- Kakao -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="resources/js/commonSweetAlert.js"></script>
	<style type="text/css">
		.snsLoginButton {
			background-color: transparent;
			border: none;
			width: 50px;
			height: 50px;
			cursor: pointer;
		}

		.vertical-center {
			min-height: 100%;
			min-height: 100vh;
			display: flex;
			align-items: center;
		}
		
		body{
background-color:#326295;
}
	</style>
	<script type="text/javascript">
		Kakao.init("5d151c02cc241d9ba7a8373a8051d79d");
		//https://kauth.kakao.com/oauth/authorize?client_id=5d151c02cc241d9ba7a8373a8051d79d&redirect_uri=http://localhost:8090/OWL/kakaoLogin
		function loginWithKakao() {
			// 로그인 창을 띄웁니다.
			Kakao.Auth.login({
				success: function (authObj) {
					alert("success" + JSON.stringify(authObj));
				},
				fail: function (err) {
					alert("error" + JSON.stringify(err));
				}
			});
		};

		$(function () {
			$("#sendPwd").click(function () {
				$.ajax({
					url: "ForgotPassword.do",
					data: {
						email: $("#email").val()
					},
					success: function (data) {
						if (data.result) {
							successAlert(data.message);
							$("#findPwdModal").modal("hide");
						} else {
							warningAlert(data.message);
						}
					},
					error: function () {
						errorAlert("메일발송에 실패했습니다.");
					}
				})
			})

			$("#profileImage").click(function () {
				$("#profileFile").click();
			})

			$("#profileFile").change(function () {
				console.log("chagne");
				let file = document.querySelector('input[type=file]').files[0];
				let reader = new FileReader();

				reader.onloadend = function () {
					$("#profileImage").attr("src", reader.result)
				}

				if (file) {
					reader.readAsDataURL(file);
				} else {
					preview.src = "resources/images/login/profile.png";
				}
			})
			
			$("#joinBox  .name").keyup(function (event) {
				if ($("#joinBox  .name").val().length < 1)
					$("#joinBox  .name").siblings(".text-danger").css("display", "block");
				else
					$("#joinBox  .name").siblings(".text-danger").css("display", "none");
			})
			$("#joinBox  .email").keyup(function (event) {
				let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if ($("#joinBox  .email").val().match(regExp) != null)
					$("#joinBox  .email").siblings(".text-danger").css("display", "none");
				else
					$("#joinBox  .email").siblings(".text-danger").css("display", "block");
			})
			$("#joinBox  .pwd").keyup(function (event) {
				if ($("#joinBox  .pwd").val().length < 8)
					$("#joinBox  .pwd").siblings(".text-danger").css("display", "block");
				else
					$("#joinBox  .pwd").siblings(".text-danger").css("display", "none");
			})

			openDialog();
		})

		function openDialog() {
			let type = "${show}";
			if (!type) return;
			else if (type === "joinEmail") $("#opneJoinEmailModal").click();
			else if (type === "joinOk") {
				$('#joinOkModal').modal({
					backdrop: 'static',
					keyboard: false
				})
				$("#opneJoinOkModal").click();
			}
		}

		function changeView(isLogin){
			// 로그인 화면 요청
			if(isLogin){
				$("#loginBox").removeClass("hidden");
				$("#joinBox").addClass("hidden");
			}
			// 회원가입 화면 요청
			else{
				$("#joinBox").removeClass("hidden");
				$("#loginBox").addClass("hidden");
			}
		}
	</script>
</head>

<body>
	<!-- ProgressBar -->
	<!--    
   <div id="preloader">
      <div class="loader">
         <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
               stroke-width="3" stroke-miterlimit="10" />
            </svg>
      </div>
   </div> -->


	<div id="main-wrapper">

		<!-- Top -->
		<div class="header-row" style="background-color: #fcf9f5">
			<div class="header-content clearfix">

				<div class="header-left">

					<div class="nav-header" style="padding-left: 200px;background-color: #fcf9f5">

						<a href="Index.do">
							<!--    <b class="logo-abbr"><img src="resources/images/logo.png" alt="">   </b> -->
							<img src="resources/images/owl_logo_real.png" alt="">

						</a>

					</div>
				</div>

				<div class="header-right">
					<ul class="clearfix">

						<li class="icons dropdown d-none d-md-flex"><a href="#" data-toggle="modal"
								data-target="#loginModal">
								<button type="button" id="loginBtn" class="btn mb-1 btn-primary">Login / Register</button>
							</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- Content -->
		<div class="content-main vertical-center">
			<div class="container-fluid ">
				<div class="login-form-bg  ">
					<div class="container h-100">
						<div class="row justify-content-center h-100">
							<div class="col-xl-6">
								<div class="form-input-content">
									<div class="card mb-0">
										<!-- 로그인 화면 -->
										<div id="loginBox">
											<div class="card-body pt-5">
												<a class="text-center" href="Index.do">
													<h4> LOGIN </h4>
												</a>

												<form action="Login.do" method="post" class="mt-5 mb-5 login-input">
													<div class="form-group">
														<input type="email" name="email" class="form-control email"
															placeholder="Email">
													</div>
													<div class="form-group">
														<input type="password" name="pwd" class="form-control pwd"
															placeholder="Password">
													</div>
													<input type="submit" class="btn login-form__btn submit w-100"
														value="LOGIN">
												</form>

												<hr />

												<div class="text-center">
													<h5>SNS LOGIN </h5>
													<button id="naverLoginButton" class="snsLoginButton mt-2 mr-3"
														onclick="location.href='https://nid.naver.com/oauth2.0/authorize?client_id=zlKEJHqR7YB9riY5pP5l&redirect_uri=http://localhost:8090/OWL/naverLogin.do&response_type=code'">
														<img src='resources/images/login/naver.png'
															style="width: 50px;">
													</button>
													<button id="kakaoLoginButton" class="snsLoginButton mr-3"
														onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=5d151c02cc241d9ba7a8373a8051d79d&redirect_uri=http://localhost:8090/OWL/kakaoLogin.do&response_type=code'">
														<img src='resources/images/login/kakao.png'
															style="width: 50px;">
													</button>
													<button id="googleLoginButton" class="snsLoginButton mr-3">
														<img src='resources/images/login/google.png'
															style="width: 50px;">
													</button>
												</div>

												<div class="mt-5 login-form__footer mt-5 text-center">
													<b class="login-form__footer"> <a href="#" data-toggle="modal" data-target="#findPwdModal" class="text-secondary">Forgot password?</a></b>
													<p>Don't have account?  <a href="javascript:void(0);" onclick="changeView(false);" class="text-primary">Sign Up</a> now </p>
												</div>

											</div>
										</div>
										
										<!-- 회원가입 화면 -->
										<div id="joinBox" class="hidden">
											<div class="card-body pt-5">
												<a class="text-center" href="Index.do">
													<h4> JOIN </h4>
												</a>

												<form action="Login.do" method="post" class="mt-5 mb-5 login-input">
													<div class="text-center mb-4">
														<img id="profileImage" src="resources/images/login/profile.png"
															style="width:150px; height:150px; cursor: pointer;"
															data-toggle="tooltip" data-placement="top"
															title="Please upload image.">
														<input type="file" id="profileFile" accept="image/*"
															style="display: none;" onchange="previewProfile()" />
													</div>
													<div class="form-group">
														<input type="text" name="name" class="form-control name"
															placeholder="Name">
														<span class="text-danger" style="display: none;">Please enter
															your name.</span>
													</div>
													<div class="form-group">
														<input type="email" name="email" class="form-control email"
															placeholder="Email">
														<span class="text-danger" style="display: none;">Please enter
															your email.</span>
													</div>
													<div class="form-group">
														<input type="password" name="pwd"
															class="form-control pwd" placeholder="Password">
														<span class="text-danger" style="display: none;">Please enter
															your password at least 8.</span>
													</div>
													<input type="submit" class="btn login-form__btn submit w-100"
														value="JOIN IN">
												</form>
												<p class="mt-5 login-form__footer">Don you have account? <a href="javascript:void(0);" onclick="changeView(true);"
														class="text-primary">Login</a> now</p>
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

		<!-- Bottom -->
		<jsp:include page="../include/bottom.jsp" />
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