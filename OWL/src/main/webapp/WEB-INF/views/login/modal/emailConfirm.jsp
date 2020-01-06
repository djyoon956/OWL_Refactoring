<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="confirmModal" tabindex="-2" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="border-bottom: 0px">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
      <div class="text-center">
           <img class="mb-3" src="resources/images/login/tick.png" style="width: 100px">
           <h3 class="mt-3 mb-3">dbsekwjdaa@naver.com</h3>
           <p class="m-0">위 메일 주소로 인증메일이 발송되었습니다.</p>
           <p class="m-0">발송된 메일을 통해 계정을 인증해주세요.</p>
           <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
       </div>
        <div class="mt-5 text-center login-form__footer">
        	<p class="m-0">메일이 발송되지 않았나요?<p>
        	<a href="#" class="text-primary ">인증 메일 재발송</a>
        </div>
      </div>
    </div>
  </div>
</div>