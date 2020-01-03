<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name= "viewport" content = "initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no">
    <title>Main</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <!-- Pignose Calender -->
    <link href="resources/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
<!--     <link rel="stylesheet" href="resources/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"> -->
    <!-- Custom Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
    <!--  칸반 -->

	<!-- css files -->
	<link rel="stylesheet" href="resources/webix/webix.css" type="text/css">
	<link rel="stylesheet" href="resources/webix/kanban.css" type="text/css" >
    	<!--  칸반  -->
	<script src="resources/webix/data.js?v=7.1.1"></script>
    
	<!-- webix -->
	<script src="resources/webix/webix.js"></script>
	<script src="resources/webix/kanban.js"></script>
</head>

<body>

    <div id="main-wrapper">

        <!-- Top -->
        <jsp:include page="../include/top.jsp"/>
       
 		<!-- SideBar -->
        <jsp:include page="../include/sideBar.jsp"/>
         
        <!-- Content -->
        <div class="content-body">
            <div class="container-fluid mt-3">
            <!--  칸반 시작 -->


	<script type="text/javascript">
	webix.ready(function(){

		if (!webix.env.touch && webix.env.scrollSize)
			webix.CustomScroll.init();
	
	    //object constructor
	    webix.ui({
	        view:"kanban",
	        type:"space",
	        //the structure of columns on the board
	        cols:[
	            { header:"Backlog",
	                body:{ view:"kanbanlist", status:"new" }},
	            { header:"In Progress",
	                body:{ view:"kanbanlist", status:"work" }},
	            { header:"Testing",
	                body:{ view:"kanbanlist", status:"test" }},
	            { header:"Done",
	                body:{ view:"kanbanlist", status:"done" }}
	        ],
	        data: base_task_set
	   });
	});
	</script>
            <!--  칸반 끝  -->
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

</body>
</html>
