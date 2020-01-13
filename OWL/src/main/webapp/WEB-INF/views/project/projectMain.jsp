<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>프로젝트 대시보드</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <jsp:include page="../include/headTag.jsp"/>
	<link href="resources/project/css/project.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
	let oldMenu = $("#projectMenu li:first");
	$("#projectMenu li").on("click", function() {
       console.log("menu in");
       oldMenu.removeClass("active");
       $(this).addClass("active");
       oldMenu = $(this);
    });
	
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
   		<!-- Tab -->
        <div id="tab-menu">
        <div class="row">
			<div class="col-md-11">
        	<div id="tab-btn">
	               <ul id="projectMenu" class="nav nav-tabs" role="tablist" style="border-bottom-width: 0px;">
	                   <li class="nav-item active">
	                   		<a class="nav-link" data-toggle="tab" href="#dash">Dash Board</a>
	                   </li>
	                   <li class="nav-item">
	                   		<a class="nav-link" data-toggle="tab" href="#calendar">Calendar</a>
	                   </li>
	                   <li class="nav-item">
	                   		<a class="nav-link" data-toggle="tab" href="#kanban">Kanban Board</a>
	                   </li>
	                   <li class="nav-item">
	                   		<a class="nav-link" data-toggle="tab" href="#notice">Notice</a>
	                   </li>
	                   <li class="nav-item">
	                   		<a class="nav-link" data-toggle="tab" href="#drive">Drive</a>
	                   </li>
	               </ul>
               </div>
               </div>
               </div>
               
           </div>
           <div class="tab-content">
                  <div class=" tab-pane fade show active" id="dash" role="tabpanel">
                   		Dash Board
                  </div>
                   <div class=" tab-pane fade" id="calendar" role="tabpanel">
                       Calendar
                   </div>
                   <div class=" tab-pane fade" id="kanban" role="tabpanel">
                       Kanban Board
                   </div>
                   <div class=" tab-pane fade" id="notice" role="tabpanel">
                       <jsp:include page="../notice/notice.jsp"/>
                   </div>
                   <div class=" tab-pane fade" id="drive" role="tabpanel">
                       Drive
                   </div>
               </div>
        </div>
        
        <!-- Bottom -->
		<jsp:include page="../include/bottom.jsp"/>
		
		<!-- pm의 설정  modal -->
	    <jsp:include page="modal/projectMemberEdit.jsp" />
	    <jsp:include page="modal/labelEdit.jsp" />
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
	<!-- Color Picker Plugin JavaScript -->
	<script src="resources/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
	<script src="resources/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
	<script src="resources/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
</body>
</html>
