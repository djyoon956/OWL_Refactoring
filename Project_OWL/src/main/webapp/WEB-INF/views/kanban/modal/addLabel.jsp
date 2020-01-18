<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

</script>
<div id="addLabelModal" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">
					<i class="fas fa-bookmark mr-2"></i> New label
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mx-3">
				<!--  라벨 추가  -->
				<div class="row">
					<form action="InsertLabel.do" method="post">
						<div class="col-md-4 m-b-10" style="height: 100px">
							<span class="m-b-10">Color</span> 
							<input type="text" class="complex-colorpicker form-control" id="labelcolor">
						</div>
						<div class="form-group col-md-6  pr-2" style="margin-bottom: 0">
							<span class="m-b-10">Label name</span>
							<input type="text" id="labelname" class="form-control" placeholder="라벨명을 설정해주세요">
						</div>
						<div class="form-group col-md-2 pl-0">
							<span class="m-b-10">&nbsp;</span> 
							<input type="button" id="addLabelBtn" class="form-control btn btn-primary" value="추가">
						</div>
					</form>
				</div>

				<hr>
				<div class="row">
					<div class="col-md-4 m-b-10" style="height: 100px">
						<span style="background-color: yello; display: inline-block">dev</span>
						<span>Edit</span> <span>Delete</span>
					</div>
				</div>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
