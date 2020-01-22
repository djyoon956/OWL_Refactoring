


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
		 let issue = '<li class="issuePiece">'
				+		'<div class="dropdown">'
				+			'<label> <span class="badgeIcon float-left" style="background-color: '+ obj.labelColor+'">' + obj.labelName + '</span>'
				+			'<span class="issueTitle">' + obj.issueTitle + '</span>'
				+			'</label>'
				+			'<a href="javascript:void(0)" data-toggle="dropdown" id="dropdownIssueButton" aria-haspopup="true" aria-expanded="false" style="float: right">' 
				+			'<i class="fas fa-ellipsis-v fa-sm"></i></a>'
				+			'<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">'
				+				'<ul class="list-style-none">'
				+					'<li class="pl-3"><a  href="#" onClick="setKanbanDetail('+obj.issueIdx+');return false;" data-toggle="modal">Detail</a></li>'
				+					'<li class="pl-3"><a href="#">Remove Issue</a></li>'
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
	
	
	function makeIssueForm (data) {
		let fr = '<div class="modal-dialog modal-lg">'
			+ '<div class="modal-content">'
			+ '<div class="modal-header">'
			+ '<h5 class="modal-title">New Issue</h5>'
			+ '<button type="button" class="close" data-dismiss="modal">'
			+ '<span>&times;</span>'
			+ '</button>'
			+ '</div>'
			+ '<div class="modal-body">'
		    + '<form action="InsertIssue.do" method="post" enctype="multipart/form-data">'
		    + '<input type="hidden" id="projectIdx" name="projectIdx" value="${project.projectIdx}">'
 		    + '<div class="row">'
		    + '<div class="col-8">'
		    + '<div class="form-group">'
		    + '<input type="text" class="form-control input-default" placeholder="Issue Title" name="issueTitle" id="issueTitle">'
		    + '</div>'
		    + '<div class="form-group">'
 		    + '<textarea class="form-control bg-light" rows="10" cols="50" placeholder="Issue Content" id="content" name="content"></textarea>'
		    + '<input type="file" name="multipartFiles" id="multipartFiles" multiple="multiple">'
		    + '</div>'
		    + '</div>'
		    + '<div class="col-4">'
		    + '<div class="form-group">'
		    + '<div class="row">'
		    + '<div class="col-4">Assignees</div>'	
		    + '<div class="col-8">'
		    + '<select class="select2 form-control custom-select" name="assigned" id="assigned">'
		    + '<option value="">Select Assignee</option>'
		    + '<option value="Cathy">Cathy</option>'
		    + '<option value="Cindy">Cindy</option>'
		    + '<option value="Colin">Colin</option>'
		    +  '<option value="Chloe">Chloe</option>'
		    +  '</select>'
		    + '</div>'
		    + '</div>'
		    + '</div>'
		    + '<hr>'
		    + '<div class="form-group">'
		    + '<div class="row">'
		    + '<div class="col-4">Label</div>'	
		    +  '<div class="col-8">'
		    
		    
/*			<select class="select2 form-control custom-select" name="assigned" id="assigned">
		<option value="">Select Assignee</option>
		<option value="Cathy">Cathy</option>
		<option value="Cindy">Cindy</option>
		<option value="Colin">Colin</option>
		<option value="Chloe">Chloe</option>
		</select>
		</div>
					
		</div>
		</div>
		<hr>
		<div class="form-group">
		<div class="row">
		<div class="col-4">Label</div>	
		<div class="col-8">
		<select class="select2 form-control custom-select" name="labelIdx" id="labelIdx">
								
		</select>
		</div>									
		</div>
		</div>
		<hr>
		<div class="form-group">
		<div class="row">
		<div class="col-4">Priority</div>	
		<div class="col-8">
		<select class="select2 form-control custom-select" name="priorityCode" id="priorityCode">
		<option value="" id="">Select Priority</option>
		<option value="LOW">low</option>
		<option value="MEDIUM">medium</option>
		<option value="HIGH">high</option>
		<option value="URGENT">urgent</option>
								
		</select>
		</div>									
		</div>
		</div>
		<hr>
		<div class="form-group">
		<div class="row">
		<div class="col-4">Due Date</div>	
		<div class="col-8">                                
        <input type="text" class="form-control" id="datepicker-autoclose" placeholder="yyyy-mm-dd" name="dueDate" >
        </div>	
		</div>
		</div>
		</div>
		</div> 
		<div class="modal-footer text-right">
		<input type="button" class="btn btn-primary" id="InsertIssueBtn" value="Save changes">
		<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		</div>
		</form>
		</div>
	</div>
</div>*/
		    
	}
	function addIssue(colIdx,obj){
		 let issue = '<li class="issuePiece">'
				+		'<div class="dropdown">'
				+			'<label> <span class="badgeIcon float-left" id= "'+ obj.labelIdx +'"></span>'
				+			'<span class="issueTitle">' + obj.issueTitle + '</span>'
				+			'</label>'
				+			'<a href="javascript:void(0)" data-toggle="dropdown" id="dropdownIssueButton" aria-haspopup="true" aria-expanded="false" style="float: right">' 
				+			'<i class="fas fa-ellipsis-v fa-sm"></i></a>'
				+			'<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">'
				+				'<ul class="list-style-none">'
				+					'<li class="pl-3"><a href="#editIssueModal" data-toggle="modal">Edit Issue</a></li>'
				+					'<li class="pl-3"><a href="#">Remove Issue</a></li>'
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
	