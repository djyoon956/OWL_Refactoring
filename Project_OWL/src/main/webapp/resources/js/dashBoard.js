$(function() {
	$("#dashboardTable").DataTable({
		stateSave: true, // 페이지 상태 저장
	 	"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
         fixedColumns: true,
         autoWidth: false
	});
	
	 $("#dashCalendar").tuiCalendar({
		  defaultView: 'month',
		  taskView: true
	}); 
 
	 $.ajax({
		 url : "CheckJoinProject.do",
		 success : function(data){
			 console.log("in CheckJoinProject success");
			 if(data < 1){ // 참여중인 프로젝트가 없음
				 $("#myDashBoardBox").addClass("hidden");
				 $("#myDashBoardEmptyBox").removeClass("hidden");
				 return;
			 }
			 
			 $("#myDashBoardBox").removeClass("hidden");
			 $("#myDashBoardEmptyBox").addClass("hidden");
			 setMyIssueTask();
		 },
		 error : function(){
			 console.log("in CheckJoinProject error");
		 }
	 })
});


function setMyIssueTask(){
	$.ajax({
		url : "GetMyIssueTask.do",
		success : function(data){
			console.log("in setMyIssueTask success");
			console.log(data);
			if(data.length > 0){
				$("#dashBoardTableEmptyBox").addClass("hidden");
				$("#dashBoardTableBox").removeClass("hidden");
			}else{ // 할당된 이슈 없음
				$("#dashBoardTableEmptyBox").removeClass("hidden");
				$("#dashBoardTableBox").addClass("hidden");
			}
		},
		error : function(){
			console.log("in setMyIssueTask error");
		}
	})
}