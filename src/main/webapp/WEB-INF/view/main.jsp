<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <c:import url="header.jsp" charEncoding="UTF-8"/>
</head>
<body>
Main page<br/>

    <form:form action="${pageContext.request.contextPath}/newArticlePage" method="get">
        <button type="submit" class="btn btn-link">
            Add new article
        </button>
    </form:form>

</body>
</html>