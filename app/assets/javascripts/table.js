$(document).on('page:load', function() {
  $(".clickable-row").click(function() {
    window.document.location = $(this).data("href");
  });
});
