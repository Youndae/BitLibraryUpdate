<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <title>도서 상세페이지</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/mypagemenu.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/bookDetail.css">
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/book.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/top.jsp" flush="false"/>

<div id="divContentsW">
    <div id="divContents">
        <div id="divContent">
            <div class="searchDetail">
                <div class="searchLink">
                    <form name="frmMylist" action="/mylist/writeitem" method="post"/>
                    <ul class="searchLinkBtn">
                        <button type="button" class="rent">대여</button>
                        <input type="hidden" id="historycount" value="${history}"/>
                        <button type="button" class="wish">위시리스트</button>
                        <button type="button" class="reserve">예약</button>
                    </ul>
                    <div class="profile">
                        <div class="profileHeader">
                            <h1>${bookdt[0].bookTitle}</h1>
                            <h3>${bookdt[0].author}</h3>
                        </div>
                        <div class="profileContent">
                            <div class="briefInfo">
                                <dl>
                                    <dd class="bookImg">
                                        <img id="coverimage" src="img${bookdt[0].imagePath}" width="300"
                                             align="center">
                                    </dd>
                                </dl>
                                <span class="bookBg"></span>
                            </div>

                            <div class="table">
                                <div id="divProfile">
                                    <table class="profiletable">
                                        <tbody>
                                        <tr>
                                            <th scope="row">자료유형</th>
                                            <td>${bookdt[0].type}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">저&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자</th>
                                            <td>${bookdt[0].author}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">발행사항</th>
                                            <td>${bookdt[0].pubYear}.${bookdt[0].publisher}</td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="searchInfo">
                                    <div class="serchContents">
                                        <div class="listTable">
                                            <table border="2" align="right" text-align="center">
                                                <tr>
                                                    <th></th>
                                                    <th>도서번호</th>
                                                    <th>도서상태</th>
                                                    <th>예약여부</th>
                                                </tr>
                                                <c:forEach var="bookdt" items="${bookdt }">
                                                    <c:set var="reservest" value="${bookdt.reserveStatus}"/>
                                                    <c:set var="bookst" value="${bookdt.rentStatus}"/>
                                                    <c:choose>
                                                        <c:when test="${bookst == 2}"> <!-- 도서상태가 2=반납상태라면 -->
                                                            <c:choose>
                                                                <c:when test="${reservest != 0}"> <!-- 도서상태가 반납이고 예약상태가 예약없음 상태가 아니라면 -->
                                                                    <c:set var="bookstat" value="예약도서"/>
                                                                    <c:set var="reservestat" value="예약불가"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:set var="bookstat"
                                                                           value="대여가능"/> <!-- 도서상태가 반납이고 예약상태가 예약없음 상태라면-->
                                                                    <c:set var="reservestat" value="예약불가"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${reservest == 0}"> <!-- 도서상태가 반납이 아니고 예약없음 상태라면 -->
                                                                    <c:set var="bookstat" value="대여중"/>
                                                                    <c:set var="reservestat" value="예약가능"/>
                                                                </c:when>
                                                                <c:otherwise> <!-- 도서상태가 반납이 아니고 예약없음 상태가 아니라면 -->
                                                                    <c:set var="bookstat" value="대여중"/>
                                                                    <c:set var="reservestat" value="예약불가"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <tr>
                                                        <td class="num footable-first-column">
                                                            <input type="checkbox" name="check" id="check"
                                                                   data-reservest="${reservest}"
                                                                   data-bookNo="${bookdt.bookNo}"
                                                                   value="${bookst}"
                                                                   onclick="check_only(this)"></td>
                                                        <td>${bookdt.bookNo}</td>
                                                        <td><c:out value="${bookstat}"/></td>
                                                        <td><c:out value="${reservestat}"/></td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>