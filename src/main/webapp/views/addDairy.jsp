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
<div class="conteiner mainList">
    <h2 class="text-center">Щоденник</h2>
    <form action="/dairies/add" method="post">
        <div class="form-group col-sm-12">
            <label for="date">Дата:</label>
            <input type="date" class="form-control" name="date" id="date" placeholder="Дата">
        </div>
        <div class="col-sm-6">
            <p class="text-center"><strong>Індивідуальна психотерапія:</strong></p>
            <table id="indv" class="table table-condensed">
                <tr>
                    <th class="text-center">Прізвище ім'я</th>
                    <th class="text-center">Вид</th>
                </tr>
            </table>
            <p class="text-center">
                <button type="button" id="addpatientIndv" class="btn btn-default btn-md">Додати хворого</button>
                <button type="button" id="deleteIndv" class="btn btn-danger btn-md ">Видалити все</button>
            </p>
        </div>
        <div class="col-sm-6">
            <p class="text-center"><strong>Групова психотерапія:</strong></p>
            <table id="group" class="table table-condensed">
                <tr>
                    <th class="text-center">Прізвище ім'я</th>
                    <th class="text-center">Вид</th>
                </tr>
            </table>
            <p class="text-center">
                <button type="button" id="addpatientGroup" class="btn btn-default btn-md">Додати хворого</button>
                <button type="button" id="deleteGroup" class="btn btn-danger btn-md ">Видалити все</button>
            </p>

        </div>
        <button type="submit" class="btn btn-success btn-lg btn-add">Додати</button>
    </form>
</div>


<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js">
</script>
<script src="/resources/js/addDairy.js"></script>

</body>
</html>
