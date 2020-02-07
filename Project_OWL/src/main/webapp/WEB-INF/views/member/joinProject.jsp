<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta name="google-signin-client_id" content="266293759218-1i2o19cvv8p80i4q4a9q94d1dner0ksg.apps.googleusercontent.com.apps.googleusercontent.com">
	<title>OWL</title>
	<jsp:include page="../include/headTag.jsp" />
    <link href="resources/css/member.css" rel="stylesheet">
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
								<div id="loginBox" class="roundBox p-4">
									<div class="text-center mt-4">
										<h3>프로젝트 참여</h3>
										<img class="mt-5" alt="" src="resources/images/member/addpProject.png" style="height: 250px">
									</div>
									<div class="text-center mt-5">
										<h4 class="mb-2">프로젝트에 초대받으셨습니다.</h4>
										<i class="fas fa-users"></i> [ ${projectName} ]
									</div>
									
									<div class="row mt-5">
										<div class="col-6 text-center">
										<form action="Login.do" method="get">
											<p class="mb-3" style="font-weight: bold;">이미 계정이 있으신가요?</p>	
											<input type="submit" class="btn btn-primary btn-lg" value="로그인">
										</form>
										</div>
										<div class="col-6 text-center">
										<form action="Register.do" method="post">
											<p class="mb-3" style="font-weight: bold;">OWL이 처음이신가요?</p>	
											<input type="submit" class="btn btn-primary btn-lg" value="가입하기">
										</form>
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
</body>

</html>