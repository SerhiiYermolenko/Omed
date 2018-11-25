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

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><sec:authorize access="isAnonymous()"><a href="/registration">Реєстрація</a></sec:authorize></li>
                <li><sec:authorize access="isAuthenticated()"><a href="/patients">Кабінет</a></sec:authorize></li>
                <li><a href="/aboutUs">Про нас</a></li>
                <li><a href="/contacts">Контакти</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><sec:authorize access="isAuthenticated()"><a href="/logout"><span
                        class="glyphicon glyphicon-log-out"
                        aria-hidden="true"></span>
                    Вийти</a></sec:authorize></li>
                <sec:authorize access="isAnonymous()">
                <li>
                    <form class="form-inline form-navi" action="/sign-in" method="post">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputEmail3">Логін</label>
                            <input type="text" name="username" class="form-control" id="exampleInputEmail3"
                                   placeholder="Логін">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputPassword3">Пароль</label>
                            <input type="password" name="password" class="form-control" id="exampleInputPassword3"
                                   placeholder="Пароль">
                        </div>
                        <button type="submit" class="btn btn-default">Увійти</button>
                    </form>
                </li>
                </sec:authorize>

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
    <div class="col-sm-6 ">
        <h2 class="text-center">Групова психотерапія</h2>
        <table class="table table-hover patients">
            <tr>
                <th>Номер п/п</th>
                <th>Назва</th>
                <th></th>
            </tr>
            <c:forEach items="${groupPsychotherapy}" var="groupPsychotherapy">
                <tr>
                    <td>${groupPsychotherapy.id}</td>
                    <td>${groupPsychotherapy.name}</td>
                    <td><a href="/psychotherapies/group${groupPsychotherapy.id}/delete" class="btn btn-danger" role="button">Видалити</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <form class="form-inline" action="/psychotherapy/addgroup" method="post">
            <div class="form-group">
                <label for="nameGroupPsychotherapy">Назва</label>
                <input type="text" class="form-control" id="nameGroupPsychotherapy" name="groupPsychotherapy">
            </div>
            <button type="submit" class="btn btn-primary btn-md btn-add">Додати</button>
        </form>
    </div>
    <div class="col-sm-6 ">
        <h2 class="text-center">Індивідуальна психотерапія</h2>
        <table class="table table-hover patients">
            <tr>
                <th>Номер п/п</th>
                <th>Назва</th>
                <th></th>
            </tr>
            <c:forEach items="${individualPsychotherapy}" var="individualPsychotherapy">
                <tr>
                    <td>${individualPsychotherapy.id}</td>
                    <td>${individualPsychotherapy.name} </td>
                    <td><a href="/psychotherapies/indv${individualPsychotherapy.id}/delete" class="btn btn-danger"
                           role="button">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <form class="form-inline" action="/psychotherapy/addindv" method="post">
            <div class="form-group">
                <label for="nameOfIndividualPsychotherapy">Назва</label>
                <input type="text" class="form-control" id="nameOfIndividualPsychotherapy" name="nameOfIndividualPsychotherapy">
            </div>
            <button type="submit" class="btn btn-primary btn-md btn-add">Додати</button>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
