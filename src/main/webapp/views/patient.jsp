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
    <div class="col-sm-6">
        <h2 class="text-center">Картка</h2>
        <p class="text-left"><strong>Номер п/п:</strong> ${patient.numberInMedList}</p>
        <p class="text-left"><strong>Ім'я:</strong> ${patient.firsName}</p>
        <p class="text-left"><strong>Прізвище:</strong> ${patient.secondName}</p>
        <p class="text-left"><strong>Рік народження:</strong> ${patient.yearOfBirth}р.</p>
        <p class="text-left"><strong>Стать:</strong> Чол.</p>
        <p class="text-left"><strong>Місце проживання:</strong>${patient.addres} </p>
        <p class="text-left"><strong>Номер телефону:</strong>+${patient.phoneNumber} </p>
        <p class="text-left"><strong>Дата звернення:</strong> ${patient.dateOfRequest}</p>
        <p class="text-left"><strong>Номер медичної картки:</strong> ${patient.numberOfMedCard}</p>
        <p class="text-center"><strong>Індивідуальна і групова психотерапія</strong></p>
        <table class="table table-condensed">
            <tr>
                <th>Вид психотерапії</th>
                <th>Дата</th>
            </tr>
            <tr>
                <td>Індивідуальна психотерапія(психокорекція)</td>
                <td>22.11.2011р.</td>
            </tr>
        </table>
    </div>
    <div class="col-sm-6">
        <h2 class="text-center">Анамнез</h2>
        <p class="text-left"><strong>Життя:</strong> ${patient.life}</p>
        <p class="text-left"><strong>Психологічний статус:</strong> ${patient.mentalStatus}</p>
        <p class="text-left"><strong>Висновок:</strong> ${patient.conclution}</p>
        <p class="text-center"><strong>План психотерапії:</strong></p>
        <p class="text-left"><strong>Групова психотерапія:</strong> ${patient.numberOfGroupPsychotherapy}</p>
        <p class="text-left"><strong>Індивідуальна психотерапія:</strong> ${patient.nuberOfInduvidualPsychotherapy}</p>
    </div>
    <a role="button" class="btn btn-primary btn-lg btn-add" href="/patients/${patient.id}/edit">Редагувати</a>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
