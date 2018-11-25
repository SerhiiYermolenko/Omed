<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>OmedTool-Main</title>
    <link rel="stylesheet" href="/resources/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/indexStyle.css">
</head>
<body>
<nav class="navbar navbar-default">
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
                <sec:authorize access="isAnonymous()">
                    <li>
                        <form class="form-inline form-navi" action="/sign-in" method="post">
                            <div class="form-group">
                                <label class="sr-only" for="login">Логін</label>
                                <input type="text" name="username" class="form-control" id="login" placeholder="Логін">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">Пароль</label>
                                <input type="password" name="password" class="form-control" id="password"
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
<h1>Знайдіть нас на карті</h1>
<div style="overflow:hidden;width: 1600px;height: 1000px;"><iframe width="1600" height="1000" src="https://maps.google.com/maps?width=1600&amp;height=1000&amp;hl=en&amp;q=Kyiv+(%D0%9D%D0%B0%D0%B7%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)&amp;ie=UTF8&amp;t=&amp;z=10&amp;iwloc=B&amp;output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><div><small><a href="https://embedgooglemaps.com/en/">https://embedgooglemaps.com/en/</a></small></div><div><small><a href="https://iamsterdamcard.it">iamsterdamcard</a></small></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div><br />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
