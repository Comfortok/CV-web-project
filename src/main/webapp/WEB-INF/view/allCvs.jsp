<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>All cvs</title>
    <c:import url="header.jsp"/>
</head>
<body>

<c:if test="${!empty allCvs}">

    <c:forEach items="${allCvs}" var="cv" varStatus="loop">
        ${cv}
        <form:form action="${pageContext.request.contextPath}/cvInfo/${cv.id}">
            <button type="submit" class="btn btn-link">
                Delete
            </button>
        </form:form>
    </c:forEach>
</c:if>
</body>
</html>