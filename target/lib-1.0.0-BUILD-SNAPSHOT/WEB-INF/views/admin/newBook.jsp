<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>도서등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/write.css">
</head>
<body>
<div class="headerBtm">
		<div>
		
			<h2 class="logo">
				<a href="/lib/main.do" title="비트 도서관">
				<img src="webimg/bitlogo.png" />
				</a>
			</h2>

		</div>
	</div>
<div id="divContentsW">
	<div id="divContent">
	<div id="row">
	<h1 align="center">도서등록페이지입니다.</h1>
	</div>
		<form class="detailTable" action="addBook.do" method="post" enctype="multipart/form-data">
		<fieldset>
					<div class="writeTable">
					<table>
						<tbody>
							<tr>
								<th scope="row">책이름</th>
								<td colspan="3"><input class="inputTextType1" type="text" name="bookTitle"></td>
							</tr>
							<tr>
								<th>작가</th>
								<td colspan="3"><input class="inputTextType1" type="text" name="author"></td>
							</tr>
							<tr>
								<th>장르</th>
								<td colspan="3"><input class="inputTextType1" type="text" name="type"></td>
							</tr>
							<tr>
								<th>출판사</th>
								<td colspan="3"><input class="inputTextType1" type="text" name="publisher"></td>
							</tr>
							<tr>
								<th>출판년도</th>
								<td colspan="3"><input class="inputTextType1" type="text" name="pubYear"></td>
							</tr>
							<tr>
								<th>이미지 첨부</th>
								<td colspan="3"><input class="inputTextType1" type="file" name="file"></td>
							</tr>
							<tr>
								<th>책 수량</th>
								<td colspan="3"><input class="inputTextType1" type="number" name="bookQty"></td>
							</tr>
							
							</tbody>
					</table>
					
					</div> <!-- writeTable end -->
					</fieldset>
					<div align="center" class="buttons">
						<input type="submit" value="등록하기">
					</div>
					
				</form>
			</div><!-- divcontent end -->
</div>
							
</body>
</html>