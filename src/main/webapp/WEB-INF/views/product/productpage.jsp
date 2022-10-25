<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
      <script src="http://code.jquery.com/jquery-latest.js"></script>
      <script type="text/javascript" src="resources/js/cart.js" charset="UTF-8"></script>
      <script type="text/javascript" src="resources/js/product.js" charset="UTF-8"></script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <link rel="stylesheet" type="text/css" href="resources/css/productpage.css">
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <title>HYPER</title>
   </head>
   <body>
      <script>
         $("#buy_quantity").keyup(function(e){
            var regNumber = /^([0-9]{2})$/;
            var str = $(this).val();
            if(!regNumber.test(str)) {
               var res = str.substring(0, str.length-1);
               $(this).val(res);
            }
         });
      </script>
      <%@ include file="../include/header.jsp" %>
      <div class="productdetail">
         <form>
            <img class="productLeft" src="${product.prd_img}">
            <div class="productRight">
               <p align="left" class="p1"><strong>상품명: ${product.prd_name}</strong></p>
               <p align="left" class="p2"><strong>가격: <fmt:formatNumber value="${product.prd_price}" pattern="#,###"/>원</strong></p>
               <p align="left" class="p3">상품코드: ${product.prd_id}</p>
               <p align="left" class="p3">수량: <input type="number" id="buy_quantity" min="1" maxlength="2" max="99" value="1" oninput="mxNum(this)" /></p>
               <script>
                  function mxNum(object) {
                     if (object.value.length > object.maxLength) {
                        object.value = object.value.slice(0, object.maxLength)
                     }
                  }
               </script>
               <p align="left" class="p3">옵션: 
                  <select id="prd_opt">
                     <c:forEach items="${fn:split(product.prd_option, ',')}" var="opt">
                        <option value="${opt}">${opt}</option>
                     </c:forEach>
                  </select>
               </p>
               <p align="left" class="p3">본 상품은 서울배송만 가능합니다.</p><br><br><br>
               <input type="hidden" name="prd_img" id="prd_img" value="${product.prd_img}" />
               <input type="hidden" name="member_id" id="member_id" value="${member.member_id}" />
               <input type="hidden" name="prd_id" id="prd_id" value="${product.prd_id}" />
               <p align="left">
                  <input type="button" name="buy" id="buy" onclick="buyProduct()" value="구매하기" />&nbsp;&nbsp;&nbsp;
                  <input type="button" name="cart" id="cart" onclick="insertCart()" value="장바구니" />
                  <input type="hidden" name="hiddenbtn" id="hiddenbtn" value="prdpage" />
               </p>
            </div>
         </form>
      </div>
      <div class="detail">
         <table style="width: 1200px;">
            <tr>
               <th>상품 설명</th>
            </tr>
            <tr>
               <td id="a">${product.prd_explain}</td>
<%--<!--                <script>--%>
<%--               	$('#a').each(function() {--%>
<%--               		var AAA = $(this).text();--%>
<%--               		$(this).text(AAA.slice(1));--%>
<%--               	})--%>
<%--               </script> -->--%>
            </tr>
         </table>
      </div>
      <div class="danger">
         <table style="width: 700px; text-align: left;">
            <tr>
               <th>주의 사항</th>
            </tr>
            <tr>
               <td>&nbsp;&nbsp;13시 이전 결제 완료시 당일 배송</td>
            </tr>
            <tr>
               <td>&nbsp;&nbsp;반품 및 교환 요청은 배송비 고객 부담</td>
            </tr>
         </table>
      </div>
      <%@ include file="../include/footer.jsp" %>
   </body>
</html>