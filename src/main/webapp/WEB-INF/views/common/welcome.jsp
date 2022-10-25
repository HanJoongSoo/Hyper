<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>HYPER</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/welcome.css">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#nav{
margin-top:-30px;
}
</style>
</head>

<body style="overflow-x: hidden">
<%@ include file="../include/header.jsp" %>


   <h1 id="com">
     
  <span>H</span>
  <span>Y</span>
  <span>P</span>
  <span>E</span>
  <span>R</span>
</h1>
     
   <div id="container">
      <div id="head">
         <a href="#target"><button type="button" id="hong">
            추천영상
         </button></a>
         <a href="#target1"><button type="button" id="hong">주력상품</button></a>
         <a href="#target2"><button type="button" id="hong">HYPER 소개</button></a>
      </div>


<a name="target2"> </a>
      <div id="sidebar">
         <h2>HYPER</h2>

         <p>
            <b>온라인에서 남성의류를 전문적으로 판매하는 하이퍼는 2022년 10월에 시작되었습니다.&nbsp;하이퍼는
               “남성의류를 합리적인 가격으로 편리하게 구매하자”라는 미션으로 차별화된 경쟁력을 지니고 있습니다.<br> 
               남성의류에 대한 인사이트가 바탕이 된 탄탄한 IT역량,&nbsp;병행수입과 구매대행 등의 다양한 소싱 방식으로 
               오프라인 채널에 머물러있던 의류 쇼핑을 온라인 채널로 적극 확장시켰습니다.&nbsp;그 결과 의류 외에도 다양한 카테고리의 상품을 판매하고 있습니다.<br> 
               이제는 남성의류만을 넘어 라이프스타일 전반을 커버하는,&nbsp;대한민국 대표 NO.1 온라인 남성의류 플랫폼으로 진화하고 있습니다.
            </b>
         </p>
      </div>
      <br> <br> <br>
      <!-- 상품사진들 -->
      <div id="content">

         <img src="resources/image/welcome/배경사진.png"
            style="width: 70%">
      </div>
      <div id="foot">
         

         <ul>
         
            <li class="show">
               <div class="thumb">
               <a name="target1"> </a>
                  <span class="show-thumb"><figure class="snip1384">
                     <img id="x" src="resources/image/welcome/상의.png"
                        style="width: 200%"> <figcaption>
                     <h3>패션</h3>
               
                     <i class="ion-ios-arrow-right"></i> </figcaption> <a href="#"></a> </figure> <figure
                        class="snip1384 hover">
                     </span>
               </div>
            </li>
         </ul>
         <ul>
            <li class="show">
               <div class="thumb">
                  <span class="show-thumb"><figure class="snip1384"><img id="x"
                     src="resources/image/welcome/신발.png"
                     style="width: 200%"><figcaption><h3>신발</h3>
                  
                     <i class="ion-ios-arrow-right"></i> </figcaption> <a href="#"></a> </figure> <figure
                        class="snip1384 hover"></span>
               </div>
            </li>
         </ul>
         <ul>
            <li class="show1">
               <div class="thumb">
                  <span class="show-thumb"><figure class="snip1384"><img id="x"
                     src="resources/image/welcome/슈프림백팩.png"
                     style="width: 200%"><figcaption><h3>가방</h3>
                     
                     <i class="ion-ios-arrow-right"></i> </figcaption> <a href="#"></a> </figure> <figure
                        class="snip1384 hover"></span>
               </div>
            </li>
         </ul>
         <ul>
            <li class="show2">
               <div class="thumb">
                  <span class="show-thumb"><figure class="snip1384"><img id="x"
                     src="resources/image/welcome/무드등.png"
                     style="width: 200%"><figcaption><h3>데코</h3>
                     <i class="ion-ios-arrow-right"></i> </figcaption> <a href="#"></a> </figure> <figure
                        class="snip1384 hover"></span>
               </div>
            </li>
         </ul>

      </div>


      <a name="target"> </a>
      <iframe id="vod" width="532.48" height="297.984"
         src="https://www.youtube.com/embed/4r7aNiwuBVY?autoplay=1&mute=1"
         title="YouTube video player" frameborder="0"
         allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
         allowfullscreen></iframe>
      <iframe id="vod" width="532.48" height="297.984"
         src="https://www.youtube.com/embed/EqODV8ZC74U?autoplay=1&mute=1"
         title="YouTube video player" frameborder="0"
         allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
         allowfullscreen></iframe>
   </div>
   </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>