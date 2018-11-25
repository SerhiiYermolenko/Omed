<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
        <!-- Brand and toggle get grouped for better mobile display -->
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
<div class="mainList">
    <div class="col-md-12">
        <div class="input-group searchCenter">
            <input type="text" id="searchString" class="form-control" placeholder="Пошук...">
            <span class="input-group-btn">
        <button class="btn btn-default" id="search" type="submit"><span class="glyphicon glyphicon-search"
                                                                        aria-hidden="true"></span></button>
      </span>
        </div>
    </div>

    <p class="text-center"><a type="button" href="/patients/add" class="btn btn-primary btn-lg btn-add">Додати нового
        хворого</a></p>
    <table id="patientList" class="table table-hover patients">
        <tr>
            <th>Номер п/п</th>
            <th>Ім'я</th>
            <th>Прізвище</th>
            <th>Дата заїзду</th>
            <th>Номер мед. картки</th>
            <th></th>
            <c:forEach items="${patients}" var="patient">
        <tr>
            <td onclick="window.location.href='/patients/${patient.id}'; return false">${patient.numberInMedList}</td>
            <td onclick="window.location.href='/patients/${patient.id}'; return false">${patient.firsName}</td>
            <td onclick="window.location.href='/patients/${patient.id}'; return false">${patient.secondName}</td>
            <td onclick="window.location.href='/patients/${patient.id}'; return false">${patient.dateOfRequest}</td>
            <td onclick="window.location.href='/patients/${patient.id}'; return false">${patient.numberOfMedCard}</td>
            <td><a type="button" href="/patients/${patient.id}/delete" class="btn btn-danger btn-md">Видалити</a></td>
        </tr>
        </c:forEach>
    </table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
</script>
<script src="/resources/js/patientList.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
