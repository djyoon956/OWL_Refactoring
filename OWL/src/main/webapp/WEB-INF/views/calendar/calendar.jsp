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
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">

    <!-- Custom Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">

</head>

<body>

    <div id="main-wrapper">

        <!-- Top -->
        <jsp:include page="../include/top.jsp"/>
       
 		<!-- SideBar -->
        <jsp:include page="../include/sideBar.jsp"/>
         
        <!-- Content -->
        <div class="content-body">
            <div class="container-fluid mt-3">대시보드
            <a href="#" data-toggle="modal" data-target="#projectModal"> 어쩌구
            </a>
            </div>
        </div>
        
        <!-- Bottom -->
		<jsp:include page="../include/bottom.jsp"/>
    </div>
	
	<jsp:include page="../login/modal/createProject.jsp"/>
    <!--Scripts-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
  

    <!-- Circle progress -->
    <script src="resources/plugins/circle-progress/circle-progress.min.js"></script>

</body>
</html>
