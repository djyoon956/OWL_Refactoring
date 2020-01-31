$(function() {
	$("#dashboardTable").DataTable({
		"pageLength": 5,
         fixedColumns: true,
         autoWidth: false,
         "searching": false,
         "lengthChange": false,
         "sScrollY": "270px",
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
				
				$.each(data, function(index, element){
					let priorityCode = element.priorityCode!=null? "<span class='priorityBadge "+element.priorityCode.toLowerCase()+"'></span>":"-"
					$('#dashboardTable').DataTable().row.add([
						element.projectName,
						element.subject,
						element.dueDate,
						priorityCode
					]).draw();
					//.node().id = element.driveFileIdx;
					//$('#dashboardTable').DataTable().draw();
				})
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