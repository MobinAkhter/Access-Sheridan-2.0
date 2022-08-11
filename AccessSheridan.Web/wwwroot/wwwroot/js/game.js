var numPicked = [];
var currentGameName = "";
var currentGameId = 0;
var gameTypePicked = 0;
var maxNumber = 0;
var minNumber = 0;

// choose game type
$(".gameTypeWrap li").on('click', function (e) {
    e.preventDefault();
    numPicked = [];

    let selectedId = $(this).attr("data-type_id");
    let selectedMin = $(this).attr("data-min");
    let selectedMax = $(this).attr("data-max");
    let selectedVal = $(this).attr("data-name");
    let selectedGameID = $(this).attr("data-gameID");
    currentGameId = selectedGameID;

    if (selectedId.length > 0) {
        maxNumber = selectedMax;
        minNumber = selectedMin;

        var tee = $(".gametype");
        tee.removeClass('active');
        var tex = $("#" + selectedId);
        tex.addClass('active');
        $("#how_many_pick_" + selectedGameID).text("Pick " + selectedMin + " to " + selectedMax + " number(s)");
    }
    ClearNumberPicker();
    ClearChosenLabel();
});

$(".circle_no a").on('click', function (e) {
    let numberPicked_id = $(this).attr("data-aid");
    let numberPicked = $(this).attr("data-picknum");
    var classSelector = "#" + numberPicked_id;

    if (numberPicked.length > 0) {
        if ($(classSelector).hasClass('active')) {
            $(classSelector).removeClass('active');
            UpdateCollection(numberPicked);
        } else {
            if (numPicked.length < maxNumber) {
                $(classSelector).addClass('active');
                UpdateCollection(numberPicked);
            }
        }
     }
    var chosenLbl = $("#chosenLabel_" + currentGameId);
    var lbl = ChosenNumberLabelBuilder();
    chosenLbl.html(lbl);

});

function UpdateCollection(num) {
    if (num > 0) {
        let condition = numPicked.includes(num)

        if (condition) {
            numPicked = numPicked.filter(e => e !== num);
        } else {
            numPicked.push(num);
        }
        numPicked = numPicked.sort((a, b) => a - b);
    }
}

function ChosenNumberLabelBuilder() {
    var finalString = "";
    for (let i = 0; i < numPicked.length; i++) {
        finalString += "<li><a>"+ numPicked[i] +"</a></li>";
    }
    return finalString;
}

function ClearNumberPicker() {
     $(".circle_no").removeClass('active')
}

function ClearChosenLabel() {
    $("#chosenLabel_" + currentGameId).html("<li><a></a></li>");
}

function ClearModalDialog() {
    numPicked = []; currentGameName = "";
    currentGameId = gameTypePicked = maxNumber = minNumber = 0;
}

$('.close').click(function () {

    ClearChosenLabel();
    ClearModalDialog();
});


$("#registerSubmit").submit(function () {
    var registerModel = {};
    //data.Name = "data";

    let FirstName = $("#regFirstName").val();
    let LastName = $("#regLastName").val();
    let Email = $("#regEmail").val();
    let Mobile = $("#regMobile").val();
    let Username = $("#regUsername").val();
    let Password = $("#regPassword").val();

    registerModel = { FirstName: FirstName, LastName: LastName, Email: Email, Mobile: Mobile, Username: Username, Password: Password };

    $.ajax({
        type: "POST",
        url: "https://localhost:5001/api/authmanagement/getgames/Register",
        data: registerModel,
        success: function (response) {
            alert("Hello: " + response.FirstName + " .\nCurrent Date and Time: " + response.LastName);
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
});

$("#btnGet").click(function () {
    var data = {};
    data.Name = "Mudassar";

    $.ajax({
        type: "POST",
        url: "/Home/AjaxMethod",
        data: { "name": $("#txtName").val() },
        success: function (response) {
            alert("Hello: " + response.FirstName + " .\nCurrent Date and Time: " + response.LastName);
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
});