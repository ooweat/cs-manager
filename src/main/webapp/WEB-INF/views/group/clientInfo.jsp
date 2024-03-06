<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title></title>
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/fancyTable.js"></script>
    <script type="text/javascript" src="/assets/js/custom.js"></script>
    <script type="text/javascript">
        function popBizNew() {
            $("#bizList").empty();  //#bizList 하위 초기화
            let companySeq = $("#vmmsCompany :selected").val();
            let str = "";             //태그 초기화 선언
            $.ajax({
                cache: false,
                url: "/ajax/getBusinessList?companySeq=" + companySeq,
                type: 'POST',
                data: companySeq,
                success: function (list) {
                    $.each(list, function (i) {
                        str += '<tr id="checkbox-mom" ' +
                            'onclick="' +
                            'checkboxInsert(' +
                            "'" + 'checkbox-' +
                            '' + list[i].businessNo + '' +
                            "','" +
                            '' + list[i].businessNo + '' +
                            "','" +
                            '' + list[i].merchantName + '' +
                            "','" +
                            '' + list[i].companySeq + '' +
                            "','" +
                            '' + list[i].companyName + '' +
                            "'" +
                            ')">' +
                            '<td class="col-6">' + list[i].businessNo + '</td>' +
                            '<td class="col-6">' + list[i].merchantName + '</td>' +
                            '</tr>';
                    });
                    $("#bizList").append(str);
                    $(".fancy-table").fancyTable({
                        sortColumn: 10, // column number for initial sorting
                        sortOrder: 'descending', // 'desc', 'descending', 'asc', 'ascending', -1 (descending) and 1 (ascending)
                        sortable: true,
                        pagination: true, // default: false
                        searchable: true,
                        globalSearch: true,
                        globalSearchExcludeColumns: [0, 20] // exclude column 2 & 5
                    });
                }, // success
                error: function (xhr, status) {
                    alert("삭제는 시스템 사업부로 요청바랍니다. (테이블: TB_MEMB_GROUP)");
                }
            });
        }
        function checkboxInsert(target, businessNo, businessName, companySeq, companyName) {
            target = $('#' + target);
            if (!target.is(":checked")) {
                target.prop('checked', true);
                $.ajax({
                    cache: false,
                    url: "/ajax/alreadyClientCheck",
                    type: 'POST',
                    data: {
                        "companySeq": companySeq,
                        "businessNo": businessNo
                    },
                    success: function (e) {
                        if(e.code =='0111'){
                            alert("타 그룹에 기등록된 소속-사업자 입니다.\n"+e.description);
                        }else{
                            let html =
                                "<tr " +
                                "class=" +
                                "'" + 'selected-' +
                                '' + businessNo + '' +
                                "'" +
                                "onclick=" +
                                'removeTagRow(' +
                                "'" + 'selected-' +
                                '' + businessNo + '' +
                                "')" +
                                ">" +
                                "<input class='form-control' type='hidden' name='etc1' value='" + companySeq + "'/>" +
                                "<td><input class='form-control' type='text' name='companyName' value='" + companyName + "'/></td>" +
                                "<td><input class='form-control' type='text' name='businessNo' value='" + businessNo + "'/></td>" +
                                "<td><input class='form-control' type='text' name='businessName' value='" + businessName + "'/></td>" +
                                "</tr>";
                            $('#checkList').append(html);
                        }
                    }
                });


            } else {
                target.prop('checked', false);
                $("." + businessNo + "").remove();
            }
        }

        async function groupUpdate(groupSeq) {
          const {value: groupName} = await Swal.fire({
            title: '수정할 그룹명을 입력하세요.',
            input: 'text',
            inputLabel: '현재 그룹명:' + $('#groupName').text(),
            inputPlaceholder: '그룹명: 쿠폰 또는 포인트 사용 시 표기될 상호명',
            inputAttributes: {
              maxlength: 25,
              autocapitalize: 'off',
              autocorrect: 'off'
            }
          });
          if (groupName.length < 2) {
            alert('상호명은 최소 2글자 이상 입력해주세요.');
            return false;
          }

          $.ajax({
            type: "POST",
            url: "/ajax/updateGroup",
            data: {
              "groupSeq": groupSeq,
              "groupName": groupName,
            },
            dataType: "json",
            cache: false,
            success: function (cmd) {
              if (cmd.code == '0000') {
                alert('수정이 완료되었습니다.');
                window.location.reload();
              }
            }, // success
            error: function () {
              alert('수정이 취소되었습니다.');
              location.href("/");
            }
          });
        }
    </script>
</head>
<body>
<!-- Main Content -->
<div class="main-content">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="card card-primary">
                <div class="card-header"><h4>그룹 고객사 정보</h4></div>
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-12">
                            <label for="groupName">선택된 그룹 : </label>
                            <span id="groupName" class="btn btn-primary" onclick="groupUpdate('${groupInfo.groupSeq}')">${groupInfo.groupName}</span>
                            <span><i class="fa-solid fa-arrow-left"></i> 그룹명 수정을 원하시면 그룹명을 눌러주세요. (특수문자 제외)</span>
                        </div>
                    </div>
                    <form role="form" name="formData" id="formData" class="needs-validation"
                          novalidate="">
                        <%--시작--%>
                        <div class="row">
                            <%-- VMMS --%>
                            <div class="form-group col-lg-5 col-md-5 col-sm-12 container">
                                <div class="container-fluid card card-primary">
                                    <div class="card-header">
                                        <h4>등록된 VMMS 소속</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="row formGrpWrapper">
                                            <div class="form-group col-lg-8 col-md-8 col-sm-12">
                                                <label for="vmmsCompany">검색조건</label>
                                                <select id="vmmsCompany"
                                                        class="form-control select2 select2-hidden-accessible"
                                                        tabindex="-1" aria-hidden="true">
                                                    <c:forEach var="getVmmsCompanyList" items="${getVmmsCompanyList}">
                                                        <option value="${getVmmsCompanyList.companySeq}">${getVmmsCompanyList.companyName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-lg-4 col-md-4 col-sm-12">
                                                <label for="newEntry" id="function-label">&nbsp;</label>
                                                <button type="button" class="form-control btn btn-primary"
                                                        id="newEntry" onclick="popBizNew();">조회하기
                                                </button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="card-header">
                                                <h4>BIZ 정보조회</h4>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table table-hover table-striped table-md fancy-table">
                                                    <thead>
                                                    <tr>
                                                        <th class="col-6">사업자번호</th>
                                                        <th class="col-6">가맹점명</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="bizList"></tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- VMMS --%>
                            <%-- BIZ--%>
                            <div class="form-group col-lg-7 col-md-7 col-sm-12 container">
                                <div class="container-fluid card card-primary">
                                    <div class="card-header">
                                        <h4>선택된 정보</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                <div class="">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-striped table-md fancy-table">
                                                            <thead>
                                                            <tr>
                                                                <th class="col-4">VMMS 소속</th>
                                                                <th class="col-4">사업자번호</th>
                                                                <th class="col-4">가맹점명</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="checkList">
                                                            <c:forEach var="clientInfo" items="${clientInfo}">
                                                                <tr name="memberGroupVOList"
                                                                    class="selected-${clientInfo.businessNo}"
                                                                    onclick="removeTagRow('selected-${clientInfo.businessNo}')">
                                                                    <input class='form-control' type='hidden'
                                                                           name='etc1'
                                                                           value='${clientInfo.companySeq}'/>
                                                                    <td><input class='form-control' type='text'
                                                                               name='companyName'
                                                                               readonly="readonly"
                                                                               value='${clientInfo.companyName}'/></td>
                                                                    <td><input class='form-control' type='text'
                                                                               name='businessNo'
                                                                               readonly="readonly"
                                                                               value='${clientInfo.businessNo}'/></td>
                                                                    <td><input class='form-control' type='text'
                                                                               name='businessName' readonly="readonly"
                                                                               value='${clientInfo.businessName}'/></td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="groupSeq" value="${paramGroupSeq}"/>
                        <div class="row">
                            <div class="form-group col-6">
                                <button type="button"
                                        onclick="confirmPost('/ajax/updateGroupClient');"
                                        class="btn btn-primary btn-lg btn-block removeEntry">
                                    수정
                                </button>
                            </div>
                            <div class="form-group col-6">
                                <button type="button" onclick="location.href='/group/client'"
                                        class="btn btn-secondary btn-lg btn-block">
                                    목록
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".fancy-table").fancyTable({
        sortColumn: 10, // column number for initial sorting
        sortOrder: 'descending', // 'desc', 'descending', 'asc', 'ascending', -1 (descending) and 1 (ascending)
        sortable: true,
        pagination: true, // default: false
        searchable: true,
        globalSearch: true,
        globalSearchExcludeColumns: [0, 20] // exclude column 2 & 5
    });
</script>
</body>
</html>
