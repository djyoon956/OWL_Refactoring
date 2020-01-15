<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	#writeBox {
		display: none
	}
</style>
<script type="text/javascript">
	function setNoticeData() {
		$.ajax({
			type: "POST",
			url: "GetNotices.do",
			data: {
				projectIdx: $ {
					project.projectIdx
				}
			},
			success: function (data) {
				$("#noticeTable tbody").empty();
				$.each(data, function (index, element) {
					let row = "<tr>" +
						"<td>" + element.noticeIdx + "</td>" +
						"<td>" + element.title + "</td>" +
						"<td>" + element.email + "</td>" +
						"<td>" + element.writeDate + "</td>" +
						"<td>" + element.readNum + "</td>" +
						"</tr>";

					$("#noticeTable tbody").append(row);
				})
			},
			error: function () {
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
				<button class="btn btn-primary" onclick="writeNotice()"><i class="icon-pencil"></i>&nbsp; 글쓰기</button>
			</div>
		</div>
	</div>

	<div class="card" id="writeBox">
		<div class="card-body">
			<div class="col-md-10 offset-1">
				<div class="compose-content">
					<h3 class="text-center">Notice</h3><br>
					<form action="#" enctype="multipart/form-data">
						<div class="form-group">
							<input type="text" class="form-control bg-transparent" placeholder="제목을 입력해주세요">
						</div>
						<div class="form-group">
							<textarea class="form-control bg-light" rows="10" cols="60" id="summernote"
								name="summernote"></textarea>
						</div>
						<h5 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i>&nbsp;파일첨부</h5>
						<div class="form-group">
							<div class="fallback">
								<input class="l-border-1" name="file" type="file" multiple="multiple">
							</div>
						</div>
				</div>
				<div class="form-group text-center">
					<input type="submit" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10 mr-2"
						value="확인">
					<button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button"
						onclick="location.href='Notice.do'" id="noticeDelBtn">취소</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>