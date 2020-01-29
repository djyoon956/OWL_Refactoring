let driveViewType ;
let driveProjectIdx;
let isTrash = false;  //false : drive , true : trash

function initDrive(projectIdx){	
	driveProjectIdx = projectIdx;
	
	$("#driveUploadFiles").fileupload({
		singleFileUploads: false,
		url : "DriveFileUpload.do",
		formData : {projectIdx : projectIdx , folderIdx:1},
		add: function(e, data){
			let folderIdx = $('#jstree').jstree('get_selected')[$('#jstree').jstree('get_selected').length-1];
			$("#driveUploadFiles").fileupload( 'option', 'formData').folderIdx = folderIdx;
			$("#driveUploadFiles").fileupload( 'option', 'formData').refs = $('#jstree').jstree().get_node(folderIdx).parents;
			data.submit();
		},
		done : function(e, data){
			callDirectoryData();
		},
		fail : function(){
			console.log("driveUploadFiles fail");
		}
	});
	
	$("#driveTable").DataTable({
	 	stateSave: true, // 페이지 상태 저장
	 	"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
	 	"searching": false,
         fixedColumns: true,
         autoWidth: false,
         columnDefs: [ { targets: 0, className: 'dt-body-left' }]
	}).on('click', 'tbody tr', function () {
		if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        } else {
        	$("#driveTable").DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
	}).on('dblclick', 'tbody tr.folder', function () {
		chageSelectedFolder($(this).attr("id"), $(this).find("td span").first().text());
	});

	
	 $.contextMenu({
         selector: '#driveTable tbody tr',
         build : function(trigger, e){
        	 console.log(trigger);
        	 console.log($(trigger[0]));
        	 console.log(trigger[0].id);
        	 let isFolder = $(trigger[0]).hasClass("folder");
        	 return {
                 callback: function(key, options) {
                     let driveFileIdx = trigger[0].id;
                     if(key == "download"){
                    	 downloadFile(driveFileIdx);
                     }else if(key == "rename"){
                       	 let renameElement = $(trigger[0]).find("td").first();
                    	 let oldText = $(trigger[0]).find("td span").first().text();
                    	 
                    	 let fun = isFolder ? "renameFolder("+driveFileIdx+")" : "renameFile("+driveFileIdx+")";
                    	 renameElement.html("<input id='driveFileRename' type='text' style='width : 70%; height : 32px;' value='"+oldText+"' onKeypress='javascript:if(event.keyCode==13) {"+fun+"}'>"
                    			 							+"<button class='btn btn-default btn-sm ml-2' style='height : 32px;' onclick='"+fun+"'><i class='fas fa-check'></i></button>");
                    	 $("#driveFileRename").selectRange(0, oldText.lastIndexOf('.'));
                     }else if(key == "delete"){
                    	 if(isFolder)
                    		 deleteDriveFolder(driveFileIdx);
                    	 else
                    		 deleteDriveFile(driveFileIdx);
                     }else if(key == "restore"){
                    	 if(isFolder)
                    		 restoreFolderfromTrash(driveFileIdx);
                    	 else 
                    		 restoreFileTrash(driveFileIdx);
                     }else if(key == "deleteFromTrash"){
                    	 if(isFolder)
                        	 deleteFolderfromTrash(driveFileIdx);
                    	 else
                        	 deleteFilefromTrash(driveFileIdx);

                     }
                 },
                 items:{
                     "download": {name: "다운로드", icon: "fas fa-download", visible : !isFolder && !isTrash},
                     "rename": {name: "이름 변경", icon: "edit", visible : !isTrash},
                     "delete": {name: "삭제", icon: "delete", visible : !isTrash},
                     "restore": {name: "복원", icon: "fas fa-undo", visible : isTrash},
                     "deleteFromTrash": {name: "영구삭제", icon: "delete", visible : isTrash},
            	 	}
             };
         },
     });
	
	$('#jstree').on( "select_node.jstree", function(event, data){
		isTrash = false;
		let path = data.instance.get_path(data.node, '<i class="fas fa-angle-right ml-2 mr-2"></i><i class="far fa-folder mr-2"></i>');
	    $("#driveName").html('<i class="far fa-folder mr-2"></i>'+path);
	    console.log(data.instance.get_path(data.node, false));
		callDirectoryData();
    });
	
	$(".driveViewBtn").click(function(){
		$(this).attr("disabled", true);
		$(this).addClass("active");
		driveViewType= $(this).attr("id");
		if(driveViewType == "tableView"){
			$("#iconView").removeClass("active");
			$("#iconView").attr("disabled", false);
		}
		// icon View
		else{
			$("#tableView").removeClass("active");
			$("#tableView").attr("disabled", false);
		}
			callDirectoryData();
	})
	
	
	//휴지통 버튼 click
	$('#trashBtn').click(function() {
		isTrash = true;
		callDirectoryData();
	})
}

//프로젝트 내 휴지통 리스트 보여주는 function 
function setTrashData() {
	isTrash = true;
	$.ajax({
		url : "GetTrashList.do",
		data : {'projectIdx' : driveProjectIdx},
		success : function (data) {
			console.log('GetTrashList in');
			console.log(data);
			console.log('data.folders.length : ' + data.folders.length);
			console.log('data.files.length : ' +data.files.length);
			$('#driveSearchBtn').hide();
			$('#driveUploadBtn').hide();
			$('#trashName').removeClass("hidden");

			if (data.folders.length == 0 && data.files.length == 0) {
				$("#emptyDriveBox").removeClass("hidden");
				$('#emptyDriveBox').find('h4').hide();
				$("#driveIconViewBox").addClass("hidden");
				$("#driveTableViewBox").addClass("hidden");
				return;
			}
			
			$("#emptyDriveBox").addClass("hidden");
			$('#driveTable').DataTable().clear();
			$("#driveIconViewBox").empty();
			//$('#perDeleteBtn').removeClass("hidden");

			if(driveViewType =="tableView"){
				console.log('tableView select');
				setTableView(data);
			}else{
				console.log('IconView select');   //언제 ? 기본값인가?
				setIconView(data);}
		},
			error : function() {
					console.log('GetTrashList error');
			}
	})
}


var rowCount=0;
function createStatusbar(obj){
     rowCount++;
     var row="odd";
     if(rowCount %2 ==0) row ="even";
     this.statusbar = $("<div class='statusbar "+row+"'></div>");
     this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
     this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
     this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
     this.abort = $("<div class='abort'>Abort</div>").appendTo(this.statusbar);
     obj.after(this.statusbar);
 
    this.setFileNameSize = function(name,size){
        var sizeStr="";
        var sizeKB = size/1024;
        if(parseInt(sizeKB) > 1024){
            var sizeMB = sizeKB/1024;
            sizeStr = sizeMB.toFixed(2)+" MB";
        }
        else{
            sizeStr = sizeKB.toFixed(2)+" KB";
        }
 
        this.filename.html(name);
        console.log("파일이름: " +this.filename.html(name));
        this.size.html(sizeStr);
        console.log("파일사이즈: " +this.size.html(sizeStr));
    }
    this.setProgress = function(progress)
    {       
        var progressBarWidth =progress*this.progressBar.width()/ 100;  
        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
        if(parseInt(progress) >= 100)
        {
            this.abort.hide();
        }
    }
    this.setAbort = function(jqxhr)
    {
        var sb = this.statusbar;
        this.abort.click(function()
        {
            jqxhr.abort();
            sb.hide();
        });
    }
}
function handleFileUpload(files,obj){
   for (var i = 0; i < files.length; i++){
        var fd = new FormData();
        fd.append('file', files[i]);
        console.log(fd);
        var status = new createStatusbar(obj); //Using this we can set progress.
        status.setFileNameSize(files[i].name,files[i].size);
        console.log(status);
        sendFileToServer(fd,status);
 
   }
}

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
		button += "<div class='drivegroup'><a><i class='fas fa-list fa-2x'></i></a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
		button += "<a><i class='fas fa-th-large fa-2x'></i></a></div>"
		$('.defaultDriveMenu').append(button);

	} else {
		$('div.more').parent('div#css').css('background', '');
		Returncheck();
	}
}

function getSelectedFolderId(){
	return $('#jstree').jstree('get_selected')[$('#jstree').jstree('get_selected').length-1];
}
function callDirectoryData(){
	let folderIdx = getSelectedFolderId();
	let folderName = $("#jstree").jstree(true).get_node(folderIdx).text;

	if(isTrash){
		$("#driveName").hide();
		setTrashData();
	} else{
		$('#driveSearchBtn').show();
		$('#driveUploadBtn').show();
		$('#trashName').addClass("hidden");
		$("#driveName").show();
		if(folderIdx != null && folderName!= null)
			setDirectoryData(folderIdx, folderName);
	}	
}

function setDirectoryData(folderIdx, folderName) {
	isTrash = false;

	$.ajax({
		url : "GetFolderData.do",
		data : { folderIdx : folderIdx },
		success : function(data){
			console.log("in GetFolderData success");
			console.log(data);

			if(data.folders.length == 0 && data.files.length == 0){
				$("#directoryName").text("[ "+folderName+" ] directory.");
				$("#emptyDriveBox").removeClass("hidden");
				$('#emptyDriveBox').find('h4').show();
				$("#driveIconViewBox").addClass("hidden");
				$("#driveTableViewBox").addClass("hidden");
				return;
			}
			
			$("#emptyDriveBox").addClass("hidden");
			$('#driveTable').DataTable().clear();
			$("#driveIconViewBox").empty();
			
			if(driveViewType =="tableView")
				setTableView(data);
			else
				setIconView(data);
		},
		error : function(){
			console.log("in GetFolderData error");
		}
	})
}

function setIconView(data){
	$("#driveIconViewBox").removeClass("hidden");
	$("#driveTableViewBox").addClass("hidden");	

	let control ="";
	let line = 4;
	if(!isTrash){
		$.each(data.folders, function(index, element) {
			console.log("in folder");
			control += '<div class="col-sm-3">'
						+ 	'<div class="card driveCard dropdown" ondblclick="setDirectoryData('+element.driveIdx+',\''+element.folderName+'\')">'
						+ 		'<div class="more" style="margin-top: 15px; padding-right:10px;">&nbsp;&nbsp;&nbsp;&nbsp;'
						+			'<input type="checkbox" value="css" onclick="checkBox(this)" style="width:18px; height:18px;">'
						+				'<a href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right; padding-left :10px; padding-right :10px;">'	
						+					'<i class="fas fa-ellipsis-v fa-lg"></i>'
						+				'</a>'
						+			'<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">'
						+				'<ul class="list-style-none">'
						+					'<li class="pl-2"><a href="#" ><i class="fas fa-undo"></i>&nbsp; 이름 변경</a></li>'
						+					'<li class="pl-2"><a href="#"><i class="fas fa-trash-alt"></i>&nbsp; 삭제</a></li>'
						+				'</ul>'                                                                                                                                                         
						+			'</div>'                                                                                                                                                        
						+		'</div>'                                                                                                                                                            
						+		'<div class="card-body text-center">'                                                                                                                               
						+			'<span style="color:#326295;"><i class="fas fa-folder fa-5x mb-4"></i></span>'
						+			'<h4>' +element.folderName+ '</h4>'                                                                                                                                         
						+		'</div>'                                                                                                                                                            
						+	 '</div>'                                                                                                                                                               
						+  '</div>';     
			
			if (index % line == line - 1 || index == data.folders.length - 1) {
				let row = $("<div class='row'></div>");
				row.append(control);
				$("#driveIconViewBox").append(row);
			}
		});
	}

	control ="";
	$.each(data.files, function(index, element) {
		let extension = element.fileName.substr(element.fileName.lastIndexOf(".")+1).toLowerCase();
		let fileName = element.fileName.length > 10 ? element.fileName.substr(0, 10)+ "..." : element.fileName;				

		control += '<div class="col-sm-3">'
					+ 	'<div class="card driveCard dropdown">'
					+ 		'<div class="more" style="margin-top: 15px; padding-right:10px;">&nbsp;&nbsp;&nbsp;&nbsp;'
					+			'<input type="checkbox" value="css" onclick="checkBox(this)" style="width:18px; height:18px;">'
					+				'<a href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right; padding-left :10px; padding-right :10px;">'	
					+					'<i class="fas fa-ellipsis-v fa-lg"></i>'
					+				'</a>'
					+			'<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">'
					+				'<ul class="list-style-none">';
		
		if(isTrash) {
			control += '<li class="pl-2"><a href="#" onclick="restoreFileTrash('+element.driveFileIdx+')"><i class="fas fa-undo"></i>&nbsp; 복원</a></li>'
						+  '<li class="pl-2"><a href="#" onclick="deleteFilefromTrash('+element.driveFileIdx+')"><i class="fas fa-trash-alt"></i>&nbsp; 영구삭제</a></li>';
		}else {
			control +=	'<li class="pl-2"><a href="#" ><i class="fas fa-undo"></i>&nbsp; 이름 변경</a></li>'
					+	'<li class="pl-2"><a href="#"><i class="fas fa-trash-alt"></i>&nbsp; 삭제</a></li>';
		}

		control	+=				'</ul>'
					+			'</div>'
					+		'</div>'
					+		'<div class="card-body text-center">'
					+			'<img class="fileDefaultImage mb-4" onerror="this.onerror=null; this.src=\'resources/images/drive/file.png\';" src="resources/images/drive/'+extension+'.png" >'
					+			'<h4>'+fileName+'</h4>'
					+		'</div>'
					+	 '</div>'
					+  '</div>';
		
		if (index % line == line - 1 || index == data.files.length - 1) {
			let row = $("<div class='row'></div>");
			row.append(control);
			$("#driveIconViewBox").append(row);
		}
	});
}

function setTableView(data){
	console.log('인영아 여기오니');
	console.log(data);
	$("#driveTableViewBox").removeClass("hidden");
	$("#driveIconViewBox").addClass("hidden");

	$.each(data.files, function(index, element) {
		$('#driveTable').DataTable().row.add( [
			"<i class='fas fa-file-alt mr-3'></i><span>"+element.fileName+"</span>",
			element.createDate,
			element.creatorName,
			element.fileSize+" KB"
        ]).node().id = element.driveFileIdx;
		
		$('#driveTable').DataTable().draw();
	})
	
	//if(!isTrash){		
		$.each(data.folders, function(index, element) {
			let row =$('#driveTable').DataTable().row.add( [
							"<i class='fas fa-folder mr-3'></i><span>"+element.folderName+"</span>",
							"-",
							"-",
							"-"
							]);
			row.node().id = element.driveIdx;
			$(row.node()).addClass("folder");
			
			$('#driveTable').DataTable().draw();
		})
	//}
}

function deleteDriveFile(driveFileIdx){
	$.ajax({
		 url : "DeleteDriveFile.do",
		 data : {driveFileIdx : driveFileIdx},
		 success : function(data){
			 if(data){
				 callDirectoryData();
				 successAlert("파일 삭제 완료");
			 }else{
				 errorAlert("파일 삭제 실패");
			 }
		 },
		 error : function(){
			 errorAlert("파일 삭제 실패");
		 }
	 })
}

function deleteDriveFolder(driveIdx, parentIdx){
	$.ajax({
		url : "DeleteFolder.do",
		type : "POST",
		data : {driveIdx : driveIdx},
		success : function(data){
			if(data){
				callDirectoryData();
				chageSelectedFolder(parentIdx);
			}else{
				errorAlert("폴더 삭제 실패");
			}
		},
		error : function(){
			errorAlert("폴더 삭제 실패");
		}
	})
}


//휴지통에서 영구 삭제 함수 
function deleteFilefromTrash(driveFileIdx) {
	console.log('여긴 휴지통에서 파일 삭제 함수');

	Swal.fire({
	    title: '완전히 삭제 하시겠습니까?',
	    text: '완전히 삭제하면 복구 하실 수 없습니다.',
	    icon: 'warning',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: 'Yes'
	  }).then((result) => {
	    if (result.value) {
	    	$.ajax({
	    		url : "DeleteFileFromTrash.do",
	    		data : {'driveFileIdx' : driveFileIdx},
	    		success : function(data) {
	    			//console.log('deleteFileFromTrash in');
	    			setTrashData(driveProjectIdx);
	    			
	    		},
	    		error : function() {
	    			console.log('deleteFilefromTrash error');
	    		}
	    	})  
	   }         
	});
}


//휴지통에서 폴더 영구 삭제 함수 
function deleteFolderfromTrash(driveFileIdx) {
	console.log('여긴 휴지통에서 폴더 삭제 함수');
	console.log(driveFileIdx);
	Swal.fire({
	    title: '완전히 삭제 하시겠습니까?',
	    text: '삭제시 해당 폴더 및 폴더내 파일을 복구 하실 수 없습니다.',
	    icon: 'warning',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    confirmButtonText: 'Yes'
	  }).then((result) => {
	    if (result.value) {
	    	$.ajax({
	    		url : "DeleteFolderfromTrash.do",
	    		data : {'driveFileIdx' : driveFileIdx},
	    		success : function(data) {
	    			console.log('deleteFolderfromTrash in');
	    			setTrashData(driveProjectIdx);
	    			
	    		},
	    		error : function() {
	    			console.log('deleteFilefromTrash error');
	    		}
	    	})  
	   }         
	});
}








//휴지통에서 복원 함수 
function restoreFileTrash(driveFileIdx) {
	
	console.log(driveFileIdx);
	
	$.ajax({
		url : "RestoreFile.do",
		data : {'driveFileIdx' : driveFileIdx},
		success : function(data) {
			console.log('restorefromTrash in');
			console.log(data);
			 successAlert("파일 복원 완료");

			setTrashData(driveProjectIdx);
		},
		error : function() {
			console.log('restorefromTrash ERROR');
		}
	}) 
}


function restoreFolderfromTrash(driveFileIdx) {
	console.log('restoreFolderfromTrash in');
	console.log(driveFileIdx);
	
	$.ajax({
		url : "RestoreFolder.do",
		data : {'driveFileIdx' : driveFileIdx},
		success : function(data) {
			console.log('restoreFolderfromTrash in');
			console.log(data);
			 successAlert("폴더 복원 완료");

			setTrashData(driveProjectIdx);
		},
		error : function() {
			console.log('restoreFolderfromTrash ERROR');
		}
	}) 
}


	

function renameFile(driveFileIdx){
	console.log("in renameFile");
	$.ajax({
		 url : "RenameDriveFile.do",
		 data : {driveFileIdx : driveFileIdx
			 		, fileName :  $("#driveFileRename").val()},
		 success : function(data){
			 if(data){ 
				 $("#driveTable #"+driveFileIdx).find("td").first().html("<i class='fas fa-file-alt mr-3'></i><span>"+$("#driveFileRename").val()+"</span>");
				 successAlert("파일 이름 변경 완료");
			 }else{
				 errorAlert("파일 이름 변경 실패");
			 }
		 },
		 error : function(){
			 errorAlert("파일 이름 변경 실패");
		 }
	 })
}

function renameFolder(driveIdx){
	$.ajax({
		url:"updateNewName.do",
		method:"POST",
		data:{driveIdx: driveIdx,
			     folderName: $("#driveFileRename").val() },
			success : function(data){
				if(data > 0){ 
					$("#driveTable #"+driveIdx).find("td").first().html("<i class='fas fa-file-alt mr-3'></i><span>"+$("#driveFileRename").val()+"</span>");
					successAlert("폴더 이름 변경 완료");
					driveRefresh();
				}else{
					errorAlert("폴더 이름 변경 실패");
				}
			},
			error : function(){
				errorAlert("폴더 이름 변경 실패");
			}
	})
}


function downloadFile(driveFileIdx){
	console.log("in downloadFile : " + driveFileIdx);
	let folderIdx = $('#jstree').jstree('get_selected')[$('#jstree').jstree('get_selected').length-1];
	let refs = $('#jstree').jstree().get_node(folderIdx).parents;
	console.log(refs);
	let path ="/upload/project/"+driveProjectIdx+"/drive/";
	$.ajax({
		url : "GetDriveDownloadPath.do",
		type : "POST",
		data : { projectIdx : driveProjectIdx
					, folderIdx :folderIdx
					, refs : refs 
					},
		success : function(path){
			console.log("in downloadFile success");
			console.log(path);
		},
		error : function(){
			console.log("in downloadFile error");
		}
	})
	console.log(path);
	//$("<a href='<c:url value=\"/upload/\"/>'>테스트파일</a>")
}

$.fn.selectRange = function(start, end) {
	return this.each(function() {
		if(this.setSelectionRange) {
			this.focus();
			this.setSelectionRange(start, end);
		}
		else if(this.createTextRange) {
			let range = this.createTextRange();
			range.collapse(true);
			range.moveEnd('character', end);
			range.moveStart('character', start);
			range.select();
		}
	});
}

function chageSelectedFolder(id, name){
	let folderIdx = $('#jstree').jstree('get_selected')[$('#jstree').jstree('get_selected').length-1];
	let folderName = $("#jstree").jstree(true).get_node(id).text;
	console.log(">"+id+"<");
	console.log(folderName);

	$('#jstree').jstree("deselect_all");
	$("#jstree").jstree("select_node", "#"+id);
	
	setDirectoryData(id, name);
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