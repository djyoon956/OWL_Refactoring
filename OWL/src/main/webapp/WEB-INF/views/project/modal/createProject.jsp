<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	<link href="resources/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">

	<!-- Color picker plugins css
    <link href="resources/plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
    <!-- Date picker plugins css 
    <link href="resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
	<script type="text/javascript">
	$(function(){
		$('#endDate').bootstrapMaterialDatePicker({
			weekStart: 0,
			time: false,
			format: 'YYYY/MM/DD'
		});
	
		$('#startDate').bootstrapMaterialDatePicker({
		    weekStart: 0, 
		    time: false,
		    format: 'YYYY/MM/DD',
		    minDate: new Date()
		}).on('change', function(e, date) {
		    $('#endDate').bootstrapMaterialDatePicker('setMinDate', date);
		});
		 $(".complex-colorpicker").asColorPicker({
		        mode: 'complex'
	    });
	})
	</script>
 -->	
<div class="modal fade" id="projectModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">New Project</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
    
        <form action="" method="post" class="mt-3 mb-3 login-input">
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="프로젝트 명을 입력해주세요.">
            </div>
           
       	   <label class="m-t-20">기간 설정</label>
          <div class="row form-group">
                 <div class="col-md-5">
                     <input type="text" class="form-control" placeholder="Start Date" id="startDate" data-dtp="dtp_l9lmR">
                 </div>
                 <div class="col-md-2 text-center">
                 		<span>~</span>
                 </div>
                 <div class="col-md-5">
                     <input type="text" class="form-control" placeholder="End Date" id="endDate" data-dtp="dtp_l9lmR">
                 </div>
             </div>
             
             <label class="m-t-20">색상 설정</label>
             <div class="form-group">
                    <div class="col-md-4 m-b-30">
                            <input type="text" class="complex-colorpicker form-control" value="#fa7a7a">
                     </div>
             </div>
       
            <input type="submit" class="btn login-form__btn submit w-100" value="프로젝트 생성">
        </form>
      </div>
    </div>
  </div>
</div>
<script src="resources/plugins/moment/moment.js"></script>
<script src="resources/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<!-- Clock Plugin JavaScript -->
<script src="resources/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
<!-- Color Picker Plugin JavaScript -->
<script src="resources/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
<script src="resources/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
<script src="resources/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
<!-- Date Picker Plugin JavaScript -->
<script src="resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
