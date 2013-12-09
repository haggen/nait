$(document).on('click', 'a[data-remote]', function() {
  NProgress.start();
});

$(document).on('ajax:complete', 'a[data-remote]', function() {
  Turbolinks.visit(location.pathname);
});