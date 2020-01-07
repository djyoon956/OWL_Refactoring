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
    
    <!-- Color picker plugins css -->
    <link href="resources/plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">

<style type="text/css">
#tab-menu {
	width: 100%;
	background: white;
	border-bottom: 1px double #326295;
	font-family: 'Source Sans Pro', sans-serif;
}
#tab-btn ul {
   overflow: hidden;
   margin-bottom: 0px;
}

#tab-btn li {
   float: left;
   width: 150px;
   text-align: center;
}

#tab-btn li a {
   display: block;
   color: #326295;
   padding: 15px 20px;
   font-weight: bold;
}

#tab-btn li.active a {
   border-bottom: 3px solid #326295;
   color: #326295;
}
.iconSize {
    font-size: 1.4rem;
    line-height: 2rem;
    color:  #326295; 
}
.iconSizeBig {
    font-size: 2rem;
    line-height: 2rem;
    color:  #326295; 
}
.modal-scroll{
    max-height: calc(100vh - 200px);
    overflow-y: auto;
}
</style>
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
			<div id="tab-menu">
				<div class="row">
					<div class="col-md-11">
						<div id="tab-btn">
							<ul>
								<li class="active"><a href="#">Dash Board</a></li>
								<li><a href="Calendar.do">Calendar</a></li>
								<li><a href="kanbanMainiy.do">Kanban Board</a></li>
								<li><a href="#">Notice</a></li>
								<li><a href="Drive.do">Drive</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-1 mt-2 text-center">
				<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                         <i class="icon-settings iconSize"></i>
                  </a>
                     <div class=" dropdown-menu">
                         <div class="dropdown-content-body">
                             <ul>
                                 <li><a href="#memberEditModal" data-toggle="modal">프로젝트멤버  설정</a></li>
                                 <li><a href="#labelEditModal" data-toggle="modal">라벨 추가</a></li>
                             </ul>
                         </div>
                     </div>
                 </li>
					</div>
				</div>
			</div>

			<div class="container-fluid mt-3"> 프로젝트 대시보드
            </div>
        </div>
        
        <!-- Bottom -->
		<jsp:include page="../include/bottom.jsp"/>
		
		<!--  modal -->
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
