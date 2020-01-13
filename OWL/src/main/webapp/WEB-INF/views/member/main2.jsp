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
    <!-- <link href="resources/css/style.css" rel="stylesheet"> -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 	 <jsp:include page="../include/headTag.jsp"/>
 	 
 	 <script type="text/javascript">
		$(function(){
			$("#SideMenu  [class$='_page']").on("click",function(){
				let data = { page : $(this).attr("class")};
				if(data.page == "project_page"){
					console.log("project");
					data.projectIdx = $(this).attr("id");
				}
				console.log(data);
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
        <jsp:include page="../include/sideBar2.jsp"/>
         
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
    <script src="resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
    <script src="resources/js/dashboard/dashboard-1.js"></script>
</html>
