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
	<jsp:include page="../include/headTag.jsp" />
	<link href="resources/css/project.css" rel="stylesheet">
	
	<!-- DataTable -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.css"/>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#noticeTable").DataTable();
			let oldMenu = $("#projectMenu li:first");
			$("#projectMenu li").on("click", function () {
				oldMenu.removeClass("active");
				let oldTab = $(oldMenu.children(".nav-link").attr("href"));
				oldTab.removeClass("active show");
				
				$(this).addClass("active");
				let currentTab = $($(this).children(".nav-link").attr("href"));
				currentTab.addClass("active show");
				oldMenu = $(this);
			});
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
		<jsp:include page="../include/top.jsp" />

		<!-- SIDE BAR -->
		<jsp:include page="../include/sideBar.jsp" />

		<!-- CONTENT BOX -->
		<div class="page-wrapper" >
			<!-- CONTENT MAIN -->
			<div class="container-fluid" style="background-color: white; margin: 20px">
				<div class="row">
					<div class="col-md-12">dfgdfgdsfds
					</div>
				</div>
			</div>

			<!-- BOTTOM -->
			<jsp:include page="../include/bottom.jsp" />
		</div>
	</div>
</body>