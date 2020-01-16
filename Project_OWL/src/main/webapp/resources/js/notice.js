"use strict";

function initNotice(){
	$('#noticeTable').DataTable({
	 	stateSave: true, // 페이지 상태 저장
	 	"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
	});
	$('#noticeTable_length select').attr("class","select2 form-control custom-select");
}

function setNoticeData(projectIdx) {
	console.log("in setNoticeData");
	 $.ajax({
		type: "POST",
		url: "GetNotices.do",
		data: {projectIdx: projectIdx},
		success: function (data) {
			if(data.length > 0){
				$("#noticeTable tbody").empty();
				$.each(data, function (index, element) {
				$('#noticeTable').DataTable().row.add( [
						element.noticeIdx,
						element.title,
						element.email,
						element.writeDate,
						element.readNum
			        ] ).draw();
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
	
	$("#noticeBox").addClass("hidden");
	$("#writeBox").removeClass("hidden");
}

function cancelNotice(){
	$("#writeBox").addClass("hidden");
	$("#noticeBox").removeClass("hidden");
	$("#noticeForm")[0].reset();
	$("#noticeNote").summernote('reset');
}

function writeNoticeOk(){
    let formData = new FormData();
    formData.append("projectIdx",$("#projectIdx").val());
    formData.append("content",$('#noticeNote').summernote('code'));
    formData.append("title",$("#title").val());
    $.each($("#multipartFiles")[0].files, function(i, file) {
    	formData.append('multipartFiles', file);
    });

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "WriteNotice.do",
        data: formData,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
        	console.log(data);
        	if(data){
        		successAlert("공지사항 작성 완료");
        	}else{
        		errorAlert("공지사항 작성 실패");
        	}
        },
        error: function (e) {
        	errorAlert("공지사항 작성 실패");
        }
    }).done(function(data){
    	cancelNotice();
    	setNoticeData($("#projectIdx").val());
    });
}

