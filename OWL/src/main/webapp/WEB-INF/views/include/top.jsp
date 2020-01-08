<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Kalam:700&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<style>
.coloricon {
	padding: 15px;
	width: 25px;
	height: 25px;
	margin-right: 10px;
	border: 2px solid #BDBDBD;
}

.setting-box {
	margin-top: 50px;
}

#userImg, .coloricon {
	border: 3px solid #fcf9f5;
    box-shadow: 1px 1px 1px 1px #BDBDBD;
}

#userImg:hover, .coloricon:hover {
	border: 3px solid #BDBDBD;
}




#settingToggle, #alarmToggle, #chatToggle, #userToggle {
	padding-left: 1%;
	padding-right: 1%;
}

.toggleOption {
	padding-top: 30px;
	background: #fcf9f5;
	height: 1185%;
	width: 310px;
	position: absolute;
}
</style>
<script>
	$(document).ready(function() {
		$("#userToggle").hide();
		$("#alarmToggle").hide();
		$("#settingToggle").hide();
		$("#chatToggle").hide();

		$("#userBtn").click(function() {
			$("#alarmToggle").hide();
			$("#settingToggle").hide();
			$("#chatToggle").hide();
			$("#userToggle").animate({
				height : 'toggle'
			});
		});

		$("#chatBtn").click(function() {
			$("#userToggle").hide();
			$("#alarmToggle").hide();
			$("#settingtoggle").hide();
			$("#chatToggle").animate({
				height : 'toggle'
			});
		});

		$("#alarmBtn").click(function() {
			$("#userToggle").hide();
			$("#chatToggle").hide();
			$("#settingToggle").hide();
			$("#alarmToggle").animate({
				height : 'toggle'
			});
		});

		$("#settingBtn").click(function() {
			$("#userToggle").hide();
			$("#chatToggle").hide();
			$("#alarmToggle").hide();
			$("#settingToggle").animate({
				height : 'toggle'
			});
		});
	});
</script>
<style>
.enter {
	margin-right: 100
}
</style>

<div class="nav-header" style="background-color: #fcf9f5;">
	<div>
		<a href="Index.do" style="padding: 0"> <b><img
				src="resources/images/owl_logo_medium.png" alt=""> </b> <span
			class="logo-compact"><img
				src="resources/images/owl_logo_real.png" alt=""></span> <span
			class="brand-title"> <img
				src="resources/images/owl_logo_real.png" alt="">
		</span>
		</a>
	</div>
</div>


<div class="header" style="background-color: #fcf9f5;">
	<div class="header-content clearfix">

		<div class="nav-control">
			<div class="hamburger">
				<span class="toggle-icon" style="color: #326295;"><i
					class="icon-menu"></i></span>
			</div>
		</div>

		<div class="header-right">
			<ul class="clearfix">

				<!-- User info  -->
				<li class="icons" style="margin-left: 30px; margin-right: 30px">

					<div class="user-img c-pointer position-relative">
						<!-- <span class="activity active"></span> -->
						<a href="javascript:void(0)" id="userBtn"> <img
							src="resources/images/user/1.png" height="40" width="40" alt=""></a>
					</div> <!-- 					<div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
						<div class="dropdown-content-body">
							<ul>
								<li><a href="app-profile.html"><i class="icon-user"></i>
										<span>Profile</span></a></li>

								<hr class="my-2">
								<li><a href="Lock.do"><i class="icon-lock"></i> <span>Lock Screen</span></a></li>
								<li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
							</ul>
						</div>
					</div> -->
				</li>

				<!-- Chatting -->
				<li class="icons" style="margin-right: 25px"><a
					href="javascript:void(0)" id="chatBtn"> <i
						class="far fa-comment"></i></a></li>

				<!-- Alram -->
				<li class="icons" style="margin-right: 25px"><a
					href="javascript:void(0)" id="alarmBtn"><i class="far fa-bell"></i></a>
				</li>

				<!--  Setting - customizing -->
				<li class="icons" style="margin-right: 15px"><a
					href="javascript:void(0)" id="settingBtn"><i class="fas fa-cog"></i></a>
				</li>
			</ul>




			<!-- toggle content Start-->
			<div class="toggleOption" id="userToggle">
				<div class="text-center">
					<i class="far fa-address-card fa-2x"></i>&nbsp; USER PROFILE
				</div>
				<div class="text-center setting-box">
					<div class="user-img c-pointer position-relative">
					<a href="#" data-toggle="modal" data-target="#myProfileSetModal">
						<img src="resources/images/users/8.jpg" class="rounded-circle" alt="" id="userImg">
						</a>
					</div>
					<h5 class="mt-3 mb-1">Name</h5>
					<p class="m-0">E-mail Address</p>
				</div>
				<hr>
				
				<div class="text-center setting-box">
					<ul>
					<li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
					</ul>
				
				</div>
			</div>


			<div class="toggleOption" id="chatToggle">채팅 토글입니다.</div>


			<div class="toggleOption" id="alarmToggle">알람토글입니다</div>

			<div class="toggleOption" id="settingToggle">
				<div class="text-center">
					<i class="fas fa-cog fa-2x"></i> CUSTOMIZING
				</div>

				<div class="text-center setting-box c-pointer">
					<h5 class="mt-3 mb-1">SIDEBAR BACKGROUND</h5>
					<hr>
					<span class="badge coloricon" style="background-color: white; display: inline-block;"></span>
					<span class="badge coloricon" style="background-color: gray; display: inline-block;"></span>


				</div>
				<div class="text-center setting-box c-pointer">
					<h5 class="mt-3 mb-1">SIDEBAR ACTIVE COLOR</h5>
					<hr>
					<span class="badge coloricon" style="background-color: white; display: inline-block;"></span>
					<span class="badge coloricon" style="background-color: #f7c9c9;display: inline-block;"></span>
					<span class="badge coloricon" style="background-color: #e0d8cd; display: inline-block;"></span>
					<span class="badge coloricon" style="background-color: #91a8d1; display: inline-block;"></span>
					<span class="badge coloricon" style="background-color: #c4d7a4; display: inline-block;"></span>
				</div>

  <!-- 처음에는 기본된 폰트로 둘까? -->
				<div class="text-center setting-box">
					<h5 class="mt-3 mb-1">SELECT FONT</h5>
					<hr>
					<div class="col-lg-12">
						<select class="form-control" id="val-skill" name="val-skill">
							<option value="">Please select</option>
							<option value="주아체">배달의민족 - 주아체</option>
							<option value="도현체">배달의민족 - 도현체</option>
							<option value="맑은고딕">맑은고딕</option>
							<option value="궁서체">궁서체</option>
						</select>
					</div>
				</div>
				<!-- toggle content End-->

			</div>
		</div>
	</div>
</div>



<!-- MyProfile Modal -->
	<jsp:include page="modal/myProfileSetting.jsp" />
