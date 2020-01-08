<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Main</title>
    <!-- Favicon icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link href="resources/css/style.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#calLi").addClass("active");
}); 
</script>    
</head>

<body>

    <div id="main-wrapper">

        <!-- Top -->
        <jsp:include page="../include/top.jsp"/>
       
 		<!-- SideBar -->
        <jsp:include page="../include/sideBar.jsp"/>
         
        <!-- Content -->
        <div class="content-body">
        <!-- Project 상단 바 -->
        <jsp:include page="../include/projectTab.jsp"/>
            <div class="container-fluid mt-3">	
            	<jsp:include page="calendar2.jsp"/>
            </div>
        </div>
        
        <!-- Bottom -->
		<jsp:include page="../include/bottom.jsp"/>
    </div>
	
	<jsp:include page="../project/modal/createProject.jsp"/>
	 <!-- pm의 설정  modal -->
	 <jsp:include page="../project/modal/projectMemberEdit.jsp" />
	 <jsp:include page="../project/modal/labelEdit.jsp" />
    <!--Scripts-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
  

    <!-- Circle progress -->
    <script src="resources/plugins/circle-progress/circle-progress.min.js"></script>

	
</body>
</html>
