function initDrive(projectIdx){
	$("#driveUploadFile").fileupload({
		url : "DriveFileUpload.do",
		formData : {projectIdx : projectIdx
							, folderIdx : $('#jstree').jstree('get_selected')[$('#jstree').jstree('get_selected').length-1] },
		done : function(e, data){
			console.log("in done");
			let folderIdx = $('#jstree').jstree('get_selected')[$('#jstree').jstree('get_selected').length-1];
			console.log(folderIdx);
			setFolderData(folderIdx);
		}
	});

	$('#jstree').on( "select_node.jstree", function(event, data){
	     let folderIdx = data.selected[data.selected.length - 1];
	     setFolderData(folderIdx);
    });
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
		button +=
			"<div class='drivegroup'><a><i class='fas fa-list fa-2x'></i></a><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>";
		button += "<a><i class='fas fa-th-large fa-2x'></i></a></div>"
		$('.defaultDriveMenu').append(button);

	} else {
		$('div.more').parent('div#css').css('background', '');
		Returncheck();
	}
}

function setFolderData(folderIdx) {
	console.log("in setFolderData : "+folderIdx);
	$.ajax({
		url : "GetFolderData.do",
		data : { folderIdx : folderIdx },
		success : function(data){
			console.log("in GetFolderData success");
			$("#driveBox").empty();
			let controls = [];
			if(data.length == 0 ){
				$("#emptyDriveBox").removeClass("hidden");
				return;
			}
				
			$("#emptyDriveBox").addClass("hidden");
			$.each(data, function(index, element) {
				let extension = element.fileName.substr(element.fileName.lastIndexOf(".")+1).toLowerCase();
				let fileName = element.fileName.length > 10 ? element.fileName.substr(0, 10)+ "..." : element.fileName;

				if((index)%3 == 0 ){
					let row = $("<div class='row'></div>");
					row.append(controls[0]);
					row.append(controls[1]);
					row.append(controls[2]);
					controls = [];
					
					$("#driveBox").append(row);
				}
				
				let control = '<div class="col-sm-4">'
								+ '	<div class="card driveCard">'
								+ '		<div class="more" style="margin-top: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;'
								+ '			<input type="checkbox" value="css" onclick="checkBox(this)" style="width:18px; height:18px;">'
								+ '			<a style="float:right;" data-toggle="collapse" href="#detail">'
								+ '				<i class="fas fa-ellipsis-v fa-lg"></i> &nbsp;&nbsp;&nbsp;&nbsp;'
								+ '			</a>'
								+ '		</div>'
								+ '		<div style="margin-left: 60%;">'
								+ '			<ul id="detail" class="collapse">'
								+ '				<li><i class="fas fa-pencil-alt"></i>&nbsp; 이름 변경</li>'
								+ '				<li><i class="fas fa-trash-alt"></i>&nbsp; 삭제</li>'
								+ '			</ul>'
								+ '		</div>'
								+ '		<div class="card-body text-center">'
								+ '			<img class="fileDefaultImage mb-4" onerror="this.onerror=null; this.src=\'resources/images/drive/file.png\';" src="resources/images/drive/'+extension+'.png" >'
								+ '			<h4 >'+fileName+'</h4>'
								+ '		</div>'
								+ '	</div>'
								+ '</div>';
				
				controls.push(control);
			})
		},
		error : function(){
			console.log("in GetFolderData error");
		}
	})
}
