$(document).on("turbolinks:load", function () {
  $(document).on("change", "#receipt_book_total_pages", function () {
    let from = $("#receipt_book_from").val();
    let total_page = $("#receipt_book_total_pages").val();

    if (from) {
      let to = parseInt(from) + parseInt(total_page);
      console.log(to);
      $("#receipt_book_to").val(to);
    }
  });
});
