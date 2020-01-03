<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<title>Main</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<!-- Pignose Calender -->
<link href="resources/plugins/pg-calendar/css/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
	href="resources/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">
<!--  칸반 -->

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://www.riccardotartaglia.it/jkanban/dist/jkanban.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.xyz/repo/riktar/jkanban/master/dist/jkanban.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
body {
	font-family: "Lato";
	margin: 0;
	padding: 0;
}

#myKanban {
	overflow-x: auto;
	padding: 20px 0;
}

.success {
	background: #00B961;
	color: #fff
}

.info {
	background: #2A92BF;
	color: #fff
}

.warning {
	background: #F4CE46;
	color: #fff
}

.error {
	background: #FB7D44;
	color: #fff
}

#tab-menu {
	width: 100%;
	background: white;
	border-bottom: 1px double #326295;
	font-family: 'Source Sans Pro', sans-serif;
}

#tab-btn ul {
	overflow: hidden;
	margin-bottom: 0px;
}

#tab-btn li {
	float: left;
	width: 150px;
	text-align: center;
}

#tab-btn li a {
	display: block;
	color: #326295;
	padding: 15px 20px;
	font-weight: bold;
}

#tab-btn li.active a {
	border-bottom: 3px solid #326295;
	color: #326295;
}

</style>
<script type="text/javascript">
$(function() {
	
    var KanbanTest = new jKanban({
        element : '#myKanban',
        gutter  : '10px',
        click : function(el){
            alert(el.innerHTML);
            alert(el.dataset.eid)
        },
        boards  :[
            {
                'id' : '_todo',
                'title'  : 'To Do (drag me)',
                'class' : 'info',
                'item'  : [
                    {
                       'id':'task-1',
                        'title':'Try drag me',
                    },
                    {
                       'id':'task-2',
                        'title':'Click me!!',
                    }
                ]
            },
            {
                'id' : '_working',
                'title'  : 'Working',
                'class' : 'warning',
                'item'  : [
                    {
                        'title':'Do Something!',
                    },
                    {
                        'title':'Run?',
                    }
                ]
            },
            {
                'id' : '_done',
                'dragTo' : ['_working'],
                'title'  : 'Done (Drag only in Working)',
                'class' : 'success',
                'item'  : [
                    {
                        'title':'All right',
                    },
                    {
                        'title':'Ok!',
                    }
                ]
            }
        ]
    });

    var toDoButton = document.getElementById('addToDo');
    toDoButton.addEventListener('click',function(){
        KanbanTest.addElement(
            '_todo',
            {
                'title':'Test Add',
            }
        );
    });

    var addBoardDefault = document.getElementById('addDefault');
    addBoardDefault.addEventListener('click', function () {
        KanbanTest.addBoards(
            [{
                'id' : '_default',
                'title'  : 'Default (Can\'t drop in Done)',
                'dragTo':['_todo','_working'],
                'class' : 'error',
                'item'  : [
                    {
                        'title':'Default Item',
                    },
                    {
                        'title':'Default Item 2',
                    },
                    {
                        'title':'Default Item 3',
                    }
                ]
            }]
        )
    });

    var removeBoard = document.getElementById('removeBoard');
    removeBoard.addEventListener('click',function(){
        KanbanTest.removeBoard('_done');
    });
});
    </script>
</head>

<body>

	<div id="main-wrapper">

		<!-- Top -->
		<jsp:include page="../include/top.jsp" />

		<!-- SideBar -->
		<jsp:include page="../include/sideBar.jsp" />


		<!-- Content -->
		<div class="content-body">


				<!-- Project 상단 바 -->
				<div id="tab-menu">
					<div id="tab-btn">
						<ul>
							<li><a href="#">Dash Board</a></li>
							<li><a href="#">Kanban Board</a></li>
							<li><a href="#">Schedule</a></li>
							<li class="active"><a href="#">Drive</a></li>
						</ul>
					</div>
				</div>

				<!--  칸반 시작 -->
			<div class="container-fluid mt-3">

				<div class="row">
					<div class="col-md-12">
						<h1>jKanban</h1>
						<p>jKanban allow you to create and manage Kanban Board in your
							project! Try It!</p>
						<button class="btn btn-success" id="addDefault">Add
							"Default" board</button>
						<button class="btn btn-success" id="addToDo">Add element
							in "To Do" Board</button>
						<button class="btn btn-danger" id="removeBoard">Remove
							"Done" Board</button>

						<hr>
						<div id="myKanban"></div>

					</div>
				</div>

				<!--  칸반 끝  -->
			</div>
		</div>

		<!-- Bottom -->
		<jsp:include page="../include/bottom.jsp" />
	</div>

	<!--  칸반 스크립트  -->
	<script>
   
    </script>
	<!--Scripts-->
	<script src="resources/plugins/common/common.min.js"></script>
	<script src="resources/js/custom.min.js"></script>
	<script src="resources/js/settings.js"></script>
	<script src="resources/js/gleek.js"></script>
	<script src="resources/js/styleSwitcher.js"></script>

	<!-- Chartjs -->
	<script src="resources/plugins/chart.js/Chart.bundle.min.js"></script>
	<!-- Circle progress -->
	<script src="resources/plugins/circle-progress/circle-progress.min.js"></script>
	<!-- Datamap -->
	<script src="resources/plugins/d3v3/index.js"></script>
	<script src="resources/plugins/topojson/topojson.min.js"></script>
	<script src="resources/plugins/datamaps/datamaps.world.min.js"></script>
	<!-- Morrisjs -->
	<script src="resources/plugins/raphael/raphael.min.js"></script>
	<script src="resources/plugins/morris/morris.min.js"></script>
	<!-- Pignose Calender -->
	<script src="resources/plugins/moment/moment.min.js"></script>
	<script src="resources/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
	<!-- ChartistJS -->
	<script src="resources/plugins/chartist/js/chartist.min.js"></script>
	<script
		src="resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
	<script src="resources/js/dashboard/dashboard-1.js"></script>



</body>
</html>
