<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script src="resources/plugin/fileUpload/jquery.fileupload.js"></script>
<script src="resources/plugin/fileUpload/jquery.iframe-transport.js"></script>
<script src="resources/plugin/fileUpload/jquery.ui.widget.js"></script>
<link href="resources/css/drive.css" rel="stylesheet">
<script src="resources/js/drive.js"></script>
<script>
$(function(){
	initDrive("${project.projectIdx}");
	$.ajax({
		url:"DriveList.do",
		dataType:"json",
		data:{projectIdx:$("#theProject").val()},
		success:function(data){
			var folder = "";
			$.each(data, function(index, element){
				var str = element.folderName;  
				let arrays = str.split("\\");
				folder = arrays[arrays.length-1];
				console.log(folder);

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

			console.log("real : " + folder);
			$.jstree.defaults.core.themes.variant = "large";
			$('#jstree').jstree({
					"core" : {
						"animation" : 0,
						"check_callback" : true,
						'force_text' : true,
						"themes" : { "stripes" : true },
					    'data' : [folder]
					  },
					"types" : {
						"#" : { "max_children" : 1, "max_depth" : 3, "valid_children" : ["root"] },
						"root" : { "icon" : "fas fa-folder", "valid_children" : ["default"] },
						"default" : { "icon" : "fas fa-folder", "valid_children" : ["default","root"] }
					},
					 "checkbox" : {
						    "keep_selected_style" : false,
						    "three_state" : false
						  },
					"plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow", "checkbox"]
				});

			$("#createFolder").click(function(){
				var ref = $('#jstree').jstree(true),
				sel = ref.get_selected();
				if(!sel.length) { return false; }
				sel = sel[0];
				sel = ref.create_node(sel, {"type":"default"});
				if(sel) {
					ref.edit(sel);
					console.log("마지막은 날타지");
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
						<a href="Trash.do" id="trash" style="color:#4f5052; cursor: pointer;"><span style="color:#326295;">
							<i class="fas fa-trash-alt"></i></span>&nbsp;&nbsp;<b>휴지통</b>
						</a>
					</div>
				</div>
			</div>
		<div class="col-md-9" style="padding-left: 0;">
					<div class="defaultDriveMenu">
				<button type="button" class="driveBtn btn-primary" onclick="Search()">검색</button>&nbsp;&nbsp;
				<div class="filebox" style="display:inline;">
					<input type="file" id="driveUploadFile" name="driveUploadFile">
					<label for="driveUploadFile" style="cursor: pointer; margin-bottom: 0px;"
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

			<div class="row" style="margin : 10px 10px; margin-top: 0px;">
				<div class="col-lg-12">
					<div id="dragandrophandler" style="height: 500px;">
					<div class="row">
							<div class="col-sm-4">
								<div class="card" id="driveCard">
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	