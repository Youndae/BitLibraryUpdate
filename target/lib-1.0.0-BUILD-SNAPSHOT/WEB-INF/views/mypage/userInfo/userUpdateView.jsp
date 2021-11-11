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
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>회원정보수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/write.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" flush="false" />

	<div id="divContentsW">
		<div id="row">
			<h1 align="center">회원정보수정</h1>
		</div>
		<div id="divContents">
			<div id="divTabMenu"
				class="mThumbnailScroller _mTS_2 mTS-buttons-out"
				style="position: relative;">
				<div>
					<div id="mTS_2" class="mTSWrapper mTS_horizontal">
						<ul class="mTSContainer" id="mTS_2_container"
							style="position: relative; top: 0px; left: 0px; width: 100%;">

							<li class="mTSThumbContainer"><a href="rentNow.do">대여현황</a></li>

							<li class="mTSThumbContainer"><a href="reserveList.do">예약목록</a></li>

							<li class="mTSThumbContainer"><a href="rentHistory.do">대여이력</a></li>

							<li class="mTSThumbContainer"><a href="wishList.do">위시리스트</a></li>

							<li class="selected mTSThumbContainer"><a href="viewUser.do">회원정보</a></li>

						</ul>
					</div>
				</div>
			</div>
			
		<div id="divContent">
				<form class="detailTable" action="updateUser.do" method="post"
					onsubmit="return check()">
					<fieldset>
					<div class="writeTable">
					<table>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td colspan="3">
								<input class="inputTextType1" type="text" id="id" name="id"
									value="${id}" readonly="readonly"></td>
							</tr>

							<tr>
								<th>이름</th>
								<td colspan="3"><input class="inputTextType1" type="text" id="name" name="name"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan="3"><input class="inputTextType1" type="password" id="pw" name="pw"></td>
							</tr>
							<tr>

								<th>비밀번호 확인</th>
								<td colspan="3"><input class="inputTextType1" type="password" name="pwCheck"
									id="pwCheck"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td colspan="3"><input class="inputTextType1" type="date" id="birth" name="birth">
								</td>
							</tr>
							<tr>
								<th>성별</th>
								<td colspan="3"><input type="radio" name="gender"
									value="남자" checked="checked"> 남자 <input type="radio"
									id="gender" name="gender" value="여자"> 여자</td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td colspan="3"><input class="inputTextType1" type="text" id="phone" name="phone"></td>
							</tr>

						</tbody>
					</table>
					
					</div> <!-- writeTable end -->
					</fieldset>
					<div align="center" class="buttons">
						<input type="submit" id="updateOk" value="수정완료">
						<input type="button" onclick="location.href='viewUser.do'" value="회원정보">
					</div>
					<!-- 	<div class="buttons">
				<input class="renew" type="button" value="도서연장"></input>
				<input class="return" type="button" value="도서반납"></input>
				</div> -->
				</form>
			</div><!-- divcontent end -->
			
		</div><!-- divContents end -->
		
	</div> <!-- divcontentsW end -->


	<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />
</body>

<script type="text/javascript">
	$(document).ready(function(e) {

		$('#updateOk').click(function() {
			if ($.trim($('#name').val()) == '') {
				alert("이름 입력.");
				$('#name').focus();
				return;
			} else if ($.trim($('#pw').val()) == '') {
				alert("비밀번호 입력.");
				$('#pw').focus();
				return;
			}//패스워드 확인
			else if ($('#pw').val() != $('#pwCheck').val()) {
				alert('비밀번호가 다릅니다.');
				$('#pw').focus();
				return;
			} else if ($.trim($('#birth').val()) == '') {
				alert("생년월일 입력.");
				$('#birth').focus();
				return;
			} else if ($.trim($('#phone').val()) == '') {
				alert("핸드폰번호 입력.");
				$('#phone').focus();
				return;
			} else {
				alert("수정완료");
			}

		});

	});
</script>
</html>