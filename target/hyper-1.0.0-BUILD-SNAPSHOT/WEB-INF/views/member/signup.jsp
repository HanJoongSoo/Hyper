<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta>
  <!-- 제이커리씨디엔 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- #end 제이커리 씨디엔 -->
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>

  <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@우편번호 서비스@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
  <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
  <title>회원 가입</title>
  <!-- <script defer src="script/address.js"></script>
   <link rel="stylesheet" href="script/hi.css">
   <script defer src="script/hi.js"></script> -->
  <script defer src="resources/js/signup.js" charset="UTF-8"></script>
  <script defer src="resources/js/address.js"></script>
  <link rel="stylesheet" href="resources/css/signup.css">
  <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp"%>
<%--상단 공통 header.jsp 불러오기 --%>



<!-- 회원가입 구간 -->
<form method="" class="joinForm" action="">
  <h2>회원가입</h2>
  <!-- 아이디 -->
  <div class="textForm" id="idForm">
    <input name="member_id"  id="member_id" type="text" class="id" value=""  placeholder="아이디"/>
  </div>
  <div id="idMsg"></div>


  <!-- 비밀번호 -->
  <div class="textForm" id="pwdForm">
    <input name="member_pwd" id="member_pwd" type="password" value="" class="pw" placeholder="비밀번호"/>
  </div>
  <div id="pwdMsg"></div>



  <!-- 비밀번호 확인-->
  <div class="textForm" id="pwdCheckForm">
    <input name="member_pwd_check" id="member_pwd_check" type="password" value="" class="pw"
           placeholder="비밀번호 확인"/>
  </div>
  <div id="pwdCheckMsg"></div>
  <!-- 비밀번호 긑 -->


  <!-- 이름 -->
  <div class="textForm" id="nameForm">
    <input name="member_name" id="member_name" value="" type="text" class="name" placeholder="이름" required/>
  </div>
  <div id="nameMsg"></div>


  <!-- 이메일 -->
  <div class="textForm" id="emailForm">
    <input name="member_email" id="member_email" type="text" class="email" placeholder="이메일"  value="" />
  </div>
  <div id="emailMsg"></div>
  <!-- 이메일 끝 -->


  <!-- 생년월일 -->
  <div class="textForm" id="yearFrom">
    <input name="member_year" id="member_year" type="text"  value="" class="name" placeholder="생년월일 8자리"/>
  </div>
  <div id="member_yearMsg"></div>
  <!-- 생년월일 끝 -->


  <!-- 전화번호 -->
  <div class="textForm" id="phoneForm">
    <input name="member_phone" id="member_phone" type="text" value="" class="cellphoneNo"
           placeholder="휴대폰 번호"/>
  </div>
  <div id="phoneMsg"></div>
  <!-- 전화번호 끝-->

  <!-- 우편번호 -->
  <div class="textForm" id="zipcodeForm">                                         <!--class='member_zipcode' 제이쿼리에 사용-->
    <input type="text" id="member_zipcode" placeholder="우편번호" value="" class="zipcode member_zipcode" name="member_zipcode"/>
    <input type="button" onclick="searchPost()" class="searchPost" value="우편번호 찾기"/><br>
  </div>
  <div class="textForm" id="faddrForm">
    <input type="text" id="member_faddr" placeholder="주소"  value="" class="name member_faddr" name="member_faddr"/>
  </div>
  <div class="textForm" id="laddrForm">
    <input type="text" id="member_laddr" placeholder="상세주소"  value="" class="name member_laddr" name="member_laddr"/>
  </div>
  <!-- 우편번호 끝 -->


<%--모든 항목을 입력하지 않고 가입버튼을 누르게 돠면 스크립트를 통해서 에러메시지 뜨는 곳--%>
          <div id="joinError"></div>
  <!------------------------------------------------------------------가입버튼--------------------------------------------------->
  <input type="button" class="btn" onclick="doSignup()" value="가입" />
</form>


<footer><%@ include file="../include/footer.jsp"%></footer>
</body>
</html>