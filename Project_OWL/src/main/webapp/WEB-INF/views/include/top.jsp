<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
	 $("#settingBtn").on({
		    mouseover: function (event) {
		    	$("#setIcon").addClass("fa-spin");
		    },
		    mouseleave: function (event) {
		    	$("#setIcon").removeClass("fa-spin");
		    }
		});

	});
</script>



<header class="topbar" data-navbarbg="skin5">
    <nav class="navbar top-navbar navbar-expand-md navbar-dark">
        <div class="navbar-header" data-logobg="skin5">
            <!-- This is for the sidebar toggle which is visible on mobile only -->
            <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            <!-- ============================================================== -->
            <!-- Logo -->
            <!-- ============================================================== -->
            <a class="navbar-brand" href="index.html">
                <!-- Logo icon -->
                <b class="logo-icon p-l-10">
                    <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                    <!-- Dark Logo icon -->
                    <img src="resources/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
                   
                </b>
                <!--End Logo icon -->
                 <!-- Logo text -->
                <span class="logo-text">
                     <!-- dark Logo text -->
                     <img src="resources/assets/images/logo-text.png" alt="homepage" class="light-logo" />
                    
                </span>
                <!-- Logo icon -->
                <!-- <b class="logo-icon"> -->
                    <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                    <!-- Dark Logo icon -->
                    <!-- <img src="../../assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->
                    
                <!-- </b> -->
                <!--End Logo icon -->
            </a>
            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Toggle which is visible on mobile only -->
            <!-- ============================================================== -->
            <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
        </div>
        <!-- ============================================================== -->
        <!-- End Logo -->
        <!-- ============================================================== -->
        <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
            <!-- ============================================================== -->
            <!-- toggle and nav items -->
            <!-- ============================================================== -->
            <ul class="navbar-nav float-left mr-auto">
                <li class="nav-item d-none d-md-block">
                	<a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar">
                		<i class="mdi mdi-menu font-24"></i>
                	</a>
                </li>
            </ul>
            <!-- ============================================================== -->
            <!-- Right side toggle and nav items -->
            <!-- ============================================================== -->
            <ul class="navbar-nav float-right">
                <!-- ============================================================== -->
                <!-- Comment -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- User profile and search -->
                <!-- ============================================================== -->
                <li class="nav-item dropdown">
                <div class="user-img c-pointer"> <!-- 빼도됨 -->
                    <a class="nav-link text-muted waves-effect waves-dark pro-pic" href="javascript:void(0)" id="userBtn">
                    	<img id="userImgTop" src="upload/${member.profilePic}" onerror="this.src='resources/images/login/profile.png'" height="40" width="40" alt="">
                    </a>
                </div>
                </li>
                <!-- ============================================================== -->
                <!-- User profile and search -->
                <!-- ============================================================== -->
       
                  <!-- Chatting Icon -->
                 <li class="nav-item ">
                  <a class="nav-link waves-effect waves-dark" href="javascript:void(0)" id="chatBtn"> 
                   	 	<i class="far fa-comment fa-lg"></i>
                    </a>
                </li>
                
                <!-- Alarm Icon -->
                <li class="nav-item ">
                    <a class="nav-link waves-effect waves-dark" href="javascript:void(0)" id="alarmBtn"> 
                    	<i class="far fa-bell fa-lg"></i>
                    </a>
                </li>
                
                <!-- Setting Icon -->
                 <li class="nav-item ">
                    <a class="nav-link waves-effect waves-dark" href="javascript:void(0)" id="settingBtn"> 
                    	<i class="fas fa-cog fa-lg" id="setIcon"></i>
                    </a>
                </li>
            </ul>
            
        </div>
        
    </nav>
</header>