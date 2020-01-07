<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	$('#endDate').bootstrapMaterialDatePicker({
		weekStart: 0,
		time: false,
		format: 'YYYY/MM/DD'
	});

	$('#startDate').bootstrapMaterialDatePicker({
	    weekStart: 0, 
	    time: false,
	    format: 'YYYY/MM/DD',
	    minDate: new Date()
	}).on('change', function(e, date) {
	    $('#endDate').bootstrapMaterialDatePicker('setMinDate', date);
	});
	 $(".complex-colorpicker").asColorPicker({
	        mode: 'complex'
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

</script>
<style>
.asColorPicker-wrap {
    position: relative;
    display: inline-flex;
    width : 100%;
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
                <ul class="metismenu" id="menu">  
                <li class="nav-label">MY</li>                                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="far fa-user menu-icon"></i><span class="nav-text">My Task</span>
                        </a>
                        <ul class="collapse in">
                             <li><a href="MyDashboard.do">DASHBOARD</a></li>
               				 <li><a href="Calendar.do">CALENDAR</a></li>
                        </ul>
                    </li>
                  
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="far fa-star menu-icon"></i> <span class="nav-text">FAVORITES</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./email-inbox.html">Inbox</a></li>
                            <li><a href="./email-read.html">Read</a></li>
                            <li><a href="./email-compose.html">Compose</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">PROJECT</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="fas fa-desktop menu-icon"></i><span class="nav-text">Project List</span>
                        </a>
                        <ul aria-expanded="false" id="projectlist">
						<li style="cursor: pointer;"><a type= "button" data-toggle="modal" data-target="#newProject"> <span style="font-size: 18px;">+</span>&emsp;  New Project</a></li>
						<li style="position:relative;"><a href="ProjectDashBoard.do"><span style="color: #ffb1b9 !important;"><i class="fas fa-circle"></i></span>&emsp; Project 1</a>
						 <a type="button" id="tools" data-toggle="modal" data-target="#editProject"><i class="far fa-sun"></i></a>					
						</li>
	                    <li><a href="Drive.do"><span style="color: #f0cc96 !important;"><i class="fas fa-circle"></i></span>&emsp; Project 2</a></li>
	                    <li><a href="kanbanMain.do"><span style="color: #b6e3e9 !important;"><i class="fas fa-circle"></i></span>&emsp; kanban</a></li>
	                    <li><a href="kanbanMainiy.do"><span style="color: lavender !important;"><i class="fas fa-circle"></i></span>&emsp; kanban_iy</a></li>
	                    <li><a href="kanbanMainiyiy.do"><span style="color: lightgrey !important;"><i class="fas fa-circle"></i></span>&emsp; kanban_iyiy</a></li>
	                    <li><a href="kanbanMaintest.do"><span style="color: seagreen !important;"><i class="fas fa-circle"></i></span>&emsp; testing_iy</a></li>
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
     <div class="modal fade" id="newProject">
         <div class="modal-dialog modal-dialog-centered" role="document">
             <div class="modal-content">
                 <div class="modal-header" style="text-align: center;">
                     <h4 class="modal-title"><b>프로젝트 생성</b></h4>
                     <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                     </button>
                 </div>
                 <div class="modal-body">
                 	 <h5>Name</h5>
                     <input type="text" id="projectTitle" style="width:100%; height: 40px;">
                     <br>
                     <br>
 		             <h5>Color</h5>
 		             <!-- <span style="float: right; font-size: 12px; color: grey;">원하는 색으로 프로젝트의 색상을 지정해주세요.&emsp;</span> -->
		             <input type="text" class="complex-colorpicker form-control" value="#326295">
                     <br> 
                     <br> 
                     <h5>Period</h5>  
			          <div class="row form-group">
			                 <div class="col-md-5" style="padding-right: 0px;">
			                     <input type="text" class="form-control" placeholder="Start Date" id="startDate" data-dtp="dtp_l9lmR">
			                 </div>
			                 <div class="col-md-2 text-center" style="padding: 0px;">
			                 		<span>~</span>
			                 </div>
			                 <div class="col-md-5" style="padding-left: 0px;">
			                     <input type="text" class="form-control" placeholder="End Date" id="endDate" data-dtp="dtp_l9lmR">
			                 </div>
			          </div>                         
                     <br>                 
                     
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                     <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="InputProject()">생성하기</button>
                 </div>
             </div>
         </div>
     </div>
     
                <!-- 프로젝트 환경설정 Modal -->
    <div class="modal fade" id="editProject">
         <div class="modal-dialog modal-dialog-centered" role="document">
             <div class="modal-content">
                 <div class="modal-header" style="text-align: center;">
                     <h4 class="modal-title"><b>프로젝트 설정</b></h4>
                     <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                     </button>
                 </div>
                 <div class="modal-body">
 		             <h5>Color</h5>
 		             <!-- <span style="float: right; font-size: 12px; color: grey;">원하는 색으로 프로젝트의 색상을 지정해주세요.&emsp;</span> -->
		             <input type="text" class="complex-colorpicker form-control" value="#326295">
                     <br>                        
                     <br>                
                     <h5>Favorite</h5>
                     <div style="position:relative;">
                     <p>해당 프로젝트를 즐겨찾기에 추가하시겠습니까?</p>
					        <div class="but r" id="but-2" style="float:right;   position:absolute; top: 0px; right: 0px;">
					          <input type="checkbox" class="chbox">
					          <div class="knobs"></div>
					          <div class="layer"></div>
					        </div>
		             </div>
		             <br>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                     <button type="button" class="btn btn-primary" data-dismiss="modal">적용하기</button>
                 </div>
             </div>
         </div>
     </div>
     
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