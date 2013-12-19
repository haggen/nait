$(document).on('ready page:change', function() {
  var total = 0;

  $('div.chart-bar div').each(function() {
    var that = $(this);
    total += parseInt(that.attr('data-amount'), 10);
  });

  $('div.chart-bar div').each(function() {
    var that = $(this);
    that.width(parseInt(that.attr('data-amount'), 10) * 100 / total + '%');
  });
});
