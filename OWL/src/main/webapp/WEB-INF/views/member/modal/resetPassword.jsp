<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="resetPwdModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
      <div class="modal-title w-100 mt-3">
        <h3 class="font-weight-bold">Password Reset <br></h3>
        <h5 class="mt-3">Enter your new password for your OWL account</h5>
        </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="mt-3 mb-3 login-input">
            <div id ="resetBox" class="form-group">
                <input type="password" name="pwd1" class="form-control pwd1" placeholder="New Password">
                <span class="text-danger pwd1letter" style="display: none;">Please enter your New Password.</span><br>
                <input type="password" name="pwd2" class="form-control pwd2" placeholder="Confirmed New Password">
                <span class="text-success successletter" style="display: none;">success.</span>
                 <span class="text-danger failletter" style="display: none;">Passwords do not match.</span>
                
                
            </div>
            <input type="button" class="btn login-form__btn submit w-100" value="Change my password">
        </div>
      </div>
    </div>
  </div>
</div>