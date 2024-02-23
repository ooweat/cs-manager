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
    <style type="text/css">
      #settings-card table td {
        height: 45px;
      }
      #settings-card tr td{padding: 0px !important;}
    </style>
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/custom.js"></script>
    <script type="text/javascript">
      $(function () {
        $("#searchValue").on("keyup", function (key) {
          if (key.keyCode == 13) {
            callList(1, $('.nav-pills a.active').attr("data-type"));
          }
        });
      });

      function init() {
        loadingStop();
        callList(1, 'users');
        callPartners();
      }

      function callList(page, target) {
        let queryString = target + "?page=" + page;

        if ($("#searchValue").val() != "") {
          queryString += "&searchValue=" + $("#searchValue").val();
        }

        $.ajax({
          type: "GET",
          url: "/api/settings/" + queryString,
          cache: false,
          success: function (cmd) {
            let header = '';
            let html = '';
            console.log(cmd.data);


            if (cmd.data.length > 0) {
              header += '<tr>';
                header += '<th class="text-center">이름</th>';
                header += '<th class="text-center">아이디</th>';
                header += '<th class="text-center">협력사</th>';
                header += '<th class="text-center">권한</th>';
                header += '<th class="text-center">삭제</th>';
                header += '</tr>';
                $('#tableHeader').html(header);
              for (let i = 0; i < cmd.data.length; i++) {
                html += '<tr onclick="location.href=' + "'/settings/" + cmd.data[i].seq + "'"
                    + '">';
                /*html += '<td class="text-center">' + convertTypeBySettingsCode(cmd.data[i].name)
                    + '</td>';*/
                html += '<td class="text-center">' + cmd.data[i].userName + '</td>';
                html += '<td class="text-center">' + cmd.data[i].userId + '</td>';
                html += '<td class="text-center">' + cmd.data[i].companyName + '</td>';
                html += '<td class="text-center">' + cmd.data[i].userLevel + '</td>';
                /*html += '<td class="text-center">' + convertDateFormat(cmd.data[i].name, "YYYY-MM-DD") + '</td>';*/
                html += '<td class="text-center">' +
                    '<a class="btn btn-danger btn-action trigger--fire-modal-1" data-toggle="tooltip" onclick="deleteSetting('
                    + cmd.data[i].seq + ')" >' +
                    '<i class="fas fa-trash"></i></a>' +
                    '</td>';
                html += '</tr>';
              }
              createPagination(cmd.page, target);
            } else {
              html += '';
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

      function convertTypeBySettingsCode(type) {
        switch (type) {
          case 'CT':
            type = '고장증상';
            break;
          case 'CR':
            type = '확인증상';
            break;
          case 'CA':
            type = '조치사항';
            break;
          case 'RT':
            type = '불량내역';
            break;
          case 'RA':
            type = '수리내역';
            break;
          case 'TERMINAL':
            type = '단말기 모델';
            break;
          case 'VM':
            type = '자판기 모델';
            break;
          case 'MN':
            type = '메인보드 리비전';
            break;
          case 'SB':
            type = '서브보드 리비전';
            break;
          case 'IC':
            type = 'IC모듈 리비전';
            break;

        }
        return type;
      }

      function saveSettings(dom) {
        let type = dom.parentNode.previousElementSibling.previousElementSibling.value;
        let name = dom.parentNode.previousElementSibling.value;

        if (type == '0') {
          alert('유형을 선택해주세요.');
          return;
        }
        if (name == '') {
          alert('명칭을 입력해주세요.');
          return;
        }

        $.ajax({
          type: "POST",
          url: "/api/setting",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify({
            type: type,
            name: name
          }),
          cache: false,
          success: function (cmd) {
            if (cmd.code == '0000') {
              alert('등록이 완료되었습니다.')
              window.location.reload();
            }
            loadingStop();
          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
          }
        });
      }

      /*사용자 수정*/
      function saveUsers(dom) {
        let type = dom.parentNode.previousElementSibling.previousElementSibling.value;
        let name = dom.parentNode.previousElementSibling.value;

        if (type == '0') {
          alert('유형을 선택해주세요.');
          return;
        }
        if (name == '') {
          alert('명칭을 입력해주세요.');
          return;
        }

        $.ajax({
          type: "POST",
          url: "/api/auth/user",
          contentType: "application/json",
          dataType: "json",
          data: JSON.stringify({
            type: type,
            name: name
          }),
          cache: false,
          success: function (cmd) {
            if (cmd.code == '0000') {
              alert('등록이 완료되었습니다.')
              window.location.reload();
            }
            loadingStop();
          }, // success
          error: function (xhr, status) {
            alert(xhr + " : " + status);
          }
        });
      }

      function deleteSetting(seq) {
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
              url: "/api/settings/" + seq,
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

      function changeSettingTable(target, page){
        let queryString = target + "?page=" + page;
        if ($("#searchValue").val() != "") {
          queryString += "&searchValue=" + $("#searchValue").val();
        }

        $.ajax({
          type: "GET",
          url: "/api"/ + queryString,
          cache: false,
          success: function (cmd) {
            let html = '';
            if (cmd.data.length > 0) {
              for (let i = 0; i < cmd.data.length; i++) {
                html += '<tr onclick="location.href=' + "'/settings/" + cmd.data[i].seq + "'"
                    + '">';
                //<div class="badge badge-success">Completed</div>
                html += '<td class="text-center">' + convertTypeBySettingsCode(cmd.data[i].type)
                    + '</td>';
                html += '<td class="text-left">' + cmd.data[i].name + '</td>';
                html += '<td class="text-center">' + convertDateFormat(cmd.data[i].createDate,
                    "YYYY-MM-DD") + '</td>';
                html += '<td class="text-center">' +
                    '<a class="btn btn-danger btn-action trigger--fire-modal-1" data-toggle="tooltip" onclick="deleteSetting('
                    + cmd.data[i].seq + ')" >' +
                    '<i class="fas fa-trash"></i></a>' +
                    '</td>';
                html += '</tr>';
              }
              console.log(cmd.page);
              createPagination(cmd.page);
            } else {
              html += '';
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
            <h2 class="section-title">Overview</h2>
            <p class="section-lead">
                서비스 이용에 필요한 정보들을 등록/관리하는 페이지 입니다.
            </p>
            <div class="row">
                <div class="col-md-5">
                    <div class="card" id="settings-regist-card">
                        <div class="card-header">
                            <h4>정보등록</h4>
                        </div>
                        <div class="card-body">
                            <p class="text-muted">계정정보 등록(수정중)</p>
                            <div class="input-group mb-2">
                                <select class="form-control custom-select col-3" id="ptnCompSeq" name="ptnCompSeq">
                                    <option value="0">-협력사-</option>
                                </select>
                                <input type="text" placeholder="ID를 입력해주세요."
                                       class="form-control col-12">
                                <div class="input-group-append">
                                    <button class="btn btn-primary"
                                            type="button" onclick="alreadyCheck(this)">중복검사
                                    </button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-12">
                                    <label for="userLevel">권한</label>
                                    <select id="userLevel" name="userLevel" class="form-control" tabindex="-1" aria-hidden="true">
                                        <option value="MA">마스터</option>
                                        <option value="MN">운영자</option>
                                        <option value="OP">협력사</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6 col-12">
                                    <label>이름</label>
                                    <input type="text" class="form-control" placeholder="이름을 입력해주세요." required="">
                                    <div class="invalid-feedback">
                                        이름을 입력해주세요.
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-12 mb-0">
                                    <label>연락처</label>
                                    <input type="text" class="form-control" placeholder="연락처를 입력해주세요." required="">
                                    <div class="invalid-feedback">
                                        연락처를 입력해주세요.
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-12 mb-0">
                                    <label>부서</label>
                                    <input type="text" class="form-control" placeholder="(선택)부서명을 입력해주세요." required="">
                                    <div class="invalid-feedback">
                                        부서명을 입력해주세요.
                                    </div>
                                </div>
                                <div class="card-footer text-right">
                                    <button class="btn btn-primary">등록하기</button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="text-muted">AS 접수 관련 정보 등록</p>
                            <div class="input-group">
                                <select class="form-control custom-select col-3">
                                    <option value="0">-증상 선택-</option>
                                    <option value="CT">고장증상</option>
                                    <option value="CR">확인증상</option>
                                    <option value="CA">조치사항</option>
                                </select>
                                <input type="text" placeholder="고장증상 또는 조치사항을 입력해주세요."
                                       class="form-control col-12">
                                <div class="input-group-append">
                                    <button class="btn btn-primary"
                                            type="button" onclick="saveSettings(this)">등록
                                    </button>
                                </div>
                            </div>
                            <br>
                            <div class="input-group">
                                <select class="form-control custom-select col-3">
                                    <option value="0">-모델 선택-</option>
                                    <option value="TERMINAL">단말기 모델</option>
                                    <option value="VM">자판기 모델</option>
                                </select>
                                <input type="text" placeholder="단말기 또는 자판기 모델명을 입력해주세요."
                                       class="form-control col-12">
                                <div class="input-group-append">
                                    <button class="btn btn-primary"
                                            type="button" onclick="saveSettings(this)">등록
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="text-muted">단말기 이력관리 관련 정보 등록</p>
                            <div class="input-group">
                                <select class="form-control custom-select col-3"
                                        id="searchType" name="searchType">
                                    <option value="0">-불량/수리내역-</option>
                                    <option value="RT">불량내역</option>
                                    <option value="RA">수리내역</option>
                                </select>
                                <input type="text" id="inputSetting"
                                       name="inputSetting" placeholder="고장증상 또는 조치사항을 입력해주세요."
                                       class="form-control col-12">
                                <div class="input-group-append">
                                    <button class="btn btn-primary"
                                            type="button" onclick="saveSettings(this)">등록
                                    </button>
                                </div>
                            </div>
                            <br>
                            <div class="input-group">
                                <select class="form-control custom-select col-3">
                                    <option value="0">-리비전 선택-</option>
                                    <option value="MN">메인보드 리비전</option>
                                    <option value="SB">서브보드 리비전</option>
                                    <option value="IC">IC모듈 리비전</option>
                                </select>
                                <input type="text" placeholder="리비전 내용을 입력해주세요."
                                       class="form-control col-12">
                                <div class="input-group-append">
                                    <button class="btn btn-primary"
                                            type="button" onclick="saveSettings(this)">등록
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="card" id="settings-card">
                        <div class="card-header">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" data-type="users" onclick="changeSettingTable('/settings/users', 1)"><i class="fas fa-user"></i> 계정</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-type="as" onclick="changeSettingTable('/settings/as', 1)"><i class="fas fa-cog"></i> AS</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-type="repair" onclick="changeSettingTable('/settings/repair', 1)"><i class="fas fa-cog"></i> Repair</a>
                                </li>
                            </ul>

                            <%--<div class="selectgroup datechoice-btn" id="function-label">
                                <label class="selectgroup-item mb-0">
                                    <input type="radio" name="datechoice-btn" value="2" class="selectgroup-input" checked="" onclick="setDateRangePicker('3')">
                                    <span class="selectgroup-button"><i class="fas fa-cog"></i> AS</span>
                                </label>
                                <label class="selectgroup-item mb-0">
                                    <input type="radio" name="datechoice-btn" value="1" class="selectgroup-input" onclick="setDateRangePicker('1')">
                                    <span class="selectgroup-button"><i class="fas fa-user"></i> 계정</span>
                                </label>
                                <label class="selectgroup-item mb-0">
                                    <input type="radio" name="datechoice-btn" value="3" class="selectgroup-input" onclick="setDateRangePicker('6')">
                                    <span class="selectgroup-button"><i class="fas fa-cog"></i> Repair</span>
                                </label>
                            </div>--%>

                            <div class="card-header-form">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="searchValue"
                                           placeholder="Search">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary"
                                                onclick="callList('1', $('.nav-pills a.active').attr('data-type'))">
                                            <i class="fas fa-search"></i></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="card-body pb-0">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead id="tableHeader">
                                    </thead>
                                    <tbody id="tableBody" class="p-0">
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
