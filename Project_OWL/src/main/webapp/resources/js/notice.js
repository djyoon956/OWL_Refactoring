"use strict";

let noticeProjectIdx;
function initNotice(projectIdx){
	noticeProjectIdx = projectIdx;
	console.log("notice init : "+noticeProjectIdx);
	$('#noticeTable').DataTable({
	 	stateSave: true, // 페이지 상태 저장
	 	"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        fixedColumns: true,
        autoWidth: false
	});
	
	$('#noticeTable_length select').attr("class","select2 form-control custom-select");
	$('#noticeTable tbody').on('click', 'tr', function () {
        let data = $('#noticeTable').DataTable().row( this ).data();
        setDetailData(data[0]);
    });
	
	$("#noticeNote").summernote({
		height: 310,
        placeholder: "내용을 입력하세요.",
        popover: {
            image: [],
            link: [],
            air: []
          }
	});
	$("#noticeEditNote").summernote({
		height: 310,
        placeholder: "내용을 입력하세요.",
        popover: {
            image: [],
            link: [],
            air: []
          }
	});
}

let detailNoticeIdx = 0;
function setDetailData(boardIdx){
	$.ajax({
		type: "POST",
		url: "GetNotice.do",
		data: {boardIdx: boardIdx},
		success: function (notice) {
			detailNoticeIdx = boardIdx;
			$("#noticeTitle").text(notice.title);
			$("#noticeContent").html(notice.content);
			
			$("#noticeFiles").empty();
			$("#noticeFileCount").text("첨부파일 ("+notice.files.length+")");
			$.each(notice.files, function(){
				let path = "/upload/"+ noticeProjectIdx +"/file/"+this.fileName;
				console.log(path);
				let control = "<li class='mb-2' style='font-size: 16px'>"
								+ "	<a href='"+path+"' download><i class='far fa-save'></i>&nbsp;&nbsp;<span> "+this.fileName+" ("+this.fileSize+" KB)</span></a>"
								+" </li>";
				$("#noticeFiles").append(control);
			})
			/*$("#editNoticeBtn").attr("onclick","editNoticeSetView( '"+ notice +"' )");*/
			console.log("노티스 데이터");
			console.log(notice);
			changeNoticeView("detailBox");
		}
	}); 
}

function setNoticeData() {
	console.log("in setNoticeData");
	 $.ajax({
		type: "POST",
		url: "GetNotices.do",
		data: {projectIdx: noticeProjectIdx},
		success: function (data) {
			if(data.length > 0){
				$('#noticeTable').DataTable().clear();
				$.each(data, function (index, element) {
				$('#noticeTable').DataTable().row.add( [
						element.boardIdx,
						element.title,
						element.email,
						element.writeDate,
						element.readNum
			        ]).draw();
				})

				$("#emptyNoticeBox").addClass("hidden");
				$("#noticeTableBox").removeClass("hidden");
			}else{
				$("#emptyNoticeBox").removeClass("hidden");
				$("#noticeTableBox").addClass("hidden");
			}
			changeNoticeView("noticeBox");
		}
	}); 
}

function writeNotice() {
	changeNoticeView("writeBox");
}

function cancelNotice(){
	$("#noticeForm")[0].reset();
	$("#noticeNote").summernote('reset');
	changeNoticeView("noticeBox");
}

function writeNoticeOk(){
	if($("#title").val() == "" || $('#noticeNote').val()==""){
		warningAlert("내용을 모두 작성해주세요.");
		return;
	}
	
    let formData = new FormData();
    formData.append("projectIdx", noticeProjectIdx);
    formData.append("content",$('#noticeNote').summernote('code'));
    formData.append("title",$("#title").val());
    $.each($("#noticeMultipartFiles")[0].files, function(i, file) {
    	formData.append('multipartFiles', file);
    });

    let notice;
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "WriteNotice.do",
        data: formData,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {
        	console.log(data);
        	if(data> 0){
        		successAlert("공지사항 작성 완료");
        		cancelNotice();
        		setDetailData(data);
        	}
        	else
        		writeNoticeError();
        },
        error: function (e) {
        	writeNoticeError()
        }
    });
}

function writeNoticeError(){
	errorAlert("공지사항 작성 실패 ");
	cancelNotice();
	setNoticeData(noticeProjectIdx);
}

function deleteNotice(){
	$.ajax({
		url : "DeleteNotice.do",
		type : "POST",
		data : {noticeIdx : detailNoticeIdx},
		success : function(data){
			if(data){
				successAlert("삭제 완료!");
				setNoticeData();
			} else
				warningAlert("삭제 실패!");
		},
		error : function(){
			warningAlert("삭제 실패!");
		}
	})
}

function editNoticeSetView(){
	/*element.boardIdx,
	element.title,
	element.email,
	element.writeDate,
	element.readNum */
	console.log("edit 화면 ");
	changeNoticeView("editBox");
	
    console.log("파일 ");
	console.log($("#noticeFiles").text());
	$("#editTitle").val($("#noticeTitle").text());
	$('#noticeEditNote').summernote('code',$("#noticeContent").html());
	  $.each($("#noticeFiles").text(), function(i, file) {
	    	//formData.append('multipartFiles', file);
		  	
	   });
}

function changeNoticeView(view){
	if(view == "noticeBox"){
		detailNoticeIdx = 0;
		$("#noticeDetailBox").addClass("hidden");
		$("#writeBox").addClass("hidden");
		$("#editBox").addClass("hidden");
		$("#noticeBox").removeClass("hidden");
	}else if(view == "writeBox"){
		detailNoticeIdx = 0;
		$("#noticeBox").addClass("hidden");
		$("#noticeDetailBox").addClass("hidden");
		$("#editBox").addClass("hidden");
		$("#writeBox").removeClass("hidden");
	}else if(view == "detailBox"){
		$("#noticeBox").addClass("hidden");
		$("#writeBox").addClass("hidden");
		$("#editBox").addClass("hidden");
		$("#noticeDetailBox").removeClass("hidden");
	}else if(view == "editBox"){
		$("#noticeDetailBox").addClass("hidden");
		$("#editBox").removeClass("hidden");
	}
}


