<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">LOGIN</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <form action="Login.do" method="post" class="mt-3 mb-3 login-input">
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="Email">
            </div>
            <div class="form-group">
                <input type="password" name="pwd" class="form-control" placeholder="Password">
            </div>
            <input type="submit" class="btn login-form__btn submit w-100" value="LOGIN">
        </form>
        <hr/>
        <div class="text-center"> 
        	<h5>SNS LOGIN </h5>
	        <button id="naverLoginButton" class="snsLoginButton mt-2 mr-3"
	        onclick="location.href='https://nid.naver.com/oauth2.0/authorize?client_id=zlKEJHqR7YB9riY5pP5l&redirect_uri=http://localhost:8090/OWL/naverLogin.do&response_type=code'">
				<img src='resources/images/login/naver.png' style="width: 50px;">
			</button>
	        <button id="kakaoLoginButton" class="snsLoginButton mr-3" 
	        onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=5d151c02cc241d9ba7a8373a8051d79d&redirect_uri=http://localhost:8090/OWL/kakaoLogin.do&response_type=code'">
				<img src='resources/images/login/kakao.png' style="width: 50px;">
			</button>
	        <button id="googleLoginButton" class="snsLoginButton mr-3">
				<img src='resources/images/login/google.png' style="width: 50px;">
			</button>
		</div>
		<div class="mt-5 login-form__footer mt-5 text-center">
	        <b class="login-form__footer"> <a href="#" data-toggle="modal" data-target="#findPwdModal" class="text-secondary">Forgot password?</a></b>
	        <p>Don't have account? <a href="#" data-toggle="modal" data-target="#joinModal" class="text-primary">Sign Up</a> now</p>
		</div>
      </div>
    </div>
  </div>
</div>