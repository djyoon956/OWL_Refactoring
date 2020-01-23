<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>    
 <script src="https://www.chartjs.org/samples/latest/utils.js"></script>
 <script type="text/javascript"> 
//왼쪽에 위치한 프로젝트 리스트 목록 출력 및 팝업창에서의 프로젝트 리스트 출력
function setSchedules() {
    cal.clear();
    generateSchedule(cal.getViewName());
    cal.createSchedules(ScheduleList);
    refreshScheduleVisibility();
}

function generateSchedule(viewName) {         
	$.ajax({
		url:"GetProjectCalendar.do",
		dataType:"json",
		async: false,
		data: {projectIdx: ${project.projectIdx}},
		success:function(data){
	    	ScheduleList = [];
			$.each(data, function(index, element){
		    	let calendar;
		    	let schedule = new ScheduleInfo();
				$.each(CalendarList, function(index, obj){
		    		if(obj.id == element.projectIdx){
		    			calendar = obj;
		    			return false;
		    		}
		    	})		    	
		    	GetCalendar(calendar, element);				
			});
	    }

    });
}

function GetCalendar(calendar, element){
	 let data = {
	            id: String(element.calIdx),
	            title: element.title,
	            isAllDay: element.allDay >0 ? true : false,
	            start: element.startDate,
	            end: element.endDate,
	            category: element.allDay >0 ? 'allday' : 'time',
	            dueDateClass: '',
	            color: "#ffffff",
	            bgColor: $("#proColor").val(),
	            dragBgColor: $("#proColor").val(),
	            borderColor: $("#proColor").val(),
	            location: element.content,
	             raw: {
	                class: "public"
	            },
	            state: "Busy" 
	        };
        
	        if (calendar) {
	        	data.calendarId = calendar.id;
	        	data.color = calendar.color;
	        	data.bgColor = calendar.bgColor;
	        	data.borderColor = calendar.borderColor;
	        }

	        cal.createSchedules([data]);

	        refreshScheduleVisibility();
}

function refreshScheduleVisibility() {
    var calendarElements = Array.prototype.slice.call(document.querySelectorAll('#calendarList input'));

    CalendarList.forEach(function(calendar) {
        cal.toggleSchedules(calendar.id, !calendar.checked, false);
    });

    cal.render(false);

    calendarElements.forEach(function(input) {
        var span = input.nextElementSibling;
        span.style.backgroundColor = input.checked ? span.style.borderColor : 'transparent';
    });
}

var config1 = {
	type: 'doughnut',
	data: {
		datasets: [{
			data: [
				((closeCount)/openCount*100),
				((openCount-closeCount)/openCount*100),
			],
			backgroundColor: [
				window.chartColors.red,
				window.chartColors.blue,
			],
			label: 'Dataset 1'
		}],
		labels: [
			'Complete',
			'Total'
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: '프로젝트 진행률'
		},
		animation: {
			animateScale: true,
			animateRotate: true
		}
	}
};
</script>  
<style>
.tui-full-calendar-month.tui-view-27.tui-view-28.tui-full-calendar-vlayout-container{
display: none;
}
#dashCalendar div.tui-view-7{
height: 480px !important;
}
#dashCalendar .tui-full-calendar-layout.tui-view-8.tui-view-13.tui-view-16{
height: 480px !important;
}

#dashCalendar .tui-full-calendar-layout.tui-view-8.tui-view-13{
height: 480px !important;
}
</style>	 
            <!-- CONTENT MAIN -->
            <div class="container-fluid" style="padding:20px">
                <div class="row">
                <!--  my task -->
                    <div class="col-lg-6">
                        <div class="card dash_shadow dash_radius">
                         
                            <div class="card-body">
                            <h4 class="card-title">Task</h4>
                                <div class="d-md-flex align-items-center table-responsive">
                                  
		                             <table class="table table-striped table-bordered text-center" id="dashboardTable">
		                                <thead>
		                                    <tr>
		                                        <th scope="col">Project</th>
		                                        <th scope="col">Subject</th>
		                                        <th scope="col">Due Date</th>
		                                        <th scope="col">Priority</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                        <td>판매계획</td>
		                                        <td>로그인 view 구현</td>
		                                        <td class="text-danger">today</td>
		                                        <td><span class="badge badge-pill badge-danger font-14">high</span></td>
		                                    </tr>
		                                    <tr>
		                                        <td>판매계획</td>
		                                        <td>공지사항 게시판 기능 구현</td>
		                                        <td class="text-success">tomorrow</td>
		                                        <td><span class="badge badge-pill badge-warning font-14">low</span></td>
		                                    </tr>
		                                    <tr>
		                                        <td>후기관리</td>
		                                        <td>단체 채팅 기능 구현</td>
		                                        <td>1/18</td>
		                                        <td><span class="badge badge-pill badge-success font-14">medium</span></td>  
		                                    </tr>
		                                    <tr>
		                                        <td>후기관리</td>
		                                        <td>캘린더 뷰 구현</td>
		                                        <td>1/30</td>
		                                        <td><span class="badge badge-pill badge-warning font-14">low</span></td>
		                                    </tr>
		                                </tbody>
		                            </table>
                                </div>
                            </div>
                        </div>
                    <!-- </div>  -->
                    <!-- calendar -->
                     <!-- <div class="col-lg-6"> -->
                        <div class="card dash_shadow dash_radius" >
                            <div class="card-body" style="height: 600px;">
                            <h4 class="card-title">Calendar</h4>
                            <br>
                            <input type="hidden" value="${project.projectColor}" id="proColor">
                                <div class="d-md-flex align-items-center">
                                    <div id="dashCalendar" class="w-100 h-100" style="height: 520px;"></div>
                                </div>
                            </div>
                        </div>
                      </div> 
               <!--  </div> -->
               <!--  <div class="row"> -->
                <!--  graph -->
              		 <div class="col-lg-6"> 
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                              <h4 class="card-title">Chart</h4>
                                <div class="align-items-center">
									<div class="row">
										<div class="col-md-6">
											<div id="canvas-holder">
												<canvas id="chartProjectProgress"></canvas>
											</div>
										</div>
										<div class="col-md-6">
											<div id="canvas-holder">
												<canvas id="chartMyProgress"></canvas>
											</div>
										</div>
									</div>
                              </div>
                            </div>
                        </div>
                        
                       <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                              <h4 class="card-title">Chart</h4>
                                <div class="align-items-center">
                                   <div class="w-100 pt-3">
                                    <div class="d-flex no-block align-items-center">
                                        <span>구매전략</span>
                                        <div class="ml-auto">
                                            <span>80%</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 80%; background-color: #ccccff" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                 <div class="w-100 pt-3">
                                    <div class="d-flex no-block align-items-center">
                                        <span>판매계획</span>
                                        <div class="ml-auto">
                                            <span>34%</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 34%; background-color:  #ffb1b9" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                 <div class="w-100 pt-3">
                                    <div class="d-flex no-block align-items-center">
                                        <span>후기관리</span>
                                        <div class="ml-auto">
                                            <span>95%</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 95%; background-color:lightgray;" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                              </div>
                            </div>
                        </div>
                    <!-- </div> -->
                 <!-- timeline  -->
                  <!-- <div class="col-lg-6"> -->
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                           	  <h4 class="card-title">Timeline</h4>
                                <div class="d-md-flex align-items-center">
								<ul class="timeline w-100">
								<li>
									<p class="float-right" >Mon, 20 Jan, 2020</p>
									<span class="badge badge-pill font-14 font-medium mb-1" style="background-color: #ffb1b9;">판매계획</span>
									<p>로그인 view 구현</p>
									<p>로그인 기능 구현</p>
								</li>
								<li>
									<p class="float-right">Tue, 21 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ffb1b9">판매계획</span>
										<p>공지사항 게시판 기능 구현</p>
										<p>공지사항 게시판 view 구현</p>
									<span class="badge badge-pill font-14 mb-1 mt-1 font-medium" style="background-color: lightgray">후기관리</span>
										<p>단체 채팅 view 구현</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ccccff">구매전략</span>
										<p>qna 게시판 view 구현</p>
								</li>
								<li>
									<p class="float-right">Wed, 22 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ccccff">구매전략</span>
										<p>qna 게시판 기능 구현</p>
								</li>
								<li>
									<p class="float-right">Thu, 23 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: lightgray">후기관리</span>
										<p>대시보드 view 구현</p>
								</li>
								<li>
									<p class="float-right">Fri, 24 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ccccff">구매전략</span>
										<p>탈퇴 view 구현</p>
								</li>
							</ul>
                                    <!-- 끝 -->
                                </div>
                            </div>
                        </div>
                       </div>
                   </div>
                 </div>
    <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
	<script src="https://uicdn.toast.com/tui.dom/v3.0.0/tui-dom.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
    <script src="resources/plugin/calendar/dashCalendar.js"></script>             
            	<!-- </div> -->