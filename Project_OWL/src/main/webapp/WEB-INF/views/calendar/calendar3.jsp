<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
		})
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
        <jsp:include page="../include/top.jsp"/>
       
        <!-- SIDE BAR -->
        <jsp:include page="../include/sideBar.jsp"/>

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
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">Site Analysis</h4>
                                        <h5 class="card-subtitle">Overview of Latest Month</h5>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-md-2">
                                	<div id="calendarListBox" class="lnb-calendars">
							            <div>
							                <div class="lnb-calendars-item">
							                    <label>
							                        <input class="tui-full-calendar-checkbox-square" type="checkbox" value="all" checked>
							                        <span></span>
							                        <strong>View all</strong>
							                    </label>
							                </div>
							            </div>
							            <div id="calendarList" class="lnb-calendars-d1">
					                    	<div class="lnb-calendars-item">
						                    	<label>
							                    	<input type="checkbox" class="tui-full-calendar-checkbox-round" value="1" checked>
							                    	<span style="border-color: rgb(158, 95, 255); background-color: rgb(158, 95, 255);"></span>
							                    	<span>My Calendar</span>
						                    	</label>
					                    	</div>
											<div class="lnb-calendars-item">
												<label>
													<input type="checkbox" class="tui-full-calendar-checkbox-round" value="2">
													<span style="border-color: rgb(0, 169, 255); background-color: rgb(0, 169, 255);"></span>
													<span>Family C</span>
												</label>
											</div>
											<div class="lnb-calendars-item">
												<label >
													<input type="checkbox" class="tui-full-calendar-checkbox-round" value="3" checked>
													<span style="border-color: rgb(255, 85, 131); background-color: rgb(255, 85, 131);"></span>
													<span>Cindy🧡</span>
												</label>
											</div>
											<div class="lnb-calendars-item">
												<label ><input type="checkbox" class="tui-full-calendar-checkbox-round" value="4" checked="">
													<span style="border-color: rgb(3, 189, 158); background-color: rgb(3, 189, 158);"></span>
													<span>Chole🧡</span>
												</label>
											</div>
											<div class="lnb-calendars-item">
												<label><input type="checkbox" class="tui-full-calendar-checkbox-round" value="5" checked="">
													<span style="border-color: rgb(187, 220, 0); background-color: rgb(187, 220, 0);"></span>
													<span>Crystal🧡</span>
												</label>
											</div>
											<div class="lnb-calendars-item">
												<label><input type="checkbox" class="tui-full-calendar-checkbox-round" value="6" checked="">
													<span style="border-color: rgb(157, 157, 157); background-color: rgb(157, 157, 157);"></span>
													<span>Cathy🧡</span>
												</label>
											</div>
											<div class="lnb-calendars-item">
												<label><input type="checkbox" class="tui-full-calendar-checkbox-round" value="7" checked="">
													<span style="border-color: rgb(255, 187, 59); background-color: rgb(255, 187, 59);"></span>
													<span>Colin💙</span>
												</label>
											</div>
											<div class="lnb-calendars-item">
												<label><input type="checkbox" class="tui-full-calendar-checkbox-round" value="7" checked="">
													<span style="border-color: rgb(255, 64, 64); background-color: rgb(255, 64, 64);"></span>
													<span>나머지</span>
												</label>
											</div>
										</div>
							        </div>
								       
					                    
					                    
                                	</div>
                                	<div class="col-md-10">
	                                   	<div id="calendar" style="height: 100%; width: 100%"></div>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

			<!-- BOTTOM -->
            <jsp:include page="../include/bottom.jsp"/>
        </div>
    </div>
</body>