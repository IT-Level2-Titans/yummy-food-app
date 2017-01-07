<%--
  Created by IntelliJ IDEA.
  User: Kasun Chinthaka
  Date: 1/3/2017
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--This page is for only testing purposes-->
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2><%= request.getParameter("queryOutput")%></h2>
<c:if test="${not empty queryOutput}">

    <ul>
        <c:forEach var="queryOutput" items="${queryOutput}">
            <li>${queryOutput}</li>
        </c:forEach>
    </ul>

</c:if>

</body>
</html>
