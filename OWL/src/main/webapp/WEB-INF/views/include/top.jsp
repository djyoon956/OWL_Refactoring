<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Kalam:700&display=swap" rel="stylesheet">
<style>
.logo {
  font-family: 'Kalam', cursive;
  text-transform: uppercase;
  display: block;
  font-size: 92px;
  color: #326295;
  text-shadow: 0 8px 9px #c4b59d, 0px -2px 1px #fff;
  font-weight: bold;
  letter-spacing: -4px;
  text-align: center;
  position: absolute;
  padding: 100px 200px;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  border-radius: 20px;
}
</style>
<div class="nav-header" style="background-color: #fcf9f5;">
     <div class="brand-logo">
         <a href="Index.do">
             <b class="logo-abbr"><img src="resources/images/logo.png" alt=""> </b>
			 <span class="logo" style="font-size: 30px; color: #326295;">OWL</span>
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
                                     <a href="Lock.do"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                 </li>
                                 <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                             </ul>
                         </div>
                     </div>
                 </li>             
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
             </ul>
         </div>
     </div>
 </div>
 