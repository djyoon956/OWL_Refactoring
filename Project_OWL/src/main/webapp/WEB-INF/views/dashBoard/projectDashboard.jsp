<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<!-- Chart.js -->
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

</script>  
<style>
.tui-full-calendar-month.tui-view-27.tui-view-28.tui-full-calendar-vlayout-container{
display: none;
}
</style>	 
            <!-- CONTENT MAIN -->
            <div class="container-fluid" style="padding:20px">
                <div class="row">
                <div class="col-lg-12">
				    <div class="card dash_shadow dash_radius" style="height: 450px">
				        <div class="card-body">
				            <h4 class="card-title">Member Progress</h4>
				            <div>
				
				                여기차트
				            </div>
				        </div>
				    </div>
				</div>
                
                <!--  my task -->
                    <div class="col-lg-6">
                        <div class="card dash_shadow dash_radius" style="height: 450px">
                            <div class="card-body">
                            <h4 class="card-title">Issue Task</h4>
                            <div id="dashBoardPTableEmptyBox" class="emptyBox">
		                    <div>
		                    	<h3 class="mb-4">프로젝트 내에서 할당된 이슈가 없습니다.</h3>
		                    	<p class="mt-1"> 어쩌구 저쩌구 어쩌구 저쩌구</p>
		                    	<p class="mt-1"> 어쩌구 저쩌구 어쩌구 저쩌구</p>
		                    </div>
	                    </div>
	                    <div id="dashBoardPTableBox" class="hidden">
	                               <table class="table table-hover table-bordered text-center w-100" id="dashboardPTable">
	                                <thead>
	                                    <tr>
	                                     	<th width="5%">No</th>
	                                        <th width="60%">Subject</th>
	                                        <th width="25%">Due Date</th>
	                                        <th width="10%">Priority</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                </tbody>
	                            </table>
      						</div>
                            </div>
                        </div>
                    <!-- </div>  -->
                    <!-- calendar -->
                     <!-- <div class="col-lg-6"> -->
                        <div class="card dash_shadow dash_radius" >
                            <div class="card-body">
                            <h4 class="card-title">Calendar</h4>
                            <br>
                            <input type="hidden" value="${project.projectColor}" id="proColor">
                                <div class="d-md-flex align-items-center">
                                    <div id="dashCalendar" class="w-100 h-100"></div>
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
                              <h4 class="card-title" style="margin-bottom: 0px;">Progress Chart</h4>
                                <div class="align-items-center">
									<div class="row">
										<div class="col-md-6" id="chartProjectProgress"> </div>
										<div class="col-md-6" id="chartMyProgress"> </div>
									</div>
                              </div>
                            </div>
                        </div>
                        
                       <div class="card dash_shadow dash_radius" style="height: 450px">
                            <div class="card-body">
                              <h4 class="card-title">Label Chart</h4>
                                <div class="align-items-center" id="labelProgress"> </div>
                            </div>
                        </div>
                    <!-- </div> -->
                 <!-- timeline  -->
                  <!-- <div class="col-lg-6"> -->
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                           	  <h4 class="card-title">Timeline</h4> 
                           	  <h6 id="timeLinePDate"></h6>
			                    <div id="dashboardPTimeLineEmptyBox" class="emptyBox hidden">
				                    <div>
				                    	<h3 class="mb-4">이번주 일정이 존재하지않습니다.</h3>
				                    	<h4 class="mt-1"> (2020-01-29 ~ 2020-02-07)</h4>
				                    </div>
			                    </div>
			                    <div style="height: 350px; overflow: auto">
                                <div class="d-md-flex align-items-center" id="dashboardPTimeLine">
								<ul class="timeline w-100">
								
							</ul>
                                    <!-- 끝 -->
                                </div>
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