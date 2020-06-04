<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<head>
    <c:import url="header.jsp" charEncoding="UTF-8"/>

    <title>Login Page</title>
</head>
<body>

<center>
    <h1>Login Form</h1>
    <div class="card-text-center">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" required
                       aria-describedby="usernameHelp">
                <small id="usernameHelp" class="form-text text-muted">Latin alphabet</small>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <c:choose>
                <c:when test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        Some error
                    </div>
                </c:when>
                <c:when test="${not empty logout}">
                    <div class="alert alert-primary" role="alert">
                        Successful logout
                    </div>
                </c:when>
            </c:choose>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary">Log In</button>
        </form>
    </div>
</center>

</body>
</html>