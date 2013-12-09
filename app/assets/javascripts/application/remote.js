$(document).on('ajax:complete', 'a[data-remote]', function() {
  Turbolinks.visit(location.pathname);
});