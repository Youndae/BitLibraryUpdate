<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>회원정보</title>
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
<style>
table {
	width: 100%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" flush="false" />

	<div id="divContentsW">
		<div id="row">
			<h1 align="center">회원정보</h1>
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
			
			<!-- divContent 시작-->
			<div id="divContent">

				<form class="detailTable" action="viewUser.do" method="post">

				<table align="center">

					<tr>
						<th scope="row" bgcolor="lightgray">아이디</th>
						<td>${user.id}</td>
					</tr>
					<tr>
						<th scope="row" bgcolor="lightgray">이름</th>
						<td>${user.name}</td>	
					</tr>
					<tr>
						<th scope="row" bgcolor="lightgray">비밀번호</th>
						<td><input type="password"  value="${user.pw}" readonly="readonly"></td>	
					</tr>
					<tr>
						<th scope="row" bgcolor="lightgray">생년월일</th>
						<td><fmt:formatDate value="${user.birth}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<th scope="row" bgcolor="lightgray">성별</th>
						<td>${user.gender}</td>
					</tr>
					<tr>
						<th scope="row" bgcolor="lightgray">휴대폰번호</th>
						<td>${user.phone}
						</td>

					</tr>

					</table>					

					
					<div class="buttons">
				     	<input type="button" value="회원정보수정"
						 onclick="location.href='updateUser.do'"></input>
					</div>
				
						
				</form>
				
</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />
</body>
</html>