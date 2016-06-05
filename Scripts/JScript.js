
function pageLoad() {
    $(".add tr").click(function () {
        var tds = $(this).addClass("selected").siblings().removeClass("selected");
        var values = $(this).text();
        var row_index = $(this).index();
        $("#lblSelectedRow").val(values.toString());
        $("#lblSelectedRowIndex").val(row_index.toString());
    });

}


//$(window).scroll(function () {
// var sticky = $('.sticky'),
// scroll = $(window).scrollTop();

//if (scroll >= 100) {
//sticky.addClass('fixed');
//sticky.removeClass('invis');
// }
//else {
//    sticky.removeClass('fixed');
//sticky.addClass('invis');
// }
//});
function showSuccessMessage() {
    $('.alert-danger').hide();
    $('.alert-success').show();
}

function showErrorMessage() {

    $('.alert-success').hide();
    $('.alert-danger').show();

}



$(document).ready(function () {
    var jqueryCall = function JQueryAjaxCall(fromBillIndex, toBillIndex, orderIndex) {
        var parameter = { "fromBillIndex": parseInt(fromBillIndex), "toBillIndex": parseInt(toBillIndex), "orderIndex": parseInt(orderIndex) };
        $.ajax({
            type: "POST",
            url: 'SplitBills.aspx/jqueryRemoveAddOrder',
            data: JSON.stringify(parameter),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                //alert(response.d);
            }
        });

    }

    function OnSuccess(response) {
        //alert(response.d);
    }

    $("#hlExperience").click(function () {

        $('html, body').animate({ scrollTop: $("#divExperience").offset().top - $('#nav_bar').height() }, 'slow');
    });

    $("#hlAbout").click(function () {

        $('html, body').animate({ scrollTop: $("#divAbout").offset().top - $('#nav_bar').height() }, 'slow');
    });

    $("#hlSkills").click(function () {

        $('html, body').animate({ scrollTop: $("#divSkills").offset().top - $('#nav_bar').height() }, 'slow');
    });

    $("#hlPortfolio").click(function () {

        $('html, body').animate({ scrollTop: $("#divPortfolio").offset().top - $('#nav_bar').height() }, 'slow');
    });

    $("#hlContact").click(function () {

        $('html, body').animate({ scrollTop: $("#divContact").offset().top - $('#nav_bar').height() }, 'slow');
    });


        $(function() {
            $(".dial").knob();
        });
  

    $(".drag_drop_grid tbody").sortable({
        items: "> tr:not(:first)",
        appendTo: "parent",
        helper: "clone"
    }).disableSelection();

    $(".drag_drop_grid tbody").droppable({
        hoverClass: "drophover",
        tolerance: "pointer",
        drop: function (e, ui) {
            $(this).closest("table").append("<tr>" + ui.draggable.html() + "</tr>");
            var billFromStr = $(ui.draggable).closest('table').attr('id');
            var billToStr = $(this).closest('table').attr('id');
            var rowIndex = $(ui.draggable).closest('tr').index();
            var billTo = billToStr.slice(-1);
            var billFrom = billFromStr.slice(-1);
            jqueryCall(billFrom, billTo, (rowIndex - 1));
            ui.draggable.remove();
            
        }
    });


});
