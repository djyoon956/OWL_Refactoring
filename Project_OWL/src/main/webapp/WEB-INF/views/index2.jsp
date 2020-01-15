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
.main_h1:hover ~ .main_h2 {
  opacity:0;
}

.main_h2{
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
/* 첫 main nav */
.header-row {
  height: 5rem;
  z-index: 1;
  position: relative;
  padding: 0 15.1875rem;
  background: #fff;
  transition: all .2s ease; }
  .header-row .header-content {
    height: 100%; }
 [data-sidebar-style="mini"] .header-content {
 margin-left: 0; }
 [data-sidebar-style="mini"] .header-content .header-left {
 margin-left: 0.625rem; }
 [data-sidebar-style="mini"] .header-content .header-left .drop-down {
 top: 0.3125rem; }
@media (max-width: 767px) {
  .nav-header {
    width: 3.75rem; }
    .nav-header .brand-title {
      display: none; }
  .header-left {
    margin-left: 1.875rem; }
    [direction="rtl"] .header-left {
      margin-left: auto;
      margin-right: 1.875rem; }
  .header-content {
    margin-left: 3.75rem; }
    [direction="rtl"] .header-content {
      margin-left: 0; } }    
 .clearfix::after {
  display: block;
  clear: both;
  content: ""; }
    
.header-right {
  float: right;
  line-height: 3rem;
  margin-top: 0;
  height: 100%; }
  .header-right ul {
    height: 100%;
    margin: 0; }
  .header-right .icons {
    float: left;
    margin: 0;
    padding: 0 0.3125rem;
    position: relative;
    height: 100%;
    display: flex;
    align-items: center; }
    @media (max-width: 575.98px) {
      .header-right .icons {
        padding: 0 0.2825rem; } }
    .header-right .icons > a {
      padding: 0 0.3125rem;
      color: #464a53; }
    .header-right .icons .dropdown-profile .badge {
      top: auto;
      bottom: auto;
      left: auto;
      right: 1.25rem; }
    .header-right .icons .badge {
      color: #fff;
      height: 1.25rem;
      width: 1.25rem;
      line-height: 0.875rem;
      font-size: 0.75rem;
      position: absolute;
      right: -2px;
      top: 2px; }
    .header-right .icons .user-img {
      position: relative;
      top: -7px; }
      .header-right .icons .user-img img {
        height: 40px;
        width: 40px;
        border: 3px solid #fff;
        border-radius: 50%;
        margin: 0;
        padding: 0;
        box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1); }
      .header-right .icons .user-img .activity {
        height: 13px;
        width: 13px;
        border-radius: 50%;
        display: inline-block;
        position: absolute;
        border: 3px solid #fff;
        bottom: .4rem;
        right: 0rem;
        padding: 0;
        top: auto;
        left: auto; }
    .header-right .icons .dropdown-content-heading .badge {
      position: relative;
      top: auto;
      left: auto;
      right: auto;
      bottom: auto; }
      
.header-left {
  float: left;
  margin-left: 50px;
  height: 100%; }
  .header-left .icons {
    float: left;
    margin: 0;
    padding: 0 0.3125rem;
    position: relative; }
    .header-left .icons > a {
      padding: 0 0.3125rem;
      color: #464a53; }
  .header-left .input-group {
    margin-top: 17px; }
    .header-left .input-group input {
      border-radius: 5px !important; }
    .header-left .input-group .input-group-text {
      font-size: 1.375rem; }
      @media (max-width: 575.98px) {
        .header-left .input-group .input-group-text {
          padding-left: .5rem; } }
  .header-left .drop-down {
    top: 0;
    height: 100%;
    box-shadow: none;
    width: 100%; }
    .header-left .drop-down form {
      height: 100%; }
    .header-left .drop-down input.form-control {
      height: 100%;
      border: none; }
      .header-left .drop-down input.form-control:focus {
        box-shadow: none; }

[data-sidebar-style="compact"] .header-left {
  margin-left: 0; }

.icons > a {
  position: relative;
  display: inline-block; }
  .icons > a i {
    font-size: 1.25rem;
    color: #fff; }

.icons.active .drop-down {
  display: block; }
@media (min-width: 768px) {
  .d-md-none {
    display: none !important; }
  .d-md-inline {
    display: inline !important; }
  .d-md-inline-block {
    display: inline-block !important; }
  .d-md-block {
    display: block !important; }
  .d-md-table {
    display: table !important; }
  .d-md-table-row {
    display: table-row !important; }
  .d-md-table-cell {
    display: table-cell !important; }
  .d-md-flex {
    display: flex !important; }
  .d-md-inline-flex {
    display: inline-flex !important; } }
/* .d-none {
  display: none !important; } */
.mb-1,
.my-1 {
  margin-bottom: 0.25rem !important; }
  
.btn-primary:active, .btn-primary:focus, .btn-primary:hover {
  background: #326295 !important;
  color: #fff;
  border-color: #326295; }
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
 <!--  <div class="row">
  <div class="col-md-6">
  <a class="navbar-brand" href="#">
    <img src="resources/images/owl_logo_real.png" alt="" height="80">
  </a>
  </div>
  <div class="col-md-6" style="text-align: right">
                  <div class="col-md-6 offset-6">
                  <a href="Login.do" >
                        <button type="button" id="loginBtn" class="btn mb-1 btn-primary">Login
                           / Register</button>
                  </a></div>
              
    </div>
 </div> -->
      <!-- Top -->
      <div class="header-row">
         <div class="header-content clearfix">

            <div class="header-left">

               <div class="nav-header" style="padding-left: 200px;">

                  <a href="Index.do" > 
               <!--    <b class="logo-abbr"><img src="resources/images/logo.png" alt="">   </b> -->
                        <img src="resources/images/owl_logo_real.png" alt="">
                     
                  </a>

               </div>
            </div>

            <div class="header-right">
               <ul class="clearfix">

                  <li class="icons dropdown d-none d-md-flex"><a href="Login.do" >
                        <button type="button" id="loginBtn" class="btn mb-1 btn-primary">Login
                           / Register</button>
                  </a></li>
               </ul>
            </div>
         </div>
      </div>



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