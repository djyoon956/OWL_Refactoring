let projectIdx;

	function addLabel(lbidx, lbcolor, lbnm) {

		let lablist =  '<div class="row labelList" id="'+lbidx+'Label">'
					+  '<div class="col-lg-8">'
					+  '<span class="badgeIconinList" style="background-color: '+lbcolor+'">'+lbnm+'</span>'
					+  '</div>'
					+  '<div class="col-lg-2">'
					+  '<button class="btn-link link-gray" onclick="editLabel(' + lbidx +')";>Edit</button>'
					+  '</div>'
					+  '<div class="col-lg-2">'
					+  '<button class="btn-link link-gray" onclick="deleteLabel(' + lbidx +')";>Delete</button>'
					+  '</div></div><hr>';
	
	
	$('#labelList').append(lablist);
	}

	
	function initKanban(projectIdx){
		this.projectIdx= projectIdx;
	}

	
	function addColumn(obj){
		let column = '<div class="columnSection" id="'+ obj.colIdx +'Column">'
					+ '<div class="columnTitle text-center mt-2 dropdown">'
					+ '<h4><span>' + obj.colname + '</span>'
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
		console.log("addKanbanIssue in");
		console.log(obj);
		if(obj.labelName == null) 
			obj.labelName = "";
		if(obj.assigned == null) 
			obj.assigned  = "none";
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

	
	function deleteLabel(labelidx) {
		$.ajax ({
			url : "DeleteLabel.do",
			method : "POST",
			data : {'labelIdx' : labelidx},
			success: function(data) {
				console.log("deleteLabel success in");
				
				$("#"+labelidx+"Label").next().remove();
      			$("#"+labelidx+"Label").remove();

				
			}, error : function() {
				console.log("deleteLabel error");
				
			}
		})
	}
	
	

function setKanbanDetail(issueIdx){
	$.ajax({
		type: "POST",
        url: "GetIssueDetail.do",
		data : {projectIdx : this.projectIdx, issueIdx : issueIdx},
		success : function (data) {
			console.log("GetIssueDetail success");
			console.log(data);
			//issueContent, issueTitle, issueFileCount, issueFiles, issueActivityCount, issueActivity, issueCommentCount, issueComment
				$("#issueDetailTitle").text(data.issueTitle);
				$("#issueDetailContent").html(data.content);
				
				$("#issueDetailFiles").empty();
				$("#issueDetailFileCount").text("첨부파일 ("+data.files.length+") ");
				$.each(data.files, function(file){
					let path = "/upload/"+ projectIdx +"/file/"+file.fileName;
					console.log(path);
					let control = "<li class='mb-2' style='font-size: 16px'>"
									+ "	<a href='"+path+"' download><i class='far fa-save'></i>&nbsp;&nbsp;<span> "+file.fileName+" ("+file.fileSize+" KB)</span></a>"
									+" </li>";
					$("#issueDetailFiles").append(control);
				});
				
				$("#issueDetailActivity").empty();
				$("#issueDetailActivityCount").text("Activity ("+data.logs.length+") ");
				$.each(data.logs, function(log){
					$("#issueDetailActivity").append("<li> <p> "+log.log+"</p> </li>")
				});
				
				$("#issueDetailComment").empty();
				$("#issueDetailCommentCount").text("Comment ("+data.replies.length+") ");
				$.each(data.replies, function(reply){
					let control = '<div class="d-flex flex-row comment-row m-0">'
									+ '	<div class="p-2">'
									+ '		<div class="comment_img">C</div>'
									+ '	</div>'
									+ '	 <div class="comment-text w-100">'
									+ '		<h6 class="font-medium mb-1">Cindy'
									+ '		<span class="text-muted float-right">Jan 18, 2020</span></h6>'
									+ '		<div class="mb-1 d-block"><span>화이팅</span></div>'
									+ '		<div class="comment-footer">'
									+ '		<button type="button" class="btn btn-info btn-sm">Edit</button>'
									+ '		<button type="button" class="btn btn-secondary btn-sm">Delete</button>'
									+ '		</div>'
									+ '	</div>'
									+ '</div>';
					$("#issueDetailComment").append(control);
				});
				
				$("#issueDetailAssignees").text(data.assigned);
				
				if(data.labelIdx > 0){
					$("#issueDetailLabel").text(data.labelName);
					$("#issueDetailLabel").css("background-color", data.labelColor);					
				}
				else
					$("#issueDetailLabel").text("none");
				
				if(data.priorityCode != null)
					$("#issueDetailPriority").addClass("priorityBadge "+data.priorityCode.toLowerCase());
				 else
					$("#issueDetailPriority").text("none");
					
				if(data.dueDate != null)
					$("#issueDetailDueDate").text(data.dueDate);
				else
					$("#issueDetailDueDate").text("none");
		},
		error : function(){
			console.log("GetIssueDetail error");
		}
	})
	
	changeNoticeView("detail");
}


function changeKanbanView(view){
	if(view == "list"){
		$("#kanbanDetailBox").addClass("hidden");
		$("#kanbanMainBox").removeClass("hidden");
	}else if(view == "detail"){
		$("#kanbanMainBox").addClass("hidden");
		$("#kanbanDetailBox").removeClass("hidden");
	}
}

function editLabel(idx, color, name) {
	
	console.log(idx);
	console.log(color);
	console.log(name);

	$('#addLabelBtn').hide();
	$('#labelcolor').focus();

	$('#addLabelBtn').addClass("hidden");
	
	$('#labelcolor').val(color);
	$('#labelname').val(name);
	

	$('#'+idx+'Label').attr('style', "background-color:#CBD7E3");
	
}


	