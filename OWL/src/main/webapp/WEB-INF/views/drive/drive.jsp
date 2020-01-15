<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>OWL</title>
	<link rel="stylesheet" href="resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
	<jsp:include page="../include/headTag.jsp" />
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    
	<script>
		function Search() {
			$('.drivemenu').empty();
			var searchfile = "";
			searchfile += "<input type='text' id='searchText' style='width: 40%; height: 30px; border-left-width: 0px;'>";
			searchfile += "<a href='#' onclick='Returncheck()'><i class='fas fa-times'></i></a>";
			$('.drivemenu').append(searchfile);
		}

		function Allcheck() { //전체선택 onclick
			$('div.more').parent('div.card').css('background', 'rgba(161, 163, 166, 0.3)');
			$("input[type=checkbox]").prop("checked", true);

			$('.drivemenu').empty();
			var button = "";
			button += "<button type='button' class='btn'>업로드</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn'>새폴더</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn'>이동</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn'>삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn' onclick='Returncheck()'>선택해제</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<div class='drivegroup'><a><i class='fas fa-list fa-2x'></i></a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
			button += "<a><i class='fas fa-th-large fa-2x'></i></a></div>"
			$('.drivemenu').append(button);
		}

		function Returncheck() {
			$('div.more').parent('div.card').css('background', '');
			$("input[type=checkbox]").prop("checked", false);

			$('.drivemenu').empty();
			var button = "";
			button += "<button type='button' class='btn' onclick='Search()'>검색</button>&nbsp;&nbsp;&nbsp;&nbsp;"
			button += "<button type='button' class='btn'>업로드</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn'>새폴더</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<button type='button' class='btn' onclick='Allcheck()'>전체선택</button>&nbsp;&nbsp;&nbsp;&nbsp;";
			button += "<div class='drivegroup'><a><i class='fas fa-list fa-2x'></i></a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
			button += "<a><i class='fas fa-th-large fa-2x'></i></a></div>"
			$('.drivemenu').append(button);
		}

		function checkBox(box) {
			var cardId = document.getElementById('css');
			if (box.checked == true) {
				$('div.more').parent('div#css').css('background', 'rgba(161, 163, 166, 0.3)');

				$('.drivemenu').empty();
				var button = "";
				button += "<button type='button' class='btn' onclick='Search()'>검색</button>&nbsp;&nbsp;&nbsp;&nbsp;"
				button += "<button type='button' class='btn'>업로드</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button += "<button type='button' class='btn'>새폴더</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button += "<button type='button' class='btn'>이동</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button += "<button type='button' class='btn'>삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button += "<button type='button' class='btn' onclick='Returncheck()'>선택해제</button>&nbsp;&nbsp;&nbsp;&nbsp;";
				button +=
					"<div class='drivegroup'><a><i class='fas fa-list fa-2x'></i></a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
				button += "<a><i class='fas fa-th-large fa-2x'></i></a></div>"
				$('.drivemenu').append(button);

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
		.drivemenu {
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

	<!-- Project 상단 바 -->
	<%-- <jsp:include page="../project/projectTab.jsp"/> --%>
	<!-- 드라이브 사이드 바 -->
  			<h3>Basic AJAX demo</h3>
				<div class="row">
					<div class="col-md-4 col-sm-8 col-xs-8">
						<button type="button" class="btn btn-success btn-sm" id="createFolder"><i class="glyphicon glyphicon-asterisk"></i> Create</button>
						<button type="button" class="btn btn-warning btn-sm" id="renameFolder"><i class="glyphicon glyphicon-pencil"></i> Rename</button>
						<button type="button" class="btn btn-danger btn-sm" id="deleteFolder"><i class="glyphicon glyphicon-remove"></i> Delete</button>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4" style="text-align:right;">
						<input type="text" value="" style="box-shadow:inset 0 0 4px #eee; width:120px; margin:0; padding:6px 12px; border-radius:4px; border:1px solid silver; font-size:1.1em;" id="demo_q" placeholder="Search" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div id="jstree_demo" class="demo" style="margin-top:1em; min-height:200px;">
				
						</div>
	<script>	
	$(function(){
		console.log("여긴 들어옴?");
		var to = false;
		$('#demo_q').keyup(function () {
			if(to) { clearTimeout(to); }
			to = setTimeout(function () {
				var v = $('#demo_q').val();
				$('#jstree_demo').jstree(true).search(v);
			}, 250);
		});

		$.jstree.defaults.core.themes.variant = "large";
		console.log("여긴 들어옴?22");
		$('#jstree_demo').jstree({
				"core" : {
					"animation" : 0,
					"check_callback" : true,
					'force_text' : true,
					"themes" : { "stripes" : true },
				    'data' : [
				        'Simple root node',
				        {
				          'text' : 'Root node 2',
				          'state' : {
				            'opened' : true,
				            'selected' : true
				          },
				          'children' : [
				            { 'text' : 'Child 1' },
				            'Child 2'
				          ]
				       }
				     ]
				},
				"types" : {
					"#" : { "max_children" : 1, "max_depth" : 4, "valid_children" : ["root"] },
					"root" : { "icon" : "/static/3.3.8/assets/images/tree_icon.png", "valid_children" : ["default"] },
					"default" : { "valid_children" : ["default","file"] },
					"file" : { "icon" : "glyphicon glyphicon-file", "valid_children" : [] }
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
			sel = ref.create_node(sel, {"type":"file"});
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
	</script>
					</div>
				</div>

	<!--Scripts-->
	<script src="resources/plugins/common/common.min.js"></script>
	<script src="resources/js/custom.min.js"></script>
	</body>

</html>