<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
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
   <title>회원주문내역 수정</title>
   <style>
      * {
         margin: 0px auto;
      }
        #nav ul li {
        right: 5px;
    }
   </style>
</head>
<body>
<%@ include file="../include/header.jsp"%>
<section>
   <div class="list2" align="center">
      <form>
         <h2 align="center">회원 주문내역</h2>
         <table id="mem" style="border:1px solid #E1DCDC;" cellpadding="7" cellspacing="7">
            <tr class="block1">
         		<th>주문번호</th>
         		<td style="border-bottom:1px solid #E1DCDC;">
         			<input id="payment_id" type="text" class="input" value="${lPay.payment_id}">
            <tr class="block1">
               <th>아이디</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <input id="member_id"  type="text" class="input" value="${lPay.member_id}">
               </td>
            </tr>
            <tr class="block1">
               <th>주소</th>
               <td style="border-bottom:1px solid #E1DCDC;">
                  <input type="text" name="member_zipcode" id="member_zipcode" class="input" readonly size="10" value="${lPay.member_zipcode}">
                  <input type="button" onclick="searchPost()" style="cursor: pointer" value="우편번호 찾기"><br><br>
                  <input type="text" name="member_faddr" id="member_faddr" class="input" size="60" value="${lPay.member_faddr}" readonly>
               </td>
            </tr>
            <tr class="block1">
               <th>상세주소</th>
               <td><input type="text" name="member_laddr" id="member_laddr" class="input" value="${lPay.member_laddr}"></td>
            </tr>
            <tr class="block1">
            	<th>상품옵션</th>
            	<td><input type="text" name="prd_opt" id="prd_opt" class="input" value="${lPay.prd_opt}"></td>
            <tr class="block1">
            	<th>배송현황</th>
            	<td><input type="text" name="delivery" id="delivery" class="input" value="${lPay.delivery}"></td>
         </table>
      </form>
      <br><br><br>
      <input type="button" class="update" onclick="paymentUp()" style="cursor: pointer" value="수정" />&nbsp;&nbsp;&nbsp;
      <input type="button" class="cancel" onclick="location.href='paymentList'" style="cursor: pointer" value="취소" />&nbsp;&nbsp;&nbsp;
      <input type="button" class="delete" value="삭제" onClick="delPayment('${lPay.payment_id}')">
   </div>
</section>
<%@ include file="../include/footer.jsp"%>
</body>
</html>