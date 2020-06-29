<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>CV adding form</title>
    <c:import url="header.jsp"/>
</head>
<body>

<form:form method="post" action="${pageContext.request.contextPath}/addCv" modelAttribute="cv">
    <spring:bind path="name">
        <label for="name">Name</label>
        <form:input type="text" path="name" cssClass="form-control" id="name" name="name"
                    required="required"/>
        <form:errors path="name" cssClass="badge badge-danger"/>
        <br>
    </spring:bind>
    <spring:bind path="surname">
        <label for="surname">Surname</label>
        <form:input type="text" path="surname" cssClass="form-control" id="surname" name="surname"
                    required="required"/>
        <form:errors path="surname" cssClass="badge badge-danger"/>
        <br>
    </spring:bind>
    <spring:bind path="birthDate">
        <label for="surname">Birth Date</label>
        <form:input type="date" path="birthDate" cssClass="form-control" id="birthDate" name="birthDate"
                    required="required"/>
        <form:errors path="birthDate" cssClass="badge badge-danger"/>
        <br>
    </spring:bind>
    <spring:bind path="skills">
        <label for="skills">Skills</label>
        <form:textarea type="text" path="skills" cssClass="form-control" id="skills" name="skills"
                    required="required"/>
        <form:errors path="skills" cssClass="badge badge-danger"/>
        <br>
    </spring:bind>
    <spring:bind path="id">
        <form:hidden path="id" name="id"/>
    </spring:bind>
    <button type="submit">Send</button>
</form:form>

</body>
</html>