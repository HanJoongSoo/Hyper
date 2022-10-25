<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>HYPER</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/product.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script>
			function list(cate_id, page) {
				location.href="category?cate_id="+cate_id+"&curPage="+page;
			}
		</script>
	</head>
	<body>
		<%@ include file="../include/header.jsp" %>
		<div>
			<table id="product">
			<div id="pdc">
				<c:if test="${(fn:length(map.list)) eq 0}">
					상품내역이 없습니다.
				</c:if>
			</div>
				<c:forEach begin="0" end="${(fn:length(map.list) + 3) / 4 - 1}" var="row">
					<tr>
						<c:forEach begin="0" end="3" var="col">
							<c:set var="item" value="${map.list[row * 4 + col]}" />
							<c:if test="${not empty item}">
								<td width="300">
									<div onclick="location.href='productpage?prd_id=${item.prd_id}'" style="cursor: pointer">
										<div><img src="${item.prd_img}" width="230" height="200"></div>
										<div class="size">${item.prd_name}</div>
										<div class="pri">￦<fmt:formatNumber value="${item.prd_price}" pattern="#,###,###"/></div>
									</div>
								</td>
							</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
				<c:if test="${(fn:length(map.list)) ne 0}">
					<tr>
						<td class="size2" colspan="4" align="center">
							<c:if test="${map.pager.curBlock > 1}">
								<a href="#" onclick="list('${map.cate_id}', '1')">[처음]</a>
							</c:if>
							<c:if test="${map.pager.curBlock > 1}">
								<a href="#" onclick="list('${map.cate_id}', '${map.pager.prevPage}')">[이전]</a>
							</c:if>
							<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
								<c:choose>
									<c:when test="${num == map.pager.curPage}">
										<span style="color:red;">${num}</span>
									</c:when>
									<c:otherwise>
										<a href="#" onclick="list('${map.cate_id}', '${num}')">${num}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.pager.curBlock < map.pager.totBlock}">
								<a href="#" onclick="list('${map.cate_id}', '${map.pager.nextPage}')">[다음]</a>
							</c:if>
							<c:if test="${map.pager.curBlock < map.pager.totPage}">
								<a href="#" class="size2" onclick="list('${map.cate_id}', '${map.pager.totPage}')">[끝]</a>
							</c:if>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
		<%@ include file="../include/footer.jsp" %>
	</body>
</html>