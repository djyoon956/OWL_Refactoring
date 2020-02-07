<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .list-margin {
        margin-bottom: 10px;
    }
</style>
<script>
    $(function () {
		initMyProfileSettingController("{setting.font}");
    });
</script>
<div id="myProfileSetModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title boldselect">
                    <i class="far fa-sticky-note"></i> &nbsp;&nbsp;My Profile Setting
                </h4>
                <button type="button" class="close" id="closing" data-dismiss="modal">                
                    <span>&times;</span>
                </button>
            </div> 
            <div class="modal-body">
                <div class="default-tab">
                    <ul class="nav nav-tabs mb-3" role="tablist" id="settingTabs">
                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#profile">My Profile</a> </li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#deleteAccount">Delete Account</a></li>
                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#themeSetting">Theme Setting</a></li>
                    </ul>
                    <div class="tab-content">
                        <!-- 회원 정보 보기-->
                        <div class="col-lg-12 tab-pane fade show active pr-0 pl-0" id="profile" role="tabpanel">
                            <div id="firstpage">
                                <div class="card">
                                    <div class="card-body" style="padding-top: 20px;">
                                        <div class="basic-form">
                                            <div class="text-center mb-3">
                                                <img id="myPicture" src="upload/member/${member.profilePic}"
                                                    onerror="this.src='resources/images/login/profile.png'"
                                                    class="rounded-circle" style="width: 180px; height: 180px; ">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="name" id="name" class="form-control name"
                                                    placeholder="Name" readonly value="${member.name}">
                                            </div>
                                            <div class="form-group">
                                                <input type="email" name="email" id="email" placeholder="Email"
                                                    class="form-control email" readonly value="${member.email}">
                                            </div>
                                            <input type="button" id="editButton" class="btn btn-dark w-100" value="정보 수정">
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- My profile end-->

                        <!-- 회원 수정 페이지 -->
                        <div class="hidden" id="twopage">
                            <div class="card">
                                <div class="card-body" style="padding-top: 20px;">
                                    <div class="basic-form" id="changeSet">
                                            <div class="text-center mb-3" id="changeImg">
                                                <img id="profileImage" src="upload/member/${member.profilePic}"
                                                    onerror="this.src='resources/images/login/profile.png'"
                                                    class="rounded-circle"
                                                    style="width: 180px; height: 180px; cursor: pointer;"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="프로필을 수정하실 수 있습니다.">
                                                <input type="file" id="multipartFile" name="multipartFile"
                                                    style="visibility: hidden;">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="name" id="myName" class="form-control name"
                                                    placeholder="Name" value="${member.name}">
                                            </div>
                                            <div class="form-group">
                                                <input type="email" name="email" id="myEmail" placeholder="Email"
                                                    class="form-control email" readonly value="${member.email}">
                                            </div>
                                            <c:if test="${member.signFrom == '홈페이지'}">
                                                <div class="form-group">
                                                    <input type="password" id="myPassword" name="password"
                                                        class="form-control pwd" placeholder="비밀번호를 재입력해주세요.">
                                                </div>
                                            </c:if>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <input type="button" id="cancelButton" class="btn btn-dark w-100"
                                                        value="취소">
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="button" class="btn btn-dark w-100"
                                                        onclick="updateMyProfile()" value="수정 완료">
                                                </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- Delete Account Start -->
                        <div class="col-lg-12 tab-pane fade pr-0 pl-0" id="deleteAccount">
                            <div class="card">
                                <div class="card-body">
                                    <div class="basic-form">
                                        <!-- 	<form action="DeleteAccount.do" method="get"> -->
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <img class="" src="resources/images/owl_logo_fit.png"
                                                    style="width: 60px;">
                                                <h5 class="mt-3 mb-1 ">&nbsp;&nbsp;Please check before
                                                    deleting your account.</h5>
                                            </div>

                                            <br>
                                            <div class="text-justify">
                                                <ul class="list-icons" style="list-style-type: none; padding-left:9px;">
                                                    <li><i class="fa fa-check text-info list-margin"></i>&nbsp;&nbsp;회원
                                                        탈퇴 후 다시 가입은 가능합니다.</li>
                                                    <li><i class="fa fa-check text-info list-margin"></i>&nbsp;&nbsp;회원
                                                        탈퇴시 다시 복원이 불가능합니다.</li>
                                                    <li><i class="fa fa-check text-info list-margin"></i>&nbsp;&nbsp;탈퇴된
                                                        계정의 정보나 게시물은 완전히 삭제됩니다.</li>
                                                </ul>
                                            </div>
                                            <br>
                                            <br>
                                            <p class="text-muted">정말 탈퇴하시겟습니까?</p>

                                            <div class="basic-form">
                                                <div class="form-group ">
                                                    <div class="form-check form-check-inline">
                                                        <label class="form-check-label"> <input type="checkbox"
                                                                class="form-check-input" value="" id="deleteChk">
                                                            <code>*</code>I agree. <span class="text-danger"
                                                                style="display: block;">&emsp;Please
                                                                check your agreement.</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <form action="DeleteAccount.do" method="post">
                                                <input type="hidden" name="email" class="form-control email"
                                                    value="${member.email}">

                                                <c:if test="${member.signFrom == '홈페이지'}">
                                                    <div class="form-group">
                                                        <input type="password" id="delPwdOut" name="password"
                                                            class="form-control pwd" placeholder="비밀번호를 입력해주세요.">
                                                    </div>
                                                </c:if>
                                               
                                            </form>
                                             <button class="btn btn-dark w-100"
                                                    id="deleteMemberBtn">Close Account</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 tab-pane fade  pr-0 pl-0" id="themeSetting">
                            <div class="card">
                                <div class="card-body">

                                    <div class="text-center setting-box " id="setBackgroundColor">
                                        <h5 class="mt-3 mb-1">SIDEBAR BACKGROUND</h5>
                                        <hr class="hrGray">
                                        <span class="coloricon"
                                            style="background-color: white; display: inline-block;"></span>
                                        <span class="coloricon"
                                            style="background-color: gray; display: inline-block;"></span>
                                    </div>
                                    <div class="text-center setting-box mt-5">
                                        <h5 class="mt-3 mb-1">SELECT FONT</h5>
                                        <hr class="hrGray">
                                        <div class="col-lg-12">
                                            <select class="form-control" id="setFont" name="val-skill">
                                                <option value="'Nanum Brush Script', cursive"
                                                    style="font-family: 'Nanum Brush Script', cursive;">나눔붓체</option>
                                                <option value="'Jua', sans-serif"
                                                    style="font-family: 'Jua', sans-serif;">주아체</option>
                                                <option value="'Hi Melody', cursive"
                                                    style="font-family: 'Hi Melody', cursive;">하이멜로디체</option>
                                                <option value="'Yeon Sung', cursive"
                                                    style="font-family: 'Yeon Sung', cursive;">연성체</option>
                                                <option value="'East Sea Dokdo', cursive"
                                                    style="font-family: 'East Sea Dokdo', cursive;">독도체</option>   
                                                 <option value="''Gamja Flower', cursive"
                                                    style="font-family: 'Gamja Flower', cursive;">감자꽃체</option>    
                                                <option value="'Gothic A1', sans-serif"
                                                    style="font-family: 'Gothic A1', sans-serif;">고딕체</option>                                                      
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
