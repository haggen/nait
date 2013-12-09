$(document).on('click', 'a[data-remote]', function() {
  Turbolinks.visit(location.pathname);
});