<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="findPwdModal" tabindex="-2" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Password</h4>
        <button type="button" class="close" data-dismiss="msodal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="mt-3 mb-3 login-input">
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="Email">
            </div>
            <input type="button" class="btn login-form__btn submit w-100" id="sendPwd" value="SEND">
        </div>
      </div>
    </div>
  </div>
</div>