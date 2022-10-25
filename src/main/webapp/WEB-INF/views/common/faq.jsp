<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>HYPER</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/faq.css">
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<script>
    $(document).ready(function(){
  
  //메뉴 슬라이드
  $('#main_menu > li > a').click(function(){
    $(this).next($('.snd_menu')).slideToggle('fast');
  })
  $('.snd_menu > li > a').click(function(e){
    e.stopPropagation();
    $(this).next($('.trd_menu')).slideToggle('fast');
  })
  
  // 버튼 클릭 시 스타일 변경
  $('li').focus(function(){
    $(this).addClass('selec');
  })
  $("li").blur(function(){
    $(this).removeClass('selec');
  })
  
})
</script>

<body style="overflow-x: hidden">
<%@ include file="../include/header.jsp" %>
<div id="container">
   <!-- 제목 -->
   <div id="header">
    <h1>
<b>FAQ</b>
자주 묻는 질문
</h1>
</div>
<div id="sidebar">
 <nav>
  <ul id="main_menu">
  <li><b><font size=5>취소/환불/교환 관련</font></b></li>
  <hr>
    <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;주문을 취소하고 싶어요!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
    <ul class="snd_menu sub_menu">
                <li id="cate_id_297" class="cate2_list"><div class="atag">주문은 [마이페이지] 메뉴에서 직접 취소 가능합니다.<br><br><br>
- 결제대기/결제완료/상품준비 : 고객님께서 직접 주문취소 가능한 상태<br><br>
- 배송준비 : 스토어 배송 준비 기간으로 결제일로부터 3영업일간 (주말/공휴일 제외) 즉시 주문취소 불가 상태<br><br><br>
3영업일 이내 주문 취소를 원하실 경우 하이퍼를 통해 구매하신 스토어 Q&A/전화로 직접 주문취소 요청 부탁드립니다.<br><br>
스토어 측 연락이 어려울 경우, Q&A 게시판 통해 문의 바랍니다. <br>
[문의방법: 하이퍼 웹 ▶ 마이페이지 ▶ 주문/배송조회 ▶ 상품문의 ▶ Q&A 작성]</div></li>
            
        </ul>
    </li>
    <hr>
    <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;현재 판매가 보다 비싸게 샀어요. 차액 환불 가능한가요?</a>
    <ul class="trd_menu sub_menu">
        <li id="cate_id_298" class="cate2_list"><div class="atag">상품 할인율은 변동될 수 있으며, 판매 가격 변동에 따른 차액은 보상해 드리지 않습니다.</div></li>
   
      </ul>
      </li>

<hr>
          <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;환불은 언제 되나요?</a>
    <ul class="trd_menu sub_menu">
            <li id="cate_id_300" class="cate2_list"><div class="atag">[주문취소]<br><br>

주문 취소 완료일로부터 아래와 같이 소요됩니다.<br><br><br>



[환불 완료]<br><br>

스토어 측으로 반품 상품 입고/검수 후 하이퍼 측으로 [환불 승인] 접수되는 날로부터 아래와 같이 소요됩니다.<br><br><br>



※결제수단별 환불 소요 기간<br><br>

[계좌/카드 취소를 통한 환급] : 환불 승인 시 자동 환불 완료 처리 (1~3 영업일 소요) <br><br>

</div></li>
            
      </ul>
      </li>
      <hr>
          <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;교환/반품시 택배비가 발생되나요?</a>
    <ul class="trd_menu sub_menu">
            <li id="cate_id_300" class="cate2_list"><div class="atag">무료배송은 구매한 상품이 최종적으로 [구매확정]되어야 제공되는 혜택입니다.<br><br>

반품 사유에 따라 배송비 지불 여부가 결정되며 반품 시 스토어가 부담한 [초기 배송비+반품/교환 왕복 배송비] 가 발생됩니다.<br><br><br>



1. 교환/반품 비용이 무료인 경우<br><br>

- 수령한 상품이 파손/불량이거나 상품이 잘못 배송된 경우에 해당됩니다.<br><br><br>



2. 교환/반품 비용이 고객 부담인 경우<br><br>

- 고객 변심으로 인한 경우 비용이 발생됩니다.<br><br><br>



※ 스토어마다 교환/반품 방법 및 금액이 상이하며 배송비 차감 시스템은 제공되지 않습니다.<br><br>

따라서 환불 요청 접수 시 [배송비차감액 0원] 으로 표기되며, 구매하신 스토어 측으로 배송비 관련 별도 문의 바랍니다.<br><br><br>



[문의방법 : 주문/배송조회 ▶ 상품문의 ▶ Q&A 작성]</div></li>
            
      </ul>
      </li>
            <hr>
          <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;반품/교환 하고 싶어요!</a>
    <ul class="trd_menu sub_menu">
            <li id="cate_id_300" class="cate2_list"><div class="atag">교환/반품 모두 하이퍼 앱 내 [교환/환불 요청] 버튼 클릭 후 진행 가능합니다.<br><br><br> 



- 교환 원하실 경우 [교환/환불 요청]  ▶ [사유:교환 요청] 접수, 교환 상품 수령 후 [환불 요청 철회] 진행 바랍니다.<br><br><br>



- 교환/환불 요청 접수 시 택배 자동 회수 시스템이 제공되지 않습니다. <br><br>

각 스토어마다 환불 및 교환 절차가 상이하여, 구매하신 스토어 고객센터로 직접 관련 문의 바랍니다.<br><br><br>



[문의방법 : 주문/배송조회 ▶ 상품문의 ▶ Q&A 작성]

</div></li>
            
      </ul>
      </li>
    </ul>
    <ul id="main_menu">
  <li><b><font size=5>주문/결제/배송 관련</font></b></li>
  
<hr>
          <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;구매확정은 언제 되나요?</a>
    <ul class="trd_menu sub_menu">
            <li id="cate_id_299" class="cate2_list"><div class="atag">구매확정까지는 배송 완료 후 7일 후 자동으로 변경됩니다.<br><br>

[배송중 +7일 ▶ 배송 완료 +7일 ▶ 구매확정]<br><br><br>



구매확정 상태는 교환/반품 의사가 없는 단계이므로, 구매확정 후 교환/반품은 불가한 점 참고 바랍니다.</div></li>
           
      </ul>
      </li>
<hr>
          <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;아직 상품을 수령하지 못했는데 [배송완료] 처리 되었어요!</a>
    <ul class="trd_menu sub_menu">
            <li id="cate_id_300" class="cate2_list"><div class="atag">구입한 상품의 실제 배송과 택배 시스템의 차이가 있을 수 있는 점 양해 바랍니다.<br><br><br>



- 배송 조회 시 이동 중일 경우 1-3일 내로 수령 가능합니다.&nbsp; ※ 해당 기간은 택배사 내부 사정에 의해 변동될 수 있습니다.<br><br>

- 배송 완료 장소를 확인하였으나 수령하지 못했을 경우 배송조회를 통해 담당 배송기사님께 문의 바랍니다.

</div></li>
            
      </ul>
      </li>
      <hr>
          <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;상품을 받았는데 주문이 아직 배송중 상태에요!</a>
    <ul class="trd_menu sub_menu">
            <li id="cate_id_300" class="cate2_list"><div class="atag">[배송 완료] 상태는 배송 중 상태에서 7일 뒤 자동으로 변경됩니다.
</div></li>
            
      </ul>
      </li>
      <hr>
          <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;주문한 상품과 다른 상품 또는 불량입니다!</a>
    <ul class="trd_menu sub_menu">
            <li id="cate_id_300" class="cate2_list"><div class="atag">먼저, 불편 드려 죄송합니다.<br><br>

교환·환불 중 원하시는 처리 방안에 대하여 [교환/환불 요청] 접수 통하여 신청 부탁드립니다.<br><br>

이후 구매하신 스토어 고객센터 또는 아래 방법으로 문의 바랍니다.<br><br><br>



[문의방법 : 주문/배송조회 ▶ 상품문의 ▶ Q&A]</div></li>
            
      </ul>
      </li>
      <hr>
          <li><a class="atag" href="javascript:void(0)">▶&nbsp;&nbsp;&nbsp;주문 내역을 확인하고 싶어요!</a>
    <ul class="trd_menu sub_menu">
            <li id="cate_id_300" class="cate2_list"><div class="atag">주문 내역 확인은 아래와 같습니다.<br><br>

1) 웹 로그인을 합니다.<br><br>

2) 웹 ▶ 상단 오른쪽 사람 모양 아이콘 클릭 <br><br>

3) 주문/배송조회에서 확인 가능합니다.</div></li>
            
      </ul>
      </li>
    </ul>
</nav>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>