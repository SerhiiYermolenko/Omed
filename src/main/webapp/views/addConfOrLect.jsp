<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="form-group">
    <label for="date">Дата:</label>
    <input type="date" class="form-control" name="date" id="date" placeholder="Дата">
</div>
<p class="text-center"><strong> Участь в медичних конференціях</strong></p>
<div class="form-group ">
    <div class="radio">
        <label>
            <input type="radio" value="lis" id="confLis" name="Conf">
            Слухач
        </label>
    </div>
    <div class="radio">
        <label>
            <input type="radio" value="lec" id="confPerf" name="Conf">
            Доповідач
        </label>
    </div>

</div>
<div class="form-group">
    <label for="themeConf">Тема:</label>
    <input type="text" class="form-control" id="themeConf" name="themeConf" placeholder="Тема">
</div>
<p class="text-center"><strong>Проведення виховних робіт в колективі:</strong></p>
<div class="form-group ">
    <div class="radio">
        <label>
            <input type="radio" value="lis" id="persListener" name="Lect">
            Слухач
        </label>
    </div>
    <div class="radio">
        <label>
            <input type="radio" value="lec" id="persPerf" name="Lect">
            Доповідач
        </label>
    </div>

</div>
<div class="form-group">
    <label for="persTheme">Тема:</label>
    <input type="text" class="form-control" id="persTheme" name="themeLect" placeholder="Тема">
</div>
</body>
</html>
