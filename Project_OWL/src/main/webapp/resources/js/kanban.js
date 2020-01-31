
let projectIdx;


let editIdx = 0;


function initKanban(projectIdx){
	this.projectIdx= projectIdx;
	
	
	//addIssueModal 모달이 오픈되면 !
	$('#addIssueModal').on('show.bs.modal', function() {  
		console.log("addIssueModal open!");
		//칸반으로 옮김 
		getissueinfo("issueModalOpen",projectIdx);

 });  
	

	$('#editLabelBtn').click(function() {
		if(editIdx == 0)
			return;
		
		$('#labelColor').val("");
		$('#labelName').val("");
			
		$.ajax({
			url : "UpdateLabel.do",
			data : {'labelIdx' : editIdx, 'labelColor' : $('#labelcolor').val(), 'labelName' : $('#labelname').val()},
			success : function(data) {
				
				//console.log('data in' + data);
				$('#'+editIdx+'Label').next().remove();
				$('#'+editIdx+'Label').remove();
				
				addLabel(editIdx, $('#labelcolor').val(), $('#labelname').val());
				
				$('#labelColor').val("");
				$('#labelName').val("");
				editIdx = 0;
				
				$('#'+editIdx+'Label').attr('style', "background-color:#fff");

			}, error : function () {
				console.log('EditLabel error');
			}
		});
	});
	
	$('#backBtn').click(function() {
		editIdx = 0;
		$('#labelcolor').val("");
		$('#labelname').val("");
		
		$('#addLabelBtn').removeClass("hidden");
		$('#editLabelBtn').addClass("hidden");
		$('#backBtn').addClass("hidden");

		$('#colorform').find('.asColorPicker-trigger').find('span').css('background-color', '#000000');
		$('.labelList').find('.edit').removeClass("hidden");

	});
	

	//검색 후 원래 칸반으로 되돌아가는 버튼 
	$('#searchReturnBtn').click(function() {
		changeKanbanView("returnlist");
	})
	
	
	
	$('#searchSelectBox').change(function () {
		
		var selectMenu = $('#searchSelectBox option:selected').val();

		if(selectMenu == "Label") {
			$('#searchContent').attr('list', 'LabelMenu');
			getLabelList("SearchLabelList", projectIdx);
		}else if(selectMenu == "Assignee") {
			$('#searchContent').attr('list', 'MemberMenu');
			getProjectMemberList("searchMember",projectIdx);
		}else if(selectMenu == "Priority") {
			$('#searchContent').attr('list', 'PriorityMenu');

			var prioritylist = '<datalist id="PriorityMenu">'
						     + '<option value="LOW" data-id="LOW"></option>'
						     + '<option value="MEDIUM" data-id="MEDIUM"></option>'
						     + '<option value="HIGH" data-id="HIGH"></option>'
						     + '<option value="URGENT" data-id="URGENT"></option>'
						     + '</datalist>'; 
			
			$('#searchContent').append(prioritylist);
		}
			
	})

	
	//검색 
	$('#kanbanSearchBtn').click(function(){
		
		$('#searchBox').find('tbody').empty();
		//console.log($('#searchSelectBox option:selected').val());
		
		if($('#searchContent').val() == "" || $('#searchContent').val() == null) {
			return;
		}
		
		let selectMN = $('#searchSelectBox option:selected').val();
		let contentVal = $('#searchContent').val();
		
		if(selectMN == "Assignee") {
			
			var memberemail = $('#MemberMenu option[value='+contentVal+']').attr('data-id');

			$.ajax ({
				url : "SearchAssignee.do",
				data : {"projectIdx" :projectIdx, "email" : memberemail},
				method : "POST",
				success : function(data) {
					searchAppend(data)

				},error : function() {
					console.log('SearchAssignee error');
				} 
			})
			
		}else if(selectMN == "Label") {
			
			var labelidx = $('#LabelMenu option[value='+contentVal+']').attr('data-id');
		
			$.ajax ({
				url : "SearchLabel.do",
				data : {"labelIdx" : labelidx},
				method : "POST",
				success : function(data) {
					searchAppend(data)
				},error : function() {
					console.log('SearchLabel error');
				} 
			})
		}else if(selectMN == "Priority") {
			
			var priorityidx = $('#PriorityMenu option[value='+contentVal+']').attr('data-id');

			$.ajax ({
				url : "SearchPriority.do",
				data : {"priorityidx" : priorityidx},
				method : "POST",
				success : function(data) {
					searchAppend(data)

				},error : function() {
					console.log('SearchLabel error');
				} 
			})
			
		}
	});


	 $('#isContentEdit').summernote({
	        height: 300,
	        toolbar: [
	            ['style', ['bold', 'italic', 'underline', 'clear']],
	            ['font', ['strikethrough', 'superscript']],
	            ['fontsize'],
	            ['color'],
	            ['para', ['ul', 'ol', 'paragraph']],
	        ]
	      });
	 
	 $('#datepicker-editIssue').datepicker({
		 dateFormat: 'yy-mm-dd' ,
   		  autoclose: true,
    	  todayHighlight: true
	 });

		$('.editViewBtn').on('click', function(e){
			    console.log($(this).parent().siblings().find(".row"));
			    if( $(this).parent().siblings().find(".row").hasClass("hidden")){
				    $(this).parent().siblings().find(".row").removeClass("hidden");
				    $(this).parent().siblings().find("span").addClass("hidden");
			    } else {
			    	$(this).parent().siblings().find("span").removeClass("hidden");
				    $(this).parent().siblings().find(".row").addClass("hidden");
			    }
			});

	
		
		

		
		
} //initKanban 끝






function searchAppend(data) {
	
	$('#searchContent').val("");
	changeKanbanView("search");
	
      $.each(data, function(index, element) {
    	  
			let labelnm = element.labelName == null ? "" : element.labelName;
			let priorityCd = element.priorityCode == null ? "-" : element.priorityCode;
			let dueDt = element.dueDate == null ? "-" : element.dueDate;
			
    	  var control = "";
    	  	  control = '<tr><td class="text-center"><label><span class="badgeIcon" style="background-color:'+ element.labelColor+'">' + labelnm + '</span></td>'
			 	      + '<td class="text-center"><a href="#" onclick="setKanbanDetail('+element.issueIdx+');">'+element.issueTitle+'</a></td>'
			          + '<td class="text-center">'+element.assigned+'</td>'
			          + '<td class="text-center">'+priorityCd+'</td>'
			          + '<td class="text-center">'+dueDt+'</td></tr>';
    	  	  $('#searchBox').find('tbody').append(control);
      });
}



function addLabel(lbidx, lbcolor, lbnm) {

   let lablist =  '<div class="row labelList" id="'+lbidx+'Label">'
            +  '<div class="col-lg-8">'
            +  '<span class="badgeIconinList" style="background-color: '+lbcolor+'">'+lbnm+'</span>'
            +  '</div>'
            +  '<div class="col-lg-2">'
            + '<button class="btn-link link-gray edit" onclick="editLabel(' + lbidx +','+"'"+lbcolor+"'"+','+"'"+lbnm+"'"+')";>Edit</button>'
            +  '</div>'
            +  '<div class="col-lg-2">'
            +  '<button class="btn-link link-gray delete" onclick="deleteLabel(' + lbidx +')";>Delete</button>'
            +  '</div></div><hr>';

   $('#labelList').append(lablist);
}

   
function addColumn(obj){
   let column = '<div class="columnSection" id="'+ obj.colIdx +'Column">'
            + '<div class="columnTitle text-center mt-2 dropdown">'
            + '<h4><span>' + obj.colname + '</span>'
            + '<a href="javascript:void(0)" data-toggle="dropdown" id = "dropdownColBtn" aria-haspopup="true" aria-expanded="false" style="float: right">' 
            + '<i class="fas fa-ellipsis-v fa-sm"></i></a>'
            + '<div class="dropdown-menu" aria-labelledby="dropdownColBtn">'
            +            '<ul class="list-style-none">'
            +   '<li class="pl-3"><a href="#editColumnModal" data-toggle="modal" '
            +    'data-updatecol-id="' + obj.colIdx +'" data-upcolname-id ="'+ obj.colname + '"'   
            +   '>Edit Column</a></li>'
            +               '<li class="pl-3"><a href="#" onclick="deleteColumn(' + obj.colIdx +');">Remove Column</a></li>'
            +            '</ul>'
            +         '</div>'
            +      '</h4>'
            +   '</div>'
            +   '<ul class="connectedSortable sortableCol columnBody cursor">'
            +   '</ul>'
            + '</div>';
   
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
			+					'<li class="pl-3"><a href="#" onclick="setKanbanDetail('+obj.issueIdx+');" data-toggle="modal">Detail</a></li>'
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
	
	console.log("in setKanbanDetail sfdsf");
	
	$.ajax({
			type: "POST",
		    url: "GetIssueDetail.do",
			data : { issueIdx : issueIdx},
			success : function (data) {
				console.log("이슈 디테일 ");
				console.log(data);
				$("#issueIdxNum").val(issueIdx);
				//issueProgress,labelIdx
				//issueContent, issueTitle, issueFileCount, issueFiles, issueActivityCount, issueActivity, issueCommentCount, issueComment
					if(data.issueProgress == 'OPEN')
						$("#closeIssueDetailBtn").attr("onclick","closeIssue("+issueIdx+")");
					else if (data.issueProgress == 'CLOSED')
						$("#closeIssueDetailBtn").attr("onclick","reOpenIssue("+issueIdx+")");
					
					$("#issueDetailTitle").text(data.issueTitle);
					$("#issueDetailContent").html(data.content);
					
					$("#issueDetailFiles").empty();
					$("#issueDetailFileCount").text("첨부파일 ("+data.files.length+") ");
					//let projectIdx = data.projectIdx;
					$.each(data.files, function(index,file){
						let path = "/upload/"+ projectIdx +"/file/"+file.fileName;
						let control = "<li class='mb-2' style='font-size: 16px'>"
										+ "	<a href='"+path+"' download><i class='far fa-save'></i>&nbsp;&nbsp;<span> "+file.fileName+" ("+file.fileSize+" KB)</span></a>"
										+" </li>";
						$("#issueDetailFiles").append(control);
					});
					
					$("#issueDetailActivity").empty();
					$("#issueDetailActivityCount").text("Activity ("+data.logs.length+") ");
					console.log("-------------------------");
					$.each(data.logs, function(index, log){
						let control = "<li> "		
										+ "	<p style='padding-top: 3px;'>"
										+ "		<b> "+log.creatorName+"</b>"
										+ "		<span> "+log.log+"</span>"
										+ "		<span class='text-muted ml-4'> "+log.logTime+"</span>"
										+ "	</p>"
										+ "</li>";
						
						$("#issueDetailActivity").append(control);
					});
					
					$("#issueDetailComment").empty();
					$("#issueDetailCommentCount").text("Comment ("+data.replies.length+") ");
					$.each(data.replies, function(index, element){
						
						
						let creatornm =  element.creator.substring(0,1);
						let control = '<div class="d-flex flex-row comment-row m-0 mb-1" id="'+element.issueRlyIdx+'Reply">'
										+ '	<div class="p-2">'
										+ '		<div class="comment_img">'+creatornm+'</div>'
										+ '	</div>'
										+ '	 <div class="comment-text w-100">'
										+ '		<h6 class="font-medium mb-2">'+element.creator
										+ '		<span class="text-muted float-right">'+element.createDate+'</span></h6>'
										+ '		<div class="mb-1" id="'+element.issueRlyIdx+'recontent">'+element.content+'</div>'
										+ '		<input type="text" class="hidden inputBox" id="'+element.issueRlyIdx+'editContent">'
										+ '		<div class="comment-footer float-right">'
										+ '		<button type="button" class="btn btn-info btn-sm" id="'+element.issueRlyIdx+'reEditBtn" onclick="editReply('+element.issueRlyIdx+', '+element.issueIdx+')">Edit</button>'
										+ '		<button type="button" class="btn btn-secondary btn-sm" id="'+element.issueRlyIdx+'reDeleteBtn" onclick="deleteReply('+element.issueRlyIdx+')">Delete</button>'
										+ '		<button type="button" class="btn btn-info btn-sm hidden" id="'+element.issueRlyIdx+'editChangeBtn">SaveChange</button>'
										+ '		<button type="button" class="btn btn-secondary btn-sm hidden replyCcBtn" id="'+element.issueRlyIdx+'editCancelBtn">Cancel</button>'
										+ '		</div>'
										+ '	</div>'
										+ '</div>';
						$("#issueDetailComment").prepend(control);
					});
					
					$("#issueDetailAssignees").text(data.assigned);
					

					if(data.labelIdx > 0){

						$("#issueDetailLabel").text(data.labelName);
						$("#issueDetailLabel").css("background-color", data.labelColor);					
					}
					else
						$("#issueDetailLabel").text("none");
					
					$("#issueDetailPriority").removeClass();
					$("#issueDetailPriority").text("");
					if(data.priorityCode != null){
						$("#issueDetailPriority").addClass("priorityBadge "+data.priorityCode.toLowerCase());
					} else{
						$("#issueDetailPriority").text("none");
					}
					if(data.dueDate != null)
						$("#issueDetailDueDate").text(data.dueDate);
					else
						$("#issueDetailDueDate").text("none");
					//console.log("이슈 프로그레스");
					//console.log(data.issueProgress);
					if(data.issueProgress == 'CLOSED')
						$("#issueClosedChk").text('Reopen issue');
					else 
						$("#issueClosedChk").text('Close issue');
		},
		error : function(){
			console.log("GetIssueDetail error");
		}
	})

	changeKanbanView("detail");
}


function closeIssue(issueIdx) {

	   $.ajax({
           url:"CloseIssue.do",
           method:"POST",
           data:{issueIdx : issueIdx},
           success:function(data){
        	$("#issueClosedChk").text('Reopen issue');
        	setKanbanDetail(issueIdx);
        	setChageView("kanban");
           }
        });  		
}


function reOpenIssue(issueIdx) {
	$.ajax({
		url:"ReopenIssue.do",
		method:"POST",
		data : {issueIdx : issueIdx},
		success:function(data) {
        	$("#issueClosedChk").text('closed issue');
        	//setKanbanDetail(issueIdx);
        	setKanbanDetail(issueIdx);
        	setChageView("kanban");
		},error :function() {
			
			console.log("ReopenIssue error");
		}
		
	})
	
	
}


function changeKanbanView(view){
   if(view == "list"){
   $("#kanbanDetailBox").addClass("hidden");
   $("#kanbanMainBox").removeClass("hidden");
}else if(view == "detail"){
   $("#kanbanMainBox").addClass("hidden");
   $("#kanbanDetailBox").removeClass("hidden");
}else if (view == "edit"){
   $("#kanbanMainBox").addClass("hidden");
   $("#kanbanDetailBox").addClass("hidden");	
 }else if (view == "search") {
   $('#searchBox').removeClass('hidden');
   $('#searchReturnBtn').removeClass('hidden');		
   $('#kanbanIn').addClass('hidden');
   $('#openIssueBtn').addClass('hidden');
   $('#closeIssueBtn').addClass('hidden');
   $('#-1Column').addClass('hidden');
   $('#-99Column').addClass('hidden'); 
 }else if (view == "returnlist") {
   $('#searchBox').addClass('hidden');
   $('#searchReturnBtn').addClass('hidden');
   $('#kanbanIn').removeClass('hidden');
   $('#-1Column').removeClass('hidden');
   $('#-99Column').removeClass('hidden');
   $('#openIssueBtn').removeClass('hidden');
   $('#closeIssueBtn').removeClass('hidden');	 
 }
   
   
}


function editLabel(idx, color, name) {
	
	console.log('idx뭐니 : ' + idx);
	//$('.labelList').attr('style', "background-color:#fff");
	$('.labelList').find('.edit').removeClass("hidden");

	//$('#labelList').$('#'+idx+'Label').removeAttr('style');
	//editIdx = idx;
	$('#addLabelBtn').addClass("hidden");
	$('#editLabelBtn').removeClass("hidden");
	$('#backBtn').removeClass("hidden");
	
	$('#labelcolor').val(color);
	$('#labelname').val(name);
	$('#colorform').find('.asColorPicker-trigger').find('span').css('background-color', color);

	//$('#'+idx+'Label').attr('style', "background-color:#CBD7E3");
	
	$('#'+idx+'Label').find('.edit').addClass("hidden");
	//css('display', 'none');
	
	};
	
	
	function deleteReply(replyIdx) {
		   $.ajax ({
		      url : "DeleteReply.do",
		      method : "POST",
		      data : {'issuerlyidx' : replyIdx},
		      success: function(data) {
		         console.log("deleteReply success in");
		         
		           $("#"+replyIdx+"Reply").remove();
  
		      }, error : function() {
		         console.log("deleteLabel error"); 
		         }
		      })
		   }	
	
	
	function editReply(issueRlyIdx, issueIdx){
		
		$('#'+issueRlyIdx+'recontent').hide(); //본 댓글
		$('#'+issueRlyIdx+'editContent').removeClass('hidden');// 변경댓글
		$('#'+issueRlyIdx+'reEditBtn').addClass("hidden"); //EDIT 버튼 
		$('#'+issueRlyIdx+'reDeleteBtn').addClass("hidden"); //Delete 버튼 
		$('#'+issueRlyIdx+'editChangeBtn').removeClass('hidden'); //saveChange 버튼
		$('#'+issueRlyIdx+'editCancelBtn').removeClass('hidden'); //cancel 버튼 
		
		let recontent= $('#'+issueRlyIdx+'recontent').text();
		
		$('#'+issueRlyIdx+'editContent').val(recontent);
		
		$('#'+issueRlyIdx+'editChangeBtn').click ( function() {
			
			let changecontent = $('#'+issueRlyIdx+'editContent').val();

			$.ajax({
				url : "EditReply.do",
			    method : "POST",
			    data : {'issueRlyIdx' : issueRlyIdx, 'content' : changecontent},
			    success : function(data) {
			    	setKanbanDetail(issueIdx);
			    	
			    }, error : function() {
			    	console.log('editReply in');
			    }
			})
		})
				
		
			$('.replyCcBtn').click(function() {
					setKanbanDetail(issueIdx);
			});

	}



	function getLabelList(flagelement,projectIdx) {
			
		  $.ajax({
				url : 'GetLabelList.do',
				data : {'projectIdx' : projectIdx},
				success : function(data) {
					console.log("Showlabel success");
					console.log(data);
					$('#labelList').empty();
					$('#labelIdx').empty();

					if(flagelement == "ShowLabelList") {
						let lablist = ""; //Make 라벨 부분에서 라벨 목록 보여줄 것 
				
						$.each(data,function(index, obj) {
					
							lablist +=  '<div class="row labelList" id="'+obj.labelIdx+'Label">';
							lablist +=  '<div class="col-lg-8">';
							lablist +=  '<span class="badgeIconinList" style="background-color: '+obj.labelColor+'">'+obj.labelName+'</span>';
							lablist +=  '</div>';
							lablist +=  '<div class="col-lg-2">';
							lablist +=  '<button class="btn-link link-gray edit" onclick="editLabel(' + obj.labelIdx +','+"'"+obj.labelColor+"'"+','+"'"+obj.labelName+"'"+')";>Edit</button>';
							lablist +=  '</div>';
							lablist +=  '<div class="col-lg-2">';
							lablist +=  '<button class="btn-link link-gray delete" onclick="deleteLabel(' + obj.labelIdx +')";>Delete</button>';
							lablist +=  '</div></div><hr>';
					});

							$('#labelList').append(lablist);
						
					}else if(flagelement == "SearchLabelList") {  //Search부분에서 Label List 보여주는 부분 
				
						var labellist = '<datalist id="LabelMenu">';
				
						$.each(data,function(index, obj) {
							labellist += '<option value="'+obj.labelName+'" data-id="'+obj.labelIdx+'"></option>';	
						});		 	
						labellist += '</datalist>';
						$('#searchContent').append(labellist);
					}else if(flagelement == "detailEdit"){
						
						$.each(data,function(index, obj) {
							
							lablist +=  '<div class="row labelList" id="'+obj.labelIdx+'Label">';
							lablist +=  '<div class="col-lg-8">';
							lablist +=  '<span class="badgeIconinList" style="background-color: '+obj.labelColor+'">'+obj.labelName+'</span>';
							lablist +=  '</div>';
							lablist +=  '<div class="col-lg-2">';
							lablist +=  '<button class="btn-link link-gray edit" onclick="editLabel(' + obj.labelIdx +','+"'"+obj.labelColor+"'"+','+"'"+obj.labelName+"'"+')";>Edit</button>';
							lablist +=  '</div>';
							lablist +=  '<div class="col-lg-2">';
							lablist +=  '<button class="btn-link link-gray delete" onclick="deleteLabel(' + obj.labelIdx +')";>Delete</button>';
							lablist +=  '</div></div><hr>';
					});
							$('#assignedEdit').append(lablist);
						
					}
			},error : function() {
					console.log("Showlabel error");
					
			}
		  });
		}
	

	function editIssueDetailView(){
		changeKanbanView("edit");
		/*
		$("#issueDetailAssignees").val;
		$("#issueDetailLabel").val;
		$("#issueDetailPriority").val();
		$("#issueDetailDueDate").val;*/
		console.log("edit  Issue Detail  View ");
		console.log($("#issueDetailAssignees").text());
		console.log($("#issueDetailLabel").text());
		
		$("#issueDetailEditTitle").val($("#issueDetailTitle").text());
		$("#issueDetailEditContent").summernote('code', $("#issueDetailContent").html());
		$("#assignedEdit").val($("#issueDetailAssignees").text());
		$("#labelIdxEdit").val($("#issueDetailLabel").text());
		$("#priorityCodeEdit").val($("#issueDetailPriority").val().toUpperCase());
		
		$("#datepicker-editIssue").val($("#issueDetailDueDate").text());
	}	
	
	
	function editTitleViewBtn(){
		$("#issueDetailTitleEdit").val($("#issueDetailTitle").text());
		if($("#editTitleBox").hasClass("hidden")){
			$("#issueDetailTitle").addClass("hidden");
			$("#editTitleBox").removeClass("hidden");
		} else {
			$("#editTitleBox").addClass("hidden");
			$("#issueDetailTitle").removeClass("hidden");
		}
	}
	function editContentViewBtn(){
		$("#isContentEdit").summernote('code', $("#issueDetailContent").html());
		if($("#editContentBox").hasClass("hidden")){
			$("#issueDetailContent").addClass("hidden");
			$("#editContentBox").removeClass("hidden");
		} else {
			$("#editContentBox").addClass("hidden");
			$("#issueDetailContent").removeClass("hidden");
		}
	}

	function editIssueTitleOk() {
		$.ajax({
			url : "UpdateIssueTitle.do",
		    method : "POST",
		    data : {issueIdx : $("#issueIdxNum").val(), issueTitle : $("#issueDetailTitleEdit").val()},
		    success : function(data){
		    	console.log(data);
		    	setKanbanDetail($("#issueIdxNum").val());
		    	$("#editTitleBox").addClass("hidden");
				$("#issueDetailTitle").removeClass("hidden");
		    }, error : function() {
		    	console.log('edit issue title in');
		    }
		});
	}
	
	function editIssueContentOk() {
		$.ajax({
			url : "UpdateIssueContent.do",
		    data : {issueIdx : $("#issueIdxNum").val(), content :$('#isContentEdit').summernote('code')},
		    success : function(data){
		    	console.log("UpdateIssueContent.do");
		    	console.log(data);
		    	setKanbanDetail($("#issueIdxNum").val());
		    	$("#editContentBox").addClass("hidden");
				$("#issueDetailContent").removeClass("hidden");
		    }, error : function() {
		    	console.log('edit issue contnet in');
		    }
		});
	}


	function getProjectMemberList(flagelement,projectidx) {
		
		console.log(projectidx);
		$.ajax({
			url : "GetProjectMemberList.do",
			data : {'projectIdx' : projectidx},
			success : function(data) {
				
				console.log('GetProjectMemberList in');
				console.log(data);
				if(flagelement == 'searchMember'){
				var memberlist = '<datalist id="MemberMenu">';

				$.each(data, function(index, obj) {
					memberlist += '<option value="'+obj.name+'" data-id="'+obj.email+'">('+obj.email+')</option>';	
				});		 	
					memberlist += '</datalist>';
				$('#searchContent').append(memberlist);
				
				} else if(flagelement == '') {
					
					
				}
			}, error : function() {
				
				
			}
			
		})
	}
	
	function editIssuePriorityOk() {
		$.ajax({
			url : "UpdateIssuePriority.do",
		    method : "POST",
		    data : {issueIdx : $("#issueIdxNum").val(), priorityCode : $('#priorityCodeEdit').val()},
		    success : function(data){
		    	console.log("UpdateIssueLabel.do");
		    	console.log(data);
		    	setKanbanDetail($("#issueIdxNum").val());
		    	$("#editPriorityBox").addClass("hidden");
				$("#issueDetailPriority").removeClass("hidden");
		    }, error : function() {
		    	console.log('edit issue contnet in');
		    }
		});
	}
	function editIssueDueDateOk() {
		$.ajax({
			url : "UpdateIssueDuedate.do",
		    method : "POST",
		    data : {issueIdx : $("#issueIdxNum").val(), 'dueDate' :$('#datepicker-editIssue').val()},
		    success : function(data){
		    	console.log("UpdateIssueDuedate.do");
		    	console.log(data);
		    	setKanbanDetail($("#issueIdxNum").val());
		    	$("#editDuedateBox").addClass("hidden");
				$("#issueDetailDueDate").removeClass("hidden");
		    }, error : function() {
		    	console.log('edit issue duedate in');
		    	console.error();
		    }
		});
	}
	function editIssueAssignedOk() {
		$.ajax({
			url : "UpdateIssueAssgined.do",
		    method : "POST",
		    data : {issueIdx : $("#issueIdxNum").val(), 'assigned' : $('#assignedEdit').val()},
		    success : function(data){
		    	setKanbanDetail($("#issueIdxNum").val());
		    	$("#editAssignedBox").addClass("hidden");
				$("#issueDetailAssignees").removeClass("hidden");
		    }, error : function() {
		    	console.log('edit issue duedate in');
		    }
		});
		
	}
	function assignListEditview(){
		//getProjectMemberList("detailEdit",$('#projectIdxNum').val());
		
	}
	function getissueinfo(flagelement, projectidx) {

		if(flagelement == "issueModalOpen") {
			
		 	let selectoption = '<option value="">Select</option>';

		 $.ajax({
		 		type: "POST",
	            url: "GetAddIssueForm.do",
	            data: { projectIdx: projectidx},
	            success: function (data) {
	            	console.log('데이터가 뭐가오니?');
	            	console.log(data);
	            	$('#assigned').empty();
	            	$('#labelIdx').empty();

					let member = data.member;
					let label = data.label;
					
					let optlabel;
					let optmember;

					$('#assigned').append(selectoption);
	                $('#labelIdx').append(selectoption);
					
	               $.each(member, function(index, element) {
						optmember += '<option value="'+element.email+'">'+element.name+'('+element.email+')</option>';
	                 });
	               
	               $('#assigned').append(optmember);

	                $.each(label, function(index, element) {
	                 	 optlabel += '<option value="'+element.labelIdx+'"style="background-color:'+element.labelColor+'">'+element.labelName+'</option>'
	                 });
	                
	                $('#labelIdx').append(optlabel);	
	            },
	            error: function () {
	                console.log("GetProjectMember error");
	            }
			})
		
		}
	}
	

