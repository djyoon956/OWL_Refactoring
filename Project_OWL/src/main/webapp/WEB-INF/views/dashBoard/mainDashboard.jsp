<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Chart.js -->
<script src="https://www.chartjs.org/dist/2.9.2/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
var LineData = [];

function MakeDataSet() {
    this.label = null;
    this.borderColor = null;
    this.backgroundColor = null;
    this.fill = false;
    this.data = [];
    this.yAxisID = 'y-axis-1';
}
    $(function () {     
    	$.ajax({
	        url:"MyProjectProgress.do",
	        dataType: "json",
	        success:function(data){	   
	        $("#myProgressChart").empty();   
		     $.each(data, function(key, value){
		    	  let idx = key;
			      let name = value[0].projectName;
			      let color = value[0].projectColor;
		    	  let totalCount=value.length;
		    	  let closeCount=0;
		    	  $.each(value, function(index, element){
		    			if(element.issueProgress == "CLOSED") 
							closeCount++;
		    	  })
			
		    	 let makeChart = '<div class="col-md-4"><div id="canvas-holder">'
					  +'<canvas id="chartProject'+idx+'"></canvas></div></div>';
				$("#myProgressChart").append(makeChart);
				ProjectMyChart(idx, totalCount, closeCount, name, color);		    	
		     });
		     
	       }
	   }); 

    	$.ajax({
	        url:"HorizonChart.do",
	        dataType: "json",
	        success:function(data){		     
				let name = [];
				let theData = [];
				let color = [];	        
		     $.each(data, function(key, value){
			      name.push(value[0].projectName);
			      color.push(value[0].projectColor);
		    	  let totalCount=value.length;
		    	  let closeCount=0;
		    	  $.each(value, function(index, element){
		    			if(element.issueProgress == "CLOSED") 
							closeCount++;
		    	  });
		    	  theData.push(Math.round((closeCount/totalCount)*100));				    	
		     });
		    	 MyHorizonChart(theData, name, color);	
	       }
	   });

    	let week = new Array('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'); 
    	let dayCount = [0, 0, 0, 0, 0, 0, 0];
    	let dayName = week[new Date().getDay()];
    	$.ajax({
    		url : "LineChart.do",
    		success : function(data){ 			
				let group;
    			$.each(data, function(key, value){
        				//let theday = key (dayName)
    					group = value.reduce((r, a) => {
    																 r[a.logTime] = [...r[a.logTime] || [], a];
    																 return r;
    															}, {});
						let theData;			
					    theData = new MakeDataSet();
						theData.label = value[0].projectName;
						theData.borderColor = value[0].projectColor;
						theData.backgroundColor = value[0].projectColor;
						theData.fill = false;   							
						theData.yAxisID = 'y-axis-1';
						
						dayCount = [0, 0, 0, 0, 0, 0, 0];		
    					$.each(group, function(key2, value2){   
        					dayCount[new Date(key2).getDay()] = value2.length;			  					
    					}) 
    					theData.data=dayCount;	
						LineData.push(theData);
    			});
				MyLineChart();
    		},
    		error : function(){
    			console.log("in setTimeLine error");
    		}
    	});
    });

function MyHorizonChart(theData, name, color){  
	var chart = new Chart(document.getElementById('myHorizon').getContext('2d'), {
	    // The type of chart we want to create
	    type: 'horizontalBar',
	    // The data for our dataset
	    data: {
	        labels: name,
	        datasets: [{
	            label: '내가 속한 프로젝트 전체 진행률(%)',
	            data: theData,
	            backgroundColor: color,
	            borderColor: color,
	            borderWidth: 1
	        }]
	    },	
	    // Configuration options go here
	    options: {
	        scales: {
	            xAxes: [{
	                ticks: {
	                    beginAtZero: true,
	                    max: 100,
	                }
	            }]
	        }
	    }
	});
	
}
function ProjectMyChart(idx, totalSum, closeSum, projectName, color){  
    window.myDoughnut = new Chart(document.getElementById('chartProject'+idx).getContext('2d'), {
        type: 'doughnut',
        data: {
            datasets: [{
                data: [
                	Math.round((totalSum - closeSum)/totalSum*100),
                	Math.round((closeSum)/totalSum*100)               	
                ],
                backgroundColor: [
                	"#d9d9d9",
                	color                	
                ],
                label: projectName
            }],
            labels: [
            	'Open : ' + totalSum,
                'CLose : ' + closeSum                
            ]
        },
        options: {
            responsive: true,
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: projectName
            },
            animation: {
                animateScale: true,
                animateRotate: true
            },
            tooltips: {
				mode: 'index',
				intersect: false,
				callbacks: {
					label: function(tooltipItem, data) {
				          return data['datasets'][0]['data'][tooltipItem['index']] + '%';
				        },
				}
			}
        }
    });	
}

function MyLineChart(){
    window.myLine = Chart.Line(document.getElementById('myLine').getContext('2d'), {
        data: {
            labels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
            datasets: LineData,
        },
        options: {
            responsive: true,
            hoverMode: 'index',
            stacked: false,
            title: {
                display: true,
                text: '나의 프로젝트 활동 빈도(일주일 단위)'
            },
            scales: {
                yAxes: [{
                    type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                    display: true,
                    position: 'left',
                    id: 'y-axis-1',
                    // grid line settings
                    gridLines: {
                        drawOnChartArea: false, // only want the grid lines for one axis to show up
                    },	
                    ticks: {
	                    beginAtZero: true,
	                },
                }],
            }
        }
    });        
}
</script>
<style>
    .tui-full-calendar-month.tui-view-27.tui-view-28.tui-full-calendar-vlayout-container {
        display: none;
    }
  
</style>
<!-- CONTENT MAIN -->
<div class="container-fluid" style="padding:20px">
    <div class="row" class="h-100 w-100">
    	<div id="myDashBoardEmptyBox" class="emptyBox" class="row">
    		<div class="col-lg-12">
	            <div class="card dash_shadow dash_radius">
	                <div class="card-body" style="margin-bottom: 10px;">
	                    <div class="align-items-center">
	                        	<h3>참여중인 프로젝트 없음</h3>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
	    <div id="myDashBoardBox" class="row">
	         <!-- IssueTask -->
	        <div class="col-lg-6">
	            <div class="card dash_shadow dash_radius" style="height: 450px">
	                <div class="card-body">
	                    <h4 class="card-title">Issue Task</h4>
	                    <div id="dashBoardTableEmptyBox" class="emptyBox">
		                    <div>
		                    	<h3 class="mb-4">나에게 할당된 이슈가 없습니다.</h3>
		                    </div>
	                    </div>
	                    <div id="dashBoardTableBox" class="hidden">
		                    <table class="table table-hover table-bordered text-center w-100" id="dashboardTable">
		                        <thead>
		                            <tr>
		                                <th width="30%">Project</th>
		                                <th width="40%">Subject</th>
		                                <th width="20%">Due Date</th>
		                                <th width="10%">Priority</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                        </tbody>
		                    </table>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!--//  IssueTask -->
	        
	        <!-- TimeLine -->
	        <div class="col-lg-6">
	            <div class="card dash_shadow dash_radius" style="height: 450px">
	                <div class="card-body h-100">
	                    <h4 class="card-title">Timeline</h4>
	                    <h6 id="timeLineDate"></h6>
	                    <div id="dashboardTimeLineEmptyBox" class="emptyBox hidden">
		                    <div>
		                    	<h3 class="mb-4">이번주 일정이 존재하지않습니다.</h3>
		                    	<h4 class="mt-1"> (2020-01-29 ~ 2020-02-07)</h4>
		                    </div>
	                    </div>
	                    <div style="height: 350px; overflow: auto">
	                    <div class="d-md-flex align-items-center" id="dashboardTimeLine"  >
	                        <ul class="timeline w-100" >
	                        </ul>
	                    </div>
	                   </div>
	                </div>
	            </div>
	        </div>
	        <!-- // TimeLine -->
	        
	        <div class="col-lg-12">
	            <div class="card dash_shadow dash_radius">
	                <div class="card-body w-100">
	                    <h4 class="card-title" style="margin-bottom: 0px;">My Issue Progress Chart</h4>
	                    <div class="align-items-center">
	                        <div class="row" id="myProgressChart"> </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-6">
	            <div class="card dash_shadow dash_radius">
	                <div class="card-body">
	                    <h4 class="card-title">Project Contribution Chart</h4>
	                    <div class="align-items-center">
	                        <canvas id="myLine"></canvas>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-lg-6">
	            <div class="card dash_shadow dash_radius">
	                <div class="card-body">
	                    <h4 class="card-title">Project Progress Chart</h4>
	                    <div class="align-items-center" id="horizon">
	                    	<canvas id="myHorizon"></canvas>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- </div> -->