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
		})
});
/* }); */
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
						<!-- My profile start-->
						<div class="col-lg-12 tab-pane fade show active" id="profile"
							role="tabpanel">
							<div class="card">
								<div class="card-body" style="padding-top: 20px;">						
									<div class="basic-form">
											<form action="UpdateMember.do" method="post" enctype="multipart/form-data">
													<div class="text-center mb-3">
														<img id="profileImage" src="upload/${member.profilePic}" onerror="this.src='resources/images/login/profile.png'" class="rounded-circle" 
														style="width: 180px; height: 180px; cursor: pointer;"	data-toggle="tooltip" data-placement="bottom" title="프로필을 수정하실 수 있습니다."> 
															<input type="file" id="multipartFile" name="multipartFile" style="display: none;" onchange="previewProfile()" />
													</div>
													<div class="form-group">
														<input type="text" name="name" class="form-control name"
															placeholder="Name" value="${member.name}">
													</div>
													<div class="form-group">
														<input type="email" name="email" placeholder="Email"
															class="form-control email" readonly value="${member.email}">
													</div>
													<div class="form-group">
														<input type="password" name="password" class="form-control pwd" 
														placeholder="Password"	value="${member.password}"> 
													</div>												
													<input type="submit"
														class="btn btn-primary w-100" value="정보 수정">
												</form>
									</div>
								</div>
							</div>
						</div>
						<!-- My profile end-->

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
													<div class="col-sm-6">
														<label class="sr-only">Password</label> 
													</div>
													<div class="col-sm-3">
														<input type="password" class="form-control" placeholder="Password">
														</div>
													<div class="col-sm-3">
														<button type="submit" class="btn btn-dark mb-2" id="deleteMemberBtn" disabled>Close Account</button>
														</div>
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


