<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>article adding form</title>
    <c:import url="header.jsp"/>
</head>
<body>

<form:form method="post" action="${pageContext.request.contextPath}/addArticle" modelAttribute="article">
    <spring:bind path="header">
        <label for="header">Header</label>
        <form:input type="text" path="header" cssClass="form-control" id="header" name="header"
                    required="required"/>
        <form:errors path="header" cssClass="badge badge-danger"/>
        <br>
    </spring:bind>
    <spring:bind path="text">
        <label for="text">Text</label>
        <form:input type="text" path="text" cssClass="form-control" id="text" name="text"
                    required="required"/>
        <form:errors path="text" cssClass="badge badge-danger"/>
        <br>
    </spring:bind>
    <spring:bind path="id">
        <form:hidden path="id" name="id"/>
    </spring:bind>
    <button type="submit">Send</button>
</form:form>

</body>
</html>