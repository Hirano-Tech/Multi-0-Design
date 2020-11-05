$(document).on('turbolinks:load', function() {
  $("#YouTube_Items dt").on("click", function() {
    $(this).next().slideToggle();
  });
});
