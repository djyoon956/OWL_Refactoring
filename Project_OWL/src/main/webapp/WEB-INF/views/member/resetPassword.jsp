<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>OWL</title>
    <jsp:include page="../include/headTag.jsp" />
    <link href="resources/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="resources/js/member.js"></script>
    <link href="resources/css/member.css" rel="stylesheet">
    <script type="text/javascript">
        $(function () {
        	initResetPasswordController();
        })
    </script>
</head>

<body id="forgotPwdBody">
    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-xl-6">
                    <div class="form-input-content  text-center">
                        <img src="resources/images/owl_plz_beige.png" alt="" height="30">
                        <div class="card login-form mb-0 forgotBox mt-4">
                            <div class="card-body pt-5 text-left">
                                <div id="resetBox" class="form-group">
                                    <input type="hidden" id="email" value="${email}">
                                    <input type="password" name="pwd1" class="form-control pwd1"
                                        placeholder="New Password">
                                    <span class="text-danger pwd1letter" style="display: none;">Please enter your New
                                        Password.</span><br>
                                    <input type="password" id="pwd" class="form-control pwd2"
                                        placeholder="Confirmed New Password">
                                    <span class="text-success successletter" style="display: none;">You can change your
                                        Password</span>
                                    <span class="text-danger failletter" style="display: none;">Passwords do not
                                        match.</span>
                                </div>
                                <input type="button" id="changeButton"
                                    class="btn btn loginButton btn-block waves-effect waves-light"
                                    value="Change my password">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>