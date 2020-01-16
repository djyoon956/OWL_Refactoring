<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script>
$(function(){
	var to = false;
	$('#searchText').keyup(function () {
		if(to) { clearTimeout(to); }
		to = setTimeout(function () {
			var v = $('#searchText').val();
			$('#jstree').jstree(true).search(v);
		}, 100);
	});

	$.jstree.defaults.core.themes.variant = "large";
	$('#jstree').jstree({
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
				"#" : { "max_children" : 1, "max_depth" : 3, "valid_children" : ["root"] },
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
		var ref = $('#jstree').jstree(true),
		sel = ref.get_selected();
		console.log(sel);
		if(!sel.length) { 
			sel = null;
			sel = ref.create_node(sel, {"type":"root"});
		}
		sel = sel[0];
		sel = ref.create_node(sel, {"type":"default"});
		if(sel) {
			ref.edit(sel);
		}
	});	

	$("#renameFolder").click(function(){
		console.log("rename");
		var ref = $('#jstree').jstree(true),
			sel = ref.get_selected();
		if(!sel.length) { return false; }
		sel = sel[0];
		ref.edit(sel);
	});

	$("#deleteFolder").click(function(){
		console.log("delete");
		var ref = $('#jstree').jstree(true),
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
.defaultDriveMenu {
	width: 100%;
	background: white;
	/*    border-bottom: 1px double #326295; */
	font-family: 'Source Sans Pro', sans-serif;
	padding: 15px 20px;
}
.driveBtn{
	padding: 0.375rem 0.75rem;
	border-radius: 2px;
	width: 82px;
	height: 35px;
	text-align: center;
}
.searchDriveMenu {
	width: 100%;
	background: white;
	/*    border-bottom: 1px double #326295; */
	font-family: 'Source Sans Pro', sans-serif;
	padding: 15px 20px;
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

#driveCard {
	border: 3px solid #326295;
}

#driveCard:hover .more {
	visibility: visible;
	opacity: 1;
	cursor: pointer;
}

.more {
	visibility: hidden;
}

#trash {

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
<div class="container-fluid mt-3">
	<div class="row">
		<div class="col-md-3">
					<h2 style="padding-left: 25px;">
						<b>D r i v e</b>
					</h2>
					<hr>
					<span id="createFolder" style="cursor: pointer; float: right;"><i class="fas fa-plus"></i></span>
					<br>
					<div class="row">
					<div class="col-lg-12">
					<div id="jstree" class="demo" style="margin-top:1em; min-height:200px;">
					
						</div>
				<a href="Trash.do" id="trash" style="color:#4f5052; cursor: pointer;"><span style="color:#326295;">
					<i class="fas fa-trash-alt"></i></span>&nbsp;&nbsp;휴지통
				</a>
					</div>
				</div>
			</div>
		<div class="col-md-9" style="padding-left: 0;">
					<div class="defaultDriveMenu">
				<button type="button" class="driveBtn btn-primary" onclick="Search()">검색</button>&nbsp;&nbsp;
				<div class="filebox" style="display:inline;">
					<input type="file" id="driveFile">
					<label for="driveFile" style="cursor: pointer; margin-bottom: 0px;"
						class="driveBtn btn-primary">업로드</label>&nbsp;&nbsp;
				</div>
				<button type="button" class="driveBtn btn-primary" onclick="Allcheck()">전체선택</button>
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
					<div class="card" id="driveCard">
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
					<div class="card" id="driveCard">
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
					<div class="card" id="driveCard">
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
</div>	