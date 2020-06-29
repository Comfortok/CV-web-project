<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="${pageContext.request.contextPath}../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>Articles</title>
    <c:import url="header.jsp"/>
</head>
<body>

<li class="nav-item active">
    <form:form action="${pageContext.request.contextPath}/newArticlePage" method="get">
        <button type="submit" class="btn btn-link">
            Add new article
        </button>
    </form:form>
</li>

<c:if test="${!empty allArticles}">

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
                            <form action="${pageContext.request.contextPath}/articleInfo/${article.id}">
                                <button type="submit" class="btn btn-link">
                                    ViewMoreInfo
                                </button>
                            </form>
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

</c:if>

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
