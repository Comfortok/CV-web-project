<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<head>
    <c:import url="header.jsp" charEncoding="UTF-8"/>

    <title>Login Page</title>
</head>
<body>

<center>
    <h1>Login Form</h1>
    <div class="card-text-center">
        <form:form action="${pageContext.request.contextPath}/signin" modelAttribute="loginForm" method="post">
            <spring:bind path="username">
                <label for="username"><spring:message code="registration.username"/></label>
                <form:input type="text" path="username" cssClass="form-control" id="username" name="username"
                            required="required"/>
                <form:errors path="username" cssClass="badge badge-danger"/>
                <br>
            </spring:bind>

            <spring:bind path="password">
                <label for="password"><spring:message code="registration.password"/></label>
                <form:input type="password" path="password" cssClass="form-control" id="password" name="password"
                            required="required"/>
                <form:errors path="password" cssClass="badge badge-danger"/>
                <br>
            </spring:bind>

<%--            <div class="form-group">--%>
<%--                <label for="username">Username</label>--%>
<%--                <input type="text" class="form-control" id="username" name="username" required--%>
<%--                       aria-describedby="usernameHelp">--%>
<%--                <small id="usernameHelp" class="form-text text-muted">Latin alphabet</small>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="password">Password</label>--%>
<%--                <input type="password" class="form-control" id="password" name="password" required>--%>
<%--            </div>--%>



<%--            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
            <button type="submit" class="btn btn-primary">Log In</button>
        </form:form>

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
            <c:when test="${not empty signup}">
                <div class="alert alert-primary" role="alert">
                    Successful sign up
                </div>
            </c:when>
        </c:choose>
    </div>
</center>

</body>
</html>