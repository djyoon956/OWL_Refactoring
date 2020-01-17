<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>OWL</title>
    <jsp:include page="../include/headTag.jsp"/>
    
    <!-- Toast Ui -->
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />

<!-- If you use the default popups, use this. -->
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />

    <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.dom/v3.0.0/tui-dom.js"></script>
	<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
<style type="text/css">
#menu{
	padding: 16px;
	font-size: 12px;
}
.calendarBtn{
background-color: #fff;
border-radius: 25px;
color: #333;
display: inline-block;
margin-bottom: 0;
text-align: center;
cursor: pointer;
border: 1px solid #ddd;
padding: 0 16px;
line-height: 30px;
}
#renderRange {
    padding-left: 12px;
    font-size: 19px;
    vertical-align: middle;
}  

.move-today{
padding: 0 16px;
line-height: 30px;
}  

.dropdown-menu > li {
    padding: 9px 12px;
    cursor: pointer;
    height: 38px; 
    width: 205px;   
}    

.open>.dropdown-menu {
    display: block;
}    
.dropdown-menu {
    top: 25px;
    padding: 3px 0;
    border-radius: 2px;
    border: 1px solid #bbb;
}

.dropdown-menu >li:hover .fa-hand-point-right{
visibility: visible !important;
}

.tui-full-calendar-section-calendar.tui-full-calendar-hide{
visibility: visible !important;
}
.tui-full-calendar-confirm{
background-color: #326295;
font-size: 14px;
}
.tui-full-calendar-confirm:hover{
color: #326295;
border: 1px double #326295;
background-color: #fff;
}
</style>
	<script type="text/javascript">
		$(function(){
			$('#calendar').tuiCalendar({
				  defaultView: 'month',
				  taskView: true,
				  useCreationPopup: true,
		    	useDetailPopup: true,
		    	calendars: 
		            [{
		                id: '0',
		                name: 'Jaime',
		                bgColor: '#9e5fff',
		                borderColor: '#9e5fff'
		            }]
			});
			 $('#calendarListBox').on('change', onChangeCalendars);

			// 캘린더 색상 설정	
			let viewAll = $('.lnb-calendars-item input');
			let calendarElements = Array.prototype.slice.call($('#calendarList input'));
			calendarElements.forEach(function(data){

				let span = data.parentNode;
				let projectName = $(data).val();
				let checkBox = $(span).find('span').eq(0);
				data.checked = true;
				if($(data).val() == "my"){
					$(checkBox).attr("id", "#326295");
					let color = hexToRGBA("#326295");
					$(checkBox).css("border-color", color)
					$(checkBox).css("background-color", color)
				}else{
					let color =hexToRGBA($(checkBox).attr("id"));
					$(checkBox).css("border-color", color)
					$(checkBox).css("background-color", color)
				}
				$(".tui-full-calendar-dropdown-menu").append("<li class='tui-full-calendar-popup-section-item tui-full-calendar-dropdown-menu-item'>"+span+"</li>");
				console.log(span);
			})
	});

		
		function hexToRGBA(hex) {
		    let radix = 16;
		    let r = parseInt(hex.slice(1, 3), radix),
		        g = parseInt(hex.slice(3, 5), radix),
		        b = parseInt(hex.slice(5, 7), radix),
		        a = parseInt(hex.slice(7, 9), radix) / 255 || 1;
		    let rgba = 'rgb(' + r + ', ' + g + ', ' + b + ', ' + a + ')';
		    return rgba;
		}

		function onChangeCalendars(e) {
	        let calendarId = e.target.value;
	        let checked = e.target.checked;
	        let viewAll = $('.lnb-calendars-item input[value=all]');
			let calendarElements = Array.prototype.slice.call($('#calendarList input'));
	        let allCheckedCalendars = true;

	        if (calendarId === 'all') {
		        console.log("all :"+ checked);
	            allCheckedCalendars = checked;

	            calendarElements.forEach(function(data) {
	                let span = data.parentNode;
	            	let checkBox = $(span).find('span').eq(0);
	                data.checked = checked;
	                if(checked)
	                	$(checkBox).css("background-color", hexToRGBA($(checkBox).attr("id")));
					else
						$(checkBox).css("background-color", 'transparent');
	            });
	        } else {
	        	calendarElements.forEach(function(data) {
	        		let span = data.parentNode;
					let projectName = $(data).val();
					let checkBox = $(span).find('span').eq(0);
					
					if($(data).val() === calendarId){
						data.checked = checked;
						if(checked)
							$(checkBox).css("background-color", hexToRGBA($(checkBox).attr("id")));
						else
							$(checkBox).css("background-color", 'transparent');
					}
	            });
	            
	        	allCheckedCalendars = calendarElements.every(function(input) {
	                return input.checked;
	            });
	            
	            if (allCheckedCalendars)
	            	viewAll.attr("checked",true);
	            else 
	            	viewAll.attr("checked",false);
	        }
	    }
	</script>
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
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Calendar</h4>
                    </div>
                </div>
            </div>

            <!-- CONTENT MAIN -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div id="calendarListBox" class="lnb-calendars">
                                            <hr>
                                            <div>
                                                <div class="lnb-calendars-item">
                                                    <label>
                                                        <input class="tui-full-calendar-checkbox-square" type="checkbox"
                                                            value="all" checked>
                                                        <span></span>
                                                        <strong>View all</strong>
                                                    </label>
                                                </div>
                                            </div>
                                            <hr>
                                            <div id="calendarList" class="lnb-calendars">
                                                <div class="lnb-calendars-item">
                                                    <label>
                                                        <input type="checkbox" class="tui-full-calendar-checkbox-round"
                                                            value="my" checked>
                                                        <span
                                                            style="border-color: rgb(158, 95, 255); background-color: rgb(158, 95, 255);"></span>
                                                        <span class="underLine">My Calendar</span>
                                                    </label>
                                                </div>                                                
                                                <c:forEach var="project" items="${projectList}">
                                                    <div class="lnb-calendars-item">
                                                        <label>
                                                            <input type="checkbox"
                                                                class="tui-full-calendar-checkbox-round"
                                                                value="${project.projectIdx}" checked>
                                                            <span id="${project.projectColor}"></span>
                                                            <span>${project.projectName} </span>
                                                        </label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-10">
                                <div id="menu">
						            <span class="dropdown">
						                <button id="dropdownMenu-calendarType" class="calendarBtn btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						                    <i id="calendarTypeIcon" class="far fa-hand-point-right" style="margin-right: 4px;"></i>
						                    <span id="calendarTypeName">Month</span>&nbsp;
						                </button>
						                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-calendarType">
						                    <li role="presentation">
						                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-daily">
						                            <i class="far fa-hand-point-right" style="margin-right: 5px; visibility: hidden;"></i>Daily
						                        </a>
						                    </li>
						                    <li role="presentation">
						                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weekly">
						                            <i class="far fa-hand-point-right" style="margin-right: 5px; visibility: hidden;"></i>Weekly
						                        </a>
						                    </li>
						                    <li role="presentation">
						                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-monthly">
						                            <i class="far fa-hand-point-right" style="margin-right: 5px; visibility: hidden;"></i>Month
						                        </a>
						                    </li>
						                    <li role="presentation">
						                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks2">
						                           <i class="far fa-hand-point-right" style="margin-right: 5px; visibility: hidden;"></i>2 weeks
						                        </a>
						                    </li>
						                    <li role="presentation">
						                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks3">
						                            <i class="far fa-hand-point-right" style="margin-right: 5px; visibility: hidden;"></i>3 weeks
						                        </a>
						                    </li>
						                    <li role="presentation">
						                        <a role="menuitem" data-action="toggle-workweek">
						                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-workweek" checked="">
						                            <span class="checkbox-title"></span>Show weekends
						                        </a>
						                    </li>
						                    <li role="presentation">
						                        <a role="menuitem" data-action="toggle-start-day-1">
						                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-start-day-1">
						                            <span class="checkbox-title"></span>Start Week on Monday
						                        </a>
						                    </li>
						                    <li role="presentation">
						                        <a role="menuitem" data-action="toggle-narrow-weekend">
						                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-narrow-weekend">
						                            <span class="checkbox-title"></span>Narrower than weekdays
						                        </a>
						                    </li>
						                </ul>
						            </span>
						            <span id="menu-navi">
						                <button type="button" class="calendarBtn btn-sm move-today" data-action="move-today">Today</button>
						                <button type="button" class="calendarBtn btn-sm move-day" data-action="move-prev">
						                    <i class="fas fa-angle-left"></i>
						                </button>
						                <button type="button" class="calendarBtn btn-sm move-day" data-action="move-next">
						                    <i class="fas fa-angle-right"></i>
						                </button>
						            </span>
						            <span id="renderRange" class="render-range">2020.01</span>
						        </div>
                                        <div id="calendar" class="h-100 w-100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- BOTTOM -->
            <jsp:include page="../include/bottom.jsp" />
        </div>
    </div>
</body>