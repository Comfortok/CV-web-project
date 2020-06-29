<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>article info</title>
    <c:import url="header.jsp"/>
</head>
<body>
Article Info
<c:out value="${article}"/>
<c:out value="${article.id}"/>
<br/>
<form:form action="${pageContext.request.contextPath}/updateArticle/${article.id}">
    <button type="submit" class="btn btn-link">
        Update
    </button>
</form:form>
<br/>
<form:form action="${pageContext.request.contextPath}/deleteArticle/${article.id}" method="post">
    <button type="submit" class="btn btn-link">
        Delete
    </button>
</form:form>
</body>
</html>
