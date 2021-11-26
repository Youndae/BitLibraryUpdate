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
    <title>예약목록</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/common.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/mypagemenu.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/mypagetable.css">

    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/reserve.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/top.jsp" flush="false"/>
<div id="divContentsW">
    <div id="row">
        <h1 align="center">예약 목록</h1>
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
                        <li class="selected mTSThumbContainer"><a href="reserveList.do">예약목록</a></li>
                        <li class="mTSThumbContainer"><a href="rentHistory.do">대여이력</a></li>
                        <li class="mTSThumbContainer"><a href="wishList.do">위시리스트</a></li>
                        <li class="mTSThumbContainer"><a href="viewUser.do">회원정보</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="listTable">
            <table class="mobileTable tablet" style="width: 100%">
                <thead>
                <tr>
                    <th scope="row" class="footable-first-column"/>
                    <th scope="row" data-class="expand">도서번호</th>
                    <th scope="row" data-class="expand">도서명</th>
                    <th scope="row" data-class="expand">예약신청일</th>
                    <th scope="row" data-class="expand">반납예정일</th>
                    <th scope="row" data-class="expand">예약만기일</th>
                    <th scope="row" data-class="expand">도서상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="rentst" items="${rentst }">
                    <c:set var="rents" value="${rentst.rentStatus}"/>
                    <c:choose>
                        <c:when test="${rents == 2 }">
                            <c:set var="rentstat" value="대여가능"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="rentstat" value="대여중"/>
                        </c:otherwise>
                    </c:choose>
                    <tr>
                        <td class="num footable-first-column"><input
                                type="checkbox" name="check" id="check"
                                data-bookNo="${rentst.bookNo}" value="${rents}"></td>
                        <td>${rentst.bookNo}</td>
                        <td>${rentst.bookTitle}</td>
                        <td>${rentst.reserveDate}</td>
                        <td>${rentst.returnDueDate}</td>
                        <td>${rentst.reserveFinDate }</td>
                        <td><c:out value="${rentstat}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <input class="rent" type="button" value="도서대여"/>
            <input type="hidden" id="historycount" value="${history}"/>
            <input class="delete" type="button" value="예약취소"/>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/bot.jsp" flush="false"/>
</body>
</html>

