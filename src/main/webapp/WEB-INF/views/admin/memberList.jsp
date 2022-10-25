<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>Hyper</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/product.js" charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/css/memberList.css" />
<script>
   function list(page) {
      location.href = "memberList?curPage=" + page;
   }
</script>
<style>
#sMember {
   width: 100px;
   border: 0px;
   outline: none;
   float: left;
   background: #ffffff;
}

#search2 {
   float: right;
   height: 25px;
   width: 400px;
   margin: 0 auto;
   margin-right: 200px;
   border: 0px solid #ffffff;
   background: #ffffff;
   border-bottom: 2px solid #202429;
}

#searchBtn {
   width: 75;
   font-family: 돋움;
   background-color: #202429;
   width: 50px;
   height: 100%;
   border: 0px;
   outline: none;
   float: right;
   color: white;
}

input[type=button] {
   cursor: pointer;
}

form{
  top: 0px;
}
</style>
</head>
<body>
   <%@ include file="../include/header.jsp"%>
   <section>
      <h2 align="center" id="title">회원 정보</h2>
      <form name="f3rm" id="f3rm" enctype="multipart/form-data">
         <table cellspacing="5px" cellpadding="10px" align="center">
            <tr id="sub">
               <th>회원ID</th>
               <th>회원이름</th>
               <th>주소</th>
               <th>연락처</th>
               <th>가입날짜</th>
               <th>이메일</th>
            </tr>
            <c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
               <c:set var="member2" value="${map.list[i]}" />
               <c:if test="${not empty member2}">
                  <tr>
                     <td>${member2.member_id}</td>
                     <td><a class="name"
                        onclick="location.href='updateMember?member_id=${member2.member_id}'">${member2.member_name}</a>
                     <div class="text">수정하려면 이름 클릭</div></td>
                     <td>${member2.member_faddr}${member2.member_laddr }</td>
                     <td>${member2.member_phone}</td>
                     <td>${member2.member_date}</td>
                     <td>${member2.member_email}</td>
                  </tr>
               </c:if>
            </c:forEach>
            <tr>
               <td colspan="7" align="center"><c:if
                     test="${map.pager.curBlock > 1}">
                     <a href="#" onclick="list('1')">[처음]</a>
                  </c:if> <c:if test="${map.pager.curBlock > 1}">
                     <a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
                  </c:if> <c:forEach var="num" begin="${map.pager.blockBegin}"
                     end="${map.pager.blockEnd}">
                     <c:choose>
                        <c:when test="${num == map.pager.curPage}">
                           <span style="color: red;">${num}</span>
                        </c:when>
                        <c:otherwise>
                           <a href="#" onclick="list('${num}')">${num}</a>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach> <c:if test="${map.pager.curBlock < map.pager.totBlock}">
                     <a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
                  </c:if> <c:if test="${map.pager.curBlock < map.pager.totPage}">
                     <a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
                  </c:if></td>
            </tr>
            <tr>
               <td colspan="6">
                  <div id="search2" align="center">
                     <input type="text" name="sMember" id="sMember"
                        placeholder="검색어 입력"
                        onkeypress="if(event.keyCode == 13) {searchMember(); return;}">
                     <button type="button" id="searchBtn" onclick="searchMember()"
                        style="cursor: pointer;">
                        <strong>검색</strong>
                     </button>
                  </div>
               </td>
         </table>
      </form>
      <br>
      <br>
   </section>
   <script>
      function searchMember() {
         var sea = $("#sMember").val();
         self.location = "searchMember?sMember=" + sea;
      }
   </script>
   <%@ include file="../include/footer.jsp"%>
</body>
</html>