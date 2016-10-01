
function pageLoad() {
    $(".add tr").click(function () {
        var tds = $(this).addClass("selected").siblings().removeClass("selected");
        var values = $(this).text();
        var row_index = $(this).index();
        $("#lblSelectedRow").val(values.toString());
        $("#lblSelectedRowIndex").val(row_index.toString());
    });

    $(function () {
        $('.footable').footable();
    });

    $(".money_button").click(function () {
        if ($('.modal_span').is(':visible')) {
            var txt = $('.modal_span').text() + $(this).text();
            $('.modal_span').text(txt);
            $('#tableNumber').val(txt);
        }
        else if ($('#lblNumGuests').is(':visible')) {
            var txt = $('#lblNumGuests').text() + $(this).text();
            $('#lblNumGuests').text(txt);
            $('#numberGuests').val(txt);
        }
        return false;
    });

    $(".clear_button").click(function () {
        if ($('.modal_span').is(':visible')) {
            $('.modal_span').text("");
            $('#tableNumber').val("");
        }
        else if ($('#lblNumGuests').is(':visible')) {
            $('#lblNumGuests').text("");
            $('#numberGuests').val("");
        }
        return false;
    });

    $(".close_new_table").click(function () {

            $('#txtTblNum').text("");
            $('#tableNumber').val("");
            $('#lblNumGuests').text("");
            $('#lblTblNumber').text("Table Number");
            $('#lblNumGuests').text("");
            $('#tblNumError').text("");
            $('#numberGuests').val("");
            $('#txtTblNum').show();
            $('#lblNumGuests').hide();
    });

    $(".money_back_button").click(function () {
        if ($('.modal_span').is(':visible')) {
            var txt = $('.modal_span').text() + $(this).text();
            $('.modal_span').text(txt.slice(0, -1));
            $('#tableNumber').val(txt.slice(0, -1));
        }
        else if ($('#lblNumGuests').is(':visible')) {
            var txt = $('#lblNumGuests').text() + $(this).text();
            $('#lblNumGuests').text(txt.slice(0, -1));
            $('#numberGuests').val(txt.slice(0, -1));
        }
        return false;
        return false;
    });
}


function Closepopup() {
    $('.modal').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
}

function Openpopup() {
    $('.modal').modal('show');
    $('body').addClass('modal-open');
    $('.modal-backdrop').add();
}

function OpenGameOverpopup() {
    $('.modal').modal({
        backdrop: 'static',
        keyboard: false
    })
    $('.modal').modal('show');
}

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
        closeToggleIfVisiblie();
    });

    $("#hlAbout").click(function () {

        $('html, body').animate({ scrollTop: $("#divAbout").offset().top - $('#nav_bar').height() }, 'slow');
        closeToggleIfVisiblie();
    });

    $("#hlSkills").click(function () {

        $('html, body').animate({ scrollTop: $("#divSkills").offset().top - $('#nav_bar').height() }, 'slow');
        closeToggleIfVisiblie();
    });

    $("#hlPortfolio").click(function () {

        $('html, body').animate({ scrollTop: $("#divPortfolio").offset().top - $('#nav_bar').height() }, 'slow');
        closeToggleIfVisiblie();
    });

    $("#hlContact").click(function () {

        $('html, body').animate({ scrollTop: $("#divContact").offset().top - $('#nav_bar').height() }, 'slow');
        closeToggleIfVisiblie();
    });


        $(function() {
            $(".dial").knob();
        });
  
        var closeToggleIfVisiblie = function () {
            if ($('.navbar-toggle').is(':visible')) {
                $('.navbar-toggle').click();
            };
        };

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
