ready = ->
  dateFormat = 'yy-mm-dd';
  $('.date-picker').datepicker(
    dateFormat: dateFormat,
    minDate: '-1y'
    maxDate: '+1y'
  );
$(document).ready(ready)
$(document).on('turbolinks:load', ready)