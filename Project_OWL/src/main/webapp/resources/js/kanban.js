


	function addColumn(obj){
		let column = '<div class="columnSection" id="'+ obj.colIdx +'Column">'
					+ '<div class="columnTitle text-center mt-2 dropdown">'
					+ '<h4>' + obj.colname
					+ '<a href="javascript:void(0)" data-toggle="dropdown" id = "dropdownColBtn" aria-haspopup="true" aria-expanded="false" style="float: right">' 
					+ '<i class="fas fa-ellipsis-v fa-sm"></i></a>'
					+ '<div class="dropdown-menu" aria-labelledby="dropdownColBtn">'
					+				'<ul class="list-style-none">'
					+	'<li class="pl-3"><a href="#editColumnModal" data-toggle="modal" '
					+    'data-updatecol-id="' + obj.colIdx +'" data-upcolname-id ="'+ obj.colname + '"'   
					+   '>Edit Column</a></li>'
					+					'<li class="pl-3"><a href="#" onclick="deleteColumn(' + obj.colIdx +');">Remove Column</a></li>'
					+				'</ul>'
					+			'</div>'
					+		'</h4>'
					+	'</div>'
					+	'<ul class="connectedSortable sortableCol columnBody cursor">'
					+	'</ul>'
					+ '</div>';

		/*$('#kanbanArea').append(column);*/
		$('#kanbanIn').append(column);
		
	}
	
	function deleteColumn(obj){
		var colIndex = obj;
		Swal.fire({
      		  title: '정말 삭제하시겠습니까?',
      		  text: '컬럼 내에 있는 이슈와 파일들이 함께 삭제됩니다.',
      		  icon: 'warning',
      		  showCancelButton: true,
      		  confirmButtonColor: '#3085d6',
      		  cancelButtonColor: '#d33',
      		  confirmButtonText: 'Yes'
      		}).then((result) => {
      		  if (result.value) {
      			$.ajax({
      	      		url:"DeleteColumn.do",
      	      		method:"POST",
      	      		data:{colIdx: colIndex},
      	      		success:function(data){
      	      			$("#"+colIndex+"Column").remove();
      	      		}
      	      	});	
      		 }			
      	});
	}

	
	function addKanbanIssue(colIdx,obj){
		if(obj.labelName == null) 
			obj.labelName = "";
		 let issue = '<li class="issuePiece" id="'+obj.issueIdx+'Issue">'
				+		'<div class="dropdown">'
				+			'<label> <span class="badgeIcon float-left" style="background-color: '+ obj.labelColor+'">' + obj.labelName + '</span>'
				+			'<span class="issueTitle">' + obj.issueTitle + '</span>'
				+			'</label>'
				+			'<a href="javascript:void(0)" data-toggle="dropdown" id="dropdownIssueButton" aria-haspopup="true" aria-expanded="false" style="float: right">' 
				+			'<i class="fas fa-ellipsis-v fa-sm"></i></a>'
				+			'<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">'
				+				'<ul class="list-style-none">'
				+					'<li class="pl-3"><a  href="#" onClick="setKanbanDetail('+obj.issueIdx+');return false;" data-toggle="modal">Detail</a></li>'
				+					'<li class="pl-3"><a href="#" onclick="deleteIssue(' + obj.issueIdx +');">Remove Issue</a></li>'
				+				'</ul>'
				+			'</div>'
				+		'</div>'
				+		'<div>'
				+			'<label>'
				+			'<span class="assigneetitle">'
				+			'<i class="fas fa-user-check"></i>&nbsp; Assignee</span> <span class="assignee">' + obj.assigned + '</span>'
				+			'</label>'
				+		'</div>'
				+	'</li>';
		
			$("#"+colIdx+"Column > .columnBody").append(issue);
		}
	
	function deleteIssue(obj){
		var issueIndex = obj;
		console.log("issue : " + issueIndex);
		console.log()
		$.ajax({
	      		url:"DeleteIssue.do",
	      		method:"POST",
	      		data:{issueIdx: issueIndex},
	      		success:function(data){
	      			$("#"+issueIndex+"Issue").remove();
	      		}
	      	});	
	}


function setKanbanDetail(issueIdx){
	console.log("in setKanbanDetail : "+issueIdx + "/" + projectIdx);

	$.ajax({
		url : "GetIssueDetail.do",
		data : {projectIdx : issueIdx, issueIdx : issueIdx},
		success : function (data){
			console.log("GetIssueDetail success");
			console.log(data);
			//issueContent, issueTitle, issueFileCount, issueFiles, issueActivityCount, issueActivity, issueCommentCount, issueComment
			$.each(data, function(){
				$("#issueTitle").text(this.issueTitle);
				$("#issueContent").html(this.content);
				
				$("#issueFiles").empty();
				$("#issueFileCount").text("첨부파일 ("+this.files.length+") ");
				$.each(this.files, function(){
					let path = "/upload/"+ projectIdx +"/file/"+this.fileName;
					console.log(path);
					let control = "<li class='mb-2' style='font-size: 16px'>"
									+ "	<a href='"+path+"' download><i class='far fa-save'></i>&nbsp;&nbsp;<span> "+this.fileName+" ("+this.fileSize+" KB)</span></a>"
									+" </li>";
					$("#issueFiles").append(control);
				});
				
				/*$("#issueActivityCount").text("Activity ("+this.issueLogs.size()+") ");
				$.each(this.issueLogs, function(file){
									
				});*/
				
			/*	$("#issueCommentCount").text("Comment ("+this.files.length+") ");
				$.each(this.files, function(file){
					
				});*/
			})
		},
		error : function(){
			console.log("GetIssueDetail error");
		}
	})
	
	changeNoticeView("detail");
}

function changeNoticeView(view){
	if(view == "list"){
		$("#kanbanDetailBox").addClass("hidden");
		$("#kanbanMainBox").removeClass("hidden");
	}else if(view == "detail"){
		$("#kanbanMainBox").addClass("hidden");
		$("#kanbanDetailBox").removeClass("hidden");
	}
}
	