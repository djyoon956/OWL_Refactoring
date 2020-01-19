<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.memberDeleteButton{
		cursor: pointer;
	}
</style>
<div id="memberEditModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">
					<i class="icon-settings mr-2"></i>프로젝트 멤버 설정
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body modal-scroll mx-3">
				<!--  멤버 추가  -->
					<div class="form-row">
						<div class="form-group col-md-10 pr-0">
							<input type="email" id="addProjectMemeberEmail"  class="form-control" placeholder="추가할 멤버를 입력해주세요" 
										onKeypress="javascript:if(event.keyCode==13) {addProjectMember()}">
						</div>
						<div class="form-group col-md-2 pl-0">
							<input type="button" class="form-control btn btn-primary" onclick="addProjectMember()" value="추가">
						</div>
					</div>
				<!--  멤버 삭제   -->
				<label class="m-t-20">멤버 리스트</label>
					<div id="addMemberBox">
		                 <div class="modal-footer">
		                     <input type="button" id="addMemberOk" class="btn btn-primary"  value="확인">
		                 </div>
					</div>				
			</div>
		</div>
	</div>
</div>