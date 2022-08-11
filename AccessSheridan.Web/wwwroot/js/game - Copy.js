var numPicked = [];
var gameTypePicked = 0;
var maxNumber = 0;
var minNumber = 0;

// choose game type
$("#gameTypeWrap li").on('click', function (e) {
    e.preventDefault();
    numPicked = [];

    let selectedId = $(this).attr("data-type_id");
    let selectedMin = $(this).attr("data-min");
    let selectedMax = $(this).attr("data-max");
    let selectedVal = $(this).attr("data-name");

    if (selectedId.length > 0) {
        maxNumber = selectedMax;
        minNumber = selectedMin;

        $("#how_many_pick").text("Pick " + selectedMin + " to " + selectedMax + " number(s)");
    }
});

//Chosen numbers
$(".circle_no a").on('click', function (e) {
 
    let numberPicked_id = $(this).text();
    var class_ = "#circle_id_" + numberPicked_id + " .circle_no";
    let obj = $(class_ + " .circle_no");
    //let numberPicked = $(obj).attr("data-picknum");

    // alert(clicked_id)//
    if (numberPicked_id.length > 0) {
        let selectedNum = numberPicked_id;

        UpdateCollection(numberPicked_id);

        if (obj.hasClass("active")) {
            obj.removeClass("active");
            alert("class removed");
        } else {
            obj.addClass("active");
            alert("class added");
        }

        //if (obj.hasClass("active")) {
        //    $(obj).removeClass("active");
        //    alert("class removed");
        //} else {
        //    $(obj).addClass("active");
        //    alert("class added");
        //}

        //Sorting number
  

        for (let i = 0; i < numPicked.length; i++) {
            //$('#ball_' + i + ' span').text(numPicked[i]);
        }

        // alert( "text: " + numPicked);
    }
});

function UpdateCollection(num) {
    if (num > 0) {
        if (numPicked.contains(num)) {
            alert("Contained: now removed");
            numPicked = numPicked.filter(e => e !== num);
        } else {
            numPicked.push(num);
            alert("Contains: Just added");
        }
        numPicked = numPicked.sort((a, b) => a - b);
    }
}

//$("a").click(function () {
//    console.log(this.innerHTML)
//    arr.push(JSON.parse(this.innerHTML))
//    $(this).parent('li').addClass("active");
//    console.log(arr)
//});


$('#ghanaTypeWrap label input').on('change', function () {
    numPicked = [];

    let selectedId = "";
    let selectedMin = "";
    let selectedMax = "";
    let selectedVal = "";
    let selected = $("#ghanaTypeWrap label input[type='radio']:checked");
    if (selected.length > 0) {
        selectedVal = selected.attr('data-name');
        selectedId = selected.attr('data-type_id');
        selectedMin = selected.attr('data-minNumber');
        selectedMax = selected.attr('data-maxNumber');
        maxNumber = selectedMax;
        minNumber = selectedMin;
        $('#regular_picks').replaceWith('<div id="regular_picks" class="pull-left"> Pick ' + selectedMin + ' more: </div>');
        let container = $("#selectedBallsContainer"); 
        $.get("/Game/generateSelectedBalls", { min: selectedMin }, function (data) { container.html(data); });
        let containerNumberPickBox = $("#numberPicks");
        $.get("/Game/loadNumberPickBox", function (data) { container.html(data); });
    }
   
});


$(".typeBtn").click(function (e) {

    let name = this.attr('data-name');
  alert(name);
    //$('.ghana_select .typeBtn').removeClass('active');
    //$(this).addClass('active');
    //GhGameT = $(this).data('type');
    //GhGameTN = $(this).data('name');
    //setCookie('ghanacookie_game', GhGameT, 90 * 24 * 3600);
    //$('.curlottery').data('balls', GhGameTypes[GhGameT][1]);
    //updateGType(); // update onscreen type name
    //updateMaxWin();
    //// set a global object GhSelected to be used in lottery.js
    //GhSelected = {
    //    name: GhGameName,
    //    type: GhGameTypes[GhGameT][0],
    //    min: GhGameTypes[GhGameT][1],
    //    max: GhGameTypes[GhGameT][2],
    //    win: GhGameTypes[GhGameT][3],
    //    lmin: GhGameTypes[GhGameT][4],
    //    lmax: GhGameTypes[GhGameT][5],
    //    cmnt: GhGameTypes[GhGameT][6],
    //};
    //resetMinMax(); // it is using GhSelected!
    //// reset a balls pool
    //NT.list = new Array();
    //NT.listExtra = new Array();
    //NT.pickCounter = NT.pickCounterExtra = 0;
    //NT.defaultLottery();
    //if (ppAutoClose) {
    //    $('.ghanaTypeWrap').fadeOut();
    //    $('.gameSect.typeSect').removeClass('active');
    //}
});

$('#myForm input').on('change', function () {
    //alert( document.querySelector('input[name="radioName"]:checked').value);
    let selectedId = "";
    let selectedMin = "";
    let selectedMax = "";
    let selectedVal = "";
    let selected = $("#myForm input[type='radio']:checked");
    if (selected.length > 0) {
        //selectedVal = selected.val();
        selectedVal = selected.attr('data-name');
        selectedId = selected.attr('data-type_id');
        selectedMin = selected.attr('data-minNumber');
        selectedMax = selected.attr('data-maxNumber');

        alert("typeid: " + selectedVal);
        
    }
    

});

$(window).resize(function () {
    if ($(window).width() <= 600) {
        $('#prop-type-group').removeClass('btn-group');
        $('#prop-type-group').addClass('btn-group-vertical');
    } else {
        $('#prop-type-group').addClass('btn-group');
        $('#prop-type-group').removeClass('btn-group-vertical');
    }
});



$("#toggle-event").change(function () {
    $("#console-event").html('Toggle: ' + $(this).prop('checked'));
});

