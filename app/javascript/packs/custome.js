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

  // area

  $("#customer_country_id").on("change", function () {
    console.log(this.text);
    // let prev = $("#customer_address").val();
    // prev + $(this).val();
  });

  $("#customer_customer_billing_info_attributes_billing_type").on("change", function () {
    let type = $(this).val();
    if (type == "Package Expiry Date") {
      let expiry = $("#package_expiry").val();
      $("#customer_customer_billing_info_attributes_billing_date").val(expiry).prop("readonly", true);
    } else {
      $("#customer_customer_billing_info_attributes_billing_date").val("").prop("readonly", false);
    }
  });

  // Receiving

  $("#receiving_customer_id").on("change", function () {
    let customer_id = $(this).val();
    window.location.href = "?customer_id=" + customer_id;
  });

  $("#receiving_staff_id").on("change", function () {
    let staff_id = $(this).val();

    let url = new URL(window.location.href);
    if (url.searchParams.has("staff_id") == false) {
      window.location.href = window.location.href + "&staff_id=" + staff_id;
    } else if (url.searchParams.has("staff_id") == true) {
      var searchParams = new URLSearchParams(window.location.search);
      searchParams.set("staff_id", staff_id);
      window.location.search = searchParams.toString();
    }
  });

  $("#receiving_receipt_book_id").on("change", function () {
    let receipt_book_id = $(this).val();

    let url = new URL(window.location.href);
    if (url.searchParams.has("receipt_book_id") == false) {
      window.location.href = window.location.href + "&receipt_book_id=" + receipt_book_id;
    } else if (url.searchParams.has("receipt_book_id") == true) {
      var searchParams = new URLSearchParams(window.location.search);
      searchParams.set("receipt_book_id", receipt_book_id);
      window.location.search = searchParams.toString();
    }
  });
});
