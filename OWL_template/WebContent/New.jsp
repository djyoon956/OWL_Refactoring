<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet"> 
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
	<script>
	$.noConflict();
	jQuery(document).ready(function( $ ) {
		var to = false;
		$('#searchText').keyup(function () {
			if(to) { clearTimeout(to); }
			to = setTimeout(function () {
				var v = $('#searchText').val();
				$('#jstree_demo').jstree(true).search(v);
			}, 100);
		});

		$.jstree.defaults.core.themes.variant = "large";
		$('#jstree_demo').jstree({
				"core" : {
					"animation" : 0,
					"check_callback" : true,
					'force_text' : true,
					"themes" : { "stripes" : true },
				    'data' : [
				        '첫번째 프로젝트',
				        {
				          'text' : '추가 폴더',
				          'state' : {
				            'opened' : true,
				            'selected' : true
				          },
				          'children' : [
				            { 'text' : '파일1' },
				            '파일2'
				          ]
				       }
				     ]
				},
				"types" : {
					"#" : { "max_children" : 1, "max_depth" : 4, "valid_children" : ["root"] },
					"root" : { "icon" : "fas fa-folder", "valid_children" : ["default"] },
					"default" : { "icon" : "fas fa-folder", "valid_children" : ["default","root"] },
					"file" : { "icon" : "fas fa-file", "valid_children" : [] }
				},
				 "checkbox" : {
					    "keep_selected_style" : false
					  },
				"plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow", "checkbox"]
			});

		$("#createFolder").click(function(){
			var ref = $('#jstree_demo').jstree(true),
			sel = ref.get_selected();
			console.log(sel);
			if(!sel.length) { 
				return false; 
			}
			sel = sel[0];
			sel = ref.create_node(sel, {"type":"default"});
			if(sel) {
				ref.edit(sel);
			}
		});	

		$("#renameFolder").click(function(){
			console.log("rename");
			var ref = $('#jstree_demo').jstree(true),
				sel = ref.get_selected();
			if(!sel.length) { return false; }
			sel = sel[0];
			ref.edit(sel);
		});

		$("#deleteFolder").click(function(){
			console.log("delete");
			var ref = $('#jstree_demo').jstree(true),
				sel = ref.get_selected();
			if(!sel.length) { return false; }
			ref.delete_node(sel);
		});
			
	});

		function Search() {
			$("div").find(".defaultDriveMenu").each(function(){
				$(this).attr('style', 'display:none');
			});
			$("div").find(".searchDriveMenu").each(function(){
				$(this).attr('style', 'display:block');
			});
			
		}

		function Allcheck() { //전체선택 onclick
			$('div.more').parent('div.card').css('background', 'rgba(161, 163, 166, 0.3)');
			$("input[type=checkbox]").prop("checked", true);

			$('.defaultDriveMenu').empty();
			var button = "";
			button += "<button type='button' class='btn'>업로드</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn'>이동</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn'>삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn' onclick='Returncheck()'>선택해제</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<div class='drivegroup'><a><i class='fas fa-list fa-2x'></i></a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
			button += "<a><i class='fas fa-th-large fa-2x'></i></a></div>"
			$('.defaultDriveMenu').append(button);
		}

		function Returncheck() {
			$('div.more').parent('div.card').css('background', '');
			$("input[type=checkbox]").prop("checked", false);

			$('.defaultDriveMenu').empty();
			var button = "";
			button += "<button type='button' class='btn' onclick='Search()'>검색</button>&nbsp;&nbsp;&nbsp;&nbsp;"
			button += "<button type='button' class='btn'>업로드</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn'>새폴더</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn' onclick='Allcheck()'>전체선택</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<div class='drivegroup'><a><i class='fas fa-list fa-2x'></i></a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
			button += "<a><i class='fas fa-th-large fa-2x'></i></a></div>"
			$('.defaultDriveMenu').append(button);
		}
		function Return() {
			$("div").find(".defaultDriveMenu").each(function(){
				$(this).attr('style', 'display:block');
			});
			$("div").find(".searchDriveMenu").each(function(){
				$(this).attr('style', 'display:none');
			});
		}

		function checkBox(box) {
			var cardId = document.getElementById('css');
			if (box.checked == true) {
				$('div.more').parent('div#css').css('background', 'rgba(161, 163, 166, 0.3)');

				$('.defaultDriveMenu').empty();
				var button = "";
				button += "<button type='button' class='btn' onclick='Search()'>검색</button>&nbsp;&nbsp;&nbsp;&nbsp;"
				button += "<button type='button' class='btn'>업로드</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button += "<button type='button' class='btn'>이동</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button += "<button type='button' class='btn'>삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button += "<button type='button' class='btn' onclick='Returncheck()'>선택해제</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button +=
					"<div class='drivegroup'><a><i class='fas fa-list fa-2x'></i></a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
				button += "<a><i class='fas fa-th-large fa-2x'></i></a></div>"
				$('.defaultDriveMenu').append(button);

			} else {
				$('div.more').parent('div#css').css('background', '');
				Returncheck();
			}
		}
	</script>
	<style>
		.box {
			width: 100%;
			background: #fff;
			padding: 30px;
			float: left;
			height: 900px;
			font-family: 'Source Sans Pro', sans-serif;
		}
		.defaultDriveMenu {
			width: 100%;
			background: white;
			/*    border-bottom: 1px double #326295; */
			font-family: 'Source Sans Pro', sans-serif;
			padding: 15px 20px;
		}

		.searchDriveMenu {
			width: 100%;
			background: white;
			/*    border-bottom: 1px double #326295; */
			font-family: 'Source Sans Pro', sans-serif;
			padding: 15px 20px;
		}
		.btn {
			border: 1px double #326295;
			background-color: #fff;
			cursor: pointer;
			font-weight: bold;
			color: #326295;

		}

		.btn:hover {
			color: #fff;
			background-color: #326295;
			border-color: #326295;
			box-shadow: 200px 0 0 0 rgba(0, 0, 0, 0.5) inset;
		}

		.drivegroup {
			float: right;
			margin-top: 5px;
			color: #326295;
		}
		.filebox input[type="file"] {
			/* 파일 필드 숨기기 */
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0;
		}
		
		#driveFile input[type="file"] {
			/* 파일 필드 숨기기 */
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0;
		}

		.card {
			border: 3px solid #326295;
		}

		.card:hover .more {
			visibility: visible;
			opacity: 1;
			cursor: pointer;
		}

		.more {
			visibility: hidden;
		}

		#trash {
			position: absolute;
			top: 880px;
			font-weight: bold;
		}

		#detail {
			position: absolute;
			z-index: 1;
			border: 2px solid #e8ebed;
			padding: 10px 10px;
			background-color: #fff;
		}

		#detail li:hover {
			background-color: #f0f3f7;
			cursor: pointer;
		}

		#searchText {
			border-right: 0px;
			border-top: 0px;
			boder-left: 0px;
			boder-bottom: 3px solid #326295;
		}
	</style>
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index.html">
                    <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="./images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="images/owl_logo_small.png" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                        <div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
                        </div>
                    </div>
                </div>
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-email-outline"></i>
                                <span class="badge gradient-1 badge-pill badge-primary">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">3 New Messages</span>  
                                    
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/1.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Saiful Islam</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/2.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Adam Smith</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Can you do me a favour?</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/3.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Barak Obama</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/4.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Hilari Clinton</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hello</div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile   dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                        </li>
                                        <li>
                                            <a href="email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                        </li>
                                        
                                        <hr class="my-2">
                                        <li>
                                            <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                        </li>
                                        <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label">Dashboard</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">Home 1</a></li>
                            <li><a href="./jsTree.jsp">JSTree</a></li>
                            <!-- <li><a href="./index-2.html">Home 2</a></li> -->
                        </ul>
                    </li>
                    <li class="nav-label">Apps</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Email</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./email-inbox.html">Inbox</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Apps</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./app-profile.html">Profile</a></li>
                            <li><a href="./app-calender.html">Calender</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                        </a>
                    </li>
                    <li class="nav-label">Forms</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./form-basic.html">Basic Form</a></li>
                            <li><a href="./form-validation.html">Form Validation</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>




        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
	<div class="row">
		<div class="col-md-3" style="padding-right: 0;">
			<div class="box">
				<h2 style="padding-left: 25px;">
					<b>D r i v e</b>
				</h2>
				<hr>
				<span id="createFolder" style="cursor: pointer; float: right;"><i class="fas fa-plus"></i></span>
				<br>
				<div id="jstree_demo" class="demo" style="margin-top:1em; min-height:200px;">
				
				</div>
				<a href="Trash.do" id="trash" style="color:#4f5052; cursor: pointer;"><span style="color:#326295;">
					<i class="fas fa-trash-alt"></i></span>&nbsp;&nbsp;휴지통
				</a>
			</div>
		</div>

		<div class="col-md-9" style="padding-left: 0;">
		
			<div class="defaultDriveMenu">
				<button type="button" class="btn btn-primary" onclick="Search()">검색</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="filebox" style="display:inline;">
					<input type="file" id="driveFile">
					<label for="driveFile" style="cursor: pointer; margin-bottom: 0px;"
						class="btn btn-primary">업로드</label>&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<button type="button" class="btn btn-primary" onclick="Allcheck()">전체선택</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="drivegroup">
					<a><i class="fas fa-list fa-2x"></i></a> <span>&nbsp;&nbsp;</span>
					<a><i class="fas fa-th-large fa-2x"></i></a>
				</div>
			</div>
			
			<div class="searchDriveMenu" style="display:none;">
				<input type='text' id='searchText' style='width: 40%; height: 30px; border-left-width: 0px;'>
				<a href='#' onclick='Return()'><i class='fas fa-times'></i></a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="drivegroup">
					<a><i class="fas fa-list fa-2x"></i></a> <span>&nbsp;&nbsp;</span>
					<a><i class="fas fa-th-large fa-2x"></i></a>
				</div>
			</div>

			<div class="row" style="margin : 10px 10px;">
				<div class="col-sm-4">
					<div class="card" id="css">
						<div class="more" style="margin-top: 10px;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" value="css" onclick="checkBox(this)"
								style="width:18px; height:18px;">
							<a style="float:right;" data-toggle="collapse" href="#detail"><i
									class="fas fa-ellipsis-v fa-lg"></i> &nbsp;&nbsp;&nbsp;&nbsp;</a>
						</div>
						<div style="margin-left: 60%;">
							<ul id="detail" class="collapse">
								<li><i class="fas fa-pencil-alt"></i>&nbsp; 이름 변경</li>
								<li><i class="fas fa-trash-alt"></i>&nbsp; 삭제</li>
							</ul>
						</div>
						<br>
						<div class="card-body text-center">
							<span style="color:#326295;"><i class="fas fa-folder fa-5x"></i></span>
							<br><br>
							<h4 style="text-align: center;">css</h4>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<div class="more" style="margin-top: 10px;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" value="js" onclick="checkBox(this)" style="width:18px; height:18px;">
							<span style="float:right;"><i class="fas fa-ellipsis-v fa-lg"></i>
								&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</div>
						<br>
						<div class="card-body text-center">
							<span style="color:#326295;"><i class="fas fa-folder fa-5x"></i></span>
							<br><br>
							<h4 style="text-align: center;">js</h4>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<div class="more" style="margin-top: 10px;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" value="images" onclick="checkBox(this)"
								style="width:18px; height:18px;">
							<span style="float:right;"><i class="fas fa-ellipsis-v fa-lg"></i>
								&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</div>
						<br>
						<div class="card-body text-center">
							<span style="color:#326295;"><i class="fas fa-folder fa-5x"></i></span>
							<br><br>
							<h4 style="text-align: center;">images</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 

        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
</div>
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
</body>

</html>