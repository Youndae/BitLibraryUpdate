<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="description" content="비트 도서관">
<meta name="keyword" content="비트 도서관 , 도서관, 도서검색">
<meta name="copyright"
	content="COPYRIGHT(C) NOWON LIBRARY. ALL RIGHTS RESERVED.">
<meta content="initial-scale=1, width=device-width" name="viewport">

<title>비트 도서관</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sub.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/brief.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />



</head>

<body>
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
				<form action="mainSearch.do" method="get" id="mainSearch">
					<!-- 검색어 넘겨주기 -->
					<fieldset>
						<legend>검색</legend>
						<div class="search">
							<p class="searchBox">
								<input type="text" class="searchInput" id="keyWord"
									value="${keyWord}" name="keyWord" title="검색어를 입력하세요."
									placeholder="검색어를 입력하세요."> <input type="image"
									class="searchBtn" src="webimg/btnSrch.png" alt="검색" title="검색">
							</p>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div>
		<article>
			<div class="block">
				<div id="divContentsW" style="margin-top: 0px;">
					<div id="divContents">
						<!-- content -->
						<div id="divContent">

							<div class="searchBrief">

								<div class="searchWords">
									<dl class="searchKeyword">
										<dt>검색어</dt>
										<dd>
											<span class="keyword">[키워드/ ${keyWord} ]</span>

										</dd>

									</dl>

								</div>
								<div class="briefContent">

									<div class="result">
										<form name="briefFrm" method="post"
											action="https://www.nowonlib.kr/search/brief/service"
											onsubmit="return checked(this);">
											<fieldset>
												<legend>Service Form</legend>
												<!-- <input type="hidden" name="webSysdiv" value="TOT"> <input
													type="hidden" name="popupYn" value="N"> <input
													type="hidden" name="mainLink" value="/search/tot"> -->

												<ul class="resultList resultDetail">
													<!-- 반복 실행 -->
													<c:forEach items="${searchBook }" var="searchBook"
														varStatus="searchBookStatus">
														<li id="${searchBook.bookCode }" class="items"
															style="width: 660px; height: 150px;">
															<dl>
																<dd class="num">${paging.startList + searchBookStatus.count }</dd>
																<dt class="title">표지이미지</dt>
																<dd class="book">
																	<a href="/lib/bookDetail.do?bookCode=${searchBook.bookCode }">
																	<img id="${searchBook.bookCode }"
																		src="${searchBook.imagePath }" width="75" height="103"
																		alt="${searchBook.bookTitle }" onerror="">
																	</a>
																</dd>

																<dt class="title">제목</dt>
																<dd class="title">
																	<a href="/lib/bookDetail.do?bookCode=${searchBook.bookCode }"> ${searchBook.bookTitle } </a> <input
																		type="button" class="addItem btnType2" onclick=""
																		title="추가" value="추가" style="display: none;">
																</dd>

																<dt class="title">저자</dt>
																<dd class="info">${searchBook.author }</dd>
																<dt class="title">유형</dt>
																<dd class="info">${searchBook.type }</dd>
																<dt class="title">출판사</dt>
																<dd class="info">${searchBook.publisher }</dd>
																<dt class="title">출판년</dt>
																<dd class="info">${searchBook.pubYear }</dd>

															</dl>
														</li>

													</c:forEach>
												</ul>
												
												<div class="paging">
												
													<span> 
													
														<c:if test="${paging.prev == true }">
															<a href="/lib/mainSearch?keyWord=${keyWord}&page=1" class="page" >
															<img src="webimg/firstPage.gif">
															</a>
														</c:if> 
													
													
														<c:if test="${paging.prev == true }">
															<a href="/lib/mainSearch?keyWord=${keyWord}&page=5&range=${paging.range-5}" class="page" >
															<img src="webimg/prevPage.gif">
															</a>
														</c:if> 
														
														<c:forEach begin="1" end="${paging.pageSize }" varStatus="page" >
														
															<c:choose>
																
																<c:when test="${paging.page+paging.range == page.count+paging.range}">
																	<span>${paging.page+paging.range}</span>
																</c:when>
																
																<c:when test="${page.count+paging.range <= paging.pageCnt}">
																	<a href="/lib/mainSearch?keyWord=${keyWord}&page=${page.count}&range=${paging.range}">
																	${page.count+paging.range}</a>
																</c:when>
																
																<c:otherwise>
																<%-- 공백처리 --%>
																</c:otherwise>
																
																
															</c:choose>
															
														</c:forEach>
														
														<c:if test="${paging.next == true }">
															<a href="/lib/mainSearch?keyWord=${keyWord}&page=1&range=${paging.range+5}" class="page" > 
															<img src="webimg/nextPage.gif">
															</a>
														</c:if> 
														
														<c:if test="${paging.next == true }">
															<a href="/lib/mainSearch?keyWord=${keyWord}&page=${paging.pageCnt%paging.pageSize }&range=${paging.pageCnt-paging.pageCnt%paging.pageSize}" class="page" > 
															<img src="webimg/lastPage.gif">
															</a>
														</c:if> 

													</span>
												</div>

											</fieldset>
										</form>
									</div>
									<!-- //resultInfo -->
								</div>
							</div>
							<!-- //brief -->

						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="../bot.jsp" flush="false" />


</body>

</html>