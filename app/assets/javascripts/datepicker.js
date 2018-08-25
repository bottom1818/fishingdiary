var format = 'yy-mm-dd'

// 開始日の設定
var start = $(".start-datepicker").datepicker({
    dateFormat: 'yy-mm-dd'
}).on("change", function () {
    // 開始日が選択されたとき
    // 終了日の選択可能最小日を設定
    end.datepicker("option", "minDate", getDate(this));
});

// 終了日の設定
var end = $(".end-datepicker").datepicker({
    dateFormat: 'yy-mm-dd'
}).on("change", function () {
    // 開始日が選択されたとき
    // 開始日の選択可能最大日を設定
    start.datepicker("option", "maxDate", getDate(this));
});


/**
 * 選択された日付をminDate,maxDate用に変換
 */

function getDate(element) {
    var date;
    try {
        date = $.datepicker.parseDate(format, element.value);
    } catch (error) {
        date = null;
    }
    return date;
}
