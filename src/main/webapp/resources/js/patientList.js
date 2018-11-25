$.ajax({
    url: '/patients/all',
    method: 'GET',
    contentType: 'application/json',
    success: function (patients) {
        for (var i = 0; i < patients.size; i++) {
            $("#patientList").append("<tr><td >" + patients[i].numberInMedList + "</td><td >" + patients[i].firstName + "</td><td >" + patients[i].secondName + "</td><td >" + patients[i].dateOfRequest + "</td><td >" + patients[i].numberOfMedCard + "</td><td><a href='patients/" + patients[i].id + "/delete' role='button' class='btn btn-danger'>Видалити</a></td> ");
        }
    }
});
$("#search").on('click', function () {
    $("#patientList").empty();
    $.ajax({
        url: '/patients/search',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(getSearchString()),
        success: function (patients) {
            for (var i = 0; i < patients.size; i++) {
                $("#patientList").append("<tr><td id='patient'>" + patients[i].numberInMedList + "</td><td id='patient'>" + patients[i].firstName + "</td><td id='patient'>" + patients[i].secondName + "</td><td id='patient'>" + patients[i].dateOfRequest + "</td><td id='patient'>" + patients[i].numberOfMedCard + "</td><td ><a href='patients/" + patients[i].id + "/delete' role='button' class='btn btn-danger'>Видалити</a></td> ");
            }
            $("#patient")
        }
    })
});
function getSearchString() {
    return {"search": +$("#searchString").val()}
}
