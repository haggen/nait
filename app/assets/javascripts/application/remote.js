$(document).on('ajax:loading', 'a[data-remote], form[data-remote]', function() {
  NProgress.start();
});

$(document).on('ajax:complete', 'a[data-remote], form[data-remote]', function() {
  Turbolinks.visit(location.pathname);
});