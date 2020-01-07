<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/plugins/common/common.min.js"></script>
<!-- Custom Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">
<jsp:include page="WEB-INF/views/include/headTag.jsp"/>
<script type="text/javascript">
	$(function(){
		 $("#opneModal").click();
/*
		$("#confirmModal").on('hide.bs.modal', function () {
			console.log("close");
	    	location.href="Index.do";
      	});  */
	})
</script>
<style>

</style>
</head>
<body>
<input type="hidden" id="opneModal" data-toggle="modal" data-target="#confirmModal">
<div class="modal fade" id="confirmModal" tabindex="-2" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
      <div class="text-center" >
      		<img class="mt-4 mb-5" src="resources/images/owl_logo_fit.png" style="width: 120px">
            <h5 class="m-0">개인과 팀 모두가 만족하는 OWL 지금 시작하세요.</h5>
       </div>
       
       <div class="mt-5">
	       <button class="btn btn-lg w-100 btn-primary" style="height: 50px;" onclick="location.href='Index.do?show=login'">
	       		<span>5</span>초 후 로그인 페이지로 이동합니다. 
	       </button>
       </div>
       
        <div class="mt-5 text-center login-form__footer">
        	<p class="m-0">you have account? <a href="Index" class="text-primary ">Login</a> now<p>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>