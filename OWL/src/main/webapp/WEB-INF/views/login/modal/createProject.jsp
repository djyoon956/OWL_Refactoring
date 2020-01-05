<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="projectModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">CREATE PROJECT</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
    
        <form action="Login.do" method="post" class="mt-5 mb-3 login-input">
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="프로젝트 명을 입력해주세요.">
            </div>
           
	          	<label class="m-t-20">프로젝트 기간 설정</label>
	           <div class="row ">
                   <div class="col-md-6">
                       <label class="m-t-20">start</label>
                       <input type="text" class="form-control" placeholder="2017-06-04" id="mdate" data-dtp="dtp_l9lmR">
                   </div>
                   <div class="col-md-6">
                       <label class="m-t-20">end</label>
                       <input type="text" class="form-control" placeholder="2017-06-04" id="mdate" data-dtp="dtp_l9lmR">
                   </div>
               </div>
       
            <input type="submit" class="btn login-form__btn submit w-100" value="프로젝트 생성">
        </form>
      </div>
    </div>
  </div>
</div>