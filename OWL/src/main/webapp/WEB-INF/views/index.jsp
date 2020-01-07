<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>OWL</title>
    <jsp:include page="include/headTag.jsp"/>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <!-- Pignose Calender -->
    <link href="resources/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="resources/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
 	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
 	<!-- fontawesome -->
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- Kakao -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="resources/js/commonSweetAlert.js"></script>
 	<style type="text/css">
 		.snsLoginButton {
 			background-color : transparent;
	        border: none;
	        width: 50px;
	        height: 50px;
	        cursor: pointer;
      }
 	
 	</style>
	<script type="text/javascript">
		Kakao.init("5d151c02cc241d9ba7a8373a8051d79d");
		//https://kauth.kakao.com/oauth/authorize?client_id=5d151c02cc241d9ba7a8373a8051d79d&redirect_uri=http://localhost:8090/OWL/kakaoLogin
	    function loginWithKakao() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.login({
	        success: function(authObj) {
	          alert("success"+JSON.stringify(authObj));
	        },
	        fail: function(err) {
	          alert("error"+JSON.stringify(err));
	        }
	      });
	    };

$(function(){
		let joinModalOpen = false;
	    $("#joinModal").on('show.bs.modal', function () {
	        $("#loginModal").modal("hide");
	        joinModalOpen=true;
	        $('body').css({'overflow': 'hidden', 'height': '100%'}); 
	      }); 
      	
	    $("#joinModal").on('hide.bs.modal', function () {
	    	 joinModalOpen = false;
	        $('html, body').css({'overflow': 'auto', 'height': '100%'}); 
      	}); 
  
	    $("#loginModal").on('show.bs.modal', function () {
		    if( joinModalOpen ){
		    	 $("#joinModal").modal("hide");
		    	 $('html, body').css({'overflow': 'hidden', 'height': '100%'}); 
		    	 joinModalOpen = false;
		    	}
	      }); 
	      
	    $("#loginModal").on('hide.bs.modal', function () {
	        $('html, body').css({'overflow': 'auto', 'height': '100%'}); 
      	}); 
      	
	    $("#findPwdModal").on('show.bs.modal', function () {
	    	 $("#loginModal").modal("hide");
	    	 $('html, body').css({'overflow': 'hidden', 'height': '100%'}); 
	      }); 
	      
	    $("#findPwdModal").on('hide.bs.modal', function () {
	        $('html, body').css({'overflow': 'auto', 'height': '100%'}); 
      	}); 

	    $("#sendPwd").click(function() { 
			$.ajax({
				url : "FindPassword.do",
				data : { email : $("#email").val()},
				success : function(data){
					if(data.result){
						successAlert(data.message);
						$("#findPwdModal").modal("hide");
					}else{
						warningAlert(data.message);
					}
				},
				error:function(){
					errorAlert("메일발송에 실패했습니다.");
				}
			})
		})
		
	    $("#sendPwd").click(function() { 
			$.ajax({
				url : "FindPassword.do",
				data : { email : $("#email").val()},
				success : function(data){
					if(data.result){
						successAlert(data.message);
						$("#findPwdModal").modal("hide");
					}else{
						warningAlert(data.message);
					}
				},
				error:function(){
					errorAlert("메일발송에 실패했습니다.");
				}
			})
		})
})
	</script>
</head>

<body>

    <!-- ProgressBar -->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>


    <div id="main-wrapper">

<div class="nav-header" style="background-color: #fcf9f5;">
     <div class="brand-logo">
         <a href="Index.do">
             <b class="logo-abbr"><img src="resources/images/logo.png" alt=""> </b>
			 <span class="logo"><img src="resources/images/owl_logo_another.png" alt=""></span>
         </a>
     </div>
 </div>

        <!-- Top -->
        <div class="header-row">    
    		 <div class="header-content clearfix">

	         <div class="header-left">

     <span class="logo-compact">OWL</span>
	         </div>

	         <div class="header-right">
	             <ul class="clearfix">
	                 <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
	                         <i class="mdi mdi-email-outline"></i>
	                         <span class="badge badge-pill gradient-1">3</span>
	                     </a>
	                     <div class="drop-down animated fadeIn dropdown-menu">
	                         <div class="dropdown-content-heading d-flex justify-content-between">
	                             <span class="">3 New Messages</span>  
	                             <a href="javascript:void()" class="d-inline-block">
	                                 <span class="badge badge-pill gradient-1">3</span>
	                             </a>
	                         </div>
	                         <div class="dropdown-content-body">
	                             <ul>
	                                 <li class="notification-unread">
	                                     <a href="javascript:void()">
	                                         <img class="float-left mr-3 avatar-img" src="resources/images/avatar/1.jpg" alt="">
	                                         <div class="notification-content">
	                                             <div class="notification-heading">Saiful Islam</div>
	                                             <div class="notification-timestamp">08 Hours ago</div>
	                                             <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
	                                         </div>
	                                     </a>
	                                 </li>
	                                 <li class="notification-unread">
	                                     <a href="javascript:void()">
	                                         <img class="float-left mr-3 avatar-img" src="resources/images/avatar/2.jpg" alt="">
	                                         <div class="notification-content">
	                                             <div class="notification-heading">Adam Smith</div>
	                                             <div class="notification-timestamp">08 Hours ago</div>
	                                             <div class="notification-text">Can you do me a favour?</div>
	                                         </div>
	                                     </a>
	                                 </li>
	                                 <li>
	                                     <a href="javascript:void()">
	                                         <img class="float-left mr-3 avatar-img" src="resources/images/avatar/3.jpg" alt="">
	                                         <div class="notification-content">
	                                             <div class="notification-heading">Barak Obama</div>
	                                             <div class="notification-timestamp">08 Hours ago</div>
	                                             <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
	                                         </div>
	                                     </a>
	                                 </li>
	                                 <li>
	                                     <a href="javascript:void()">
	                                         <img class="float-left mr-3 avatar-img" src="resources/images/avatar/4.jpg" alt="">
	                                         <div class="notification-content">
	                                             <div class="notification-heading">Hilari Clinton</div>
	                                             <div class="notification-timestamp">08 Hours ago</div>
	                                             <div class="notification-text">Hello</div>
	                                         </div>
	                                     </a>
	                                 </li>
	                             </ul>
	                             
	                         </div>
	                     </div>
	                 </li>
	                 <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
	                         <i class="mdi mdi-bell-outline"></i>
	                         <span class="badge badge-pill gradient-2">3</span>
	                     </a>
	                     <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
	                         <div class="dropdown-content-heading d-flex justify-content-between">
	                             <span class="">2 New Notifications</span>  
	                             <a href="javascript:void()" class="d-inline-block">
	                                 <span class="badge badge-pill gradient-2">5</span>
	                             </a>
	                         </div>
	                         <div class="dropdown-content-body">
	                             <ul>
	                                 <li>
	                                     <a href="javascript:void()">
	                                         <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
	                                         <div class="notification-content">
	                                             <h6 class="notification-heading">Events near you</h6>
	                                             <span class="notification-text">Within next 5 days</span> 
	                                         </div>
	                                     </a>
	                                 </li>
	                                 <li>
	                                     <a href="javascript:void()">
	                                         <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
	                                         <div class="notification-content">
	                                             <h6 class="notification-heading">Event Started</h6>
	                                             <span class="notification-text">One hour ago</span> 
	                                         </div>
	                                     </a>
	                                 </li>
	                                 <li>
	                                     <a href="javascript:void()">
	                                         <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
	                                         <div class="notification-content">
	                                             <h6 class="notification-heading">Event Ended Successfully</h6>
	                                             <span class="notification-text">One hour ago</span>
	                                         </div>
	                                     </a>
	                                 </li>
	                                 <li>
	                                     <a href="javascript:void()">
	                                         <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
	                                         <div class="notification-content">
	                                             <h6 class="notification-heading">Events to Join</h6>
	                                             <span class="notification-text">After two days</span> 
	                                         </div>
	                                     </a>
	                                 </li>
	                                 
	                             </ul>
	                             
	                         </div>
	                     </div>
	                 </li>
	                 <li class="icons dropdown d-none d-md-flex">
	                     <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
	                         <span>English</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
	                     </a>
	                     <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
	                         <div class="dropdown-content-body">
	                             <ul>
	                                 <li><a href="javascript:void()">English</a></li>
	                                 <li><a href="javascript:void()">Dutch</a></li>
	                             </ul>
	                         </div>
	                     </div>
	                 </li>
	                 <li class="icons dropdown">
	                     <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
	                         <span class="activity active"></span>
	                         <img src="resources/images/user/1.png" height="40" width="40" alt="">
	                     </div>
	                     <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
	                         <div class="dropdown-content-body">
	                             <ul>
	                                 <li>
	                                     <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
	                                 </li>
	                                 <li>
	                                     <a href="javascript:void()">
	                                         <i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill gradient-1">3</div>
	                                     </a>
	                                 </li>
	                                 
	                                 <hr class="my-2">
	                                 <li>
	                                     <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
	                                 </li>
	                                 <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
	                             </ul>
	                         </div>
	                     </div>
	                 </li>
	                 <li class="icons dropdown d-none d-md-flex" >
                         <a href="#" data-toggle="modal" data-target="#loginModal">
                             <button type="button" id="loginBtn"  class="btn mb-1 btn-primary">Login / Register</button>
                         </a>
	                 </li>
	             </ul>
	         </div>
     </div>
 </div>
       

         
        <!-- Content -->
        <div class="content-body">
            <div class="container-fluid mt-3">
                메인 부분
            </div>
        </div>
        
        <!-- Bottom -->
		<jsp:include page="include/bottom.jsp"/>
    </div>

	<!--  Modal  -->
	<jsp:include page="member/modal/login.jsp"/>
	<jsp:include page="member/modal/register.jsp"/>
	<jsp:include page="member/modal/findPassword.jsp"/>

    <!--Scripts-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>

    <!-- Chartjs -->
    <script src="resources/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="resources/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="resources/plugins/d3v3/index.js"></script>
    <script src="resources/plugins/topojson/topojson.min.js"></script>
    <script src="resources/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="resources/plugins/raphael/raphael.min.js"></script>
    <script src="resources/plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="resources/plugins/moment/moment.min.js"></script>
    <script src="resources/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="resources/plugins/chartist/js/chartist.min.js"></script>
    <script src="resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
    <script src="resources/js/dashboard/dashboard-1.js"></script>

</body>

</html>
