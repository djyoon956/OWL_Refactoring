<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Chart.js -->
<script src="https://www.chartjs.org/dist/2.9.2/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
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


/*
        var ctx4 = document.getElementById('canvas').getContext('2d');
        window.myLine = Chart.Line(ctx4, {
            data: lineChartData,
            options: {
                responsive: true,
                hoverMode: 'index',
                stacked: false,
                title: {
                    display: true,
                    text: '나의 프로젝트 별 커밋 수(일주일 단위)'
                },
                scales: {
                    yAxes: [{
                        type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: 'left',
                        id: 'y-axis-1',
                    }, {
                        type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: 'right',
                        id: 'y-axis-2',

                        // grid line settings
                        gridLines: {
                            drawOnChartArea: false, // only want the grid lines for one axis to show up
                        },
                    }],
                }
            }
        });

        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'horizontalBar',

            // The data for our dataset
            data: {
                labels: ['Project1', 'Project2', 'Project3', 'Project4', 'Project5'],
                datasets: [{
                    label: 'My First dataset',
                    data: [60, 50, 70, 85, 20],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },

            // Configuration options go here
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
*/


        
    });

/*
    var lineChartData = {
        labels: ['Monday', 'Thusday', 'Wednesday', 'Thursday', 'Friday'],
        datasets: [{
            label: 'Project 1',
            borderColor: window.chartColors.red,
            backgroundColor: window.chartColors.red,
            fill: false,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ],
            yAxisID: 'y-axis-1',
        }, {
            label: 'Project 2',
            borderColor: window.chartColors.blue,
            backgroundColor: window.chartColors.blue,
            fill: false,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ],
            yAxisID: 'y-axis-1'
        }, {
            label: 'Project 3',
            borderColor: window.chartColors.yellow,
            backgroundColor: window.chartColors.yellow,
            fill: false,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ],
            yAxisID: 'y-axis-1'
        }]
    };
*/

var randomScalingFactor = function () {
    console.log("랜덤값-----------");
    console.log(Math.random());
    console.log(Math.random() * 100);
    console.log(Math.round(Math.random() * 100));
    return Math.round(Math.random() * 100);
};


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
            	'Open : ' + (totalSum-closeSum),
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
	        <!--  my task -->
	        <div class="col-lg-6">
	            <div class="card dash_shadow dash_radius" style="height: 450px">
	                <div class="card-body">
	                    <h4 class="card-title">Issue Task</h4>
	                    <div id="dashBoardTableEmptyBox" class="emptyBox">
		                    <div>
		                    	<h3 class="mb-4">나에게 할당된 이슈가 없습니다.</h3>
		                    	<p class="mt-1"> 어쩌구 저쩌구 어쩌구 저쩌구</p>
		                    	<p class="mt-1"> 어쩌구 저쩌구 어쩌구 저쩌구</p>
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
	        <div class="col-lg-6">
	            <div class="card dash_shadow dash_radius" style="height: 450px">
	                <div class="card-body">
	                    <h4 class="card-title">Timeline</h4>
	                    <h6 id="timeLineDate"></h6>
	                    <div class="d-md-flex align-items-center" id="dashboardTimeLine">
	                        <ul class="timeline w-100" style="height: 350px; overflow: auto;">
	 
	                        </ul>
	                        <!-- 끝 -->
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-12">
	            <div class="card dash_shadow dash_radius">
	                <div class="card-body" style="margin-bottom: 10px;">
	                    <h4 class="card-title" style="margin-bottom: 0px;">My Issue Chart by Project</h4>
	                    <div class="align-items-center">
	                        <div class="row w-100" id="myProgressChart" style="overflow:auto; overflow-y:hidden;"> </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-6">
	            <div class="card dash_shadow dash_radius">
	                <div class="card-body">
	                    <h4 class="card-title">Project Commit Chart</h4>
	                    <div class="align-items-center">
	                        <canvas id="canvas"></canvas>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-lg-6">
	            <div class="card dash_shadow dash_radius">
	                <div class="card-body">
	                    <h4 class="card-title">Chart</h4>
	                    <div class="align-items-center">
	                        <canvas id="myChart"></canvas>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- </div> -->