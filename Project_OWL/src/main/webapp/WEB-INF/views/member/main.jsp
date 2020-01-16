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
	<!-- DataTable -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.css"/>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.js"></script>
	<!-- Toast Ui -->
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
    <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.dom/v3.0.0/tui-dom.js"></script>
	<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	
<script type="text/javascript">
$(function() {
	$("#dashboardTable").DataTable();
	 $("#dashCalendar").tuiCalendar({
		  defaultView: 'month',
		  taskView: true
		   /* template: {
		    monthDayname: function(dayname) {
		      return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
		    }
		  }  */
		  /* grid: {
	            header: {
	                header: 34
	            },
	            footer: {
	                height: 10
	            }
	        } */
	}); 
});



</script>
<style type="text/css">
 .dash_shadow {
 box-shadow: 3px 3px 3px 3px gray; 
 }
 .dash_radius {
 border-radius: 0.25rem
 }
</style>
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
            <!-- CONTENT MAIN -->
            <div class="container-fluid">
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
		                                        <td>구매전략</td>
		                                        <td>로그인 view 구현</td>
		                                        <td class="text-danger">today</td>
		                                        <td><span class="badge badge-pill badge-danger font-14">high</span></td>
		                                    </tr>
		                                    <tr>
		                                        <td>구매전략</td>
		                                        <td>공지사항 게시판 기능 구현</td>
		                                        <td>1/28</td>
		                                        <td><span class="badge badge-pill badge-warning font-14">low</span></td>
		                                    </tr>
		                                    <tr>
		                                        <td>판매계획</td>
		                                        <td>단체 채팅 기능 구현</td>
		                                        <td>1/18</td>
		                                        <td><span class="badge badge-pill badge-success font-14">medium</span></td>  
		                                    </tr>
		                                </tbody>
		                            </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- calendar -->
                     <div class="col-lg-6">
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                            <h4 class="card-title">Calendar</h4>
                                <div class="d-md-flex align-items-center">
                                   
                                    <div id="dashCalendar" class="w-100 h-100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                <!--  graph -->
                <div class="col-lg-6">
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                              <h4 class="card-title">Progress</h4>
                                <div class="d-md-flex align-items-center">
                                   <div class=" col-md-12 m-t-20 w-100">
                                    <div class="d-flex no-block align-items-center">
                                        <span>구매전략</span>
                                        <div class="ml-auto">
                                            <span>81%</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 81%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                 <div class=" col-md-12 m-t-20 w-100">
                                    <div class="d-flex no-block align-items-center">
                                        <span>판매계획</span>
                                        <div class="ml-auto">
                                            <span>81%</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 81%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                              </div>
                            </div>
                        </div>
                    </div>
                 <!-- timeline  -->
                  <div class="col-lg-6">
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                           	  <h4 class="card-title">timeline</h4>
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        
                                        <h5 class="card-subtitle">Overview of Latest Month</h5>
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
 </div>
</body>