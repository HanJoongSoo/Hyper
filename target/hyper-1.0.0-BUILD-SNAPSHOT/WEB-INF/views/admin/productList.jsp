<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>Hyper</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="resources/js/product.js" charset="UTF-8"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script>
			function list(page) {
				location.href="productList?curPage="+page;
			}
		</script>
		<style>
		input[type=button] {
			cursor: pointer;
		}
		</style>
	</head>
	<body>
		<%@ include file="../include/header.jsp" %>
		<section>
			<h2 align="center">등록 상품</h2>
			<form name="f3rm" id="f3rm" method="post" action="updateProduct" enctype="multipart/form-data">
			
				<table align="center">
					<tr>
						<th>카테고리</th>
						<th>이미지</th>
						<th>품명</th>
						<th>품번</th>
						<th>가격</th>
						<th>이미지 경로</th>
					</tr>
					<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
						<c:set var="product" value="${map.list[i]}" />
						<c:if test="${not empty product}">
							<tr>
								<td>${product.cate_id}</td>
								<td><img src="${product.prd_img}" width="100" height="100"></td>
								<td>${product.prd_name}</td>
								<td><a onclick="location.href='prdupdate?prd_id=${product.prd_id}'">${product.prd_id}</a></td>
								<td>${product.prd_price}</td>
								<td>${product.prd_img}></td>
							</tr>
						</c:if>
					</c:forEach>
				<tr>
					<td colspan="7" align="center">
						<c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('1')">[처음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<span style="color:red;">${num}</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="list('${num}')">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock < map.pager.totPage}">
							<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
		</section>
		<%@ include file="../include/footer.jsp" %>
	</body>
</html>