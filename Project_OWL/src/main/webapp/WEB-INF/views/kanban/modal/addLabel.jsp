<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.btn-link {
	display: inline-block;
	padding: 0;
	font-size: inherit;
	color: #0366d6;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: initial;
	border: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.newLabelSection {
	padding: 10px;
	background-color: #ebedf0;
	border: 1px solid #dcdee0;
}

.labelList {
	margin-bottom: 5px;

}

.labelListSection {
	padding-left: 50px;
	padding-right: 10px;
	overflow: auto;
}


.badgeIconinList {
	display: inline-block;
	font-size: large;
	font-weight: bold;
	padding: 3px;
	color: black;
	margin-right: 7px;
	border-radius: 2px;
}

</style>

<script>
$(function() {
	console.log("라벨박스 in !!!!!!");
	
	/* $.ajax({
		url : 'GetLabelList.do',
		data : {'projectIdx' : ${project.projectIdx}},
		success : function(data) {
			console.log("Showlabel success");
			console.log(data);
			$('#labelList').empty();

			let lablist = "";
			
			 $.each(data,function(index, obj) {
				 console.log("each문 in")
				console.log(obj.labelIdx);
				console.log(obj.labelName);
				console.log(obj.labelColor);

				lablist +=  '<div class="row labelList" id="'+obj.labelIdx+'">';
				lablist +=  '<div class="col-lg-8">';
				lablist +=  '<span class="badgeIconinList" style="background-color: '+obj.labelColor+'">'+obj.labelName+'</span>';
				lablist +=  '</div>';
				lablist +=  '<div class="col-lg-2">';
				lablist +=  '<a>Edit</a>';
				lablist +=  '</div>'
				lablist +=  '<div class="col-lg-2">';
				lablist +=  '<a>Delete</a>';
				lablist +=  '</div></div><hr>';

				$('#labelList').append(lablist);
				
				 });
		},error : function() {
			console.log("Showlabel error");
		}
	
		}); */
});	
</script>
<div id="addLabelModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title w-100 font-weight-bold">
					<i class="fas fa-bookmark mr-2"></i> Label Box
				</h4>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="InsertLabel.do">
					<input type="hidden" id="projectIdx" name="projectIdx" value="${project.projectIdx}">
					<div class="row">
						<!-- label make section -->
						<div class="col-lg-5 newLabelSection">
							<div class="form-group">
								<h5>Color</h5>
								<input type="text" class="complex-colorpicker form-control"name="labelcolor" id="labelcolor"> <br> <br>
								<h5>Label name</h5>
								<input type="text" class="form-control input-default"name="labelname" id="labelname">
							</div>
							<hr>
							<input type="button" class="btn btn-primary text-right" id="addLabelBtn" value="Create label">

						</div>
						<!-- label list section -->
						<div class="col-lg-6 labelListSection" id="labelList">
							
								<div class="row labelList">
									<div class="col-lg-8">
										<span class="badgeIconinList" style="background-color: #F4D452">test</span>
									</div>
									<div class="col-lg-2">
										<a>Edit</a>
									</div>
									<div class="col-lg-2">
										<a>Delete</a>
									</div>
								</div>
								<hr>
								<div class="row labelList">
									<div class="col-lg-8">
										<span class="badgeIconinList" style="background-color: #f0f3f7">test</span>
									</div>
									<div class="col-lg-2">
										<a>Edit</a>
									</div>
									<div class="col-lg-2">
										<a>Delete</a>
									</div>
								</div>
								<hr>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
</div>


