<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Kalam:700&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript" ></script>
<script> 
$(document).ready(function(){
  $("#chatBtn").click(function(){
	  $("#alarmtoggle").hide();
	  $("#settingtoggle").hide();
    $("#chattoggle").animate({
      height: 'toggle'
    });
  });

  $("#alarmBtn").click(function(){
	  $("#chattoggle").hide();
	  $("#settingtoggle").hide();
	    $("#alarmtoggle").animate({
	      height: 'toggle'
	    });
	  });

  $("#settingBtn").click(function(){
	  $("#chattoggle").hide();
	  $("#alarmtoggle").hide();
	    $("#settingtoggle").animate({
	      height: 'toggle'
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
            <div >
                <a href="index.html" style="padding: 0">
                    <b><img src="resources/images/owl_logo_medium.png" alt=""> </b>
                    <span class="logo-compact"><img src="resources/images/owl_logo_real.png" alt=""></span>
                    <span class="brand-title">
                        <img src="resources/images/owl_logo_real.png" alt="">
                    </span>
                </a>
            </div>
        </div>
 

 <div class="header" style="background-color: #fcf9f5;">    
     <div class="header-content clearfix">
         
         <div class="nav-control">
             <div class="hamburger">
                 <span class="toggle-icon" style="color: #326295;"><i class="icon-menu"></i></span>
             </div>
         </div>

         <div class="header-right">
             <ul class="clearfix">
             
             <!-- User info  -->
                 <li class="icons dropdown" style="margin-left: 30px; margin-right: 25px">
                     <div class="user-img c-pointer position-relative" data-toggle="dropdown">
                         <span class="activity active"></span>
                         <img src="resources/images/user/1.png" height="40" width="40" alt="">
                     </div>
                     <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                         <div class="dropdown-content-body">
                             <ul>
                                 <li>
                                     <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                 </li>
                                 
                                 <hr class="my-2">
                                 <li>
                                     <a href="Lock.do"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                 </li>
                                 <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                             </ul>
                         </div>
                     </div>
                 </li>         
                 
                 <!-- Chatting -->    
                 <li class="icons " style="margin-right: 25px">
                         <a href="javascript:void(0)" id="chatBtn"><i class="far fa-comment"></i></a>
                         
<!--                          <span class="badge badge-pill gradient-1">3</span>
 -->                     
                 </li>
                 
                 <!-- Alram -->
                 <li class="icons " style=" margin-right: 25px">
                  <a href="javascript:void(0)" id="alarmBtn"><i class="far fa-bell"></i></a>
<!--                          <span class="badge badge-pill gradient-2">3</span>
 -->                     
 
                 </li>
                 
                  <!--  Setting - customizing -->
                 <li class="icons " style="margin-right: 30px">
                  <a href="javascript:void(0)" id="settingBtn"><i class="fas fa-cog"></i></a>

                 </li>

   
             </ul>
             
             
             
  <!-- toggle content -->           
 <div id="chattoggle" style="padding-top:30px; background:#fcf9f5; height:1185%; width:500px;position:absolute;">
 채팅토글입니다
 </div>
 
  <div id="alarmtoggle" style="padding-top:30px; background:#fcf9f5; height:1185%; width:500px;position:absolute;">
  알람토글입니다
  </div>
  
  <div id="settingtoggle" style="padding-top:30px; background:#fcf9f5; height:1185%; width:500px;position:absolute;">
  셋팅토글입니다.
  </div>
 
         </div>
         
         
     </div>
 </div>
 
 
 
 
