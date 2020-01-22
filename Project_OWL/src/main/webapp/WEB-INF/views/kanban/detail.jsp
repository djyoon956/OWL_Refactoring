<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .comment_img {
        background-color: #326295;
        width: 50px;
        height: 50px;
        line-height: 50px;
        border-radius: 50%;
        text-align: center;
        font-weight: 900;
        font-size: 16px;
        color: #f8f9fa;
    }
</style>

<div class="container-fluid mt-2 hidden" style="padding: 25px;" id="kanbanDetailBox" >
    <div class="row">
        <div class="col-8">
            <div class="card">
                <div class="card-title mb-0">
                    <div class="ml-3">
                        <h2 id="issueTitle">Drive Development</h2>
                    </div>
                </div>
                <hr class="mt-1">
                <div class="card-body mt-0 mb-0" id="issueContent" style="border: 1px solid; border-color:#e9e9e9;">
                    <p>Task </p>
                    <p>- 드라이브 디폴트 폴더 생성</p>
                    <p>- 계층형 구조 </p>
                    <p>- 휴지통 기능</p>
                </div>

                <div class="accordion" id="kanbanAccordion">
                	<!-- 첨부파일 -->
                    <div class="card mb-0">
                        <div class="card-header" id="kanbanFileBoxHeader">
                            <a  data-toggle="collapse" data-parent="#kanbanAccordion" href="#kanbanFileBox" aria-expanded="true" aria-controls="kanbanFileBox">
                                <h5 class="mb-0">
                                    <i class="fas fa-download mr-2 " aria-hidden="true"></i>
                                    <span id="issueFileCount">첨부파일 (3)</span>
                                </h5>
                            </a>
                        </div>
                        <div id="kanbanFileBox" class="collapse multi-collapse">
                            <ul class=" m-4" id="issueFiles">
                                <li class="mb-2" style="font-size: 16px">
                                    <a href="#"><i class="far fa-save"></i>&nbsp;&nbsp;<span> 어쩌구.txt</span></a>
                                </li>
                                <li class="mb-2" style="font-size: 16px">
                                    <a href="#"><i class="far fa-save"></i>&nbsp;&nbsp;<span> 어쩌구.txt</span></a>
                                </li>
                                <li class="mb-2" style="font-size: 16px">
                                    <a href="#"><i class="far fa-save"></i>&nbsp;&nbsp;<span> 어쩌구.txt</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- Activity -->
                    <div class="card mb-0">
                        <div class="card-header" id="kanbanActivityBoxHeader">
                            <a data-toggle="collapse" data-parent="#kanbanAccordion" href="#kanbanActivityBox" aria-expanded="true" aria-controls="kanbanActivityBox">
                                <h5 class="mb-0">
                                    <i class="fas fa-bars mr-2" aria-hidden="true"></i>
                                    <span id="issueActivityCount">Activity (4)</span>
                                </h5>
                            </a>
                        </div>
                        <div id="kanbanActivityBox" class=" collapse multi-collapse" >
                            <ul class="timeline w-100" id="issueActivity">
                                <li>
                                    <p> Crystal opened this issue 1/11</p>
                                </li>
                                <li>
                                    <p>1/12 edited </p>
                                </li>
                                <li>
                                    <p>1/14 edited</p>
                                </li>
                                <li>
                                    <p>1/16 moved this issue from 'to do' to 'done'</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                   
                    <!-- Comments -->
                    <div class="card mb-0">
                        <div class="card-header" id="kanbanCommentBoxHeader">
                            <a data-toggle="collapse" data-parent="#kanbanAccordion" href="#kanbanCommentBox" aria-expanded="true" aria-controls="kanbanCommentBox">
                                <h5 class="mb-0">
                                    <i class="fas fa-comments mr-2" aria-hidden="true"></i>
                                    <span id=issueCommentCount>Comments (10)</span>
                                </h5>
                            </a>
                        </div>
                        <div id="kanbanCommentBox" class=" collapse show multi-collapse">
                            <div class="card-body mt-0" style="border: 1px solid; border-color:#e9e9e9; border-radius: 0.25rem;background-color:#e9e9e9;">
                                <div class="comment-widgets scrollable" id="issueComment">
                                    <div class="d-flex flex-row comment-row m-0">
                                        <div class="p-2">
                                            <div class="comment_img">C</div>
                                        </div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium mb-1">Cindy 
                                            <span class="text-muted float-right">Jan 18, 2020</span></h6>
                                            <div class="mb-1 d-block"><span>화이팅</span></div>
                                            <div class="comment-footer">
                                                <button type="button" class="btn btn-info btn-sm">Edit</button>
                                                <button type="button" class="btn btn-secondary btn-sm">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row comment-row m-0">
                                        <div class="p-2">
                                            <div class="comment_img">C</div>
                                        </div>
                                        <div class="comment-text w-100">
                                            <h6 class="font-medium mb-1">Colin
                                            <span class="text-muted float-right">Jan  16, 2020</span></h6>
                                            <div class="mb-1 d-block"><span>파이어베이스 알아?</span></div>
                                            <div class="comment-footer">
                                                <button type="button" class="btn btn-info btn-sm">Edit</button>
                                                <button type="button" class="btn btn-secondary btn-sm">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body mt-0 p-0">
                    <%-- <jsp:include page="./Reply.jsp"/> --%>
                    <!-- <textarea class="form-control bg-light w-100" rows="10" cols="10" placeholder="Leave a comment" name="" id="issueReply"></textarea> -->
                    <button class="btn btn-secondary mt-1 mr-1">comment</button>
                    <button class="btn btn-secondary mt-1 ml-1"><i class="fas fa-at"></i></button>
                </div>
            </div>
        </div>
        
        <!-- Option -->
        <div class="col-4">
            <div class="form-group">
                <div class="row">
                    <div class="col-4">Assignees </div>
                    <div class="col-8">  Chloe </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <div class="row">
                    <div class="col-4">Label</div>
                    <div class="col-8">
                        <div style="background-color: #F4D452;padding:2px; padding-left:5px;">Dev</div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <div class="row">
                    <div class="col-4">Priority</div>
                    <div class="col-8">
                        <span class="badge badge-pill badge-danger font-14">High</span>
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <div class="row">
                    <div class="col-4">Due Date</div>
                    <div class="col-8"><i class="fas fa-calendar mr-1"></i> 2020/01/20 </div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <div class="row">
                    <button class="btn w-100"><i class="fas fa-check mr-2 text-danger"></i>Close issue</button>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center"><button class="btn btn-primary mr-1">목록</button>
        <button class="btn btn-primary ml-1">수정</button>
    </div>
</div>