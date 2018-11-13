<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <head></head>



</head>

<body id="bg">
<form action="#" method="post">
<!-- 左边节点 -->
<div class="container">
    <div class="leftsidebar_box">

        <!--用户管理-->
        <c:forEach items="${firstMenuList}"  var="firstMenu" >
        <dl class="system_log">
            <dt>
                <img class="icon1" src="../images/coin07.png" />
                <img class="icon2" src="../images/coin08.png" />
                    ${firstMenu.phamacyFirstName}
                <img class="icon3" src="../images/coin19.png" />
                <img class="icon4" src="../images/coin20.png" />
            </dt>
                <c:forEach items="${secondMenuList}"  var="secondMenu" >
                    <c:if test="${firstMenu.phamacyFirstId==secondMenu.phamacyFirstId}">
            <dd>
                <img class="coin11" src="../images/coin111.png" />
                <img class="coin22" src="../images/coin222.png" />
                <a href="${pageContext.request.contextPath}${secondMenu.phamacySecondUrl}" target="main" class="cks">${secondMenu.phamacySecondName}</a>
                <img class="icon5" src="../images/coin21.png" />
            </dd>
                    </c:if>
                </c:forEach>
        </dl>
                </c:forEach>
    </div>
</div>
</form>
</body>
</html>
