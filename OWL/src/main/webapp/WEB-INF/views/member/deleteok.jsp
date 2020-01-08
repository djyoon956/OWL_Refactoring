<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>OWL</title>
<jsp:include page="../include/headTag.jsp" />
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="resources/js/commonSweetAlert.js"></script>
<style type="text/css">
.snsLoginButton {
	background-color: transparent;
	border: none;
	width: 50px;
	height: 50px;
	cursor: pointer;
}
</style>

</head>

<body>

	<div id="main-wrapper">


		<!-- Top -->
		<div class="header-row" style="background-color: black">
			<div class="header-content clearfix">

				<div class="header-left">

					<div class="nav-header" style="padding-left: 200px;background-color: black">

						<a href="Index.do" > 
					<!-- 	<b class="logo-abbr"><img src="resources/images/logo.png" alt="">	</b> -->
								<img src="resources/images/owl_logo_real.png" alt="">
							
						</a>

					</div>
				</div>

				<div class="header-right">
					<ul class="clearfix">

						<li class="icons dropdown d-none d-md-flex"><a href="#"
							data-toggle="modal" data-target="#loginModal">
								<button type="button" id="loginBtn" class="btn mb-1 btn-primary">Login
									/ Register</button>
						</a></li>
					</ul>
				</div>
			</div>
		</div>



		<!-- Content -->
		<div class="content-main">
			<div class="container-fluid mt-3">메인 부분</div>
		</div>

		<!-- Bottom -->
		<jsp:include page="../include/bottom.jsp" />
	</div>


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