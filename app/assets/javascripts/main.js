$(document).on('turbolinks:load', function() {
  // インフルエンサー詳細ページの YouTube 部分 アコーディオンアクション
  $(".YouTube h3").on("click", function() {
    $(this).next().slideToggle();
  });

  $(".YouTube_2nd h3").on("click", function() {
    $(this).next().slideToggle();
  });
});
