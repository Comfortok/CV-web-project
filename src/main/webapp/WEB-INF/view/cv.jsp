<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>CV</title>
    <c:import url="header.jsp"/>
</head>
<body>

CV

<c:choose>
<c:when test="${cv != null}">
    <c:out value="${cv.id}"/>
    <c:out value="${cv.name}"/>
    <c:out value="${cv.surname}"/>
    <c:out value="${cv.birthDate}"/>
    <c:out value="${cv.skills}"/>

    <form:form action="${pageContext.request.contextPath}/updateCv/${cv.id}">
        <button type="submit" class="btn btn-link">
            Update
        </button>
    </form:form>
    <br/>
    <form:form action="${pageContext.request.contextPath}/deleteCv/${cv.id}" method="post">
        <button type="submit" class="btn btn-link">
            Delete
        </button>
    </form:form>
</c:when>
    <c:otherwise>
        No cv created yet...
        <form:form action="${pageContext.request.contextPath}/newCvPage" method="get">
            <button type="submit" class="btn btn-link">
                Create
            </button>
        </form:form>
    </c:otherwise>
</c:choose>
</body>
</html>
