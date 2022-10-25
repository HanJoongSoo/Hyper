<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/login.js" charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/include.css">
<!-- up -->
<script  defer src="resources/js/up.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js" integrity="sha512-VEBjfxWUOyzl0bAwh4gdLEaQyDYPvLrZql3pw1ifgb6fhEvZl9iDDehwHZ+dsMzA0Jfww8Xt7COSZuJ/slxc4Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/ScrollToPlugin.min.js" integrity="sha512-lZACdYsy0W98dOcn+QRNHDxFuhm62lfs8qK5+wPp7X358CN3f+ml49HpnwzTiXFzETs4++fADePDI+L2zwlm7Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
   // 마이페이지 클릭 이벤트
   function mypBtn() {
      var member_id = $("#member_id").val();
      var myp = $("#myp").val();
      $.ajax({
         type : "GET",
         url : "mypL",
         data : {
            "member_id" : member_id,
            "myp" : myp
         },
         success : function(data) {
            window.location.href = "mypage?member_id=" + member_id
                  + "&myp=" + myp;
         }
      });
   }
</script>
<script  defer src="resources/js/up.js"></script>
<div>
       <div>
            <img src="resources/image/header/bannerImage.png"
               alt="이벤트 배너" style="width:100%; height:100px;">
         </div>
<div id="icon" align="right">
<form name="frm" id="inner">
<h1 id="main_title">
   <a href="main"><img src="resources/image/header/logo.png" width="200px" height="100px"/></a>
</h1>
   <!-- form 있던자리 -->
      <input type="hidden" id="myp" value="${myp}" />
      <!-- 검색 -->
      <div id="search" align="center">
         <input type="text" name="sPrd" id="sPrd" placeholder="검색어 입력"
            onkeypress="if(event.keyCode == 13) {searchPrd(); return;}">
         <button type="button" id="searchBtn" onclick="searchPrd()"
            style="cursor: pointer;">
            <strong>검색</strong>
         </button>
      </div>
      <!-- 헤더버튼들 -->
      <c:choose>
         <c:when test="${member.member_id eq 'Admin'}">
            <i class="fa fa-user-plus fa-2x" onclick="location.href='prdinsert'"
               style="cursor: pointer"></i>
            <i class="fa fa-user  fa-2x" onclick="location.href='productList'"
               style="cursor: pointer"></i>
            <i class="fa fa-user-times  fa-2x" onclick="location.href='logout'"
               style="cursor: pointer"></i>
            <i class="fa fa-user  fa-2x" onclick="location.href='memberList'"
               style="cursor: pointer"></i>
         </c:when>
         <c:when test="${member.member_id == null}">
            <i class="fa fa-user-plus fa-2x" onclick="location.href='signup'"
               style="cursor: pointer"></i>
            <i class="fa fa-user  fa-2x" onclick="location.href='login'"
               style="cursor: pointer"></i>
         </c:when>
         
         <c:otherwise>
            <input type="hidden" id="member_id" name="member_id"
               value="${member.member_id}" />
            <i class="fa fa-user-times  fa-2x" onclick="location.href='logout'"
               style="cursor: pointer"></i>
            <i class="fa fa-shopping-cart fa-2x" onclick="productCart()"
               style="cursor: pointer"></i>
            <i class="fa fa-shopping-bag fa-2x" onClick="mypBtn()"
               style="cursor: pointer"></i>
         </c:otherwise>
      </c:choose>
      
      <script>
         function searchPrd() {
            var sea = $("#sPrd").val();
            self.location = "searchPrd?sPrd=" + sea;
         }
      </script>
   </form>
</div>
</div>
<!-- 여기서부터 메뉴 -->
<div id="nav">
   <ul>
      <li class='Mirror'>패션
         <ul>
            <li onclick="location.href='category?cate_id=TOP20220010'">상의</li>
            <li onclick="location.href='category?cate_id=LOW20220020'">바지</li>
            <li onclick="location.href='category?cate_id=CAP20220030'">모자</li>
            <li onclick="">아우터</li>
            <li onclick="">셔츠</li>
            <li onclick="">아이웨어</li>
            <li onclick="">잡화</li>
            <li onclick="">가방</li>
            <li onclick="">언더웨어</li>
            <li onclick="">시계</li>
            <li class="liBot" onclick="">기타</li>
         </ul>
      </li>
      <li>신발
         <ul>
            <li onclick="location.href='category?cate_id=SHO20220040'">운동화</li>
            <li onclick="">스니커즈</li>
            <li onclick="">구두/로퍼</li>
            <li onclick="">부츠/워커</li>
            <li onclick="">샌들/슬리퍼</li>
            <li onclick="">신발용품</li>
            <li class="liBot" onclick="">기타</li>
         </ul>
      </li>
      <li>가방
         <ul>
            <li onclick="location.href='category?cate_id=BAG20220050'">백팩</li>
            <li onclick="location.href='category?cate_id=ECO20220060'">에코백</li>
            <li onclick="">메신저/크로스백</li>
            <li onclick="">사무용/서류가방</li>
            <li onclick="">클러치백</li>
            <li onclick="">캐리어</li>
            <li class="liBot" onclick="">기타</li>
         </ul>
      </li>
      <li>홈데코
         <ul>
            <li onclick="location.href='category?cate_id=LIT20220070'">조명</li>
            <li onclick="">가구</li>
            <li onclick="">수납/정리</li>
            <li onclick="">침구</li>
            <li onclick="">인테리어소품</li>
            <li class="liBot" onclick="">기타</li>
         </ul>
      </li>
      <li onclick="location.href='welcome'">브랜드</li>
      <li class='contact'>커뮤니티
         <ul>
            <li onclick="location.href='board'">공지사항</li>
            <li onclick="location.href='boardqna'">Q&A</li>
            <li onclick="location.href='faq'">FAQ</li>
            <li onclick="location.href='location'">오시는길</li>
         </ul>
      </li>
   </ul>
</div>
<!-- 여기까지 메뉴 -->
<!-- 위로올리는 화살표 -->
<div id="to-top">
   <div>
      <img src="resources/image/header/up.svg">
   </div>
</div>