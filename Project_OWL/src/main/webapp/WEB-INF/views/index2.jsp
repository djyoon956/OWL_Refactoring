<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/assets/images/favicon.png">
    <title>OWL</title>
    <jsp:include page="include/headTag.jsp"/>
<style type="text/css">
/* 첫 메인 css */
.mainBack {
background-color:#326295;
}
.e{
  position: absolute;
  left:50%;
  top:50%;
  transform:translate(-50%,-50%);
}

.d{
  position: absolute;
  left:50%;
  top:80%;
  transform:translate(-50%,-50%);

}
.main_h1{
  font-size:120px;
  font-weight:700;
  font-family: 'Montserrat', sans-serif;
  text-align:center;
  color:#fff;
  letter-spacing:0px;
  transition:1s;
  -webkit-transition:1s;
  -ms-transition:1s;
  position: relative;
  padding:10px;
 
}

.main_h1:before,
.main_h1:after{
  content:"";
  position: absolute;
  height: 7px;
  width: 0px;
  background:#fff;
  transition:300ms;
  -webkit-transition:1s;
  -ms-transition:1s;
  opacity:0.3;
  left:50%;
}

.main_h1:before{
  bottom:0;
 
}

.main_h1:after{
  top:0;
  
}

.main_h1:hover{
  letter-spacing:30px;
}

.main_h1:hover:before,
.main_h1:hover:after{
   width: 95%;
    opacity:1;
  left:0;

}
.main_h1:hover ~ h2{
  opacity:0;
}

h2{
  color:#fff;
  font-family: 'Kalam', cursive;
  text-align:center;
  font-size:40px;
  font-weight:200;
  bottom:80%;
  transition:1s;
  -webkit-transition:1s;
  -ms-transition:1s;
  opacity:0.2;
  width: 400px;
  right: 100px;
} 


</style>
</head>

<body>
	<!-- LOADER -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
   
    <div id="main-wrapper">
        
		<!-- TOP -->
       <%--  <jsp:include page="include/top.jsp"/> --%>
       
        <!-- SIDE BAR -->
<%--         <jsp:include page="include/sideBar.jsp"/> --%>

		<!-- CONTENT BOX -->
		
<!--  top   -->
<!-- <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">Login</a></li>
        <li><a href="#myPage">Register</a></li>
      </ul>
    </div>
  </div>
</nav> -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">
    <img src="bird.jpg" alt="logo" style="width:40px;">
  </a>
  
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Link 1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 2</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 3</a>
    </li>
  </ul>
</nav>

		<div class="page-wrapper" style="margin-left: 0; width: 100%; height: 700px;">
		

			<!-- CONTENT MAIN -->
			<div class="container-fluid mainBack" style="height: 100%">
				<a href="Main2.do">메인으로 이동하기 </a>
				<div class="e text-center">
					<h1 class="main_h1">OWL</h1>
				</div>
				<div class="d text-center">
					<h5 style="color: lightgrey;">Our Work Leader</h5>
					<p style="color: lightgrey;">효과적인 팀워크와 가벼워진 업무를 이끌어내는 공간, OWL</p>
				</div>
			</div>

			<!-- BOTTOM -->
			 <jsp:include page="include/bottom.jsp"/> 
		</div>
	</div>
</body>