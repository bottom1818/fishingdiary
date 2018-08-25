ready = ->
  dateFormat = 'yy-mm-dd';
  $('.date-picker').datepicker(
    dateFormat: dateFormat,
    minDate: '-1y'
    maxDate: '+1y'
  );
  
  start = $('.start-date-picker').datepicker(
    dateFormat: dateFormat,
    minDate: '-1y'
    maxDate: '+1y'
  ).on('change', ->
    # 開始日が選択されたとき
    # 終了日の選択可能最小日を設定
    end.datepicker 'option', 'minDate', getDate(this)
    return
　);
  
  end = $('.end-date-picker').datepicker(
    dateFormat: dateFormat,
    minDate: '-1y'
    maxDate: '+1y'
  ).on('change', ->
    # 開始日が選択されたとき
    # 開始日の選択可能最大日を設定
    start.datepicker 'option', 'maxDate', getDate(this)
    return
  );

###
getDate = (element) ->
  date = undefined
  try
    date = $.datepicker.parseDate(format, element.value)
  catch error
    date = null
  date
###

$(document).ready(ready)
$(document).on('turbolinks:load', ready)