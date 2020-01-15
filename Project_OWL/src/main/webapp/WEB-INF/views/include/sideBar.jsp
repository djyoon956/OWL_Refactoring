<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link href="resources/plugin/colorpicker/css/asColorPicker.css" rel="stylesheet">
<link href="resources/css/include.css" rel="stylesheet">
<script>
 $(function(){
	 $(".complex-colorpicker").asColorPicker({
	        mode: 'complex'
    });

 $("#editBtn").click(function(){
	 let myFavorite =$(".chbox:checked").val() == "on" ? 1 : 0;
		$.ajax({
	        url:"EditMyProject.do",
	        type: "POST",
	        data: {projectIdx: 	$("#projectIdx").val(),
		        	  projectColor: $("#nowColor").val(),
		        	  favorite: myFavorite},
	        success:function(data){
	         location.reload();   
	       }
	   });
	 });

 $("#insertBtn").click(function(){
		$.ajax({
	        url:"InsertNewProject.do",
	        type: "POST",
	        data: {projectName: 	$("#projectTitle").val(),
		        	  projectColor: $("#myColor").val()},
	        success:function(data){
	         location.reload();   
	       }
	   }); 
	 });    
 });

 function thisProject(obj){
	 $("#editProject").on('show.bs.modal', function () {

		 
		 console.log($(obj).siblings("#projectFavorite").val());
		 console.log($(obj).parent().attr('id'));
		 $("#projectIdx").val($(obj).parent().attr('id'));	
		 console.log($(obj).siblings());
		 var theColor = $(obj).siblings("#projectColor").children().eq(0).css("color");
	        $("#nowColor").attr("value",theColor);
	        $(".asColorPicker-trigger").children('span').css("background", theColor);
	        
	        var checking = $(".chbox").is(":checked");
	          if($(obj).siblings("#projectFavorite").val()=="1"){		     
	                $(".chbox").attr("checked",true);
	           }else if($(obj).siblings("#projectFavorite").val()=="0"){
	        	   $(".chbox").attr("checked",false);
	           }       
	     }); 
	} 
</script>
<aside class="left-sidebar" data-sidebarbg="skin5">
    <div class="scroll-sidebar">
        <nav class="sidebar-nav">
        <c:set var="projectList" value="${projectList}"/> 
            <ul id="sidebarnav" class="p-t-30">
            <li id="sidebarLable" class="sidebar-item hide-menu">MY</li>
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect" href="javascript:void(0)" aria-expanded="true"><i class="mdi mdi-account-outline"></i><span class="hide-menu">MY TASK</span></a>
                    <ul aria-expanded="false" class="collapse in first-level" style="padding-bottom: 0px;">
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">DASHBOARD</span></a></li>
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-calendar"></i><span class="hide-menu">CALENDAR</span></a></li>
                    </ul>
                </li>
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect" href="javascript:void(0)" aria-expanded="true"><i class="mdi mdi-star-outline"></i> <span class="hide-menu">FAVORITES</span></a>
                    <ul aria-expanded="true" class="collapse first-level">
                       <c:forEach var="list" items="${projectList}">
                       	<c:if test="${list.favorite == 1}">
	                    	<li class="sidebar-item" id="${list.projectIdx}" style="position:relative;">
	                    		<input id="projectFavorite" type="hidden" value="${list.favorite}">
	                    		<a href="#" class="sidebar-link">
	                    			<i class="mdi mdi-checkbox-blank-circle" style="color: ${list.projectColor};"></i>
	                    			<span class="hide-menu">${list.projectName}</span>
	                    		</a>
	                    	</li> 
	                    	</c:if>                    
	                    </c:forEach>
                    </ul>
                </li>
                <li id="sidebarLable" class="hide-menu">PROJECT</li>    
                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark" type= "button" data-toggle="modal" data-target="#newProject"><i class="mdi mdi-plus"></i><span class="hide-menu">NEW PROJECT</span></a></li>           
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-laptop-windows"></i><span class="hide-menu">PROJECT LIST</span></a>
                    <ul aria-expanded="false" class="collapse  first-level" id="projectlist">
                    <li class="sidebar-item" style="position:relative;" ><a href="Project.do" class="sidebar-link"><i class="mdi mdi-checkbox-blank-circle" style="color: #E39CB2;"></i><span class="hide-menu">프로젝트 바로가기</span></a>
                    	<a type="button" id="sidebarTools" data-toggle="modal" data-target="#editProject" onclick="thisProject(this)"><i class="mdi mdi-settings"></i></a>	
                    </li>
	  					<c:forEach var="list" items="${projectList}">
	                    	<li class="sidebar-item" id="${list.projectIdx}" style="position:relative;">
	                    		<input id="projectFavorite" type="hidden" value="${list.favorite}">
	                    		<a href="#" class="sidebar-link">
	                    			<i class="mdi mdi-checkbox-blank-circle" style="color: ${list.projectColor};"></i>
	                    			<span class="hide-menu">${list.projectName}</span>
	                    		</a>
	                    		<a type="button" id="sidebarTools" data-toggle="modal" data-target="#editProject" onclick="thisProject(this)">
	                    			<i class="far fa-sun"></i>
	                    		</a>	
	                    	</li>                     
	                    </c:forEach>	           
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</aside>

<jsp:include page="../project/modal/newProject.jsp" />
	   <!-- 프로젝트 환경설정 Modal -->
<jsp:include page="../project/modal/editProject.jsp" />
<script src="resources/plugin/colorpicker/libs/jquery-asColor.js"></script>
<script src="resources/plugin/colorpicker/libs/jquery-asGradient.js"></script>
<script src="resources/plugin/colorpicker/dist/jquery-asColorPicker.min.js"></script>