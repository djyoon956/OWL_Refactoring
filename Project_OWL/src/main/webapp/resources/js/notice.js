"use strict";

function initNotice(){
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
			console.log(notice);
			console.log(notice.title);
			console.log(notice.content);
			$("#DetailBox #title").val(notice.title);
			$("#DetailBox #content").html(notice.content);
			
			changeNoticeView("DetailBox");
		}
	}); 
}

function setNoticeData(projectIdx) {
	 $.ajax({
		type: "POST",
		url: "GetNotices.do",
		data: {projectIdx: projectIdx},
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

function writeNoticeOk(projectIdx){
	console.log("WriteNoticeOk");
	console.log(projectIdx);
    let formData = new FormData();
    formData.append("projectIdx", projectIdx);
    formData.append("content",$('#noticeNote').summernote('code'));
    formData.append("title",$("#title").val());
    $.each($("#multipartFiles")[0].files, function(i, file) {
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
	setNoticeData(projectIdx);
}

function changeNoticeView(view){
	if(view == "noticeBox"){
		$("#DetailBox").addClass("hidden");
		$("#writeBox").addClass("hidden");
		$("#noticeBox").removeClass("hidden");
	}else if(view == "writeBox"){
		$("#noticeBox").addClass("hidden");
		$("#DetailBox").addClass("hidden");
		$("#writeBox").removeClass("hidden");
	}else if(view == "DetailBox"){
		$("#noticeBox").addClass("hidden");
		$("#writeBox").addClass("hidden");
		$("#DetailBox").removeClass("hidden");
}
	
	
}
