<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link href="resources/css/include.css" rel="stylesheet">
<style>
.asColorPicker-wrap {
    position: relative !important;
    display: inline-flex;
    width : 100%;
}

.asColorPicker-trigger{
    left: 0px;
    height: 45px !important;
}

.asColorPicker-dropdown{
max-width: 270px;
}


</style>
<script>
 $(function(){
	 $(".complex-colorpicker").asColorPicker({
	        mode: 'complex'
    });

 $("#editBtn").click(function(){
	 let myFavorite =$(".favoriteCheckbox:checked").val() == "on" ? 1 : 0;
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
		 $("#projectIdx").val($(obj).parent().attr('id'));	
		 
		 var theColor = $(obj).siblings().children().eq(0).css("color")
	        $("#nowColor").attr("value",theColor);
	        $(".asColorPicker-trigger").children('span').css("background", theColor);  
	      var theName =  $(obj).siblings().eq(1).text().trim();
	      $("#myProjectTitle").empty();
	      $("#myProjectTitle").append('<i class="far fa-sun"></i> ');
	      $("#myProjectTitle").append(theName + " 환경설정");
	        var checking = $(".favoriteCheckbox").is(":checked");
	          if($(obj).siblings("#projectFavorite").val()=="1"){		     
	                $(".favoriteCheckbox").attr("checked",true);
	           }else if($(obj).siblings("#projectFavorite").val()=="0"){
	        	   $(".favoriteCheckbox").attr("checked",false);
	           }       
	     }); 
	} 
</script>
<aside class="left-sidebar mySetting" data-sidebarbg="skin5">
    <div class="scroll-sidebar mySetting">
        <nav class="sidebar-nav" id="sidemenu">
        <c:set var="projectList" value="${projectList}"/> 
            <ul id="sidebarnav" class="p-t-30 mySetting">
            <li id="sidebarLable" class="sidebar-item hide-menu">MY</li>
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect" href="javascript:void(0)" aria-expanded="true"><i class="mdi mdi-account-outline"></i><span class="hide-menu">MY TASK</span></a>
                    <ul aria-expanded="false" class="mySetting collapse first-level" style="padding-bottom: 0px;">
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">DASHBOARD</span></a></li>
                        <li class="sidebar-item"><a href="Calendar.do" class="sidebar-link"><i class="mdi mdi-calendar"></i><span class="hide-menu">CALENDAR</span></a></li>
                    </ul>
                </li>
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect" href="javascript:void(0)" aria-expanded="true"><i class="mdi mdi-star-outline"></i> <span class="hide-menu">FAVORITES</span></a>
                    <ul aria-expanded="true" class="mySetting collapse first-level">
                       <c:forEach var="list" items="${projectList}">
                       	<c:if test="${list.favorite == 1}">
	                    	<li class="sidebar-item" id="${list.projectIdx}" style="position:relative;">
	                    		<input id="projectFavorite" type="hidden" value="${list.favorite}">
	                    		<a href="Project.do?projectIdx=${list.projectIdx}" class="sidebar-link">
	                    			<i class="mdi mdi-checkbox-blank-circle" style="color: ${list.projectColor};"></i>
	                    			<span class="hide-menu" id="projectName">${list.projectName}</span>
	                    		</a>
	                    	</li> 
	                    	</c:if>                    
	                    </c:forEach>
                    </ul>
                </li>
                <li id="sidebarLable" class="hide-menu">PROJECT</li>    
                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark" type= "button" data-toggle="modal" data-target="#newProject"><i class="mdi mdi-plus"></i><span class="hide-menu">NEW PROJECT</span></a></li>           
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-laptop-windows"></i><span class="hide-menu">PROJECT LIST</span></a>
                    <ul aria-expanded="false" class="mySetting collapse  first-level" id="projectlist">
	  					<c:forEach var="list" items="${projectList}">
	                    	<li class="sidebar-item" id="${list.projectIdx}" style="position:relative;">
	                    		<input id="projectFavorite" type="hidden" value="${list.favorite}">
	                    		<a href="Project.do?projectIdx=${list.projectIdx}" class="sidebar-link">
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
