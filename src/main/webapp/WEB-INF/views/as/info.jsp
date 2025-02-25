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
    <script type="text/javascript" src="/assets/js/info.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <%--<script type="text/javascript" src="/static/assets/js/summernote-bs4.js"></script>--%>
    <title></title>
    <script type="text/javascript">
        async function init() {
            //수정일 경우
            if ('${asNo}' != '') {
                $('#confirmBtn').text('수정');
                $('#reRegistermBtn').show();
                $('.regist-group').show();
                await getInfoData('${asNo}');
            } else { //등록일 경우
                $('.regist-group').hide();
                callCompany();
                callPartners();
                callTerminalModel();
                callVMModel();
                callError();
            }
        }

        async function getInfoData(asNo) {
            $.ajax({
                type: "GET",
                url: "/api/aslist/" + asNo,
                cache: false,
                success: function (cmd) {
                    console.log(cmd);

                    $('#ptnWriter').val(cmd.ptnWriter);
                    $('#asNo').val(cmd.asNo);
                    $('#compName').val(cmd.compName);
                    $('#businessNo').val(
                        validateNotEmpty(cmd.businessNo) ? cmd.businessNo : '000-00-00000');
                    $('#ctmName').val(cmd.ctmName);
                    $('#ctmPhone').val(cmd.ctmPhone);
                    $('#terminalId').val(cmd.terminalId);

                    $('#ctmPlacePostCode').val(cmd.ctmPlacePostCode);
                    $('#ctmPlaceAddress1').val(cmd.ctmPlaceAddress1);
                    $('#ctmPlaceAddress2').val(cmd.ctmPlaceAddress2);
                    $('#ctmPlaceName').val(cmd.ctmPlaceName);

                    $("#ctmCharge").val(cmd.ctmCharge).trigger('change');
                    //비용여부
                    validateNotEmpty(cmd.ctmCharge) ? $("#ctmCharge").val(cmd.ctmCharge).trigger(
                            'change') :
                        $("#ctmCharge").val('Y').trigger('change')
                    ;

                    //입금여부
                    validateNotEmpty(cmd.deposit) ? $("#deposit").val(cmd.deposit).trigger('change')
                        :
                        $("#deposit").val('Y').trigger('change')
                    ;

                    $('#repairCost').val(cmd.repairCost);
                    $('#transferCost').val(cmd.transferCost);

                    validateNotEmpty(cmd.ptnFinale) ? $('#ptnFinale').val(cmd.ptnFinale) : $(
                        '#ptnFinale').parent().hide();
                    validateNotEmpty(cmd.ptnCpDate) ? $('#ptnCpDate').val(cmd.ptnCpDate) : $(
                        '#ptnCpDate').parent().hide();
                    validateNotEmpty(cmd.modifyUser) ? $('#modifyUser').val(cmd.modifyUser) : $(
                        '#modifyUser').parent().hide();
                    $('#modifyDate').val(convertDateFormat(cmd.modifyDate));

                    callSeqName("vmSeq", cmd.vmSeq);
                    callSeqName("tidSeq", cmd.tidSeq);
                    $('#trbSeq').attr("disabled", true);
                    callSeqName("trbSeq", cmd.trbSeq);
                    callSeqName("rtSeq", cmd.rtSeq);
                    callSeqName("atSeq", cmd.atSeq);

                    callSeqName("progressStatus", cmd.progressStatus);
                    callSeqName("ptnCompSeq", cmd.ptnCompSeq);

                    //조회 완료 후, 후처리
                    if ('${member.userLevel}' == "OP") {
                        $('#ptnCompSeq').attr("disabled", true);
                    }
                    if ($('#atSeq :selected').text().includes('모뎀')) {
                        $('#modemSerialRow').show();
                    } else {
                        $('#modemSerialRow').hide();
                    }

                    /*$('#compSeq').prepend(
                        '<option value="' + cmd.compSeq + '" selected=selected>' + cmd.compName
                        + '</option>');
                    cmd.ptnCompSeq == null ? $("#ptnCompSeq").val('Y').trigger('change') : $(
                        "#ptnCompSeq").val(cmd.ptnCompSeq).trigger('change');
                    $('#serialNo').val(cmd.serialNo);
                    $('#cid').val(cmd.cid);
                    cmd.samFlag == null ? $("#samFlag").val('Y').trigger('change') : $("#samFlag").val(
                        cmd.samFlag).trigger('change');
                    cmd.tidSeq == null ? $("#tidSeq").val(0).trigger('change') : $("#tidSeq").val(
                        cmd.tidSeq).trigger('change');
                    $('#terminalId').val(cmd.terminalId);
                    $('#repairDate').val(cmd.repairDate);
                    $('#repairExpireDate').val(cmd.repairExpireDate);

                    cmd.trbSeq == null ? $("#trbSeq").val(0).trigger('change') : $("#trbSeq").val(
                        cmd.trbSeq).trigger('change');
                    cmd.rtSeq == null ? $("#rtSeq").val(0).trigger('change') : $("#rtSeq").val(
                        cmd.rtSeq).trigger('change');
                    cmd.atSeq == null ? $("#atSeq").val(0).trigger('change') : $("#atSeq").val(
                        cmd.atSeq).trigger('change');
                    cmd.mbRvSeq == null ? $("#mbRvSeq").val(0).trigger('change') : $("#mbRvSeq").val(
                        cmd.mbRvSeq).trigger('change');
                    cmd.sbRvSeq == null ? $("#sbRvSeq").val(0).trigger('change') : $("#sbRvSeq").val(
                        cmd.sbRvSeq).trigger('change');
                    cmd.icRvSeq == null ? $("#icRvSeq").val(0).trigger('change') : $("#icRvSeq").val(
                        cmd.icRvSeq).trigger('change');*/

                    //ptnComment
                    $('#ptnComment').html(cmd.ptnComment);
                    $('#ptnMemo').html(cmd.ptnMemo);

                    loadingStop();
                }, // success
                error: function (xhr, status) {
                    alert(xhr + " : " + status);
                }
            });
        }

        function popupInit(v) {
            callCompany();
            switch (v) {
                case 'company':
                    window.open('/company', 'company', 'width=800, height=800, left=100, top=100');
                    break;
            }
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

            if ($('#terminalId').val() == '') {
                alert('TID를 입력해주세요.(없을 경우 0000000000)');
                $('#terminalId').focus();
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
                            url: "/api/as",
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
                            url: "/api/aslist/${asNo}",
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
        <div class="col-12">
            <form role="form" name="formData" id="formData" class="needs-validation row" novalidate>
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="card card-primary">
                        <div class="card-header"><h4>단말기 AS 접수내역</h4></div>
                        <div class="card-body">
                            <input type="hidden" id="canUseUserId" value="S"/>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12 regist-group">
                                    <label for="ptnWriter">등록자</label>
                                    <input id="ptnWriter" type="text" class="form-control"
                                           name="ptnWriter" readonly required="" autofocus="">
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12 regist-group">
                                    <label for="asNo">접수번호</label>
                                    <input id="asNo" type="text" class="form-control"
                                           name="asNo" readonly required="" autofocus="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="compName">등록된 가맹점명</label>
                                    <div class="input-group">
                                        <input id="compName" type="text"
                                               class="form-control col-12"
                                               name="compName" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-info" type="button"
                                                    onclick="popupInit('company')">
                                                <i class="fas fa-store-alt"></i> <i
                                                    class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="businessNo">사업자번호</label>
                                    <div class="input-group">
                                        <input id="businessNo" type="text"
                                               class="form-control col-12"
                                               name="businessNo" required="" autofocus="" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-info" type="button"
                                                    onclick="$('#businessNo').val('0000000000')">
                                                <i class="fas fa-hand-holding-usd"></i> <i
                                                    class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="ctmName">지점명</label>
                                    <input id="ctmName" type="text" class="form-control"
                                           name="ctmName" maxlength="10"
                                           placeholder="지점명" required="" autofocus="">
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="ctmPhone">AS 신청자 연락처</label>
                                    <div class="input-group">
                                        <input id="ctmPhone" type="text"
                                               class="form-control col-12"
                                               name="ctmPhone"
                                               onkeyup="addHyphenPhoneNo(this);"
                                               placeholder="연락처" required="" autofocus=""
                                               maxlength="13">
                                        <div class="input-group-append" id="findAddressByPhone">
                                            <button class="btn btn-info" type="button"
                                                    onclick="$('#ctmPhone').val('010-0000-0000')">
                                                <i class="far fa-map"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                                <%--<div class="form-group col-lg-6 col-md-12 col-sm-12">
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
                                <div class="form-group col-lg-3 col-md-4 col-sm-6">
                                    <label for="serialNo">Serial</label>
                                    <input id="serialNo" type="text" class="form-control"
                                           name="serialNo" maxlength="10"
                                           placeholder="Serial" required="" autofocus="">
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>--%>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="ctmPlacePostCode">우편번호</label>
                                    <div class="input-group">
                                        <input id="ctmPlacePostCode" type="text"
                                               class="form-control col-12"
                                               name="ctmPlacePostCode"
                                               placeholder="우편번호" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-info" type="button"
                                                    onclick="execPostCode('')">
                                                <i class="fas fa-map-marker-alt"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12 regist-group">
                                    <label for="ctmPlaceAddress1">상세주소1</label>
                                    <input id="ctmPlaceAddress1" type="text" class="form-control"
                                           name="ctmPlaceAddress1" readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12 regist-group">
                                    <label for="ctmPlaceAddress2">상세주소2</label>
                                    <input id="ctmPlaceAddress2" type="text" class="form-control"
                                           name="ctmPlaceAddress2">
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="ctmPlaceName">설치위치</label>
                                    <input id="ctmPlaceName" type="text" class="form-control"
                                           name="ctmPlaceName">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="vmSeq">자판기 모델</label>
                                    <select id="vmSeq" name="vmSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="tidSeq">단말기 모델</label>
                                    <select id="tidSeq" name="tidSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="terminalId">*AS 단말기 TID</label>
                                    <div class="input-group">
                                        <input id="terminalId" type="text"
                                               class="form-control col-12"
                                               name="terminalId"
                                               placeholder="TID 입력" required="" autofocus=""
                                               maxlength="10">
                                        <div class="input-group-append">
                                            <button class="btn btn-danger" type="button"
                                                    onclick="$('#terminalId').val('0000000000')">
                                                없음
                                            </button>
                                        </div>
                                    </div>
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="trbSeq">증상접수</label>
                                    <select id="trbSeq" name="trbSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="rtSeq">고장증상</label>
                                    <select id="rtSeq" name="rtSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="atSeq">수리내용</label>
                                    <select id="atSeq" name="atSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row" id="modemSerialRow">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="bfModemSerial">기존 모뎀 시리얼번호</label>
                                    <input id="bfModemSerial" type="text" class="form-control"
                                           placeholder="기존에 사용 중이던 시리얼" required="" autofocus="">
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="afModemSerial">변경 모뎀 시리얼번호</label>
                                    <input id="afModemSerial" type="text" class="form-control"
                                           placeholder="변경된 시리얼" required="" autofocus="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="card card-primary">
                        <div class="card-body">
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label>AS 참고사항</label>
                                    <textarea class="form-control" style="height: 200px !important;"
                                              id="ptnComment" name="ptnComment"></textarea>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label>협력사 참고사항</label>
                                    <textarea class="form-control" style="height: 200px !important;"
                                              id="ptnMemo" name="ptnMemo"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-2 col-md-12 col-sm-12">
                                    <label for="ctmCharge">비용여부</label>
                                    <select id="ctmCharge" name="ctmCharge"
                                            onchange="this.value == 'N' ?
                                            (()=>{
                                              $('#deposit').val('Y').trigger('change');
                                              $('#repairCost').val('0');
                                              $('#repairCost').attr('readonly', true);
                                            })() : $('#repairCost').attr('readonly', false);"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1" aria-hidden="true">
                                        <option value="Y">유상</option>
                                        <option value="N">무상</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-2 col-md-12 col-sm-12">
                                    <label for="deposit">입금여부</label>
                                    <select id="deposit" name="deposit"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1" aria-hidden="true">
                                        <option value="N">미납</option>
                                        <option value="Y">납부</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-4 col-md-6 col-sm-6">
                                    <label for="repairCost">비용</label>
                                    <input id="repairCost" type="text" class="form-control"
                                           name="repairCost" maxlength="10" placeholder="숫자만 입력"
                                           required="" autofocus="">
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 col-md-6 col-sm-6">
                                    <label for="transferCost">대행료</label>
                                    <input id="transferCost" type="text" class="form-control"
                                           name="transferCost" maxlength="10" placeholder="숫자만 입력"
                                           required="" autofocus="">
                                    <div class="invalid-feedback">
                                        내용을 입력해주세요!
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="progressStatus">처리상태</label>
                                    <select id="progressStatus" name="progressStatus"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="ptnCompSeq">협력사</label>
                                    <select id="ptnCompSeq" name="ptnCompSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">
                                        <option value="0">-선택-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="ptnFinale">처리자</label>
                                    <input type="text" id="ptnFinale" name="ptnFinale"
                                           class="form-control" readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="ptnCpDate">처리일자</label>
                                    <input type="text" id="ptnCpDate"
                                           class="form-control datepicker" readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="modifyUser">수정자</label>
                                    <input type="text" id="modifyUser" name="modifyUser"
                                           class="form-control" readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-12 col-sm-12">
                                    <label for="modifyDate">수정일자</label>
                                    <input type="text" id="modifyDate"
                                           class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="modAdminId" value="${userId}"/>
                    <input type="hidden" name="page" value="userInsert"/>
                    <div class="row m-auto">
                        <%--<div class="form-group col-4" id="reRegistermBtn"
                             style="display: none;">
                            <button type="button"
                                    onclick="_confirm('post');"
                                    class="btn btn-warning btn-lg btn-block">
                                원본 신규 이력추가
                            </button>
                        </div>--%>
                        <%--<div class="form-group col-3">
                            <button type="button" id="confirmBtn"
                                    onclick="_confirm('${asNo}' == '' ? 'post' : 'patch');"
                                    class="btn btn-primary btn-lg btn-block">
                                등록
                            </button>
                        </div>--%>
                        <div class="form-group col-3">
                            <button type="button" onclick="history.back()"
                                    class="btn btn-secondary btn-lg btn-block">
                                뒤로가기
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
