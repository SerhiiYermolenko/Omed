var ident = 1;
var group = 1;
$("#addpatientIndv").on('click', function () {
    ident++;
    $.ajax({
        url: '/psychotherapy/allindv',
        method: 'GET',
        contentType: '/application/json',

        success: function (allindv) {
            $("#indv").append("<tr class='indvPsy'><td><input type='text' class='form-control patientNameIndv' name='indvPatients'/></td><td ><select name='indvPsy' id='indvPsy' class='form-control indvPsyName'></select></td></tr>");
            $(".indvPsyName").empty();
            for (var i = 0; i < allindv.length; i++) {
                $(".indvPsyName").append("<option value=" + allindv[i] + ">" + allindv[i] + "</option>")

            }
        }


    });
    $("#deleteIndv").on('click', function () {
        $(".indvPsy").remove();
    })
});
$("#addpatientGroup").on('click', function () {
    ident++;
    $.ajax({
        url: '/psychotherapy/allgroup',
        method: 'GET',
        contentType: '/application/json',

        success: function (allindv) {
            $("#group").append("<tr class='groupPsy'><td><input type='text' class='form-control patientNameIndv' name='groupPatients'/></td><td ><select name='groupPsy' id='groupPsy' class='form-control groupPsyName '></select></td></tr>");
            $(".gropuPsyName").empty();
            for (var i = 0; i < allindv.length; i++) {
                $(".groupPsyName").append("<option value=" + allindv[i] + ">" + allindv[i] + "</option>")

            }
        }


    });
    $("#deleteGroup").on('click', function () {
        $(".groupPsy").remove();
    })
});


