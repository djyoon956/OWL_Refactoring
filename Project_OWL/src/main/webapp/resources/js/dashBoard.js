$(function() {
	$("#dashboardTable").DataTable({
		"pageLength": 5,
         fixedColumns: true,
         autoWidth: false,
         "ordering" : false,
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
			 setTimeLine();
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
			if(data.length > 0){
				$("#dashBoardTableEmptyBox").addClass("hidden");
				$("#dashBoardTableBox").removeClass("hidden");
				
				$.each(data, function(index, element){
					$('#dashboardTable').DataTable().row.add([
						element.projectName,
						element.subject,
						element.dueDate!=null? getDueDateElement(element.dueDate):"-",
						element.priorityCode!=null? "<span class='priorityBadge "+element.priorityCode.toLowerCase()+"'></span>":"-"
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

function getDueDateElement(date){
	let result = "";
	let now = new Date();
	let dates = date.split("-"); 
	let target = new Date(dates[0], Number(dates[1])-1, dates[2]);  
	
	let betweenDay = Math.round((target-now)/(1000*60*60*24))+1;
	if(betweenDay < 0)
		result = "<span style='color:red; font-weight: bold;'>Past by "+Math.abs(betweenDay)+" days</span>";
	else if(betweenDay === 0)
		result = "<span style='background-color:yellow;font-weight: bold; padding-left: 20px;padding-right: 20px;'>Today</span>";
	else if(betweenDay === 1)
		result = "<span style='color:green; font-weight: bold;'>Tomorrow</span>";
	else
		result = date;
	
	return result;
}

function setTimeLine(){
	let week = new Array('일', '월', '화', '수', '목', '금', '토'); 
	let today = new Date();
	let year = today.getFullYear(); 
	let month = (today.getMonth() + 1) < 10? "0"+(today.getMonth() + 1):(today.getMonth() + 1); 
	let day = today.getDate(); 
	let dayName = week[today.getDay()];
	
	let todayFormat = year+"-"+month+"-"+day+" ("+dayName+")";
	$.ajax({
		url : "GetMyTimeLine.do",
		success : function(data){
			$("#timeLineDate").text("Today : "+todayFormat);
			$("#dashboardTimeLine ul:first").empty();
			$.each(data, function(key, value){
					console.log(key);
					console.log(todayFormat==key);
					let control = "<li><p class='float-right'>"+((key==todayFormat)?"Today":key)+"</p>";

					let group = value.reduce((r, a) => {
																 r[a.projectName] = [...r[a.projectName] || [], a];
																 return r;
															}, {});

					$.each(group, function(key2, value2){
						control += "<span style='background-color: "+value2[0].projectColor+"'>"+key2+"</span>";

						$.each(value2, function(index, element){
							control += "<p>"+element.subject+"</p>";
						})
					})

					$("#dashboardTimeLine ul:first").append(control+"</li>");
			})
		},
		error : function(){
			console.log("in setTimeLine error");
		}
	})
}