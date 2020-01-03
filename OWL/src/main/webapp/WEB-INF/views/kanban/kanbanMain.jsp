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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	font-family: "Helvetica Neue", Helvetica, Arial, "Lucida Grande",
		sans-serif;
	box-shadow: 2px 2px 2px #eee;
}

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

		$('#plusbtn').click(function() {
			let result = '<div id="aa" class="card">추가된 것</div>'
			$('#issue').append(result);
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
						<li><a href="#">Kanban Board</a></li>
						<li><a href="#">Schedule</a></li>
						<li class="active"><a href="#">Drive</a></li>
					</ul>
				</div>
			</div>
			<div class="container-fluid mt-3">

				<button class="btn btn-default" id="addColumn">
					<i class="far fa-plus-square fa-lg"></i> &nbsp;&nbsp;ADD COLUMN
				</button>
				<a href="#" data-toggle="modal" data-target="#addIssueModal">
					<button class="btn btn-default" id="addIssue">
						<i class="far fa-plus-square fa-lg"></i> &nbsp;&nbsp;ADD ISSUE
					</button>
				</a> <br> <br>


				<!-- Kanban Start -->
				<div id="board">

					<div id="issue" class="section">
						<div class="row">
							<div class="col-6">
								<h5>Issue</h5>
							</div>
							<div class="col-6">
								<button class="btn btn-default" id="plusbtn">
									<i class="far fa-plus-square fa-lg"></i>
								</button>
							</div>
						</div>
						<div id="c1" class="card">Learn HTML5</div>
						<div id="c2" class="card">Make Killer App</div>
						<div id="c3" class="card">Retire!</div>
					</div>




					<div id="todo" class="section">
						<div class="row">
							<div class="col-9">
								<h5>Todo</h5>
							</div>
							<div class="col-2">
								<i class="far fa-plus-square fa-lg"></i>

							</div>
						</div>
						<div id="c1" class="card">Learn HTML5</div>
						<div id="c2" class="card">Make Killer App</div>
						<div id="c3" class="card">Retire!</div>
					</div>


					<div id="doing" class="section">
						<div class="row">
							<div class="col-9">
								<h5>Doing</h5>
							</div>
							<div class="col-2">
								<i class="far fa-plus-square fa-lg"></i>
							</div>
						</div>
						<div id="c1" class="card">Learn HTML5</div>
					</div>


					<div id="done" class="section">
						<div class="row">
							<div class="col-9">
								<h5>Done</h5>
							</div>
							<div class="col-2">
								<i class="far fa-plus-square fa-lg"></i>
							</div>
						</div>
						<div id="c4" class="card">Learn HTML3</div>
					</div>

					<div id="closed" class="section">
						<div class="row">
							<div class="col-9">
								<h5>Closed</h5>
							</div>
							<div class="col-2">
								<i class="far fa-plus-square fa-lg"></i>
							</div>
						</div>
						<div id="c5" class="card">Learn HTML</div>
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


	<!--  칸반 스크립트  -->
	<script>
		var cards = document.querySelectorAll('.card');
		for (var i = 0, n = cards.length; i < n; i++) {
			var card = cards[i];
			card.draggable = true;
		};
		var board = document.getElementById('board');
		var hideMe;
		board.onselectstart = function(e) {
			e.preventDefault();
		}
		board.ondragstart = function(e) {
			console.log('dragstart');
			hideMe = e.target;
			e.dataTransfer.setData('card', e.target.id);
			e.dataTransfer.effectAllowed = 'move';
		};
		board.ondragend = function(e) {
			e.target.style.visibility = 'visible';
		};
		var lastEneterd;
		board.ondragenter = function(e) {
			console.log('dragenter');
			if (hideMe) {
				hideMe.style.visibility = 'hidden';
				hideMe = null;
			}
			// Save this to check in dragleave.
			lastEntered = e.target;
			var section = closestWithClass(e.target, 'section');
			// TODO: Check that it's not the original section.
			if (section) {
				section.classList.add('droppable');
				e.preventDefault(); // Not sure if these needs to be here. Maybe for IE?
				return false;
			}
		};
		board.ondragover = function(e) {
			// TODO: Check data type.
			// TODO: Check that it's not the original section.
			if (closestWithClass(e.target, 'section')) {
				e.preventDefault();
			}
		};
		board.ondragleave = function(e) {
			// FF is raising this event on text nodes so only check elements.
			if (e.target.nodeType === 1) {
				// dragleave for outer elements can trigger after dragenter for inner elements
				// so make sure we're really leaving by checking what we just entered.
				// relatedTarget is missing in WebKit: https://bugs.webkit.org/show_bug.cgi?id=66547
				var section = closestWithClass(e.target, 'section');
				if (section && !section.contains(lastEntered)) {
					section.classList.remove('droppable');
				}
			}
			lastEntered = null; // No need to keep this around.
		};
		board.ondrop = function(e) {
			var section = closestWithClass(e.target, 'section');
			var id = e.dataTransfer.getData('card');
			if (id) {
				var card = document.getElementById(id);
				// Might be a card from another window.
				if (card) {
					if (section !== card.parentNode) {
						section.appendChild(card);
					}
				} else {
					alert('couldn\'t find card #' + id);
				}
			}
			section.classList.remove('droppable');
			e.preventDefault();
		};
		function closestWithClass(target, className) {
			while (target) {
				if (target.nodeType === 1
						&& target.classList.contains(className)) {
					return target;
				}
				target = target.parentNode;
			}
			return null;
		}
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
