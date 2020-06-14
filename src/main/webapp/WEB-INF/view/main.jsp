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
<div>

    <center>
        <c:if test="${!empty allArticles}">
            <form:form method="post" action="${pageContext.request.contextPath}/admin/remove">
                <div id="accordion">
                    <c:forEach items="${allArticles}" var="article" varStatus="loop">
                        <div class="card-text-center">
                            <div class="card-header" id="heading_${loop.index}">
                                <h5 class="mb-0">
                                    <div class="row">
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <div class="col-auto">
                                                <div class="form-check">
                                                    <input class="form-check-input position-static" type="checkbox"
                                                           id="articleId"
                                                           name="articleId" value="${article.id}" aria-label="...">
                                                </div>
                                            </div>
                                        </sec:authorize>

                                        <div class="col-auto">
                                            <a class="nav link" data-toggle="collapse" data-target="#collapse_${loop.index}"
                                               aria-expanded="true" aria-controls="collapse_${loop.index}">
                                                    ${article.header}
                                            </a>
                                        </div>
                                    </div>
                                </h5>
                            </div>

                            <div id="collapse_${loop.index}" class="collapse hide" aria-labelledby="heading_${loop.index}"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <h6 class="card-subtitle mb-2 text-muted">
                                        ${article.releaseDate}
                                    </h6>
                                    <p class="card-text block">
                                            ${article.text}
                                    </p>
                                    <h6 class="card-subtitle mb-2 text-muted">
                                        ${article.userName}
                                    </h6>
                                    <a href="#" class="button">More</a><br/>
                                    <a href="/user/articleInfo/${article.id}" class="card-link">
                                        View</a>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                        <a href="<c:url value="/admin/edit/${article.id}"/>" class="card-link">
                                            Edit</a>
                                    </sec:authorize>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <br/>

                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <input type="submit" class="btn btn-primary" value="delete"
                               onclick="return confirm('sure?')"/>
                        <br/>
                    </sec:authorize>
                </div>
            </form:form>
        </c:if>

        1<c:out value="${requestScope.get('Authorization')}"/>
        2<c:out value="${requestScope.get('SESSION_KEY')}"/>
        3<c:out value="${pageContext.request.getAttribute('SESSION_KEY')}"/>
        4<c:out value="${pageContext.request.getAttribute('Authorization')}"/>
        5<c:out value="${pageContext.request.getHeader('Authorization')}"/>
    <br/>

    <form:form method="post" action="${pageContext.request.contextPath}/add">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="text" name="header" placeholder="Header">
        <input type="text" name="text" placeholder="Text">
<%--        <input type="hidden" name="Authorization" value="">--%>
        <button type="submit">Send</button>
    </form:form>
    </center>
</div>
</body>

<script type="text/javascript">
    $(document).ready(function(){
        $('.button').click(function(){
            $('.block').toggleClass('opener');
            if (!$(this).data('status')) {
                $(this).data('status', true).html('Hide');
            } else {
                $(this).data('status', false).html('More');
            }
        });
    });
</script>
</html>