<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid mt-2 hidden" style="padding: 25px;" id="kanbanEditBox" >	
	<input type="hidden" id="issueIdxNum">
	
    <div class="row">
        <div class="col-8">
            <div class="card">
                <div class="card-title mb-0">
                    <div class="ml-3">
                        <!-- <h2 id="issueDetailEditTitle">Drive Development</h2> -->
                        <input type="text" class="form-control input-default"  name="issueTitle" id="issueDetailEditTitle">
                    </div>
                </div>
                <hr class="mt-1">
                <div class="card-body mt-0 mb-0" id="issueDetailEditContent" style="border: 1px solid; border-color:#e9e9e9;">
                     <textarea class="form-control bg-light" rows="10" cols="50" id="isContentEdit" name="content"></textarea>
					  <input type="file" name="multipartFiles" id="multipartFilesEdit" multiple="multiple"> 
                </div>

                <div class="accordion" id="kanbanAccordion">
                	<!-- 첨부파일 -->
                    <div class="card mb-0">
                        <div class="card-header" id="kanbanFileBoxHeader">
                            <a  data-toggle="collapse" data-parent="#kanbanAccordion" href="#kanbanFileBox" aria-expanded="true" aria-controls="kanbanFileBox">
                                <h5 class="mb-0">
                                    <i class="fas fa-download mr-2 " aria-hidden="true"></i>
                                    <span id="issueDetailFileCount">첨부파일 (3)</span>
                                </h5>
                            </a>
                        </div>
                        <div id="kanbanFileBox" class="collapse multi-collapse">
                            <ul class=" m-4 list-style-none" id="issueDetailEditFiles">
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
               	 </div>
                <br>
            </div>
        </div>
        
        <!-- Option -->
        <div class="col-4">
            <div class="form-group bold">
                <div class="row">
                    <div class="col-4">Assignees </div>
                    <div class="col-8" id="issueDetailEditAssignees">  Chloe </div>
                </div>
            </div>
            <hr>
            <div class="form-group bold" >
                <div class="row">
                    <div class="col-4">Label</div>
                    <div class="col-8">
                        <div id="issueDetailEditLabel" style="padding-right:7px; padding-left:7px;"  class="badgeIcon">Dev</div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group bold">
                <div class="row">
                    <div class="col-4">Priority</div>
                    <div class="col-8">
                        <span id="issueDetailEditPriority"></span>
                    </div>
                </div>
            </div>
            <hr>
            <div class="form-group bold">
                <div class="row">
                    <div class="col-4">Due Date</div>
                    <div class="col-8" ><i class="fas fa-calendar mr-1"></i> <span id="issueDetailEditDueDate"></span></div>
                </div>
            </div>
            <hr>
            <div class="form-group bold">
                <div class="row">
                    <button class="btn w-100" id="closeIssueDetailBtn"><i class="fas fa-check mr-2 text-danger"></i><span id="issueClosedChk">Close issue</span></button>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center mt-5">
    	<button class="btn btn-primary mr-1" onclick="changeKanbanView('list')"><i class="fas fa-chevron-left"></i>뒤로가기</button>
        <button class="btn btn-primary ml-1" id="editOkBtn">수정</button>
    </div>
</div>