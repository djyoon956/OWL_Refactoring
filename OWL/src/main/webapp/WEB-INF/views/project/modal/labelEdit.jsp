<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<div class="form-row">
			<!-- 	<div class="form-group col-md-2 text-center"> -->
			
					 <!-- <i class="fas fa-bookmark iconSizeBig" style="color: #ff9933 !important;"></i> -->
					 <!--  <input type="color" class="complex-colorpicker form-control" value="#ff9933"> -->
					<div class="col-md-4 m-b-30">
						<div class="example">
							<h5 class="box-title">Complex mode</h5>
							<p class="text-muted m-b-20">
								just add class to create it.
							</p>
							<input type="text" class="complex-colorpicker form-control"
								value="#fa7a7a">
						</div>
					</div>


					<!-- </div> -->
					<div class="form-group col-md-8 pr-0">
						<input type="text" name="" class="form-control" placeholder="라벨명을 설정해주세요">
					</div>
					<div class="form-group col-md-2 pl-0">
						<input type="button" class="form-control btn btn-primary" value="추가">
					</div>
				</div>
				
				<!--  라벨 추가  -->
				<div class="form-row">
				<div class="form-group col-md-2  text-center">
					  <!-- <i class="fas fa-bookmark iconSizeBig" style="color: #993366 !important;"></i> -->
					  <input type="color" class="complex-colorpicker form-control" value="#993366">
				</div>
					<div class="form-group col-md-8 pr-0">
						<input type="text" name="" class="form-control"placeholder="라벨명을 설정해주세요">
					</div>
					<div class="form-group col-md-2 pl-0">
						<input type="button" class="form-control btn btn-primary" value="추가">
					</div>
				</div>
				
			</div>
		</div>
  </div>
</div>    

<!-- Color Picker Plugin JavaScript -->
<script src="resources/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
<script src="resources/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
<script src="resources/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>