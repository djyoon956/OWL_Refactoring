<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="joinModal" tabindex="-2" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">JOIN</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <form action="EmailConfirm.do" method="post" class="mt-3 mb-3 login-input">
        	<div class="text-center mb-4">
        		<img id="profileImage" src="resources/images/login/profile.png" style="width:150px; height:150px; cursor: pointer;"
        				data-toggle="tooltip" data-placement="top" title="Please upload image.">
   				<input type="file" id="profileFile" accept="image/*" style="display: none;" onchange="previewProfile()" />
        	</div>
            <div class="form-group">
                <input type="text" name="name" id="name" class="form-control" placeholder="Name">
                <span class="text-danger" style="display: none;">Please enter your name.</span>
            </div>
            <div class="form-group">
                <input type="email" name="email" id="email"  class="form-control" placeholder="Email">
                <span class="text-danger" style="display: none;">Please enter your email.</span>
            </div>
            <div class="form-group">
                <input type="password" name="pwd" name="pwd"  class="form-control" placeholder="Password">
                <span class="text-danger" style="display: none;">Please enter your password at least 8.</span>
            </div>
            <input type="submit" class="btn login-form__btn submit w-100" value="JOIN IN">
        </form>
        <p class="mt-5 login-form__footer">Don you have account? <a href="#" data-toggle="modal" data-target="#loginModal" class="text-primary">Login</a> now</p>
      </div>
    </div>
  </div>
</div>