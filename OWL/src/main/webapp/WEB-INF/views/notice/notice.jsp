<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script type="text/javascript">
	function setNoticeData(){
		$.ajax({
	        type : "POST",
	        url : "GetNotices.do",
	        data : {projectIdx : ${project.projectIdx}},
	        success : function(data) {
	            $("#noticeTable tbody").empty();
	            $.each(data, function(index, element){
		            let row = "<tr>"
				            		+ "<td>"+element.noticeIdx+"</td>"
			            			+ "<td>"+element.title+"</td>"
			            			+ "<td>"+element.email+"</td>"
			            			+ "<td>"+element.writeDate+"</td>"
			            			+ "<td>"+element.readNum+"</td>"
		            			+ "</tr>";
		            			
           			$("#noticeTable tbody").append(row);
	            })
	        }, error : function(){
	        	console.log("setNoticeData error");
	        }
	    }); 
	}
</script>

<div class="container-fluid mt-3">
	<div class="card">
		<div class="card-body">
			<h3 class="text-center">Notice</h3>
			<div class="table-responsive">
				<table class="table  table-hover table-bordered zero-configuration text-center" id="noticeTable">
					<thead>
						<tr>
							<th width="10%">NO</th>
							<th width="53%">제목</th>
							<th width="15%">작성자</th>
							<th width="15%">작성일</th>
							<th width="7%">조회</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
			<div class="text-right mt-3 ">
				<button class="btn btn-primary" type="submit" id="notice" name=""
					onclick="location.href='NoticeWrite.do'"><i class="icon-pencil"></i>&nbsp; 글쓰기</button>
				&emsp;&emsp;
			</div>
		</div>
	</div>
</div>
