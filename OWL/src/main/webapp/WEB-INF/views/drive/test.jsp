<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>OWL</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<link rel="stylesheet" href="resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.box {
	width: 220px;
	background: #fff;
	padding: 30px;
	float: left;
	height: 900px;
}


/* The list style
-------------------------------------------------------------- */
.directory-list ul {
	margin-left: 10px;
	padding-left: 20px;
	padding-bottom: 7px;
	border-left: 1px dashed #ddd;
	font-size: 22px;
	padding-bottom: 7px;
}

.directory-list li {
	list-style: none;
	color: #888;
	font-size: 18px;
	padding-bottom: 7px;
}

.directory-list a {
	border-bottom: 1px solid transparent;
	color: #888;
	text-decoration: none;
	transition: all 0.2s ease;
}

.directory-list a:hover {
	border-color: #eee;
	color: #000;
}

.directory-list .folder, .directory-list .folder>a {
	color: #777;
	font-weight: bold;
}

/* The icons
-------------------------------------------------------------- */
.directory-list li:before {
	margin-right: 10px;
	content: "";
	height: 20px;
	vertical-align: middle;
	width: 20px;
	background-repeat: no-repeat;
	display: inline-block;
	/* file icon by default */
	background-image:
		url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><path fill='lightgrey' d='M85.714,42.857V87.5c0,1.487-0.521,2.752-1.562,3.794c-1.042,1.041-2.308,1.562-3.795,1.562H19.643 c-1.488,0-2.753-0.521-3.794-1.562c-1.042-1.042-1.562-2.307-1.562-3.794v-75c0-1.487,0.521-2.752,1.562-3.794 c1.041-1.041,2.306-1.562,3.794-1.562H50V37.5c0,1.488,0.521,2.753,1.562,3.795s2.307,1.562,3.795,1.562H85.714z M85.546,35.714 H57.143V7.311c3.05,0.558,5.505,1.767,7.366,3.627l17.41,17.411C83.78,30.209,84.989,32.665,85.546,35.714z' /></svg>");
	background-position: center 2px;
	background-size: 60% auto;
}

.directory-list li.folder:before {
	/* folder icon if folder class is specified */
	background-image:
		url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><path fill='lightblue' d='M96.429,37.5v39.286c0,3.423-1.228,6.361-3.684,8.817c-2.455,2.455-5.395,3.683-8.816,3.683H16.071 c-3.423,0-6.362-1.228-8.817-3.683c-2.456-2.456-3.683-5.395-3.683-8.817V23.214c0-3.422,1.228-6.362,3.683-8.817 c2.455-2.456,5.394-3.683,8.817-3.683h17.857c3.422,0,6.362,1.228,8.817,3.683c2.455,2.455,3.683,5.395,3.683,8.817V25h37.5 c3.422,0,6.361,1.228,8.816,3.683C95.201,31.138,96.429,34.078,96.429,37.5z' /></svg>");
	background-position: center top;
	background-size: 75% auto;
}

#tab-menu {
	width: 100%;
	background: white;
	border-bottom: 1px double #326295;

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
<script>
var tabBtn = $("#tab-btn > ul > li");     //각각의 버튼을 변수에 저장
var tabCont = $("#tab-cont > div");       //각각의 콘텐츠를 변수에 저장

//컨텐츠 내용을 숨겨주세요!
tabCont.hide().eq(0).show();

tabBtn.click(function(){
  var target = $(this);         //버튼의 타겟(순서)을 변수에 저장
  var index = target.index();   //버튼의 순서를 변수에 저장
  tabBtn.removeClass("active");    //버튼의 클래스를 삭제
  target.addClass("active");       //타겟의 클래스를 추가
  tabCont.css("display","none");
  tabCont.eq(index).css("display","block");
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
						<li ><a href="#">Dash Board</a></li>
						<li><a href="#">Kanban Board</a></li>
						<li><a href="#">Schedule</a></li>
						<li class="active"><a href="#">Drive</a></li>
					</ul>
				</div>
			</div>
			<div class="box">
				<br>
				<h2 style="padding-left: 25px;"><b>D r i v e</b></h2>
				<hr>
				<span style="float:right;"><i class="fas fa-plus"></i></span>
				<br>
				<ul class="directory-list">
					<li class="folder">Project 1 
						<ul>
							<li class="folder">css</li>
							<li class="folder">js</li>
							<li class="folder">images</li>
						</ul>
					</li>
					<li class="folder">assets
						<ul>
							<li class="folder">css</li>
							<li class="folder">js</li>
							<li class="folder">images</li>
						</ul>
					</li>
				</ul>
			</div> 

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
</body>
</html>
