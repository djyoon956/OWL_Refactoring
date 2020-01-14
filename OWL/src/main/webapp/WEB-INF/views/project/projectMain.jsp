<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">

   	<link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
	console.log("project main");
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
   		<!-- Tab -->
   		<c:set var="project" value="${project }"/>
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
               <div class="col-md-1 mt-2 text-center">
				<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                         <i class="fas fa-user-cog iconSizeBig pt-2"></i>
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
           <div class="tab-content">
                  <div class=" tab-pane fade show active" id="dash" role="tabpanel">
                  		<h1>Dash Board</h1>
                  		<h1>${project.projectName }</h1>
                  </div>
                   <div class=" tab-pane fade" id="calendar" role="tabpanel">
                       <h1>Calendar</h1>
                   </div>
                   <div class=" tab-pane fade" id="kanban" role="tabpanel">
                         <%-- <jsp:include page="../kanban/kanbanMain_iy_iy.jsp"/> --%>
                
                   </div>
                   <div class=" tab-pane fade" id="notice" role="tabpanel">
                       <jsp:include page="../notice/notice.jsp"/>
                   </div>
                   <div class=" tab-pane fade" id="drive" role="tabpanel">
                       <h1>Drive</h1>
                   </div>
               </div>
		
		<!-- pm의 설정  modal -->
	    <jsp:include page="modal/projectMemberEdit.jsp" />
	    <jsp:include page="modal/labelEdit.jsp" />
</body>
</html>
