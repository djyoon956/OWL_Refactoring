<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Kalam:700&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"	type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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


.enter {
	margin-right: 100
	display: inline
}
#searchChat{
border-right:0px; 
border-top:0px; 
boder-left:0px; 
boder-bottom:3px solid #326295;
background-color: rgba(255, 255, 255, 0);
border-left-width: 0px;
color: #326295;
}
#searchChatname{
cursor: pointer; float: right;
}
#searchChatname:hover{
color: #326295;
}
#chatTitle img{
margin-top: 10px;
width: 40px;
height: 40px;
margin-right: 10px;
}
.media h5{
font-size: 15px;
font-weight: bold;
}

.setting-box{
	margin-top: 20px;
	font-family: 'Noto Sans KR', sans-serif;
}

.custom-menu {
    z-index:1000;
    position: absolute;
    padding: 2px;
    background-color:#f0f3f7;
    text-align: center;
}
/* alarm shake */
#alarmBtn:hover {
  /* Start the shake animation and make the animation last for 0.5 seconds */

  animation: shake 1s;

  /* When the animation is finished, start again */
  animation-iteration-count: infinite;
}

@keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}

/* rotate */

#settingBtn:hover {
	 transform: rotate(720deg);
}
@keyframes infinite-spinning {
  from {
    transform: rotateY(0deg);
  }
  to {
    transform: rotateY(360deg);
  }
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

function Search(){
	$('.ChatList').empty();   
	var plus = "";
	plus += "<input type='text' id='searchChat' style='width: 70%; height:30px; float:left; margin-top: 10px;'>&emsp; <span style='cursor:pointer;' onclick='Cancle()'><i class='fas fa-times'></i></span>";
	plus += "<span style='float:right'>&emsp;<i class='fas fa-comment-medical'></i>&emsp;<i class='fas fa-cog'></i></span>";
	$('.ChatList').append(plus);
}

function Cancle(){
	$('.ChatList').empty();   
	var plus = "";	
	plus += "<span style='float: right;'>&emsp;<i class='fas fa-comment-medical'></i>&emsp;<i class='fas fa-cog'></i></span>";
	plus += "<span id='searchChatname' onclick='Search()'><i class='fas fa-search'></i></span><br>";
	$('.ChatList').append(plus);
}


$("#chatroom").mousedown(function(e) { 
	alert(e.which); // 1:좌클릭, 2:휠클릭, 3:우클릭 
});

/* $(document).bind("contextmenu", function(event) { 
	event.preventDefault();    
    $("<div class='custom-menu'><b style='text-align:center;'>윤다정</b>" 
    	    + "<ul id='chatTool'><li>채팅방 고정</li><li>채팅방 나가기</li></ul></div>")
        .appendTo("li")
        .css({top: event.pageY + "px", left: event.pageX + "px"});
}).bind("click", function(event) {
    $("div.custom-menu").hide();
}); */

</script>
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
					href="javascript:void(0)" id="chatBtn"> <i class="far fa-comment"></i></a>
				</li>

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
			<div class="toggleOption" id="userToggle"  style="padding-top: 0px; z-index: 80;">
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
			
			<!-- 채팅 목록 토글 -->
			<div class="toggleOption" id="chatToggle" style="padding-top: 0px; z-index: 80;">
				<div  class="ChatList"> 
					<span style=" float: right;">&emsp;<i class="fas fa-cog"></i></span>
					<a href="#" data-toggle="modal" data-target="#newChat" style=" float: right;">&emsp;<i class="fas fa-comment-medical"></i></a>					
					<span id="searchChatname" onclick="Search()"><i class="fas fa-search"></i></span>
				<br>
				</div>
				<hr>
				<div class="setting-box">
					 <ul class="list-group">
                       <li class="list-group-item list-group-item-action flex-column align-items-start"  style="height: 106px;" id="chatroom">
                           <div class="d-flex w-100 justify-content-between" id="chatTitle">
                               <div class="media">
                               <img src="resources/images/user/group.png" class="rounded-circle" alt="" id="userImg">
                               <h5 style="margin-top: 18px; color: #ffb1b9">Project 1</h5>
                               </div>
                                <small style="float:right;">AM 12:00</small>
                           </div>
                           <ul>
		                      	<li class="d-flex justify-content-between align-items-center">
		                      			진성씨 시말서 제출하세요.
		                        		<span class="badge badge-primary badge-pill" style="background-color: #ffb1b9">2</span>
		                        </li>
                           </ul>             
                       </li>
                       <li class="list-group-item list-group-item-action flex-column align-items-start"  style="height: 106px;">
                           <div class="d-flex w-100 justify-content-between" id="chatTitle">
                               <div class="media">
                               <img src="resources/images/user/group.png" class="rounded-circle" alt="" id="userImg">
                               <h5 style="margin-top: 18px; color: #ccccff">kanban_iy</h5>
                               </div>
                                <small style="float:right;">2020-01-05</small>
                           </div>
                           <ul>
		                      	<li class="d-flex justify-content-between align-items-center">
		                      			이슈 끝나면 Done으로 이동해주세요.
		                        		<span class="badge badge-primary badge-pill" style="background-color: #ccccff">2</span>
		                        </li>
                           </ul>             
                       </li>	                       					 
                       <li class="list-group-item list-group-item-action flex-column align-items-start" style="height: 106px;">
                           <div class="d-flex w-100 justify-content-between" id="chatTitle">
                               <div class="media">
                               <img src="resources/images/member/4.jpg" class="rounded-circle" alt="" id="userImg">
                               <h5 style="margin-top: 18px;">윤다정</h5>
                               </div>
                                <small style="float:right;">AM 11:11</small>
                           </div>
                           <ul>
		                      	<li class="d-flex justify-content-between align-items-center">
		                      			샐러드 사왔어?
		                        		<span class="badge badge-primary badge-pill">1</span>
		                        </li>
                           </ul>             
                       </li>
                       <li class="list-group-item list-group-item-action flex-column align-items-start" style="height: 106px;">
                           <div class="d-flex w-100 justify-content-between" id="chatTitle">
                               <div class="media">
                               <img src="resources/images/member/8.jpg" class="rounded-circle" alt="" id="userImg">
                               <h5 style="margin-top: 18px;">정은아</h5>
                               </div>
                                <small style="float:right;">2020-01-06</small>
                           </div>
                           <ul>
		                      	<li class="d-flex justify-content-between align-items-center">
		                      			언니언니~
		                        		<span class="badge badge-primary badge-pill">5</span>
		                        </li>
                           </ul>             
                       </li>
                       <li class="list-group-item list-group-item-action flex-column align-items-start"  style="height: 106px;">
                           <div class="d-flex w-100 justify-content-between" id="chatTitle">
                               <div class="media">
                               <img src="resources/images/member/3.jpg" class="rounded-circle" alt="" id="userImg">
                               <h5 style="margin-top: 18px;">배인영</h5>
                               </div>
                                <small style="float:right;">2020-01-06</small>
                           </div>
                           <ul>
		                      	<li class="d-flex justify-content-between align-items-center">
		                      			Hey! What's up!
		                        		<span class="badge badge-primary badge-pill">1</span>
		                        </li>
                           </ul>             
                       </li>
                    </ul>
				
				</div>
		</div>


			<div class="toggleOption" id="alarmToggle"  style="padding-top: 0px; z-index: 80;">알람토글입니다</div>

			<div class="toggleOption" id="settingToggle"  style="padding-top: 0px; z-index: 80;">
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
	<jsp:include page="modal/newChat.jsp" />
