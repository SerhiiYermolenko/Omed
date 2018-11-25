<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="/resources/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/registrationStyle.css">
</head>
<body>
<nav class="navbar navbar-default">
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
                <li><sec:authorize access="isAnonymous()"><a href="/">Головна</a></sec:authorize></li>
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
            </ul>
        </div>
    </div>
</nav>
<div class="container registrationContainer">
    <form class="form-horizontal" action="/registration" method="post">
        <div class="form-group">
            <label for="name" class="col-sm-4 control-label">Ім'я</label>
            <div class="col-sm-8">
                <input name="name" type="text" class="form-control" id="name" placeholder="Ім'я">
            </div>
        </div>
        <div class="form-group">
            <label for="secondName" class="col-sm-4 control-label">Прізвище</label>
            <div class="col-sm-8">
                <input name="secondName" type="text" class="form-control" id="secondName" placeholder="Прізвище">
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-4 control-label">Електронна пошта</label>
            <div class="col-sm-8">
                <input name="email" type="email" class="form-control" id="email" placeholder="Електронна пошта">
            </div>
        </div>
        <div class="form-group">
            <label for="phoneNumber" class="col-sm-4 control-label">Номер телефону</label>
            <div class="col-sm-8">
                <input name="phone" type="number" class="form-control" id="phoneNumber" placeholder="Телефон">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-4 control-label">Пароль</label>
            <div class="col-sm-8">
                <input name="password" type="password" class="form-control" id="password" placeholder="Пароль">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
                <button type="Submit" class="btn btn-default">Зареєструвати</button>
            </div>
        </div>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
