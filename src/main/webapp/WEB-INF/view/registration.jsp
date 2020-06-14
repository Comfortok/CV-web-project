<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <c:import url="header.jsp" charEncoding="UTF-8"/>
</head>
<body>

<center>
    <div class="sign-form-center">
        <form:form method="POST" modelAttribute="userForm" action="${pageContext.request.contextPath}/signup">
            <h2><spring:message code="registration.form"/></h2>
            <spring:bind path="username">
                <label for="username"><spring:message code="registration.username"/></label>
                <form:input type="text" path="username" cssClass="form-control" id="username" name="username"
                            required="required"/>
                <form:errors path="username" cssClass="badge badge-danger"/>
                <br>
            </spring:bind>

            <spring:bind path="email">
                <label for="email"><spring:message code="registration.email"/></label>
                <form:input type="text" path="email" cssClass="form-control" id="email" name="email"
                            required="required"/>
                <form:errors path="email" cssClass="badge badge-danger"/>
                <br>
            </spring:bind>

            <spring:bind path="password">
                <label for="password"><spring:message code="registration.password"/></label>
                <form:input type="password" path="password" cssClass="form-control" id="password" name="password"
                            required="required"/>
                <form:errors path="password" cssClass="badge badge-danger"/>
                <br>
            </spring:bind>

            <spring:bind path="confirmPassword">
                <div class="form-group">
                    <label for="confirmPassword"><spring:message code="registration.confirmPassword"/></label>
                    <form:input type="password" path="confirmPassword" cssClass="form-control" id="confirmPassword"
                                name="confirmPassword" required="required"/>
                    <form:errors path="confirmPassword" cssClass="badge badge-danger"/>
                </div>
            </spring:bind>
            <button type="submit" class="btn btn-primary"><spring:message code="registration.button.send"/></button>
        </form:form>
    </div>
</center>

<c:choose>
    <c:when test="${not empty error}">
        <div class="alert alert-danger" role="alert">
            <c:out value="${error}"/>
        </div>
    </c:when>
</c:choose>

</body>
</html>