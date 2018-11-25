<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
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

    <form:form modelAttribute="patient" action="/patients/add" method="post">
        <div class="col-sm-6">
            <h2 class="text-center">Картка</h2>
            <div class="form-group">
                <form:label path="numberInMedList">Номер п/п:</form:label>
                <form:input path="numberInMedList" value="${patient.numberInMedList}" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="firsName">Ім'я:</form:label>
                <form:input path="firsName" value="${patient.firsName}" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="secondName">Прізвище:</form:label>
                <form:input class="form-control" value="${patient.secondName}" path="secondName"/>
            </div>
            <div class="form-inline chek">
                <strong>Стать:</strong>
                <div class="radio">
                    <form:label path="gender">
                        Чол.<form:radiobutton value="M" path="gender"/>

                    </form:label>
                </div>
                <div class="radio">
                    <form:label path="gender">
                        Жін.<form:radiobutton value="F" path="gender"/>

                    </form:label>
                </div>
            </div>
            <div class="form-group">
                <form:label path="yearOfBirth">Рік народження:</form:label>
                <form:input path="yearOfBirth" value="${patient.yearOfBirth}" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="addres">Місце проживання:</form:label>
                <form:input class="form-control" value="${patient.addres}" path="addres"/>
            </div>
            <div class="form-group">
                <form:label path="dateOfRequest">Дата звернення:</form:label>
                <form:input class="form-control" value="${patient.dateOfRequest}" path="dateOfRequest"/>
            </div>
            <div class="form-group">
                <form:label path="numberOfMedCard">Номер медичної картки:</form:label>
                <form:input class="form-control" value="${patient.numberOfMedCard}" path="numberOfMedCard"/>
            </div>

        </div>
        <div class="col-sm-6">
            <h2 class="text-center">Анамнез</h2>
            <strong>Життя:</strong>
            <form:textarea path="life" class="form-control anamnez" value="${patient.life}" rows="4"></form:textarea>
            <strong> Психічний статус:</strong>
            <form:textarea path="mentalStatus" class="form-control anamnez" value="${patient.mentalStatus}"
                           rows="4"></form:textarea>
            <strong>Висновок:</strong>
            <form:textarea path="conclution" class="form-control anamnez" value="${patient.conclution}"
                           rows="4"></form:textarea>
            <div class="form-group">
                <form:label
                        path="nuberOfInduvidualPsychotherapy">Кількість занять індивідуальної психотерапії:</form:label>
                <form:input class="form-control" value="${patient.nuberOfInduvidualPsychotherapy}"
                            path="nuberOfInduvidualPsychotherapy"/>
            </div>
            <div class="form-group">
                <form:label path="numberOfGroupPsychotherapy">Кількість занять групової психотерапії:</form:label>
                <form:input class="form-control" value="${patient.numberOfGroupPsychotherapy}"
                            path="numberOfGroupPsychotherapy"/>
            </div>
        </div>
        <form:button class="btn btn-success btn-lg btn-add">Редагувати</form:button>
    </form:form>
</div>


</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>