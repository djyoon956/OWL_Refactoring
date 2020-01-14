<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 <link href="resources/plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
 <link href="resources/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
 <link href="resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
<script>
function InputProject(){
    var newPro = $("#projectTitle").val();
   var plus = "";
   plus += "<li><a href='#'>" + newPro + "</a></li>";
   $('#projectlist').append(plus);
}

$.noConflict();
jQuery(document).ready(function( $ ) {
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

$(document).on('click', '.toggleBG', function () {
    var toggleBG = $(this);
    var toggleFG = $(this).find('.toggleFG');
    var left = toggleFG.css('left');
    if(left == '40px') {
        toggleBG.css('background', '#CCCCCC');
        toggleActionStart(toggleFG, 'TO_LEFT');
    }else if(left == '0px') {
        toggleBG.css('background', '#53FF4C');
        toggleActionStart(toggleFG, 'TO_RIGHT');
    }
});
 
// 토글 버튼 이동 모션 함수
function toggleActionStart(toggleBtn, LR) {
    // 0.01초 단위로 실행
    var intervalID = setInterval(
        function() {
            // 버튼 이동
            var left = parseInt(toggleBtn.css('left'));
            left += (LR == 'TO_RIGHT') ? 5 : -5;
            if(left >= 0 && left <= 40) {
                left += 'px';
                toggleBtn.css('left', left);
            }
        }, 10);
    setTimeout(function(){
        clearInterval(intervalID);
    }, 201);
}

function thisProject(obj){
 $("#editProject").on('show.bs.modal', function () {	 
	 $("#projectIdx").val($(obj).parent().attr('id'));	
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
<style>
.asColorPicker-wrap {
    position: relative;
    display: inline-flex;
    width : 100%;
    background: 
}

.asColorPicker-trigger{
    left: 0px;
    height: 45px;
}

.asColorPicker-dropdown{
max-width: 270px;
}

#projectlist > li:hover #tools{
   visibility: visible;
   opacity: 1;
   cursor: pointer;
}

#favoriteList > li:hover #tools{
   visibility: visible;
   opacity: 1;
   cursor: pointer;
}

#tools{
  visibility: hidden;
  float:right; 
  z-index: 5; 
  position:absolute; 
  top: 0px; 
  right: 0px;
}

.knobs, .layer
{
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
}

.but
{
    position: relative;
    top: 50%;
    width: 80px;
    height: 40px;
    margin: -20px auto 0 auto;
    overflow: hidden;
}
z
.but.r, .but.r .layer
{
    border-radius: 100px;
}

.but.b2
{
    border-radius: 1px;
}

.chbox
{
    position: relative;
    width: 100%;
    height: 100%;
    padding: 0;
    margin: 0;
    opacity: 0;
    cursor: pointer;
    z-index: 3;
}

.knobs
{
    z-index: 2;
}

.layer
{
    width: 100%;
    background-color: #fcebeb;
    transition: 0.3s ease all;
    z-index: 1;
}


/* Button 2 */
#but-2 .knobs:before, #but-2 .knobs:after
{
    content: 'Y';
    position: absolute;
    top: 10px;
    left: 4px;
    width: 20px;
    height: 10px;
    color: #fff;
    font-size: 15px;
    font-weight: bold;
    text-align: center;
    line-height: 0;
    padding: 9px 4px;
    background-color: #F44336;
    border-radius: 50%;
    transition: 0.3s ease all;
}

#but-2 .knobs:after
{
    content: 'Y';
}

#but-2 .knobs:before
{
    content: 'N';
}

#but-2 .knobs:after
{
    right: -28px;
    left: auto;
    background-color: #03A9F4;
}

#but-2 .chbox:checked + .knobs:before
{
    left: -28px;
}

#but-2 .chbox:checked + .knobs:after
{
    right: 4px;
}

#but-2 .chbox:checked ~ .layer
{
    background-color: #ebf7fc;
}
</style>

        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
            <c:set var="projectList" value="${projectList}"/> 
                <ul class="metismenu" id="SideMenu">  
                <li class="nav-label">MY</li>                                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="far fa-user menu-icon"></i><span class="nav-text">&emsp;My Task</span>
                        </a>
                        <ul class="collapse in">
                             <li class="dash_page" ><a href="#">DASHBOARD</a></li>
               				 <li class="calendar_page" ><a href="#">CALENDAR</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="far fa-star menu-icon"></i> <span class="nav-text">&emsp;FAVORITES</span>
                        </a>
                        <ul class="collapse in" id="favoriteList">                  
                        <c:forEach var="list" items="${projectList}">
                        	<c:if test="${list.favorite == 1}">
								<li class="project_page" style="position:relative;" id="${list.projectIdx}">
								<input id="projectFavorite" type="hidden" value="${list.favorite}">
									<a id="projectColor">
										<span style="color: ${list.projectColor}!important;"><i class="fas fa-circle"></i></span>&emsp; ${list.projectName}
									</a>
									 <a type="button" id="tools" data-toggle="modal" data-target="#editProject" onclick="thisProject(this)"><i class="far fa-sun"></i></a>					
								</li>	      	
								</c:if>
							</c:forEach>
                        </ul>
                    </li>
                    <li class="nav-label">PROJECT</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="fas fa-desktop menu-icon"></i><span class="nav-text">&emsp;Project List</span>
                        </a>                       
                        <ul class="collapse in" id="projectlist">
							<li style="cursor: pointer;"><a type= "button" data-toggle="modal" data-target="#newProject"> <span style="font-size: 18px;">+</span>&emsp;  New Project</a></li>
								<c:forEach var="list" items="${projectList}">
									<li class="project_page" style="position:relative;" id="${list.projectIdx}">
									<input id="projectFavorite" type="hidden" value="${list.favorite}">
										<a href="#" id="projectColor">
											<span style="color: ${list.projectColor}!important;"><i class="fas fa-circle"></i></span>&emsp; ${list.projectName}
										</a>
										 <a type="button" id="tools" data-toggle="modal" data-target="#editProject" onclick="thisProject(this)"><i class="far fa-sun"></i></a>					
									</li>						
                        		</c:forEach>
                        	</ul>                    
                    </li>
                    <!-- 비밀 기능 -->
	                 <li>
	                     <a href="#" aria-expanded="false" style="display: none;">
	                         <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
	                     </a>
	                 </li>
	                 <li>
	                     <a href="#" aria-expanded="false" style="display: none;">
	                         <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
	                     </a>
	                 </li>
	                 <li>
	                     <a href="#" aria-expanded="false" style="display: none;">
	                         <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
	                     </a>
	                 </li>	 	                 
                </ul>
                
            </div>
        </div>

           <!-- 프로젝트 생성 Modal -->
	<jsp:include page="../project/modal/newProject.jsp" />
		   <!-- 프로젝트 환경설정 Modal -->
    <jsp:include page="../project/modal/editProject.jsp" />
     
                <!-- 프로젝트 환경설정 Modal -->
      
   
<script src="resources/plugins/moment/moment.js"></script>
<script src="resources/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<!-- Clock Plugin JavaScript -->
<script src="resources/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
<!-- Color Picker Plugin JavaScript -->
<script src="resources/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
<script src="resources/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
<script src="resources/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
<!-- Date Picker Plugin JavaScript -->
<script src="resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>