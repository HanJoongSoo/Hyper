<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>HYPER - 상품수정</title>
<script src="resources/js/product.js" charset="UTF-8"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="resources/css/insertProduct.css">
<style>
#sPrd {
   margin-top: -12px;
}
</style>
</head>
<body>
   <%@ include file="../include/header.jsp"%>
   <br>
   <section>
      <h1 align="center" class="hanna">HYPER 상품수정</h1>
      <form action="updateProduct" method="POST"
         enctype="multipart/form-data">
         <table align="center" class="hanna">
            <tr>
               <th>카테고리</th><!-- ${product.cate_id } -->
               <td><select name="cate_id" id="cate_id"
                  style="width: 190px; height: 35px;">
                     <option value="" selected>--선택--</option>
                     <option value="TOP20220010">상의</option>
                     <option value="LOW20220020">바지</option>
                     <option value="CAP20220030">모자</option>
                     <option value="SHO20220040">운동화</option>
                     <option value="BAG20220050">백팩</option>
                     <option value="ECO20220060">에코백</option>
                     <option value="LIT20220070">조명</option>
               </select></td>
            </tr>
            <tr>
               <th>품명</th>
               <td><input type="text" name="prd_name" id="prd_name" value="${product.prd_name }"></td>
            </tr>
            <tr>
               <th>물품번호</th>
               <td><input type="text" name="prd_id" id="prd_id" value="${product.prd_id }" disabled="disabled">
                <input type="button" value="중복 확인" onclick="prdidChk()"/><br></td>
            </tr>
            <tr>
               <th>상품가격</th>
               <td><input type="text" name="prd_price" id="prd_price"  value="${product.prd_price }"/></td>
            </tr>
            <tr>
               <th>배송비</th>
               <td><input type="text" name="prd_delivery" id="prd_delivery" value="${product.prd_delivery }"/>
               </td>
            </tr>
            <tr>
               <th>재고</th>
               <td><input type="text" name="prd_stock" id="prd_stock" value="${product.prd_stock }" /></td>
            </tr>
            <tr>
               <th>상품옵션</th>
               <td><input type="text" name="prd_option" id="prd_option" value="${product.prd_option }"/></td>
            </tr>
            <tr>
               <th>할인금액</th>
               <td><input type="text" name="prd_discount" id="prd_discount" value="${product.prd_discount} "/>
               </td>
            </tr>
            <tr>
               <th>이미지</th>
               <td><img src="${product.prd_img}"></td>
            </tr>
            <tr>
               <th>상품 설명</th>
               <td><textarea name="prd_explain" id="prd_explain" cols="40" rows="40">${product.prd_explain }</textarea>
               </td>
            </tr>
         </table>
      </form>
      <div style="text-align: center;">
               <input type="button" id="editBtn" onclick="doUpdateProduct()" value="물품수정"/>
               <input type="button" onclick="delProduct('${product.prd_id}', '${product.cate_id}')" value="물품삭제">
               <input type="button" onclick="location.href='productList'" value="상품목록"/>
               </div>
   </section>
   <%@ include file="../include/footer.jsp"%>
</body>
</html>