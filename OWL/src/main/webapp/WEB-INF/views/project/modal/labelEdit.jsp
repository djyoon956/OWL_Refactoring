<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="labelEditModal" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold"><i class="ion-bookmark mr-2"></i> 라벨 추가 </h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
    
        <form action="" method="post" class="mt-3 mb-3 login-input">
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="프로젝트 명을 입력해주세요.">
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