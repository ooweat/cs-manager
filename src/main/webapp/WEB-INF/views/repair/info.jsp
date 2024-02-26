<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
      .note-editable > p {
        margin-bottom: 0;
      }
    </style>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
          name="viewport">
    <script type="text/javascript" src="/static/assets/js/jquery.js"></script>
    <%--<script type="text/javascript" src="/static/assets/js/summernote-bs4.js"></script>--%>
    <title></title>
    <script type="text/javascript">
      async function init() {
        callCompany();
        callPartners();
        callTerminalModel();
        callRevision();
        callError();

        //수정일 경우
        if ('${asNo}' != '') {
          $('#confirmBtn').text('수정');
          $('.regist-group').show();
          await getRepairData('${asNo}');
        } else { //등록일 경우
          $('.regist-group').hide();
        }
      }

      async function getRepairData(asNo) {
        $.ajax({
          type: "GET",
          url: "/api/repairs/" + asNo,
          cache: false,
          success: function (cmd) {
            $('#ptnWriter').val(cmd.ptnWriter);
            $('#asNo').val(cmd.asNo);
            $('#compSeq').prepend(
                '<option value="' + cmd.compSeq + '" selected=selected>' + cmd.compName
                + '</option>');
            cmd.ptnCompSeq == null ? $("#ptnCompSeq").val('Y').trigger('change') : $("#ptnCompSeq").val(cmd.ptnCompSeq).trigger('change');
            $('#serialNo').val(cmd.serialNo);
            $('#cid').val(cmd.cid);
            cmd.samFlag == null ? $("#samFlag").val('Y').trigger('change') : $("#samFlag").val(cmd.samFlag).trigger('change');
            cmd.tidSeq == null ? $("#tidSeq").val(0).trigger('change') : $("#tidSeq").val(cmd.tidSeq).trigger('change');
            $('#terminalId').val(cmd.terminalId);
            $('#repairDate').val(cmd.repairDate);
            $('#repairExpireDate').val(cmd.repairExpireDate);

            cmd.trbSeq == null ? $("#trbSeq").val(0).trigger('change') : $("#trbSeq").val(cmd.trbSeq).trigger('change');
            cmd.rtSeq == null ? $("#rtSeq").val(0).trigger('change') : $("#rtSeq").val(cmd.rtSeq).trigger('change');
            cmd.atSeq == null ? $("#atSeq").val(0).trigger('change') : $("#atSeq").val(cmd.atSeq).trigger('change');
            cmd.mbRvSeq == null ? $("#mbRvSeq").val(0).trigger('change') : $("#mbRvSeq").val(cmd.mbRvSeq).trigger('change');
            cmd.sbRvSeq == null ? $("#sbRvSeq").val(0).trigger('change') : $("#sbRvSeq").val(cmd.sbRvSeq).trigger('change');
            cmd.icRvSeq == null ? $("#icRvSeq").val(0).trigger('change') : $("#icRvSeq").val(cmd.icRvSeq).trigger('change');
            //ptnComment
            $('.note-editable').html(cmd.ptnComment);

          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
          }
        });
      }

      function callCompany() {
        $.ajax({
          type: "GET",
          url: "/api/settings/companys",
          cache: false,
          success: function (cmd) {
            if (cmd.data.length > 0) {
              for (let i = 0; i < cmd.data.length; i++) {
                $('#compSeq').append(
                    '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
              }
            }
            loadingStop();
          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
            location.href("/");
          }
        });
      }
      function callPartners() {
        $.ajax({
          type: "GET",
          url: "/api/settings/partners/${member.companySeq}",
          cache: false,
          success: function (cmd) {
            if (cmd.data.length > 0) {
              for (let i = 0; i < cmd.data.length; i++) {
                $('#ptnCompSeq').append(
                    '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
              }
            }
            loadingStop();
          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
            location.href("/");
          }
        });
      }
      function callTerminalModel() {
        $.ajax({
          type: "GET",
          url: "/api/settings/terminal-models",
          cache: false,
          success: function (cmd) {
            if (cmd.data.length > 0) {
              for (let i = 0; i < cmd.data.length; i++) {
                $('#tidSeq').append(
                    '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
              }
            }
            loadingStop();
          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
            location.href("/");
          }
        });
      }

      function callRevision() {
        $.ajax({
          type: "GET",
          url: "/api/settings/revisions",
          cache: false,
          success: function (cmd) {
            if (cmd.data.length > 0) {
              for (let i = 0; i < cmd.data.length; i++) {
                if (cmd.data[i].type == 'MN') {
                  $('#mbRvSeq').append(
                      '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
                } else if (cmd.data[i].type == 'SB') {
                  $('#sbRvSeq').append(
                      '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
                } else if (cmd.data[i].type == 'IC') {
                  $('#icRvSeq').append(
                      '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
                }
              }
            }
            loadingStop();
          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
            location.href("/");
          }
        });
      }

      function callError() {
        $.ajax({
          type: "GET",
          url: "/api/settings/errors/repair",
          cache: false,
          success: function (cmd) {
            if (cmd.data.length > 0) {
              for (let i = 0; i < cmd.data.length; i++) {
                if (cmd.data[i].type == 'RT') {
                  $('#trbSeq').append(
                      '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
                } else if (cmd.data[i].type == 'RA') {
                  $('#atSeq').append(
                      '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
                }
              }
            }
            loadingStop();
          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
            location.href("/");
          }
        });
      }

      function _confirm(methodType) {
        if ($('#compSeq').val() == '0') {
          alert('발송처를 선택해주세요.');
          $('#compSeq').focus();
          return;
        }

        if ($('#ptnCompSeq').val() == '0') {
          alert('협력사를 선택해주세요.');
          $('#ptnCompSeq').focus();
          return;
        }

        if ($('#cid').val() == '') {
          alert('CID를 입력해주세요.');
          $('#cid').focus();
          return;
        }
        switch (methodType) {
          case 'post':
            if (confirm('등록하시겠습니까?')) {
              $.ajax({
                method: "POST",
                url: "/api/repair",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({
                  "compSeq": $('#compSeq').val(),
                  "ptnCompSeq": $('#ptnCompSeq').val(),
                  "repairDate": $('#repairDate').val(),
                  "repairExpireDate": $('#repairExpireDate').val(),
                  "compName": $('#compSeq :selected').text(),
                  "terminalId": $('#terminalId').val(),
                  "trbSeq": $('#trbSeq').val(),
                  "ptnComment": $('#ptnComment').val(),
                  "rtSeq": $('#rtSeq').val(),
                  "atSeq": $('#atSeq').val(),
                  "ptnWriter": '${member.userName}',
                  "tidSeq": $('#tidSeq').val(),
                  "cid": $('#cid').val(),
                  "serialNo": $('#serialNo').val(),
                  "samFlag": $('#samFlag').val(),
                  "mbRvSeq": $('#mbRvSeq').val(),
                  "sbRvSeq": $('#sbRvSeq').val(),
                  "icRvSeq": $('#icRvSeq').val(),
                }),
                cache: false,
                success: function (cmd) {
                  if (cmd.code == '0000') {
                    alert('저장되었습니다.');
                    location.href = '/repairs';
                  }
                  loadingStop();
                }, // success
                error: function (xhr, status) {
                  alert(xhr + " : " + status);
                }
              });
            }
            break;
          case 'patch':
            if (confirm('수정하시겠습니까?')) {
              $.ajax({
                method: "PATCH",
                url: "/api/repairs/${asNo}",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({
                  "compSeq": $('#compSeq').val(),
                  "ptnCompSeq": $('#ptnCompSeq').val(),
                  "repairDate": $('#repairDate').val(),
                  "repairExpireDate": $('#repairExpireDate').val(),
                  "compName": $('#compSeq :selected').text(),
                  "terminalId": $('#terminalId').val(),
                  "trbSeq": $('#trbSeq').val(),
                  "ptnComment": $('#ptnComment').val(),
                  "rtSeq": $('#rtSeq').val(),
                  "atSeq": $('#atSeq').val(),
                  "modifyUser": '${member.userName}',
                  "tidSeq": $('#tidSeq').val(),
                  "cid": $('#cid').val(),
                  "serialNo": $('#serialNo').val(),
                  "samFlag": $('#samFlag').val(),
                  "mbRvSeq": $('#mbRvSeq').val(),
                  "sbRvSeq": $('#sbRvSeq').val(),
                  "icRvSeq": $('#icRvSeq').val(),
                }),
                cache: false,
                success: function (cmd) {
                  if (cmd.code == '0000') {
                    alert('저장되었습니다.');
                    location.href = '/repairs';
                  }
                  loadingStop();
                }, // success
                error: function (xhr, status) {
                  alert(xhr + " : " + status);
                }
              });
            }
            break;
        }
      }

      function setDateRangePicker(btnType) {
        let repairExpireDate = new Date($('#repairDate').val());
        repairExpireDate.setMonth(repairExpireDate.getMonth() + Number(btnType));
        repairExpireDate = repairExpireDate.getFullYear() + "-" + (('0'
            + (repairExpireDate.getMonth()
                + 1)).slice(-2)) + "-" + (('0' + repairExpireDate.getDate()).slice(-2));

        $('#repairExpireDate').val(repairExpireDate);
      }
    </script>
</head>
<body onload="init()">
<div class="main-content">
    <div class="row">
        <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-1 col-xl-8 offset-xl-2">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card card-primary">
                    <div class="card-header"><h4>단말기 이력관리</h4></div>
                    <div class="card-body">
                        <form role="form" name="formData" id="formData"
                              class="needs-validation" novalidate>
                            <input type="hidden" id="canUseUserId" value="S"/>
                            <div class="row">
                                <div class="form-group col-lg-3 col-md-6 col-sm-6 regist-group">
                                    <label for="ptnWriter">접수자</label>
                                    <input id="ptnWriter" type="text" class="form-control"
                                           name="ptnWriter" readonly required="" autofocus="">
                                </div>
                                <div class="form-group col-lg-4 col-md-6 col-sm-6 regist-group">
                                    <label for="asNo">접수번호</label>
                                    <input id="asNo" type="text" class="form-control"
                                           name="asNo" readonly required="" autofocus="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="compSeq">*발송처</label>
                                    <select id="compSeq" name="compSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1" aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-3 col-md-6 col-sm-6">
                                    <label for="ptnCompSeq">*협력사</label>
                                    <select id="ptnCompSeq" name="ptnCompSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1" aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-3 col-md-6 col-sm-6">
                                    <label for="tidSeq">단말기 모델</label>
                                    <select id="tidSeq" name="tidSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1" aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-2 col-md-3 col-sm-6">
                                    <label for="samFlag">SAM 유무</label>
                                    <select id="samFlag" name="samFlag"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1" aria-hidden="true">
                                        <option value="Y">Y</option>
                                        <option value="N">N</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-3 col-md-4 col-sm-6">
                                    <label for="cid">*CID</label>
                                    <input id="cid" type="text" class="form-control" name="cid"
                                           placeholder="CID" required="" autofocus=""
                                           maxlength="8">
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 col-md-5 col-sm-6">
                                    <label for="terminalId">TID</label>
                                    <input id="terminalId" type="text" class="form-control"
                                           name="terminalId"
                                           placeholder="TID 입력" required="" autofocus=""
                                           maxlength="10">
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                                <div class="form-group col-lg-3 col-md-4 col-sm-6">
                                    <label for="serialNo">Serial</label>
                                    <input id="serialNo" type="text" class="form-control"
                                           name="serialNo" maxlength="10"
                                           placeholder="Serial" required="" autofocus="">
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-3 col-md-6 col-sm-6">
                                    <label for="repairDate">처리일자</label>
                                    <input type="text" id="repairDate"
                                           class="form-control datepicker">
                                </div>
                                <div class="form-group col-lg-3 col-md-6 col-sm-6">
                                    <label for="repairExpireDate">보증만료일자</label>
                                    <input type="text" id="repairExpireDate"
                                           class="form-control datepicker">
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12 text-center">
                                    <label for="function-label">퀵버튼
                                        <i class="fas fa-question-circle title-i-line-height text-primary"
                                           data-toggle="tooltip" title=""
                                           data-original-title=
                                                   "보증시작일자를 기준으로 정해져요."></i></label>
                                    <div class="selectgroup datechoice-btn" id="function-label">
                                        <label class="selectgroup-item mb-0">
                                            <input type="radio"
                                                   name="datechoice-btn" value="1"
                                                   class="selectgroup-input"
                                                   checked=""
                                                   onclick="setDateRangePicker('1')">
                                            <span class="selectgroup-button">1달</span>
                                        </label>
                                        <label class="selectgroup-item mb-0">
                                            <input type="radio"
                                                   name="datechoice-btn" value="2"
                                                   class="selectgroup-input"
                                                   onclick="setDateRangePicker('3')">
                                            <span class="selectgroup-button">3달</span>
                                        </label>
                                        <label class="selectgroup-item mb-0">
                                            <input type="radio"
                                                   name="datechoice-btn" value="3"
                                                   class="selectgroup-input"
                                                   onclick="setDateRangePicker('6')">
                                            <span class="selectgroup-button">6달</span>
                                        </label>
                                        <label class="selectgroup-item mb-0">
                                            <input type="radio"
                                                   name="datechoice-btn" value="4"
                                                   class="selectgroup-input"
                                                   onclick="setDateRangePicker('12')">
                                            <span class="selectgroup-button">1년</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-4 col-md-12 col-sm-12">
                                    <label for="trbSeq">불량내역</label>
                                    <select id="trbSeq" name="trbSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-4 col-md-12 col-sm-12">
                                    <label for="atSeq">수리내역</label>
                                    <select id="atSeq" name="atSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-4 col-md-12 col-sm-12">
                                    <label for="mbRvSeq">메인보드 Revision</label>
                                    <select id="mbRvSeq" name="mbRvSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-4 col-md-12 col-sm-12">
                                    <label for="sbRvSeq">서브보드 Revision</label>
                                    <select id="sbRvSeq" name="sbRvSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-4 col-md-12 col-sm-12">
                                    <label for="icRvSeq">IC모듈 Revision</label>
                                    <select id="icRvSeq" name="icRvSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-12">
                                    <label>비고</label>
                                    <textarea class="form-control"
                                              id="ptnComment" name="ptnComment"></textarea>
                                </div>
                            </div>
                            <input type="hidden" name="modAdminId" value="${userId}"/>
                            <input type="hidden" name="page" value="userInsert"/>
                            <div class="row">
                                <div class="form-group col-6">
                                    <button type="button" id="confirmBtn"
                                            onclick="_confirm('${asNo}' == '' ? 'post' : 'patch');"
                                            class="btn btn-primary btn-lg btn-block">
                                        등록
                                    </button>
                                </div>
                                <div class="form-group col-6">
                                    <button type="button" onclick="history.back()"
                                            class="btn btn-secondary btn-lg btn-block">
                                        뒤로가기
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
  $(document).ready(function () {
    /*$('#summernote').summernote({
      height: 300,                 // 에디터 높이
      minHeight: null,             // 최소 높이
      maxHeight: null,             // 최대 높이
      focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
      lang: "ko-KR",					// 한글 설정
      //placeholder: '최대 1,000 자까지 쓸 수 있습니다',	//placeholder 설정
      toolbar: [
        // [groupName, [list of button]]
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']]
      ]
    });*/
  });
</script>
</body>
</html>
