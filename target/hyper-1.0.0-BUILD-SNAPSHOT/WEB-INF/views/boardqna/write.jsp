<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="resources/css/board.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function createB() {
	   var writer=$("#writer").val();
	   var title=$("#title").val();
	   var content=CKEDITOR.instances.content.getData();
	   var titleLength=title.length;
	   
	   if(!title) {
	      swal("", "제목을 입력하세요.", "error");
	   } else if(titleLength>50) {
	      swal("", "제목이 너무 깁니다.", "error");
	   } else if(content==""){ 
	       swal("", "글내용을 입력해 주세요!!.", "error");
	       return false; 
	   } else {
	      swal({
	          icon: "warning",
	          text: "지금 게시글 등록을 하시겠습니까?",
	          closeOnClickOutside : false,
	          closeOnEsc : false, 
	          buttons: ["돌아가기", "작성 완료!"],
	         }).then(function(isConfirm) {
	           if (isConfirm) {
	             swal('등록 완료!','게시글 등록을 완료했습니다.^^','success').then(function(isConfirm)
	                {
	                   $.ajax({
	                     type : "POST",
	                     url : "createQnABoard",
	                     data : {
	                        "writer" : writer,
	                        "title" : title,
	                        "content" : content
	                  }, success : function(data) {
	                     location.href='boardqna';
	                  }
	                  });
	                });
	           }
	         })
	   }
	}

	// 키보드로 글자수 입력 받았을 때 글자카운트 스크립트
	$(document).ready(function(){

	   $('#title').keyup(function(){
	      // 남은 글자수를 구한다.
	      var titleLength = $(this).val().length; //현재 글자수
	      var remain = 50 - titleLength;
	      
	      // 문서 객체에 남은 글자수 표시
	      $('#titleCount').html(remain);
	      
	      if(remain>=0){
	            $('#titleCount').css('color', 'green');
	      }else{
	            $('#titleCount').css('color', 'red');
	      }
	      
	      if(remain<0) {
	         swal("", "제목은 한글기준 50자 까지만 쓸 수 있습니다.", "warning");
	      }
	   })
	})

</script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/header.jsp" %>
<title>글작성</title>
</head>
<body>
<center>
	<div style="width:800px;">

		<br/><br/>
	<form>
		<input type="hidden" name="writer" id="writer" value="${member.member_id}"/>
		<table class="textb" width="100%">
			<tr>
			<td class="asd" width="60">제목</td>
			<td  class="asd" align="left">
			<input type="text" name="title" id="title" maxlength="70" size="70%" />
			<span id="titleCount" style="color:green;">50</span><span>/50</span>
			</td>
			</tr>
				
			<tr>
			<td colspan="2" align="left" height="500px">
			<textarea name="content" id="content" cols="88" rows="80"></textarea>
		<script>
			CKEDITOR.replace( 'content', {} );
		</script>
			</td>
			</tr>
		</table>
		<br/><br/>
		<input type="button" class="write" value="작성하기" onClick="createB()" />
	</form>
		
		<button style="float:right;" class="listp" onClick="location.href='boardqna'">목록</button>
	</div>
</center>
<%@ include file="../include/footer.jsp" %>
</body>
</html>