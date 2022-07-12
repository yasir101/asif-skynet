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

  // company packages list

  $("#company").on("change", function () {
    $.ajax({
      url: "/app/company_packages/package_list?company_id=" + $(this).val(),
      type: "get",
      success: function (result) {
        console.log(result.data);
        if (result.data.length == 0) {
          $(".pakage_selection").empty();
          var options = $(".pakage_selection").get(0).options;
          options[options.length] = new Option("No Package Found");
        } else {
          $(".pakage_selection").empty();
          var options = $(".pakage_selection").get(0).options;
          $.each(result.data, function (key, value) {
            options[options.length] = new Option(value.name, value.id);
          });
        }
      },
      error: function (data) {
        $(".pakage_selection").text("No package found");
      },
    });
  });
});
