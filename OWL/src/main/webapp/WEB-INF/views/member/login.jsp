<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>OWL</title>
<jsp:include page="../include/headTag.jsp" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon.png">

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

body {
	background-color: #326295;
	overflow-y: hidden;
}
</style>
<script type="text/javascript">
	Kakao.init("5d151c02cc241d9ba7a8373a8051d79d");
	//https://kauth.kakao.com/oauth/authorize?client_id=5d151c02cc241d9ba7a8373a8051d79d&redirect_uri=http://localhost:8090/OWL/kakaoLogin
	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success : function(authObj) {
				alert("success" + JSON.stringify(authObj));
			},
			fail : function(err) {
				alert("error" + JSON.stringify(err));
			}
		});
	};

	$(function() {


		$("#sendPwd").click(function() {
			$.ajax({
				url : "ForgotPassword.do",
				data : {
					email : $("#email").val()
				},
				success : function(data) {
					if (data.result) {
						successAlert(data.message);
						$("#findPwdModal").modal("hide");
					} else {
						warningAlert(data.message);
					}
				},
				error : function() {
					errorAlert("메일발송에 실패했습니다.");
				}
			})
		})

		$("#profileImage").click(function() {
			$("#profileFile").click();
		})

		$("#profileFile").change(function() {
			let file = document.querySelector('input[type=file]').files[0];
			let reader = new FileReader();

			reader.onloadend = function() {
				$("#profileImage").attr("src", reader.result)
			}

			if (file) {
				reader.readAsDataURL(file);
			} else {
				preview.src = "resources/images/login/profile.png";
			}
		})

		$("#joinBox  .name").keyup(
				function(event) {
					if ($("#joinBox  .name").val().length < 1)
						$("#joinBox  .name").siblings(".text-danger").css(
								"display", "block");
					else
						$("#joinBox  .name").siblings(".text-danger").css(
								"display", "none");
				})
		$("#joinBox  .email")
				.keyup(
						function(event) {
							let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							if ($("#joinBox  .email").val().match(regExp) != null)
								$("#joinBox  .email").siblings(".text-danger")
										.css("display", "none");
							else
								$("#joinBox  .email").siblings(".text-danger")
										.css("display", "block");
						})
		$("#joinBox  .pwd").keyup(
				function(event) {
					if ($("#joinBox  .pwd").val().length < 8)
						$("#joinBox  .pwd").siblings(".text-danger").css(
								"display", "block");
					else
						$("#joinBox  .pwd").siblings(".text-danger").css(
								"display", "none");
				})
				
		$("#resetBox  .pwd1").keyup(

				function(event) {
					if ($("#resetBox  .pwd1").val().length < 8 ) {
						$("#resetBox  .pwd1").siblings(".text-danger").css("display", "block");
						$("#resetBox .successletter").css("display", "none");
						$("#resetBox .failletter").css("display", "none");
						

					}else if($("#resetBox  .pwd1").val() == null && $("#resetBox  .pwd2").val() == null) {
						$("#resetBox .successletter").css("display", "none");
						$("#resetBox .failletter").css("display", "none");
						

					}else{
						$("#resetBox  .pwd1").siblings(".text-danger").css("display", "none");
						$("#resetBox  .pwd2").keyup(
								function(event) {
									console.log('여기오니');
									if ($("#resetBox  .pwd1").val() == $("#resetBox  .pwd2").val()){
										console.log('여기와와와 if');
										$("#resetBox .successletter").css("display", "block");
										$("#resetBox .failletter").css("display", "none");
										
									}else{
										console.log('여기와와와 else');
										$("#resetBox .failletter").css("display", "block");
										$("#resetBox .successletter").css("display", "none");
									}
								})
					}
				})		
				
	
				

		openDialog();
	})

	function openDialog() {
		let type = "${show}";
		if (!type)
			return;
		else if (type === "joinEmail")
			$("#opneJoinEmailModal").click();
		else if (type === "joinOk") {
			$('#joinOkModal').modal({
				backdrop : 'static',
				keyboard : false
			})
			$("#opneJoinOkModal").click();
		}
		else if(type === "join"){
			changeView(false)
		}
	}

	function changeView(isLogin) {
		// 로그인 화면 요청
		if (isLogin) {
			$("#loginBox").removeClass("hidden");
			$("#joinBox").addClass("hidden");
		}
		// 회원가입 화면 요청
		else {
			$("#joinBox").removeClass("hidden");
			$("#loginBox").addClass("hidden");
		}
	}
</script>
</head>

<body>



	<div id="main-wrapper">
		<div class="text-center mt-5">
			<a href="Index.do"><img src="resources/images/owl_plz_beige.png"
				alt=""></a>
		</div>

		<!-- Content -->
		<div class="content-main mt-5">
			<div class="container-fluid ">
				<div class="login-form-bg">
					<div class="container h-100">
						<div class="row justify-content-center h-100">
							<div class="col-xl-6">
								<div class="form-input-content">
									<div class="card mb-0">
										<!-- 로그인 화면 -->
										<div id="loginBox">
											<div class="card-body pt-1">
												<div class="text-center mt-4">
													<h4>LOGIN</h4>
												</div>
												<c:url value="/login" var="loginurl"></c:url>
												<form action="${loginurl}" method="post" class="mt-5 mb-5 login-input">
													<div class="form-group">
														<input type="email" name="email"
															class="form-control email" placeholder="Email">
													</div>
													<div class="form-group">
														<input type="password" name="pwd" class="form-control pwd"
															placeholder="Password">
													</div>
													<div class="form-check mb-3">
		                                                <label class="form-check-label">
		                                                    <input type="checkbox" class="form-check-input" name ="_spring_security_remember_me"> Remember me</label>
		                                            </div>
													<input type="submit"
														class="btn login-form__btn submit w-100" value="LOGIN">
												</form>

												<hr />

												<div class="text-center">
													<h5>SNS LOGIN</h5>
													<button id="naverLoginButton"
														class="snsLoginButton mt-2 mr-3"
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

												<div class="mt-5 login-form__footer text-center">
													<b class="login-form__footer"> <a href="#"
														data-toggle="modal" data-target="#findPwdModal"
														class="text-secondary">Forgot password?</a></b>
													<p>
													
													<!-- 삭제예정 -------------------------------------------------->
													<b class="login-form__footer"> 
													<a href="#" data-toggle="modal" data-target="#resetPwdModal" class="text-secondary">ResetPassword 테스트용</a></b>
													<!-- ----------------------------------------------------- -->	
													<p>
														Don't have account? <a href="javascript:void(0);"
															onclick="changeView(false);" class="text-primary">Sign
															Up</a> now
													</p>
												</div>

											</div>
										</div>

										<!-- 회원가입 화면 -->
										<div id="joinBox" class="hidden">
											<div class="card-body pt-1">
												<div class="text-center mt-4">
													<h4>JOIN</h4>
												</div>

												<form action="EmailConfirm.do" method="post" class="mt-4 mb-3 login-input" enctype="multipart/form-data">
													<div class="text-center mb-3">
														<img id="profileImage" src="resources/images/login/profile.png" onerror="this.src='resources/images/login/profile.png'" style="width: 150px; height: 150px; cursor: pointer;"
															data-toggle="tooltip" data-placement="top"
															title="Please upload image."> 
															<input type="file" name="profileFile" id="profileFile" accept="image/*" style="display: none;" onchange="previewProfile()" />
															
													</div>
													<div class="form-group">
														<input type="text" name="name" class="form-control name" placeholder="Name"> 
														<span class="text-danger" style="display: none;">Please enter your name.</span>
													</div>
													<div class="form-group">
														<input type="email" name="email" class="form-control email" placeholder="Email"> 
														<span class="text-danger" style="display: none;">Please enter your email.</span>
													</div>
													<div class="form-group">
														<input type="password" name="password" class="form-control pwd" placeholder="Password"> 
														<span class="text-danger" style="display: none;">Please enter your password at least 8.</span>
													</div>
													<input type="submit" class="btn login-form__btn submit w-100" value="JOIN IN">
												</form>
												<p class="mt-3 login-form__footer">
													Don you have account? <a href="javascript:void(0);"
														onclick="changeView(true);" class="text-primary">Login</a>
													now
												</p>
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

	<!--  Modal  -->
	<jsp:include page="modal/resetPassword.jsp" />
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