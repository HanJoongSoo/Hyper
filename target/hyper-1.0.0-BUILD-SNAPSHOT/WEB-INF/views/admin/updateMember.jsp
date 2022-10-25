<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
   <script src="resources/js/mypage.js" charset="UTF-8"></script>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/mypage.css">
   <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
   <title>{member.memer_id}님 회원정보 수정</title>
   <style>
      * {
         margin: 0px auto;
      }
   </style>
</head>
<body>
<%@ include file="../include/header.jsp"%>
<section>
   <div class="list2" align="center">
      <form>
         <h2 align="center">회원 정보 수정</h2>
         <table style="border:1px solid #E1DCDC;" cellpadding="7" cellspacing="7">
            <tr class="block1">
               <th>아이디</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <input id="member_id"  type="text" class="input" value="${member2.member_id}">
               </td>
            </tr>
            <tr class="block1">
               <th>변경할 비밀번호</th>
               <td style="border-bottom:1px solid #E1DCDC;"><input type="password" id="member_pwd" class="input" maxlength="20" /></td>
            </tr>
            <tr class="block1">
               <th>비밀번호 확인</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <input type="password" id="chk_member_pwd" class="input" maxlength="20" />
                  <label id="checkPasswd"></label>
               </td>
            </tr>
            <tr class="block1">
               <th>이름</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <input id="member_name" type="text" class="input" value="${member2.member_name}"/>
                  <label id="chkname"></label>
               </td>
            </tr>
            <tr class="block1">
               <th>생년월일</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <fmt:parseDate value="${member2.member_year}" pattern="yyyy-MM-ddHH:mm:ss" var="m_birth" />
                  <fmt:formatDate value="${m_birth}" pattern="yyyy-MM-dd" var="mbirth" />
                  <input id="member_year" class="input" value="${mbirth}"><br>
               </td>
            </tr>
            <tr class="block1">
               <th>이메일(선택)</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <!-- email split해서 값 넣어주기 -->
                  <!-- c:set 셋팅 -->
                  <c:set var="m_email" value="${member2.member_email}" />
                  <c:set var="memail" value="${fn:split(m_email, '@') }" />
                  <!-- 배열 인덱스로 불러옴 -->
                  <input type="text" size="15" id="email_id" class="input" value="${memail[0] }"> @
                  <input type="text" size="15" id="email_addr" class="input" value="${memail[1] }" disabled>
                  <select id="email_select">
                     <option value="" selected>::선택하세요::</option>
                     <option value="naver.com">naver.com</option>
                     <option value="gmail.com">gmail.com</option>
                     <option value="hanmail.net">hanmail.net</option>
                     <option value="nate.com">nate.com</option>
                     <option value="1">직접입력</option>
                  </select>
               </td>
            </tr>
            <tr class="block1">
               <th>연락처(선택)</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <!-- phone split해서 값 넣어주기 -->
                  <!-- c:set 셋팅 -->
                  <c:set var="m_phone" value="${member2.member_phone}" />
                  <c:set var="mphone" value="${fn:split(m_phone, '-') }" />
                  <!-- 배열 인덱스로 불러옴 -->
                  <select id="NUMst">
                     <option value="${mphone[0]}" selected>${mphone[0]}</option>
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                  </select> -
                  <input type="text" id="NUMnd" class="input" maxlength="4" size="4" value="${mphone[1]}" /> -
                  <input type="text" id="NUMrd" class="input" maxlength="4" size="4" value="${mphone[2]}" />
               </td>
            </tr>
            <tr class="block1">
               <th>주소</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <input type="text" name="member_zipcode" id="member_zipcode" class="input" readonly size="10" value="${member2.member_zipcode}">
                  <input type="button" onclick="searchPost()" style="cursor: pointer" value="우편번호 찾기"><br><br>
                  <input type="text" name="member_faddr" id="member_faddr" class="input" size="60" value="${member2.member_faddr}" readonly>
               </td>
            </tr>
            <tr class="block1">
               <th>상세주소</th>
               <td><input type="text" name="member_laddr" id="member_laddr" class="input" value="${member2.member_laddr}"></td>
            </tr>
         </table>
      </form>
      <br>
      <input type="button" onclick="memberUp()" style="cursor: pointer" value="수정" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" onclick="location.href='main'" style="cursor: pointer" value="취소" />
   </div>
</section>
<%@ include file="../include/footer.jsp"%>
</body>
</html>