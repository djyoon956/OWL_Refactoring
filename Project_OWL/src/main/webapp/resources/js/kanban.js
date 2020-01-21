


	function addColumn(obj){
		console.log('addColumn function in');
		console.log(obj)
		console.log("addColumn :" + obj.colIdx);
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

		$('#kanbanArea').append(column);
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
	
	
	
	


	