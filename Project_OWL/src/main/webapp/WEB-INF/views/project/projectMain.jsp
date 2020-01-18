<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="project" value="${project}" scope="request"/>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>OWL</title>
	<jsp:include page="../include/headTag.jsp" />
	<link href="resources/css/project.css" rel="stylesheet">
	<!--  dashboard css -->
	<link href="resources/css/dashBoard.css" rel="stylesheet">
	
	<!-- DataTable -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.css"/>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.js"></script>

	<!-- SummerNote -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    
     <!-- Toast Ui -->
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
    <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.dom/v3.0.0/tui-dom.js"></script>
	<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
    
	<script src="resources/js/notice.js"></script>
	<script src="resources/js/dashBoard.js"></script>
	<script type="text/javascript">
		$(function(){
			initNotice();

			$('#calendar').tuiCalendar({
				  defaultView: 'month',
				  taskView: true
				});
			
			let oldMenu = $("#projectMenu li:first");
			$("#projectMenu li").on("click", function () {
				oldMenu.removeClass("active");
				let oldTab = $(oldMenu.children(".nav-link").attr("href"));
				oldTab.removeClass("active show");
				
				$(this).addClass("active");
				let currentTab = $($(this).children(".nav-link").attr("href"));
				currentTab.addClass("active show");
				oldMenu = $(this);

				setChageView(currentTab.attr("id"));
			});
		})
		
		function setChageView(target){
			console.log("setChageView : "+target);
			if(target === "dash")
				setDashBoardData();
			else if(target === "calendar")
				setCalendarData();
			else if(target === "kanban")
				setKanbanData();
			else if(target === "notice")
				setNoticeData('${project.projectIdx}');
			else if(target === "drive")
				setDriveData();
		}
		
		function setDashBoardData(){
			console.log("in setDashBoardData");
		}

		function setCalendarData(){
			console.log("in setCalendarData");

		}

		function setKanbanData(){
			console.log("in setKanbanData");
			/*   $.ajax({
		        type : "POST",
		        url : "GetKanban.do",
		        data : {projectIdx : ${project.projectIdx}},
		        success : function(data) {
		            console.log("setKanbanData success");
		            $("#kanban").html(data);
		        }, error : function(){
		        	console.log("setKanbanData error");
		        }
		    }); 
 */			 
		}
		
		
		function setDriveData(){
			console.log("in setDriveData");
			/*  $.ajax({
			        type : "POST",
			        url : "GetDrive.do",
			        data : {projectIdx : ${project.projectIdx}},
			        success : function(data) {
			            console.log("setDriveData success");
			            $("#drive").html(data);
			        }, error : function(){
			        	console.log("setDriveData error");
			        }
			    });  */
		}
	</script>
	<style type="text/css">
	
	.iconSizeBig {
    font-size: 1.2rem;
    line-height: 2rem;
    color:  #326295; 
}
	</style>
</head>

<body>
	<!-- LOADER -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

	<div id="main-wrapper">

		<!-- TOP -->
		<jsp:include page="../include/top.jsp" />

		<!-- SIDE BAR -->
		<jsp:include page="../include/sideBar.jsp" />

		<!-- CONTENT BOX -->
		<div class="page-wrapper" >
			<!-- CONTENT MAIN -->
			<div class="container-fluid" style="background-color: white;padding:0">

				<!-- <div class="row">
					<div class="col-md-12">dfgdfgdsfds
					</div>
				</div> -->
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
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#kanbanDetail">kanbanDetail</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="dropdown col-md-1 mt-2 text-center">
			<a href="javascript:void(0)" data-toggle="dropdown" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user-cog iconSizeBig pt-2"></i></a> 
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<ul class="list-style-none">
								<li class="pl-3"><a href="#memberEditModal" data-toggle="modal">프로젝트멤버 설정</a></li>
							</ul>
					</div>
			</div> 
		</div>
	</div>
		<div class="tab-content">
		<div class=" tab-pane fade active show" id="dash" role="tabpanel">
			<!-- 대시보드  -->
			<jsp:include page="../dashBoard/projectDashboard.jsp"/>
		</div>
		<div class=" tab-pane fade" id="calendar" role="tabpanel">
			<jsp:include page="../calendar/projectCalendar.jsp" />
		</div>
		<div class=" tab-pane fade" id="kanban" role="tabpanel">
			  <jsp:include page="../kanban/kanban.jsp"/>
		</div>
		<div class=" tab-pane fade" id="notice" role="tabpanel">
			<jsp:include page="../notice/notice.jsp" />	
		</div>
		<div class=" tab-pane fade" id="drive" role="tabpanel">
			<jsp:include page="../drive/drive.jsp" />
		</div>
		<div class=" tab-pane fade" id="kanbanDetail" role="tabpanel">
			<jsp:include page="../kanban/kanban.jsp" />
		</div>
	</div>		
			</div>

			<!-- BOTTOM -->
			<jsp:include page="../include/bottom.jsp" />
		</div>
		
	</div>
	
		<!-- pm의 설정  modal -->
	<jsp:include page="modal/projectMemberEdit.jsp" />

</body>