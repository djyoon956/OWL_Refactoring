<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function () {
		$('#noticeTable').DataTable();
	});
</script>

<div class="container-fluid mt-3">
	<div class="card">
		<div class="card-body">
			<h3 class="text-center">Notice</h3>
			<div class="table-responsive">
				<table class="table table-striped table-bordered zero-configuration text-center" id="noticeTable">
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
						<tr>
							<td>1</td>
							<td>쉬지 말고 일하세요</td>
							<td>PM</td>
							<td>2020-01-10</td>
							<td>12</td>
						</tr>
						<tr>
							<td>2</td>
							<td>프로젝트가 얼마 안남았어요</td>
							<td>PM</td>
							<td>2020-01-08</td>
							<td>1234</td>
						</tr>
						<tr>
							<td>3</td>
							<td>화이팅합시다</td>
							<td>PM</td>
							<td>2020-01-09</td>
							<td>1</td>
						</tr>
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

<!-- Modal -->
<jsp:include page="../project/modal/projectMemberEdit.jsp" />
<jsp:include page="../project/modal/labelEdit.jsp" />