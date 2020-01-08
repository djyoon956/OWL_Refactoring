<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>OWL</title>
<jsp:include page="include/headTag.jsp" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
   href="resources/images/favicon.png">
<!-- Pignose Calender -->
<link href="resources/plugins/pg-calendar/css/pignose.calendar.min.css"
   rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
   href="resources/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
   href="resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
   href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- fontawesome -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="resources/js/commonSweetAlert.js"></script>
<style type="text/css">
.snsLoginButton {
   background-color: transparent;
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
          $(this).find('form').trigger('reset');
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
          $(this).find('form').trigger('reset');
           $('html, body').css({'overflow': 'auto', 'height': '100%'}); 
         }); 
         
       $("#findPwdModal").on('show.bs.modal', function () {
           $("#loginModal").modal("hide");
           $('html, body').css({'overflow': 'hidden', 'height': '100%'}); 
         });  
       $("#findPwdModal").on('hide.bs.modal', function () {
          $(this).find('form').trigger('reset');
           $('html, body').css({'overflow': 'auto', 'height': '100%'}); 
         }); 

       $("#joinOkModal").on('show.bs.modal', function () {
             let interval = 3;
                let changeTime = setInterval(function(){
                   if(interval < 0){
                      clearTimeout(changeTime);
                      $("#joinOkModal").modal("hide");
                      $("#loginModal  #email").val("${memberId}");
                  $("#loginBtn").click();
                   }
                   
                   $("#joinOkModal #changeTime").text(interval--);
                }, 1000)
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
      
      $("#profileImage").click(function(){
         $("#profileFile").click();
      })

      $("#profileFile").change(function(){
         console.log("chagne");
          let file    = document.querySelector('input[type=file]').files[0];
          let reader  = new FileReader();

           reader.onloadend = function () {
              $("#profileImage").attr("src",reader.result)
           }

           if (file) {
             reader.readAsDataURL(file);
           } else {
             preview.src = "resources/images/login/profile.png";
           }
      })

      $("#joinModal  #name").keyup(function(event){
         if($("#name").val().length < 1)
            $( "#name").siblings( ".text-danger" ).css( "display", "block" );
         else
            $( "#name").siblings( ".text-danger" ).css( "display", "none" );
      })
       $("#joinModal  #email").keyup(function(event){
         let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         if ($("#email").val().match(regExp) != null) 
            $( "#email").siblings( ".text-danger" ).css( "display", "none" );
         else
            $( "#email").siblings( ".text-danger" ).css( "display", "block" );
      })
      $("#joinModal  #pwd").keyup(function(event){
         console.log("in pwd");
         if($("#pwd").val().length < 8)
            $( "#pwd").siblings( ".text-danger" ).css( "display", "block" );
         else
            $( "#pwd").siblings( ".text-danger" ).css( "display", "none" );
      })

      openDialog();
})

function openDialog() {
   let type="${show}";
   if(!type) return;
   else if(type === "joinEmail") $("#opneJoinEmailModal").click();
   else if(type === "joinOk") {
      $('#joinOkModal').modal({backdrop: 'static', keyboard: false})  
      $("#opneJoinOkModal").click();
   }
}

   </script>
</head>

<body>
<!-- ProgressBar -->
<!--    
   <div id="preloader">
      <div class="loader">
         <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
               stroke-width="3" stroke-miterlimit="10" />
            </svg>
      </div>
   </div> -->


   <div id="main-wrapper">

      <!-- Top -->
      <div class="header-row" style="background-color: black">
         <div class="header-content clearfix">

            <div class="header-left">

               <div class="nav-header" style="padding-left: 200px;background-color: black">

                  <a href="Index.do" > 
               <!--    <b class="logo-abbr"><img src="resources/images/logo.png" alt="">   </b> -->
                        <img src="resources/images/owl_logo_real.png" alt="">
                     
                  </a>

               </div>
            </div>

            <div class="header-right">
               <ul class="clearfix">

                  <li class="icons dropdown d-none d-md-flex"><a href="#"
                     data-toggle="modal" data-target="#loginModal">
                        <button type="button" id="loginBtn" class="btn mb-1 btn-primary">Login
                           / Register</button>
                  </a></li>
               </ul>
            </div>
         </div>
      </div>



      <!-- Content -->
      <div class="content-main">
         <div class="container-fluid">
메인 부분 

  

</div>
      </div>

      <!-- Bottom -->
      <jsp:include page="include/bottom.jsp" />
   </div>

   <!--  Modal  -->
   <jsp:include page="member/modal/login.jsp" />
   <jsp:include page="member/modal/join.jsp" />
   <jsp:include page="member/modal/forgotPassword.jsp" />
   <jsp:include page="member/modal/joinConfirm.jsp" />
   <jsp:include page="member/modal/joinOk.jsp" />

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
   <script
      src="resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
   <script src="resources/js/dashboard/dashboard-1.js"></script>

</body>

</html>