<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<se:authorize access="isAuthenticated()" var="isLogin"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>OWL</title>
    <jsp:include page="include/headTag.jsp"/>
    <!-- 스크롤 애니메이션  -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
 	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
 	<script src="resources/js/firebase-messaging-sw.js"></script>
 	
    <link href="resources/css/index.css" rel="stylesheet">
   	<script src="resources/js/index.js"></script>
<script type="text/javascript">
	$(function(){
		initMainController("${show}");
	})
</script>
</head>

<body>

   
    <div id="main-wrapper">
        
		<!-- CONTENT BOX -->
      <!-- Top -->
      <div class="header-row">
         <div class="header-content clearfix">
            <div class="header-left">
               <div class="nav-header" style="padding-left: 200px;">
                  <a href="Index.do" > 
                        <img src="resources/images/owl_logo_real.png" alt=""> 
                  </a>
               </div>
            </div>

            <div class="header-right">
               <ul class="clearfix">
               <c:choose>
	               	<c:when test="${isLogin}">
	               		<li class="icons dropdown d-md-flex">
		                  <a href="Main.do" > 
		                        <button type="button" id="loginBtn" class="btn mb-1 btn-primary main_btn">Go Main</button>
		                  </a>
                 	 </li>
                 	 <li class="icons dropdown d-md-flex">
		                  <a href="Logout.do" > 
		                        <button type="button" id="loginBtn" class="btn mb-1 btn-primary main_btn">Logout</button>
		                  </a>
                 	 </li>
	               	</c:when>
	               	<c:otherwise>
	               		<li class="icons dropdown d-md-flex">
		                  <a href="Login.do" > 
		                        <button type="button" id="loginBtn" class="btn mb-1 btn-primary main_btn">Login / Register</button>
		                  </a>
                 	 </li>
	               	</c:otherwise>
               </c:choose>        
               </ul>
            </div>
         </div>
      </div>



		<div class="page-wrapper" style="margin-left: 0; width: 100%;">
		<!--  height:719px; -->
			<!-- CONTENT MAIN -->
			<div class="container-fluid mainBack" style="height:775px;">
				<div class="e text-center">
					<h1 class="main_h1">OWL</h1>
				</div>
				<div class="d text-center">
					<h5 style="color: lightgrey;">Our Work Leader</h5>
					<p style="color: lightgrey;">효과적인 팀워크와 가벼워진 업무를 이끌어내는 공간, OWL</p>
				</div>
			</div>

			<!-- BOTTOM -->
			 
		</div>
	
	<div class="page-wrapper sectionPart w-100 ml-0" style="height:470px;">
		<div class="row" style="padding-left: 100px; padding-right: 70px;">
			<div class="col-5" style="margin-top:120px; padding-left :30px">
			<h2>전체 흐름 이해를 위한 DashBoard </h2> <br><br>
			<h4>프로젝트 내 전반적인 진행상황을 한눈에! </h4>
			<h4>프로젝트별 진행상황을 수치화하여 확인이 가능하며 </h4>
			<h4>개인별, 프로젝트별 할당된 업무를 한눈에 확인할 수 있습니다.</h4>
			</div>
			<div class="col-7" style="padding-left :30px">
	<img src="resources/images/indexImage/kanbanEx3.JPG" height="420px"  width="800px" data-aos="fade-left" data-aos-duration="1500" >
			</div>

		</div>
	</div>
	
	
	<div class="page-wrapper sectionPart w-100 ml-0" style="height:470px;" >
		<div class="row" style="padding-left: 100px; padding-right: 100px;">
			<div class="col-7">
			<img src="resources/images/indexImage/CalendarEx5.JPG" height="420px" width="730px"  data-aos="fade-right" data-aos-duration="1500" >
			</div>
			<div class="col-5" style="margin-top:120px; padding-left :10px">
			<h2>체계적인 스케줄 관리에 필요한 Calendar</h2> <br><br>
			<h4>완벽한 팀워크를 위해 가장 필수적인 첫걸음!  </h4>
			<h4>OWL을 이용하면 개인 스케줄 관리 뿐만 아니라 </h4>
			<h4>참여하는 프로젝트 내의 프로젝트도 함께 관리 할 수 있습니다.</h4>
			</div>
		</div>
	
	</div>
	
	
	<div class="page-wrapper sectionPart w-100 ml-0" style="height:470px;">
		<div class="row" style="padding-left: 100px; padding-right: 70px;">
			<div class="col-5" style="margin-top:120px; padding-left: 30px;">
			<h2>업무진행 체크시 필수인 Kanban Board</h2> <br><br>
			<h4>프로젝트 내 업무 진행상황 확인가능!</h4>
			<h4>컬럼 및 이슈설정을 통해 업무의 진행상태를 실시간 트래킹 하여</h4>
			<h4>프로젝트를 효율적으로 진행할 수 있도록 도와줍니다.</h4>
	</div>
	<div class="col-7" style="padding-left :30px">
	<img src="resources/images/indexImage/kanbanEx3.JPG" height="420px"  width="800px" data-aos="fade-left" data-aos-duration="1500" >
	</div>	
			
		</div>
			
	</div>
	
	
	<div class="page-wrapper sectionPart w-100 ml-0" style="height:470px;" >
		<div class="row" style="padding-left: 100px; padding-right: 100px;">
			<div class="col-7">
			<img src="resources/images/indexImage/DriveEx3.JPG" height="410px" width="730px"  style="padding:4px; padding-left:8px;padding-right:10px;"  data-aos="fade-right" data-aos-duration="1500">
			</div>
			<div class="col-5" style="margin-top:120px; padding-left :10px">
			<h2>Drive를 통한 효율적인 문서 공유 및 관리</h2> <br><br>
			<h4>전에는 없던 놀라운 문서 관리 기능! </h4>
			<ul class="driveul">
				<h5><li>프로젝트 생성 시 기본 폴더 자동 생성</li></h5>
				<h5><li>폴더 생성 기능</li></h5>
				<h5><li>검색 기능</li></h5>
			</ul>
			</div>
		</div>
	</div>
	
	
	
	<div class="page-wrapper sectionPart w-100 ml-0" style="height:470px; margin-bottom:100px;">
		<div class="text-center" style="margin-bottom: 70px;"><h1>OWL YOUR WAY !</h1></div>
	
	<div class="row text-center" style="padding-left: 200px; padding-right:200px; margin-bottom: 30px;">
	<div class="col-3">
		<img class="introIcon" src="resources/images/indexIcon/global.png"  height="200" width="200" data-aos="fade-up" data-aos-duration="1500" >
		<h2>Team Work</h2>
		<span class="subfont">OWL을 사용하면 팀 구성이 쉽고 </span><br>
		<span class="subfont">어디서든 팀원간의 소통이 가능합니다</span>
	</div>
	<div class="col-3">
		<img class="introIcon" src="resources/images/indexIcon/customizing.png"  height="200" width="200"  data-aos="fade-up" data-aos-duration="1500" >
		<h2>Customizing</h2>
		<span class="subfont">개인별 혹은 프로젝트별로 </span><br>
		<span class="subfont">커스터마이징이 가능합니다</span>
	</div>
	<div class="col-3">
		  <img class="introIcon" src="resources/images/indexIcon/chatting.png"  height="200" width="200"  data-aos="fade-up" data-aos-duration="1500" >
		<h2>Chatting</h2>
		<span class="subfont">일대일, 프로젝트별, 다수의 사람들과</span><br>
		<span class="subfont">다양한 채팅을 즐겨보세요</span>
	</div>
	<div class="col-3">
		 <img class="introIcon" src="resources/images/indexIcon/alarm.png"height="200" width="200" data-aos="fade-up" data-aos-duration="1500" >
		<h2>Alarm</h2>
		<span class="subfont">알람을 통해서 프로젝트내에서 </span><br>
		<span class="subfont">업무효율을 높여보세요</span>
	</div>
      </div>
	</div>
	
	
	</div>
	<jsp:include page="include/bottom.jsp"/>  
   <!--  Modal  -->
   <jsp:include page="member/modal/forgotPassword.jsp" />
   <jsp:include page="member/modal/joinConfirm.jsp" />
   <jsp:include page="member/modal/joinOk.jsp" />
</body>