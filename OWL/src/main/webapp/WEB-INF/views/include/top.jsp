<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Kalam:700&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript" ></script>

 
        <div class="nav-header" style="background-color: #fcf9f5;">
            <div class="brand-logo">
                <a href="index.html">
                    <b class="logo-abbr"><img src="resources/images/owl_logo_medium.png" alt=""> </b>
                    <span class="logo-compact"><img src="resources/images/owl_logo_another.png" alt=""></span>
                    <span class="brand-title">
                        <img src="resources/images/owl_logo_another.png" alt="">
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
                 <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                         <i class="mdi mdi-email-outline"></i>
                         <i class="mdi mdi-email-outline" style="display:none;"></i>
                         
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
                             </ul>
                         </div>
                     </div>
                 </li>
                 
                 <!-- Alram -->
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
                             </ul>
                         </div>
                     </div>
                 </li>
                 
                 <!-- Setting - customizing -->
                 <li class="icons toggle-icon siteMapBtn">
                 <a href="javascript:void(0)">
                         <i class="mdi mdi-settings"></i>
                     </a>
                 </li>

             </ul>
             

         </div>
     </div>
 </div>
 
 <div id="leftmenuArea" style="text-align: right"> </div>
 
 
 <style>
 #leftmenuArea{height:900px; width:500px; background-color:#3e3d3d; font-family:'Malgun Gothic',Dotum,AppleGothic,sans-serif;}
 .siteMapBtn i {
   position: absolute;
   top: 10px;
   right: 40px;
   z-index: 1;
   display: block;
   font-size:3em;
   color: #444;
   cursor: pointer;
   transform: translate3d(0, 0, 0);
   transition: transform .10s;
}
 </style>
 
 <script>
$(document).ready(function(){
    $("#leftmenuArea").show();
    $(".siteMapBtn").click(function(){
       $(".siteMapBtn i").toggle();
    $('#leftmenuArea').animate({width:'toggle'});
    })

})
</script>










<!-- 

             Setting - customizing
                 <li class="icons toggle-icon">
                 <a href="javascript:void(0)" data-toggle="dropdown">
                         <i class="mdi mdi-settings"></i>
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
                             </ul>
                         </div>
                     </div> 
                 </li> -->
 