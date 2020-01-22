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
}


function setDetailData(boardIdx){
	$.ajax({
		type: "POST",
		url: "GetNotice.do",
		data: {boardIdx: boardIdx},
		success: function (notice) {
			$("#detailBox #noticeTitle").text(notice.title);
			$("#detailBox #noticeContent").html(notice.content);
			console.log("file");
			console.log(notice.files);
			$("#noticeFiles").empty();
			$("#noticeFileCount").text("첨부파일 ("+notice.files.length+")");
			$.each(notice.files, function(){
				//noticeFiles
				console.log(this);
				let path = "/upload/"+ noticeProjectIdx +"/file/"+this.fileName;
				console.log(path);
				let control = "<li class='mb-2' style='font-size: 16px'>"
								+ "	<a href='"+path+"' download><i class='far fa-save'></i>&nbsp;&nbsp;<span> "+this.fileName+" ("+this.fileSize+" KB)</span></a>"
								+" </li>";
				$("#noticeFiles").append(control);
			})
			changeNoticeView("detailBox");
		}
	}); 
}

function setNoticeData() {
	changeNoticeView("noticeBox");
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
		}
	}); 
}

function writeNotice() {
	$("#noticeNote").summernote({
		height: 310,
        placeholder: "내용을 입력하세요.",
        popover: {
            image: [],
            link: [],
            air: []
          }
	});
	
	changeNoticeView("writeBox");
}

function cancelNotice(){
	$("#noticeForm")[0].reset();
	$("#noticeNote").summernote('reset');
	changeNoticeView("noticeBox");
}

function writeNoticeOk(){
	console.log("WriteNoticeOk");
    let formData = new FormData();
    formData.append("projectIdx", noticeProjectIdx);
    formData.append("content",$('#noticeNote').summernote('code'));
    formData.append("title",$("#title").val());
    $.each($("#noticeMultipartFiles")[0].files, function(i, file) {
    	formData.append('multipartFiles', file);
    });
    
    console.log($('#noticeNote').summernote('code'));
    console.log($("#title").val());
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

function changeNoticeView(view){
	if(view == "noticeBox"){
		$("#noticeDetailBox").addClass("hidden");
		$("#writeBox").addClass("hidden");
		$("#noticeBox").removeClass("hidden");
	}else if(view == "writeBox"){
		$("#noticeBox").addClass("hidden");
		$("#noticeDetailBox").addClass("hidden");
		$("#writeBox").removeClass("hidden");
	}else if(view == "detailBox"){
		$("#noticeBox").addClass("hidden");
		$("#writeBox").addClass("hidden");
		$("#noticeDetailBox").removeClass("hidden");
	}
}
