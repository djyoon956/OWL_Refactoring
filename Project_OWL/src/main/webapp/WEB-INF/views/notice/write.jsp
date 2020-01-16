<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
    #writeBox {
        display: none
    }
</style>
<div class="container-fluid mt-3">
    <div id="writeBox">
        <div class="card">
            <div class="card-body">
                <div class="col-md-10 offset-1">
                    <div class="compose-content">
                        <h3 class="text-center">Notice</h3><br>
                        <form action="#" enctype="multipart/form-data">
                            <input type="hidden" name="projectIdx" value="${project.projectIdx}">
                            <div class="form-group">
                                <input type="text" class="form-control bg-transparent" placeholder="제목을 입력해주세요">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control bg-light" rows="10" cols="60" id="summernote"
                                    name="summernote"></textarea>
                            </div>
                            <h5 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i>&nbsp;파일첨부</h5>
                            <div class="form-group">
                                <div class="fallback">
                                    <input class="l-border-1" name="file" type="file" multiple="multiple">
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <input type="submit"
                                    class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10 mr-2" value="확인">
                                <button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button"
                                    onclick="location.href='Notice.do'" id="noticeDelBtn">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>