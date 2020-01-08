<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>OWL</title>
<jsp:include page="../include/headTag.jsp" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">

<!-- Kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="resources/js/commonSweetAlert.js"></script>
<style type="text/css">
 html, body {
            height: 100%;
        }
.snsLoginButton {
   background-color: transparent;
   border: none;
   width: 50px;
   height: 50px;
   cursor: pointer;
}

#wrapper {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
}

#wrapper #content-wrapper {
  overflow-x: hidden;
  width: 100%;
  padding-top: 1rem;
  padding-bottom: 30px;
}

#wrapper #content-main {
  overflow-x: hidden;
  width: 100%;
  padding-bottom: 30px;
}
.resume-section {
    padding-top: 3rem!important;
    padding-bottom: 3rem!important;
        min-height: 100vh;
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

<body id="page-top">
    <!-- Top -->
    <!-- <c:import url="/common/Top.jsp"/> -->
    <div id="wrapper">
        <!-- Left Menu -->
        <!-- <c:import url="/common/Left.jsp"/> -->

        <div id="content-wrapper">

            <!-- !! Content !! -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-check"></i>
                        로그인
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form action="LoginOk.do" method="post">
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="text" id="userid" name="userid" class="form-control"
                                                        placeholder="ID" required="required" autofocus="autofocus">
                                                    <label for="userid">ID</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-label-group">
                                                    <input type="password" id="pwd" name="pwd" class="form-control"
                                                        placeholder="Password" required="required">
                                                    <label for="pwd">Password</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value="remember-me"> Remember ID
                                                    </label>
                                                </div>
                                            </div>
                                            <input type="submit" value="Login" class="btn btn-primary btn-block">
                                        </form>
                                        <div class="text-center">
                                            <a class="d-block small mt-3" href="Register.do">Register an
                                                Account</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

          
        </div>
    </div>
            <jsp:include page="../include/bottom.jsp"></jsp:include>
</body>

</html>