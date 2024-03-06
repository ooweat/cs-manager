<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
          name="viewport">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/custom.js"></script>
    <script type="text/javascript" src="/static/assets/js/support-datepicker.js"></script>
    <script type="text/javascript">
      function init() {
        loadingStop();
        /*날짜 초기값 설정*/
        $('#sDate').val(moment().format('YYYY-MM-DD'));
        $('#eDate').val(moment().format('YYYY-MM-DD'));
        callList(1);
      }

      function deleteRepair(asNo) {
        Swal.fire({
          title: '정말로 삭제하시겠습니까?',
          text: "삭제 시, 복구할 수 없습니다!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#fc544b',
          cancelButtonColor: '#bdbdbd',
          confirmButtonText: '삭제',
          cancelButtonText: '취소'
        }).then((result) => {
          if (result.isConfirmed) {
            $.ajax({
              type: "DELETE",
              url: "/api/repairs/" + asNo,
              cache: false,
              success: function () {
                Swal.fire({
                  title: '<strong>완료</strong>',
                  icon: 'success',
                  html: '완료되었습니다.',
                  showCloseButton: true,
                  showCancelButton: false,
                  focusConfirm: false,
                  confirmButtonText: '확인',
                  confirmButtonAriaLabel: 'Thumbs up, great!',
                }).then((click) => {
                  window.location.reload();
                });
              }, // success
              error: function (xhr, status) {
                alert(xhr + " : " + status);
              }
            });
          }
        })
      }

      function callList(page) {
        let queryString = "?page=" + page
            + "&sDate=" + $("#sDate").val()
            + "&eDate=" + $("#eDate").val();

        if ($("#searchType").val() != "0" && $("#searchValue").val() != "") {
          queryString += "&searchType=" + $("#searchType").val() + "&searchValue=" + $(
              "#searchValue").val();
        }

        if ($("#searchType").val() == "0" && $("#searchValue").val() != "") {
          alert("검색조건을 선택해주세요.");
          return;
        }

        if ($("#searchType").val() != "0" && $("#searchValue").val() == "") {
          alert("검색어를 입력해주세요.");
          return;
        }

        $.ajax({
          type: "GET",
          url: "/api/repairs" + queryString,
          cache: false,
          success: function (cmd) {
            console.log(cmd);
            $('#searchCount').text("(" + numberWithCommas(cmd.page.total) + "건)");
            let html = '';
            if (cmd.data.length > 0) {
              for (let i = 0; i < cmd.data.length; i++) {
                html += '<tr>';
                html += '<td class="text-center">' +
                    '<a class="btn btn-primary btn-action mr-1" ' +
                    'data-toggle="tooltip" title="" ' + 'onclick="location.href=' + "'/repairs/"
                    + cmd.data[i].asNo + "'" + '" data-original-title="Edit">' +
                    '<i class="fas fa-pencil-alt"></i></a>' +
                    '<a class="btn btn-danger btn-action trigger--fire-modal-1" data-toggle="tooltip" onclick="deleteRepair('
                    + cmd.data[i].asNo + ')" >' +
                    '<i class="fas fa-trash"></i></a>' +
                    '</td>';
                html += '<td class="text-center">' + convertDateFormat(cmd.data[i].createDate,
                    'YYYY-MM-DD') + '</td>';
                html += '<td class="text-center">' + cmd.data[i].repairDate + '</td>';
                html += '<td class="text-center">' + cmd.data[i].repairExpireDate + '</td>';
                html += '<td class="text-center">' + cmd.data[i].cid + '</td>';
                html += '<td class="text-left">' + cmd.data[i].compName + '</td>';
                html += '<td class="text-left">' + cmd.data[i].ptnCompName + '</td>';
                html += '<td class="text-center">' + cmd.data[i].tidModelName + '</td>';
                html += '<td class="text-center">' + cmd.data[i].terminalId + '</td>';
                html += '<td class="text-left">' + cmd.data[i].trbName + '</td>';
                html += '<td class="text-left">' + cmd.data[i].atName + '</td>';
                html += '<td class="text-left">' + cmd.data[i].mbRvName + '</td>';
                html += '<td class="text-left">' + cmd.data[i].sbRvName + '</td>';
                html += '<td class="text-left">' + cmd.data[i].icRvName + '</td>';
                html += '</tr>';
              }

              createPagination(cmd.page);
            } else {
              html += '';
              $('.pagination').html(html);
            }

            $('#tableBody').html(html);
            loadingStop();
          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
            location.href("/");
          }
        });
      }
    </script>
</head>
<body onload="init();">
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card card-primary custom-card">
                        <div class="card-body">
                            <div class="row form-divider text-primary">
                                단말기 이력관리
                                <a class="btn btn-primary" href="/repairs/info">신규등록
                                    <span
                                            class="badge badge-white">N</span></a>
                            </div>
                            <input type="hidden" name="serviceType" id="serviceType"
                                   value="issuance"/>
                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <div class="container-fluid border">
                                        <div class="row border-bottom">
                                            <div class="col-lg-2 col-sm-2 col-md-2 bg-light p-2">
                                                상세정보
                                                <i class="fas fa-question-circle title-i-line-height text-primary"
                                                   data-toggle="tooltip" title=""
                                                   data-original-title=
                                                           "추가정보를 조회할 수 있어요!"></i>
                                            </div>
                                            <div class="row col-lg-7 col-sm-7 col-md-7 py-2 m-auto-0">
                                                <div class="input-group">
                                                    <select class="form-control custom-select col-3"
                                                            id="searchType" name="searchType">
                                                        <option value="0">-선택-</option>
                                                        <option value="COMP.COMP_NAME">발송처</option>
                                                        <option value="LIST.TERMINAL_ID">TID
                                                        </option>
                                                        <option value="LIST.SERIAL_NO">Serial
                                                        </option>
                                                        <option value="LIST.CID">CID</option>
                                                    </select>
                                                    <input type="text" id="searchValue"
                                                           name="searchValue"
                                                           class="form-control col-6">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary"
                                                                type="button" onclick="callList(1)">
                                                            조회
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row border-bottom"
                                             style="border-bottom: 0px solid !important;">
                                            <div class="col-lg-2 col-md-2 bg-light p-2">등록기간
                                            </div>
                                            <div class="col-lg-4 col-sm-4 col-md-5 py-2 m-auto-0">
                                                <div class="input-group daterange-btn form-inline col-lg-12 col-sm-12 col-md-12">
                                                    <input type="text" name="sDate"
                                                           maxlength="8"
                                                           class="form-control daterange-sdate"
                                                           id="sDate"
                                                           placeholder="시작일자">
                                                    <div class="date-hypen"> ~</div>
                                                    <input type="text" name="eDate"
                                                           maxlength="8"
                                                           class="form-control daterange-edate"
                                                           id="eDate"
                                                           placeholder="종료일자">
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-sm-6 col-md-5 py-2 m-auto-0">
                                                <div class="selectgroup datechoice-btn">
                                                    <label class="selectgroup-item mb-0">
                                                        <input type="radio"
                                                               name="datechoice-btn" value="1"
                                                               class="selectgroup-input"
                                                               checked=""
                                                               onclick="setDateRangePicker('1')">
                                                        <span class="selectgroup-button">오늘</span>
                                                    </label>
                                                    <label class="selectgroup-item mb-0">
                                                        <input type="radio"
                                                               name="datechoice-btn" value="2"
                                                               class="selectgroup-input"
                                                               onclick="setDateRangePicker('2')">
                                                        <span class="selectgroup-button">어제</span>
                                                    </label>
                                                    <label class="selectgroup-item mb-0">
                                                        <input type="radio"
                                                               name="datechoice-btn" value="3"
                                                               class="selectgroup-input"
                                                               onclick="setDateRangePicker('3')">
                                                        <span class="selectgroup-button">이번달</span>
                                                    </label>
                                                    <label class="selectgroup-item mb-0">
                                                        <input type="radio"
                                                               name="datechoice-btn" value="4"
                                                               class="selectgroup-input"
                                                               onclick="setDateRangePicker('4')">
                                                        <span class="selectgroup-button">지난달</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="p-2 pb-1 mt-0 ml-2 mr-2">
                            <div class="float-left">
                                <h6 class="pt-0">조회결과 <span class="text-muted"
                                                            id="searchCount"></span>
                                </h6>
                                <code>※정렬순서요청(오름차순): 불량내역, 수리내역, 메인REV, 서브REV, ICREV</code>
                            </div>
                            <div class="float-right">
                                <button class="btn btn-primary" onclick="excelDownload('repairs');">
                                    <i class="fas fa-file-download lh-0"></i> 엑셀 다운로드
                                </button>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <div class="table-responsive">
                                <table class="table table-striped table-md fancy-table">
                                    <thead>
                                    <tr>
                                        <th class="text-center">관리</th>
                                        <th class="text-center">등록일자</th>
                                        <th class="text-center">처리일자</th>
                                        <th class="text-center">보증만료일자</th>
                                        <th class="text-center">CID</th>
                                        <th class="text-left">발송처</th>
                                        <th class="text-left">협력사</th>
                                        <th class="text-center">단말기모델</th>
                                        <th class="text-center">TID</th>
                                        <th class="text-left">불량내역</th>
                                        <th class="text-left">수리내역</th>
                                        <th class="text-left">메인REV</th>
                                        <th class="text-left">서브REV</th>
                                        <th class="text-left">ICREV</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tableBody">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%--테이블--%>
                        <div class="card-footer text-center border-top">
                            <nav class="d-inline-block">
                                <ul class="pagination justify-content-center">

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>
