<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<!-- File Upload -->
<script src="resources/plugin/fileUpload/jquery.fileupload.js"></script>
<script src="resources/plugin/fileUpload/jquery.iframe-transport.js"></script>
<script src="resources/plugin/fileUpload/jquery.ui.widget.js"></script>
<!-- Contect Menu -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

<link href="resources/css/drive.css" rel="stylesheet">
<script src="resources/js/drive.js"></script>

<style>
.btn-link1 {
	display: inline-block;
	padding: 0;
	font-size: inherit;
	color: #0366d6;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: initial;
	border: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	
}
/* .more {
    visibility: hidden;
} */
</style>
<script>
var folderList = [];

function folderInfo() {
    this.id = null;
    this.parent = null;   
    this.text = null;
}

function addFolder(folder) {
	folderList.push(folder);
}

$(function(){
	initDrive("${project.projectIdx}");

	$.jstree.defaults.core.themes.variant = "large";
	$('#jstree').jstree({
			"core" : {
				"animation" : 0,
				"check_callback" : true,
				'force_text' : true,
				"themes" : { "stripes" : true },
			    
			  },
			"types" : {
				"#" : { "max_children" : 1, "max_depth" : 3, "valid_children" : ["root"] },
				"root" : { "icon" : "fas fa-folder", "valid_children" : ["default"] },
				"default" : { "icon" : "fas fa-folder", "valid_children" : ["default","root"] }
			},
			 "checkbox" : {
				    "three_state" : false
				  },
			"plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow"]

		}).on('rename_node.jstree', function (e, data) {
			if(data.node.id.startsWith("j1_")){	
			jQuery.ajaxSettings.traditional = true				
			  $.ajax({
	        		url:"insertFolder.do",
	        		method:"POST",
	        		data:{projectIdx: ${project.projectIdx},
	        			  folderName: data.text,
	        			  ref: data.node.parent,
	        			  refs : data.node.parents
	        			 },
	        		success:function(idx){
		        		data.node.id =idx;
		        		driveRefresh();
	        		}
  		
	    		});
			}else{
				let thisId = data.node.id;
				$.ajax({
	        		url:"updateNewName.do",
	        		method:"POST",
	        		data:{driveIdx: data.node.id,
	        			     folderName: data.text
	        			 },
	        		success:function(idx){
		        		data.node.id = idx;
		        		console.log(data.node);	
		        		driveRefresh();
	        		}
	    		});
		       
			}
		}).on('move_node.jstree', function (e, data) {
			//잘라내기 후 paste 할 때
			jQuery.ajaxSettings.traditional = true				
			  $.ajax({
	        		url:"cutFolder.do",
	        		method:"POST",
	        		data:{driveIdx: data.node.id,
		        		  projectIdx: ${project.projectIdx},
	        			  folderName: data.node.text,
	        			  ref: data.parent,
	        			  refs: data.node.parents,
	        			  oldRef: data.old_parent
	        			 },
	        		success:function(idx){
		        		data.node.id = idx;
		        		driveRefresh();
	        		}
	    		});
			}).on('paste.jstree', function (e, data) {
 	 			//복사 후 paste 할 때
 	 			if(data.mode =="copy_node"){ 	 	 			
				jQuery.ajaxSettings.traditional = true				
				  $.ajax({
		        		url:"copyFolder.do",
		        		method:"POST",
		        		data:{oldId: data.node[0].id,
			        		  projectIdx: ${project.projectIdx},
		        			  folderName: data.node[0].text,
		        			  parent: data.parent, //새로운 ref
		        			  refs: data.node[0].parents
		        			 },
		        		success:function(idx){
			        		data.node[0].id =idx;
			        		driveRefresh();
		        		}
		    		});
 	 			}
 			});
		
	driveRefresh();
	
	$("#createFolder").click(function(){
		var ref = $('#jstree').jstree(true),
		sel = ref.get_selected();
		if(!sel.length) { return false; }
		sel = sel[0];
		sel = ref.create_node(sel, {"type":"default"});
		if(sel) {
			ref.edit(sel);					
		} 
	});


	//file drag and drop 기능
	var obj = $("#dragandrophandler");
	obj.on('dragenter', function (e){
	    e.stopPropagation();
	    e.preventDefault();
	    $(this).addClass('dragBorder');
		 obj.text("이 곳에 파일을 Drag & Drop 해주세요.");
	});
	obj.on('dragover', function (e) 
	{
	     e.stopPropagation();
	     e.preventDefault();
	});
	obj.on('drop', function (e) 
	{	 
	     $(this).removeClass('dragBorder');
	     obj.text('');
	     e.preventDefault();
	     var files = e.originalEvent.dataTransfer.files;	 
	     //We need to send dropped files to Server
	     handleFileUpload(files,obj);
	});
	$(document).on('dragenter', function (e) 
	{
	    e.stopPropagation();
	    e.preventDefault();
	});
	$(document).on('dragover', function (e) 
	{
	  e.stopPropagation();
	  e.preventDefault();
	  obj.removeClass('dragBorder');
	  obj.text('');
	});
	$(document).on('drop', function (e) 
	{
	    e.stopPropagation();
	    e.preventDefault();
	});	
});

function sendFileToServer(formData,status){
	console.log(formData);
    var uploadURL ="http://hayageek.com/examples/jquery/drag-drop-file-upload/upload.php"; //Upload URL
    var extraData ={}; //Extra Data.
    var jqXHR=$.ajax({
            xhr: function() {
            var xhrobj = $.ajaxSettings.xhr();
            if (xhrobj.upload) {
                    xhrobj.upload.addEventListener('progress', function(event) {
                        var percent = 0;
                        var position = event.loaded || event.position;
                        var total = event.total;
                        if (event.lengthComputable) {
                            percent = Math.ceil(position / total * 100);
                        }
                        //Set progress
                        status.setProgress(percent);
                    }, false);
                }
            return xhrobj;
        },
    url: uploadURL,
    type: "POST",
    contentType:false,
    processData: false,
        cache: false,
        data: formData,
        success: function(data){
            status.setProgress(100); 
        }
    }); 
 
    status.setAbort(jqXHR);
}

function driveRefresh(){
	folderList = [];
	$.ajax({
		url:"DriveList.do",
		dataType:"json",
		data:{projectIdx:$("#theProject").val()},
		success:function(data){
			let folder;		
			$.each(data, function(index, element){
				if(element.ref == 0){
					element.ref = "#";
				}				
				folder = new folderInfo();
				folder.id = element.driveIdx;
			    folder.parent = element.ref;
			    folder.text = element.folderName;
			    addFolder(folder);
			});

			//jstree 기능
			var to = false;
			$('#searchText').keyup(function () {
				if(to) { clearTimeout(to); }
				to = setTimeout(function () {
					var v = $('#searchText').val();
					$('#jstree').jstree(true).search(v);
				}, 100);
			});

			$('#jstree').jstree(true).settings.core.data = folderList;
			$('#jstree').jstree(true).refresh();
			callDirectoryData();	
	
		}
	});
}


</script>


<div class="container-fluid mt-3">
    <input type="hidden" value="${project.projectIdx}" id="theProject">
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

                    <div>
                        <button id="trashBtn" class="btn-link" style="color:#326295;"><i
                                class="fas fa-trash-alt"></i>&nbsp;&nbsp;휴지통</button>
                    </div>

                    <!-- 			<a href="Trash.do" style="color:#4f5052; cursor: pointer;"><span style="color:#326295;">
							<i class="fas fa-trash-alt"></i></span>&nbsp;&nbsp;<b>휴지통</b>
						</a> -->
                </div>
            </div>
        </div>
        <div class="col-md-9" style="padding-left: 0;">
            <div class="defaultDriveMenu pt-0">
	            <div class="h-100">
	            	<div style="height: 15%" class="mt-1 mb-3">
	            		<span style="font-size: medium;font-weight: 700;"  id="driveName"> </span>
	            	</div>
	            	<div style="height: 70%">
		                <span style="font-size : large; font-weight:bold" class="hidden" id="trashName">
		                	<i class="fas fa-trash-alt"></i>&nbsp;&nbsp;휴지통
		               	</span>
		                <button id="driveSearchBtn" type="button" class="driveBtn btn-primary"
		                    onclick="Search()">검색</button>&nbsp;&nbsp;
		                <div class="filebox" style="display:inline;">
		                    <input type="file" id="driveUploadFiles" name="driveUploadFiles" multiple>
		                    <label for="driveUploadFiles" style="cursor: pointer; margin-bottom: 0px;"
		                        class="driveBtn btn-primary" id="driveUploadBtn">업로드</label>&nbsp;&nbsp;
		                </div>
		                <button id="driveAllSelectBtn" type="button" class="driveBtn btn-primary"
		                    onclick="Allcheck()">전체선택</button>
		                &nbsp;&nbsp;&nbsp;&nbsp;
		                <div class="drivegroup">
		                    <button class="btn driveViewBtn" id="tableView">
		                        <i class="fas fa-list fa-2x"></i>
		                    </button>
		                    <button class="btn driveViewBtn active" id="iconView" disabled>
		                        <i class="fas fa-th-large fa-2x"></i>
		                    </button>
		                </div>
	            	</div>
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

            <div class="row" style="margin : 10px 10px; margin-top: 0px;">
                <div class="col-lg-12">
                    <div id="dragandrophandler" style="height: 500px;">
                        <div class="h-100 text-center mt-5 hidden" id="emptyDriveBox">
                            <img src="resources/images/drive/notFound.png" style="height: 250px">
                            <h1 class="text-muted mt-5">File Not Found.</h1>
                            <h4>Please upload a file in <span id="directoryName"></span></h4>
                        </div>

                        <div id="driveIconViewBox"></div>

                        <div id="driveTableViewBox" class="hidden">
                            <table id="driveTable" class="table table-hover table-bordered text-center">
                                <thead>
                                    <tr>
                                        <th width="45">file name</th>
                                        <th width="30%">create date</th>
                                        <th width="15%">creator</th>
                                        <th width="10%">size</th>
                                    </tr>
                                </thead>

                                <tbody> </tbody>
                            </table>
                        </div>
                        <!-- <div class="row">
							<div class="col-sm-4">
								<div class="card driveCard"  >
									<div class="more" style="margin-top: 10px;">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" value="css" onclick="checkBox(this)"
											style="width:18px; height:18px;">
										<a style="float:right;" data-toggle="collapse" href="#detail"><i class="fas fa-ellipsis-v fa-lg"></i> &nbsp;&nbsp;&nbsp;&nbsp;</a>
									</div>
									<div style="margin-left: 60%;">
										<ul id="detail" class="collapse">
											<li><i class="fas fa-pencil-alt"></i>&nbsp; 이름 변경</li>
											<li><i class="fas fa-trash-alt"></i>&nbsp; 삭제</li>
										</ul>
									</div>
									<div class="card-body text-center">
										<span style="color:#326295;"><i class="fas fa-folder fa-5x mb-4"></i></span>
										<h4 style="text-align: center;">css</h4>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="card driveCard">
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
									<div class="card-body text-center">
										<span style="color:#326295;"><i class="fas fa-folder fa-5x mb-4"></i></span>
										<h4 style="text-align: center;">css</h4>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="card driveCard">
									<div class="more" style="margin-top: 10px;">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" value="css" onclick="checkBox(this)" style="width:18px; height:18px;">
										<a style="float:right;" data-toggle="collapse" href="#detail">
											<i class="fas fa-ellipsis-v fa-lg"></i> &nbsp;&nbsp;&nbsp;&nbsp;
										</a>
									</div>
									<div style="margin-left: 60%;">
										<ul id="detail" class="collapse">
											<li><i class="fas fa-pencil-alt"></i>&nbsp; 이름 변경</li>
											<li><i class="fas fa-trash-alt"></i>&nbsp; 삭제</li>
										</ul>
									</div>
									<div class="card-body text-center">
										<img class="fileDefaultImage mb-4" src="resources/images/drive/js.png" >
										<h4 >css</h4>
									</div>
								</div>
							</div>
						</div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>