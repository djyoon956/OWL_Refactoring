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
    <!-- Pignose Calender -->
    <link href="resources/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="resources/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
 	 <jsp:include page="../include/headTag.jsp"/>
 	<link href="resources/project/css/project.css" rel="stylesheet">
 	
 	 <script type="text/javascript">
		$(function(){
			$("#SideMenu  [class$='_page']").on("click",function(){
				let data = { page : $(this).attr("class")};
				if(data.page == "project_page")
					data.projectIdx = $(this).attr("id");

				$.ajax({
			        type : "GET",
			        url : "PageChage.do",
			        data : data,
			        dataType : "html",
			        success : function(data) {
			            $('#ContentBox').html(data);
			        }
			    });
			})
		})
			
 	 </script>
</head>

<body>

    <div id="main-wrapper">

        <!-- Top -->
        <jsp:include page="../include/top.jsp"/>
       
 		<!-- SideBar -->
        <jsp:include page="../include/sideBar.jsp"/>
         
        <!-- Content -->
        <div class="content-body ">
            <div id="ContentBox" class="container-fluid" style="padding: 0">
            
            </div>
        </div>
        
        <!-- Bottom -->
		<jsp:include page="../include/bottom.jsp"/>
    </div>

    <!--Scripts-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
</html>
