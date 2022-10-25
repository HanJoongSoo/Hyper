<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>비밀번호 찾기</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@구글 공짜 폰트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
  <script defer src="resources/js/findPassword.js"></script>
  <link rel="stylesheet" href="resources/css/findId.css">
</head>
<body>
<%@ include file="../include/header.jsp"%>
<%--상단 공통 header.jsp 불러오기 --%>
<div class="container">
  <form class="form" method="post" id="login" action="find_password" name="findform" style="">
    <section id="sec1">
    <h1 class="form__title">비밀번호 찾기</h1>
    <div class="form__message form__message--error">
      <!-- 정보가 일치하지 않을 때-->
      <c:if test="${check == 1}">
        <script>
          console.log("일치하는 정보없음.");
          opener.document.findform.member_id.value = "";
          opener.document.findform.member_name.value = "";
          opener.document.findform.member_phone.value = "";
        </script>
        <label>일치하는 정보가 존재하지 않습니다.</label>
      </c:if>
    </div>
    <div class="form__message">
    </div>

    <div class="form__input-group">
      <input type="text" class="form__input" id="member_id" name="member_id" autofocus placeholder="아이디">
      <label for="member_id"></label>
      <div class="form__input-error-message"></div>
    </div>
    <div class="form__input-group">
      <input type="text" class="form__input" id="member_name" name="member_name" autofocus placeholder="이름">
      <label for="member_name"></label>
      <div class="form__input-error-message"></div>
    </div>
    <div class="form__input-group">
      <input type="text" class="form__input" id="member_phone" name="member_phone" autofocus placeholder="핸드폰번호">
      <label for="member_phone"></label>
      <div class="form__input-error-message"></div>
    </div>
    <button class="form__button updatePassword" type="submit" value="">비밀번호 찾기</button>
    <p class="form__text">
      <a href="find_id_form" class="form__link">아이디 찾기</a>
    </p>
    <p class="form__text">
      <a class="form__link" href="main" id="linkCreateAccount">HOME</a>
    </p>
    </section>
  <!-- 일치할시 -->
  <c:if test="${check == 0 }">
    <script type="text/javascript">
      $(function(){
        $("#sec1").hide();
      })
    </script>
    <h1 class="form__title">비밀번호 재설정</h1>
    <p id="re">비밀번호를 변경해주세요.</p>
    <div class="form__message form__message--error"></div>
    <div class="form__input-group">
      <input type="hidden" id="id" name="${updateid}">
      <input type="password" class="form__input pwd" id="member_pwd" name="member_pwd" autofocus placeholder="비밀번호">
      <label for="member_pwd"></label>
      <div class="form__input-error-message"></div>
    </div>
    <div class="form__input-group">
      <input type="password" class="form__input pwd" id="confirmpassword" name="confirmpwd" autofocus placeholder="비밀번호 확인">
      <label for="confirmpassword"></label>
      <div class="form__input-error-message"></div>
    </div>
    <button class="form__button" type="button" onclick="updatePassword()" disabled="" id="pwdbtn">비밀번호 변경</button>
    <p class="form__text">
      <a href="login" class="form__link">로그인</a>
    </p>
    <p class="form__text">
      <a class="form__link" href="main" id="">HOME</a>
    </p>
  </c:if>

  </form>
</div>


<script type="text/javascript">
  function updatePassword(){
    if(document.findform.member_pwd.value==""){

      document.findform.member_pwd.focus();
    } else if(document.findform.member_pwd.value != document.findform.confirmpwd.value){

      document.findform.confirmpwd.focus();
    } else {
      document.findform.action="update_password";
      document.findform.submit();
    }
  }
</script>

<footer><%@ include file="../include/footer.jsp"%></footer>
</body>
</html>
