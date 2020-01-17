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
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/assets/images/favicon.png">
    <title>OWL</title>
    <jsp:include page="../include/headTag.jsp"/>
    
    <!-- Toast Ui -->
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
    <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.dom/v3.0.0/tui-dom.js"></script>
	<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<style type="text/css">
	input[type='checkbox'].tui-full-calendar-checkbox-square {
	  display: none;
	}
	input[type='checkbox'].tui-full-calendar-checkbox-square + span {
	  display: inline-block;
	  cursor: pointer;
	  line-height: 14px;
	  margin-right: 8px;
	  width: 14px;
	  height: 14px;
	  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAADpJREFUKBVjPHfu3O5///65MJAAmJiY9jCcOXPmP6kApIeJBItQlI5qRAkOVM5o4KCGBwqPkcxEvhsAbzRE+Jhb9IwAAAAASUVORK5CYII=) no-repeat;
	  vertical-align: middle;
	}
	input[type='checkbox'].tui-full-calendar-checkbox-square:checked + span {
	  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAMBJREFUKBWVkjEOwjAMRe2WgZW7IIHEDdhghhuwcQ42rlJugAQS54Cxa5cq1QM5TUpByZfS2j9+dlJVt/tX5ZxbS4ZU9VLkQvSHKTIGRaVJYFmKrBbTCJxE2UgCdDzMZDkHrOV6b95V0US6UmgKodujEZbJg0B0ZgEModO5lrY1TMQf1TpyJGBEjD+E2NPN7ukIUDiF/BfEXgRiGEw8NgkffYGYwCi808fpn/6OvfUfsDr/Vc1IfRf8sKnFVqeiVQfDu0tf/nWH9gAAAABJRU5ErkJggg==) no-repeat;
	}
	
	input[type='checkbox'].tui-full-calendar-checkbox-round {
	  display: none;
	}
	input[type='checkbox'].tui-full-calendar-checkbox-round + span {
	  display: inline-block;
	  cursor: pointer;
	  width: 14px;
	  height: 14px;
	  line-height: 14px;
	  vertical-align: middle;
	  margin-right: 8px;
	  border-radius: 8px;
	  border: solid 2px;
	  background: transparent;
	}
	.underLine{
		border-bottom: 3px solid #a5c5e8;
		box-shadow: inset 0 -4px 0 #a5c5e8;
	}
	
	#tui-menu {
	  padding: 16px;
	}
	
	.tui-open > .dropdown-toggle.btn-default {
	  background-color: #fff;
	}
	
	#dropdownMenu-calendarType {
	  padding: 0 8px 0 11px;
	}
	
	#calendarTypeName {
	  min-width: 62px;
	  display: inline-block;
	  text-align: left;
	  line-height: 30px;
	}
	
	.calendar-icon {
	  width: 14px;
	  height: 14px;
	}

	#tui-menu .btn {
	  border-radius: 25px;
	  border-color: #ddd;
	}
	
	#tui-menu .btn:hover {
	  border: solid 1px #bbb;
	  background-color: #fff;
	}
	
	#tui-menu .btn:active {
	  background-color: #f9f9f9;
	  border: solid 1px #bbb;
	  outline: none;
	}
	
	#tui-menu .btn:disabled {
	  background-color: #f9f9f9;
	  border: solid 1px #ddd;
	  color: #bbb;
	}
	
	#tui-menu .btn:focus:active, #tui-menu .btn:focus, #tui-menu .btn:active {
	  outline: none;
	}
	
	#tui-menu >.dropdown-menu {
	  top: 25px;
	  padding: 3px 0;
	  border-radius: 2px;
	  border: 1px solid #bbb;
	}
	
	#tui-menu >.dropdown-menu-title .calendar-icon {
	  margin-right: 8px;
	}
	
	</style>
	<script type="text/javascript">
		$(function(){
			$('#calendar').tuiCalendar({
				  defaultView: 'month',
				  taskView: true,
				  template: {
				    monthDayname: function(dayname) {
				      return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
				    }
				  }
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
			})
		})
		
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
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
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
                                        <div id="tui-menu">
										      <span id="menu-navi">
										        <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
										        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
										          <i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
										        </button>
										        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
										          <i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
										        </button>
										      </span>
										      <span id="renderRange" class="render-range"></span>
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