(function($) {

  $.fn.tip = function() {
    return this.each(function() {
      var that, offset, title, tip;
      
      that = $(this);
      offset = that.offset();
      title = that.attr('title');
      
      tip = $('<span class="tip">');

      tip.append('<span>' + title + '</span>');
      
      tip.css({
        top: offset.top + that.height() + 10,
        left: offset.left
      });
      
      that.append(tip);
      // that.addClass('tipped');
    });
  };

})(this.jQuery);