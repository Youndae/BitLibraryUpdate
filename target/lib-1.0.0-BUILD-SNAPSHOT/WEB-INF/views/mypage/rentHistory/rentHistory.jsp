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

<title>대여이력</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagetable.css">

<style>
table {
	width: 100%;
}
#button {
	margin: -1px;
	border: 1px solid rgba(0, 155, 255, 0.9);
	background-color: rgba(0, 0, 0, 0);
	color: rgba(0, 155, 255, 0.9);
	padding: 3px;
	border-radius: 5px;
	font-size: 24px;
}
#button:hover{
	color:white;
	background-color: skyblue;
}
</style>



</head>
<body>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false" />

	<div id="divContentsW">
	
	<div id="row">
	<h1 align="center">대여 이력</h1>
	</div>
		<div id="divContents">
			<div id="divTabMenu" class="mThumbnailScroller _mTS_2 mTS-buttons-out" style="position: relative;">
				<div>
					<div id="mTS_2" class="mTSWrapper mTS_horizontal"><ul class="mTSContainer" id="mTS_2_container" style="position: relative; top: 0px; left: 0px; width: 100%;">

								<li class="mTSThumbContainer"><a href="rentNow.do">대여현황</a></li>

								<li class="mTSThumbContainer"><a href="reserveList.do">예약목록</a></li>
								
								<li class="selected mTSThumbContainer"><a href="rentHistory.do">대여이력</a></li>

								<li class="mTSThumbContainer"><a href="wishList.do">위시리스트</a></li>

								<li class="mTSThumbContainer"><a href="viewUser.do">회원정보</a></li>

					</ul>
					</div>
				</div>
			</div>	
	
	<div class="listTable">
	<table class="mobileTable tablet">

		<thead>
			<tr>
				<th scope="row" class="footable-first-column">No.</th>

				<th scope="row" data-class="expand">도서명</th>

				<th scope="row" data-class="expand">저자</th>

				<th scope="row" data-class="expand">등록번호</th>
				<th scope="row" data-class="expand">대여일</th>
			
				<th scope="row" data-hide="phone" class="footable-last-column" style="display: table-cell;">반납일</th>

			</tr>
		</thead>
		<tbody>

			<c:forEach items="${rentHistoryList}" var="rent" varStatus="status">

				<tr>
					<td class="num footable-first-column">${status.count}</td>

					<td class="bookTitle"><a href="/lib/bookDetail.do?bookCode=${rent.bookCode}">${rent.bookTitle}</a></td>
					
					<td class="author" style="display: table-cell;">${rent.author}</td>
					<td class="bookNo" style="display: table-cell;">${rent.bookNo}</td>
					<td class="rentDate" style="display: table-cell;">${rent.rentDate}</td>
				    
					<td class="footable-last-column"  style="display: table-cell;">${rent.returnDate}</td>
					
				</tr>

			</c:forEach>
		</tbody>
	</table>
	
	</div>
	</div>
</div>	
	
<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />

	
</body>
</html>