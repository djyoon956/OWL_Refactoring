<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	 $(".complex-colorpicker").asColorPicker({
	        mode: 'complex'
    });
})
</script>
<div id="labelEditModal" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold"><i class="fas fa-bookmark mr-2"></i> 라벨 추가 </h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
			<div class="modal-body mx-3">
			<!--  라벨 추가  -->
					 <!-- <i class="fas fa-bookmark iconSizeBig" style="color: #ff9933 !important;"></i> -->
				<div class="row">
					<div class="col-md-4 m-b-10">
						<input type="text" class="complex-colorpicker form-control" value="#fa7a7a">
					</div>
					<div class="form-group col-md-6  pr-0">
						<input type="text" name="" class="form-control"
							placeholder="라벨명을 설정해주세요">
					</div>
					<div class="form-group col-md-2 pl-0">
						<input type="button" class="form-control btn btn-primary" value="추가">
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 m-b-10">
						<input type="text" class="complex-colorpicker form-control" value="#b3b3ff">
					</div>
					<div class="form-group col-md-6 pr-0">
						<input type="text" name="" class="form-control"
							placeholder="라벨명을 설정해주세요">
					</div>
					<div class="form-group col-md-2 pl-0">
						<input type="button" class="form-control btn btn-primary" value="추가">
					</div>
				</div>
			</div>
		</div>
  </div>
</div>    