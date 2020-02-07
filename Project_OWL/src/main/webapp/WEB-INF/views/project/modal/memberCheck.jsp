<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="memberCheckModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">
                    <i class="icon-settings mr-2"></i>프로젝트 정보 확인
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modal-scroll mx-3 mb-3">
                <div>
                    <ul class="list-style-none assignedto text-center" id="projectInfoBox">
                        <li>
                            <h5 id="theInfo" style="background-color : #326295;">
                                <b>📅 ${project.startDate} ~ ${project.endDate}</b>
                            </h5>
                        </li>
                    </ul>
                    <hr>

                    <ul class="list-style-none assignedto text-center" id="projectMemebersBox">
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>