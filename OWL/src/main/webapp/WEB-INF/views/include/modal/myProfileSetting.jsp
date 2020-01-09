<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<style>
.list-margin {
margin-bottom: 10px;
}
.form-group{
text-align: center;
}
</style>
<script>
/* $("#deleteMemberBtn").click(function() { */
$(function() {
	
	$("#deleteChk").change(function(){
		if ($("input:checkbox[id='deleteChk']").is(":checked") == true){
			$("#deleteChk").siblings(".text-danger").css(
					"display", "none");
			$("#deleteMemberBtn").attr('disabled', false);
		}else{ 
			$("#deleteChk").siblings(".text-danger").css(
				"display", "block");
			$("#deleteMemberBtn").attr('disabled', true);	
		}
	});

	 $("#multipartFile").change(function(){
	  		var reader = new FileReader();
	  	    reader.onload = function (e) {
	  	        // get loaded data and render thumbnail.
	  	        document.getElementById("profileImage").src = e.target.result;
	  	      console.log($("#multipartFile").val());
	  	    };
	  	    // read the image file as a data URL.
	  	    reader.readAsDataURL(this.files[0]);
	  	});	

	 $("#profileImage").click(function() {
			$("#multipartFile").click();
		});






	 
/* 		$('#name').attr("readonly" , false); 
		$('#password').attr("readonly",  false); 

			
	$("#editButton").click(function(){
		$.ajax({
                 url:"GetMember.do",
                 data:{email:$("#email").val()},
                 success:function(data){
				if(data.signFrom =="홈페이지"){
					$(".basic-form").empty();
					var editform = "";


					}

                 }
              });

	}); */
	
});


function changeView() {
	$("#firstpage").addClass("hidden");
	$("#firstpage").css("display", "none");
	$("#twopage").removeClass("hidden");
	}

</script>
<div id="myProfileSetModal" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title boldselect">
					<i class="far fa-sticky-note"></i> &nbsp;&nbsp;My Profile Setting
				</h4>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="default-tab">

					<ul class="nav nav-tabs mb-3" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#profile">My profile</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#deleteAccount">Delete account</a></li>
					</ul>
					<div class="tab-content">
						<!-- 회원 정보 보기-->
						<div class="col-lg-12 tab-pane fade show active" id="profile" role="tabpanel">
							<div  id="firstpage">	
							<div class="card">
								<div class="card-body" style="padding-top: 20px;">						
									<div class="basic-form">																		
												<div class="text-center mb-3">
													<img id="profileImage" src="upload/${member.profilePic}" onerror="this.src='resources/images/login/profile.png'" class="rounded-circle" 
													style="width: 180px; height: 180px; "> 												
												</div>
												<div class="form-group">
													<input type="text" name="name" id="name" class="form-control name"
														placeholder="Name" readonly value="${member.name}">
												</div>
												<div class="form-group">
													<input type="email" name="email" id="email" placeholder="Email"
														class="form-control email" readonly value="${member.email}">
												</div>										
												<input type="button" id="editButton" onclick="changeView()" class="btn btn-primary w-100" value="정보 수정">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- My profile end-->

						<!-- 회원 수정 페이지 -->
					<div class="hidden" id="twopage">
							<div class="card">
								<div class="card-body" style="padding-top: 20px;">
									<div class="basic-form">										
											<form action="UpdateMember.do" method="post"
												enctype="multipart/form-data">
												<div class="text-center mb-3">
													<img id="profileImage" src="upload/${member.profilePic}"
														onerror="this.src='resources/images/login/profile.png'"
														class="rounded-circle"
														style="width: 180px; height: 180px; cursor: pointer;"
														data-toggle="tooltip" data-placement="bottom"
														title="프로필을 수정하실 수 있습니다."> <input type="file"
														id="multipartFile" name="multipartFile"
														style="display: none;" onchange="previewProfile()" />
												</div>
												<div class="form-group">
													<input type="text" name="name" id="name"
														class="form-control name" placeholder="Name"
														value="${member.name}">
												</div>
												<div class="form-group">
													<input type="email" name="email" id="email"
														placeholder="Email" class="form-control email" readonly
														value="${member.email}">
												</div>
												<c:if test="${member.signFrom == '홈페이지'}">
													<div class="form-group">
														<input type="password" id="password" name="password"
															class="form-control pwd" placeholder="Password"
															value="${member.password}">
													</div>
												</c:if>
												<div class="row">
													<div class="col-md-6">
														<input type="button" id="editButton"
															class="btn btn-primary w-100" value="취소">
													</div>
													<div class="col-md-6">
														<input type="submit" class="btn btn-primary w-100"
															value="수정 완료">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>

							

						<!-- Delete Account Start -->
						<div class="col-lg-12 tab-pane fade" id="deleteAccount">
							<div class="card">
								<div class="card-body">
									<div class="basic-form">
										<form action="DeleteAccount.do" method="get">
											<div class="modal-body">
											<h5 class="mt-3 mb-1 "><img class="" src="resources/images/owl_logo_fit.png" style="width: 60px"> &nbsp;&nbsp; Please check before deleting your account.</h5>
												<br>
												<div class="text-justify">
													<ul class="list-icons">
													<li><i class="fa fa-check text-info list-margin"></i>&nbsp;회원 탈퇴 후 다시 가입은 가능합니다.</li>
														<li><i class="fa fa-check text-info list-margin"></i>&nbsp;회원 탈퇴시 다시 복원이 불가능합니다.</li>
														<li><i class="fa fa-check text-info list-margin"></i>&nbsp;탈퇴된 계정의 정보나 게시물은 완전히 삭제됩니다.</li>
													</ul>
												</div>
                                              <br><br>			
												<p class="text-muted">정말 탈퇴하시겟습니까?</p>
												
												<div class="basic-form">
													<div class="form-group ">
														<div class="form-check form-check-inline">
															<label class="form-check-label"> <input type="checkbox" class="form-check-input" value="" id="deleteChk">
																<code>*</code>I agree.
																<span class="text-danger" style="display: block;">&emsp;Please check your agreement.</span>
															</label>
														</div>
													</div>
												</div>
												<hr>
											<c:choose>
												<c:when test="${member.signFrom == '홈페이지'}">
													<form action="DeleteAccount.do" method="get">
												</c:when>
												<c:when test="${member.signFrom == '구글'}">
													<form action="googleLogin.do" method="get">
												</c:when>
												<c:when test="${member.signFrom == '카카오'}">
													<form action="kakaoLogin.do" method="get">
												</c:when>
												<c:otherwise>
													<!-- 네이버 -->
													<form action="naverLogin.do" method="get">
												</c:otherwise>
											</c:choose>
											<!-- <form action="DeleteAccount.do" method="get"> -->

												<div class="row">

												<c:choose>
												<c:when test="${member.signFrom == '홈페이지'}">
													<!-- <div class="col-sm-2">
														<label class="sr-only">Password</label> 
													</div> -->
													<div class="col-sm-6">
														<input type="password" class="form-control" placeholder="Password">
														</div>
													<div class="col-sm-6">
														<button type="submit" class="btn btn-dark mt-1" id="deleteMemberBtn" disabled>Close Account</button>
													</div>
												</c:when>
												<c:when test="${member.signFrom == '구글'}">
													<button id="googleLoginButton" class="snsLoginButton mr-3">
														<img src='resources/images/login/google.png'
															style="width: 50px;">
													</button>
												</c:when>
												<c:when test="${member.signFrom == '카카오'}">
													<button id="kakaoLoginButton" class="snsLoginButton mr-3"
														onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=5d151c02cc241d9ba7a8373a8051d79d&redirect_uri=http://localhost:8090/OWL/kakaoLogin.do&response_type=code'">
														<img src='resources/images/login/kakao.png'
															style="width: 50px;">
													</button>
												</c:when>
												<c:otherwise>
													<!-- 네이버 -->
													<button id="naverLoginButton"
														class="snsLoginButton mt-2 mr-3"
														onclick="location.href='https://nid.naver.com/oauth2.0/authorize?client_id=zlKEJHqR7YB9riY5pP5l&redirect_uri=http://localhost:8090/OWL/naverLogin.do&response_type=code'">
														<img src='resources/images/login/naver.png'
															style="width: 50px;">
													</button>
												</c:otherwise>
											</c:choose>
													</div>
												</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Delete Account End -->
				</div>
			</div>
		</div>
	</div>
</div>


