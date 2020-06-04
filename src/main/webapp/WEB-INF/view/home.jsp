<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
    <c:import url="header.jsp" charEncoding="utf8"/>
</head>
<body>

<div class="jumbotron">
    <h1 class="display-4">H1 Text</h1>
    <p class="lead">P Hello message</p>
    <hr class="my-4">
    <p>P Hello some text</p>
    <p class="lead">
        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/main"
           role="button">Main Page</a>
    </p>
</div>

</body>
</html>