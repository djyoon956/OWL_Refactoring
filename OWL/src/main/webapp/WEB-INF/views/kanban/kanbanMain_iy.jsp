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
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon.png">
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
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- kanban board -->
<script src="https://gitcdn.xyz/repo/riktar/jkanban/master/dist/jkanban.min.js"></script>
<link href="https://www.riccardotartaglia.it/jkanban/dist/jkanban.min.css" rel="stylesheet">

<style>
#board {
	display: table;
	margin: 0;
	padding: 0;
	border-spacing: 5px;
	background-color: #CDCDC9;
}

.section {
	display: table-cell;
	margin: 0;
	border: 1px solid #666;
	padding: 5px;
	width: 300px;
}

.section.droppable {
	border: 1px dashed #666;
}

/*  h5 {
	margin: 0;
	border-bottom: 1px solid #999;
	padding: 0;
	font-size: 12pt;
	text-align: center;
} */

.card {
	display: inline-block;
	vertical-align: top;
	margin: 10px 5px;
	padding: 5px;
	width: 95%;
	height: 100px;
	color: black;
	background: #EFEEE6;
	cursor: move;
	text-align: center;
	font-family: "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
	box-shadow: 2px 2px 2px #eee;
}

body {
	font-family: "Lato";
	margin: 0;
	padding: 0;
}

#myKanban {
	overflow-x: auto;
	padding: 10px 0;
}

.columncolor {
	background-color: #336699;
	color : #fff
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
                 'id' : 'addIssue',
                 'title'  : 'Add Issue <a href="#" data-toggle="modal" data-target="#addIssueModal"><i class="icon-plus ml-2"></i></a>',
                 /* 'class' : 'columncolor', */
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
                'id' : '_todo',
                'title'  : 'To Do',
                'class' : 'columncolor',
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
                'class' : 'columncolor',
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
                'title'  : 'Done',
                'class' : 'columncolor',
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
                'title'  : 'Default',
                'dragTo':['_todo','_working'],
                'class' : 'columncolor',
                'item'  : [
                    /* {
                        'title':'Default Item',
                    },
                    {
                        'title':'Default Item 2',
                    },
                    {
                        'title':'Default Item 3',
                    } */
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

			<div id="tab-menu">
				<div id="tab-btn">
					<ul>
						<li><a href="#">Dash Board</a></li>
						<li class="active"><a href="#">Kanban Board</a></li>
						<li><a href="#">Schedule</a></li>
						<li><a href="#">Drive</a></li>
					</ul>
				</div>
			</div>
			<div class="container-fluid mt-3">

 							<form class="form-inline">
                                        <div class="form-group mx-sm-3 mb-2">
                                            <label class="sr-only">search</label>
                                            <input type="text" class="form-control" placeholder="search">
                                        </div>
                                        <button type="submit" class="btn columncolor mb-2">검색</button>
                               </form>
				<!-- Kanban Start -->
				<div class="row">
					<div class="col-md-12">
					

						<button class="btn columncolor" id="addDefault">Add Column+</button>
						
						<a href="#" data-toggle="modal" data-target="#addIssueModal">
						<button class="btn columncolor" id="addToDo">Add Issue++</button>
						</a>
						<button class="btn columncolor" id="removeBoard">Remove Column</button>

						<hr>
						<div id="myKanban" class="row">
						
						</div>

					</div>
					<div class="col-md-1">
					closed 
					</div>
				</div>


				<!--  칸반 끝  -->
			</div>
		</div>

		<!-- Bottom -->
		<jsp:include page="../include/bottom.jsp" />
	</div>

	<!-- add issue modal -->
	<jsp:include page="modal/createIssue.jsp" />



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
	<script src="resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
	<script src="resources/js/dashboard/dashboard-1.js"></script>
</body>
</html>
