<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<style>
.list-margin {
margin-bottom: 10px;
}

</style>
<script>
/* $("#deleteMemberBtn").click(function() { */
$(function() {
	
	let agreeChk = false;
	let pwdChk = true;
	
	$("#delPwd").keyup(function(){
		if($("#delPwd").val() == "" || $("#delPwd").val() == null){
		   $("#delPwd").focus();
		}else{
			$.ajax({
				url:"chkDelPwd.do",
				data:{email:$("#email").val(), password:$("#delPwd").val()},
				type:"post",
				dataType: "html",
				success:function(responsedata){
					console.log("받는 데이터 >"+responsedata+"<");
				
					if(responsedata == "true"){
						console.log("참");
						pwdChk = true;
					}else{
						console.log("거짓");
						pwdChk = false;
					}
				},
				error:function(){
					console.log("에러");
				}
			});
		}
	}); 

	$("#deleteChk").change(function(){
		if ($("input:checkbox[id='deleteChk']").is(":checked") == true){
			$("#deleteChk").siblings(".text-danger").css("display", "none");
			agreeChk = true;

		}else{ 
			$("#deleteChk").siblings(".text-danger").css("display", "block");
			agreeChk = false;
		}
	});
	   $('#deleteMemberBtn').click(function() {

	    	if (agreeChk && pwdChk) {
	    		
	    	} else if (agreeChk && pwdChk == false) {
	    			
	    			warningAlert("비밀번호가 일치하지 않습니다");
					return false; 
			} else if (agreeChk == false && pwdChk){
				warningAlert("약관에 동의해주시기 바랍니다.");
				return false; 
			
	    	} else {
    			
    			warningAlert("약관에 동의해주시기바랍니다. 비밀번호가 일치하지 않습니다.");
					return false;
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

	 $("#cancelButton").click(function(){
			$("#firstpage").removeClass("hidden");
			$("#twopage").addClass("hidden");	
		});
	
});


function changeView() {
	$("#firstpage").addClass("hidden");
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
													<img src="upload/${member.profilePic}" onerror="this.src='resources/images/login/profile.png'" class="rounded-circle" 
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
									<div class="text-center mb-3" id="changeImg">
										<img id="profileImage" src="upload/${member.profilePic}"
											onerror="this.src='resources/images/login/profile.png'"
											class="rounded-circle"
											style="width: 180px; height: 180px; cursor: pointer;"
											data-toggle="tooltip" data-placement="bottom"
											title="프로필을 수정하실 수 있습니다."> 
											<input type="file" id="multipartFile" name="multipartFile" style="visibility: hidden;">
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
												class="form-control pwd" placeholder="비밀번호를 재입력해주세요.">
										</div>
									</c:if>
									<div class="row">
										<div class="col-md-6">
											<input type="button" id="cancelButton" class="btn btn-primary w-100" value="취소">
										</div>
										<div class="col-md-6">
											<input type="submit" class="btn btn-primary w-100" onclick="window.location.reload()"
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
									<!-- 	<form action="DeleteAccount.do" method="get"> -->
											<div class="modal-body">
											<div class="text-center">
												<img class="" src="resources/images/owl_logo_fit.png" style="width: 60px;"> 
												<h5 class="mt-3 mb-1 ">&nbsp;&nbsp;Please check before deleting your account.</h5>
											</div>
											
												<br>
												<div class="text-justify">
													<ul class="list-icons" style="list-style-type: none;">
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
										<form action="DeleteAccount.do" method="post">
											<input type="hidden" name="email" class="form-control email" value="${member.email}">
												<div class="row">
											
												<c:if test="${member.signFrom == '홈페이지'}">
													<!-- <div class="col-sm-2">
														<label class="sr-only">Password</label> 
													</div> -->
												
													<div class="col-sm-6">
														<input type="password" class="form-control" placeholder="Password" name="password" id="delPwd">
														</div>
												</c:if>
													<div class="col-sm-6">
														<button type="submit" class="btn btn-dark mt-1" id="deleteMemberBtn">Close Account</button>
													</div>
													<span class="text-danger" style="display: block;" id="pwdMatchMsg"></span>
												
									
													</div>
											</form>
													
												</div>
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



