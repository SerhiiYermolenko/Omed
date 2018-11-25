<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="/resources/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/dashboardStyle.css">
</head>
<body>
<nav class="navbar navbar-default dashboard-navi">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><span>Omed</span>Tool</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><sec:authorize access="isAnonymous()"><a href="/registration">Реєстрація</a></sec:authorize></li>
                <li><sec:authorize access="isAuthenticated()"><a href="/patients">Кабінет</a></sec:authorize></li>
                <li><a href="/aboutUs">Про нас</a></li>
                <li><a href="/contacts">Контакти</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><sec:authorize access="isAuthenticated()"><a href="/logout"><span
                        class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Вийти</a></sec:authorize></li>
            </ul>
        </div>
    </div>
</nav>
<div class="col-sm-3 col-md-2 sidebar">
    <ul class="nav nav-sidebar">
        <li><a href="/patients"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Хворі</a></li>
        <li><a href="/dairies"><span class="glyphicon glyphicon-book" aria-hidden="true"></span> Щоденник</a></li>
        <li><a href="/psychotherapy"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Психотерапія</a>
        </li>
    </ul>
    <ul class="nav nav-sidebar">
        <li><a href=""><span class="glyphicon glyphicon-print" aria-hidden="true"></span> Роздрук</a></li>
    </ul>
</div>
<div class="conteiner mainList">
    <div class="col-md-12">
        <div class="input-group searchCenter">
            <input type="text" class="form-control" placeholder="Пошук...">
            <span class="input-group-btn">
        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"
                                                            aria-hidden="true"></span></button>
      </span>
        </div>
    </div>
    <div class="col-md-12 filters">
        <form class="form-inline">

            <div class="form-group">
                <label for="date">Дата:</label>
                <input type="date" class="form-control filter-width-date" id="date" placeholder="Password">
                <strong>-</strong> <input type="date" class="form-control filter-width-date" id="date1"
                                          placeholder="Password">
            </div>
            <button type="submit" class="btn btn-default">Фільтрувати</button>
        </form>
    </div>
    <p class="text-center"><a type="button" href="/dairies/add" class="btn btn-primary btn-lg btn-add">Додати</a></p>
    <table class="table table-hover patients">
        <tr>
            <th>Номер п/п</th>
            <th>Дата</th>
            <th></th>
        </tr>
        <c:forEach items="${dairies}" var="dairy">
            <tr onclick="window.location.href='/dairy/${dairy.id}'; return false">
                <td>${dairy.id}</td>
                <td>${dairy.date} </td>
                <td><a href="/dairy/${dairy.id}/delete" role="button" class="btn btn-danger">Видалити</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
