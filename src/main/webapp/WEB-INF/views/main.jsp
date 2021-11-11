<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>비트 도서관</title>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" />

</head>

<body>
	<!-- divHeader -->
	<div class="headerBtm">
		<div>
			<h2 class="logo">
				<a href="/lib/main.do" title="비트 도서관"> <img
					src="webimg/bitlogo.png" />
				</a>
			</h2>
			<div id="globalMenu">
				<ul>
					<li><a href="rentNow.do" title="마이페이지">마이페이지</a></li>

					<li><a href="logout.do" title="로그아웃">로그아웃</a></li>

				</ul>
			</div>
			<div id="divSearch">
				<form action="mainSearch.do" method="get" >
					<fieldset>
						<div class="search">
							<p class="searchBox">
							
								<input type="text" class="searchInput" id="keyWord"
									name="keyWord" title="검색어를 입력하세요." placeholder="검색어를 입력하세요.">
								<input type="image" class="searchBtn" src="webimg/btnSrch.png"
									alt="검색" title="검색">
									
							</p>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<!-- 메인 출력 페이지-->
	<div>
		<!-- <div id="contents2"> -->
		<article>
			<div class="block">
				<p>
				<c:forEach items="${mainView }" var="mainView" >			
					<a href="/bookDetail.do?bookCode=${mainView.bookCode }">
					<img src="img${mainView.imagePath }" width="300" height="400"
					vspace="20" hspace="50" /></a>
				</c:forEach>
				</p>
			</div>
			<!-- 반복 -->
		</article>



		<script>
		$(document).ready(function() {
			$(document).scroll(function() {
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop() + $(window).height();
				if (maxHeight <= currentScroll + 200) {
					$.ajax({

						url:"/lib/mainSub.do",
						type:"GET",
						dataType:"JSON",
												
						success : function(data) {
							
							var mainView = data.mainView;
							var addContent = '\n';
							
							$.each(mainView, function(index, value) {
								//console.log(index + " " + value.bookCode);
								addContent =  addContent + '<img src="'+value.imagePath+'" width="300" height="400" vspace="20" hspace="50"/>'
						
							});
							addContent = '<p>' + addContent + '</p>';
							
							$('.block').append(addContent);
						},
					
						/* complete : function(data) {
							
						
						}, 
						*/

						error : function(xhr, status, error) {
							
							alert("실패!");
						}
					})//Ajax 종료
				}//스크롤 판단식
			})
		});

		</script>


	</div>


	<jsp:include page="bot.jsp" flush="false" />

</body>
</html>