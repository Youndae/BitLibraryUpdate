<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="비트 도서관">
<meta name="keyword" content="비트 도서관">
<meta name="copyright"
	content="COPYRIGHT(C) BIT LIBRARY. ALL RIGHTS RESERVED.">
<meta content="initial-scale=1, width=device-width" name="viewport">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagetable.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<title>join</title>
</head>
<body>
<div class="headerBtm">
		<div>
<h2 class="logo">
				<a href="login.do" title="비트 도서관">
				<img src="webimg/bitlogo.png" />
				</a>
			</h2><br><br><br><br>
			<div align="center">
	<h1 >회원가입</h1>
	<hr>
	<form action="joinProcess.do" id="signFrm" name="signFrm" method="post">

		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" ></td>
					<td><input type="button" id="check" style="cursor: pointer" value="중복체크"></td>
				</tr>
				<tr>
					<td colspan=3 id="idCheck"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="name" ></td>
					
				</tr>
				<tr>
					<td>패스워드</td>
					<td colspan="2"><input id="pw" name="pw" type="password"></td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td colspan="2"><input id="pwCheck" name="pwCheck" type="password"></td>
				</tr>
				
				<tr>
					<td>생일</td>
					<td><input type="date" id="birth" name="birth" ></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>남자<input type="radio" name="gender" value="남자" checked="checked">
               여자<input type="radio" id="gender" name="gender" value="여자" ></td>
					
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" id="phone" name="phone" ></td>
				</tr>
				
				<tr>
					<td colspan="3"><input type="button" id="signUp" value="회원가입 완료" style="cursor: pointer; HEIGHT: 24pt; background-color: white; font-weight: bold"></td>
				</tr>
				
				<tr>
					<td colspan="3"><input type="button" value="로그인" style="cursor: pointer; HEIGHT: 24pt; background-color: white; font-weight: bold" onclick="location.href='login.do'"></td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />
</body>
<script type="text/javascript">
	$(document).ready(function(e){
		
		var idx = false;
		
		$('#signUp').click(function(){
			if($.trim($('#id').val()) == ''){
				alert("아이디 입력.");
				$('#id').focus();
				return;
				
			}else if($.trim($('#name').val()) == ''){
				alert("이름 입력.");
				$('#name').focus();
				return;
			}
			else if($.trim($('#pw').val()) == ''){
				alert("패스워드 입력.");
				$('#pw').focus();
				return;
			}//패스워드 확인
			else if($('#pw').val() != $('#pwCheck').val()){
				alert('패스워드가 다릅니다.');
				$('#pw').focus();
				return;
			}
			else if($.trim($('#birth').val()) == ''){
				alert("생년월일 입력.");
				$('#birth').focus();
				return;
			}else if($.trim($('#phone').val()) == ''){
				alert("핸드폰번호 입력.");
				$('#phone').focus();
				return;
			}else{
				alert("가입완료");
			}
			
			
			
			if(idx==false){
				alert("아이디 중복체크를 해주세요.");
				return;
			}else{
				$('#signFrm').submit();
			}
		});
		
		$('#check').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck.do",
				type: "GET",
				data:{
					"id":$('#id').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#id').val()) != '' ){
						idx=true;
						$('#id').attr("readonly",true);
						var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});
		
	});
</script>

</html>