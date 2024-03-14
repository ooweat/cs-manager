<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="/static/favicon.ico">
    <title>로그인</title>
    <!-- General CSS Files -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/fontawesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <%--<script type="text/javascript" src="/assets/js/custom.js"></script>--%>
    <!-- Template CSS -->
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/components.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
</head>
<body>
<div id="app">
    <div class='loading_layer' style="display: none;">
        <img class="loading_layer_img" src='/assets/img/unsplash/loading_2.gif' alt='로딩중'
             onclick="$('.loading_layer').css('display','none')">
    </div>
    <section class="section">
        <div class="container mt-5">
            <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                    <div class="login-brand">
                        <img src="" alt="logo" class="mb-5 mt-2">
                    </div>

                    <div class="card card-primary">
                        <div class="card-header"><h4>로그인</h4></div>

                        <div class="card-body">
                            <div id="formData" class="needs-validation" novalidate="">
                                <div class="form-group">
                                    <label for="userId">아이디</label>
                                    <input id="userId" type="text" class="form-control"
                                           name="userId" tabindex="1"
                                           placeholder="아이디"
                                           required autofocus>
                                    <div class="invalid-feedback">
                                        아이디를 입력하여 주세요.
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="d-block">
                                        <label for="userPass" class="control-label">비밀번호</label>
                                    </div>
                                    <input id="userPass" type="password" class="form-control"
                                           name="userPass"
                                           tabindex="2" placeholder="비밀번호" required>
                                    <div class="invalid-feedback">
                                        비밀번호를 입력하여 주세요.
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button onclick="login()"
                                            class="btn btn-primary btn-lg btn-block" tabindex="4">
                                        로그인
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="simple-footer">
                        Copyright &copy;
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="/assets/js/stisla.js"></script>
<script type="text/javascript">
  /* 엔터 이벤트 추가 */
  $(function () {
    $("#userId").on("keyup", function (key) {
      if (key.keyCode == 13) {
        login();
      }
    });
    $("#userPass").on("keyup", function (key) {
      if (key.keyCode == 13) {
        login();
      }
    });
  });

  function login() {
    $('.loading_layer').show();
    $.ajax({
      cache: false,
      type: "POST",
      contentType: "application/json;",
      url: "/api/auth/loginConfirm",
      data: JSON.stringify({
        "userId": $('#userId').val(),
        "userPass": $('#userPass').val(),
      },),
      dataType: "json",
      success: function (cmd) {
        if (cmd.code == '0000') {
          window.location.assign("/dashboard");
          //window.location.assign("/repairs");
        } else {
          alert('아이디 또는 비밀번호가 다릅니다.');
          location.assign("/");
          $('.loading_layer').hide();
        }
      }, // success
      error: function (xhr, status) {
        alert("오류가 발생하였습니다.");
        $('.loading_layer').hide();
        location.assign("/");
      }
    });
  }
</script>
</body>
</html>
