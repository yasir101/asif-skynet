$(document).on("turbolinks:load", function () {
  // Receipt Book page number Calculation
  $(document).on("change", "#receipt_book_total_pages", function () {
    let from = $("#receipt_book_from").val();
    let total_page = $("#receipt_book_total_pages").val();

    if (from) {
      let to = parseInt(from) - 1 + parseInt(total_page);
      $("#receipt_book_to").val(to);
    }
  });

  // On Company select - Get Company packages

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
          options[options.length] = new Option("Select Company Package", "");
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

  // On Company package select - Get Customer Packages ( Packages )

  $(document).on("change keyup paste", "#customer_customer_package_attributes_company_package_id", function () {
    let company_package_id = $(this).val();
    console.log(company_package_id);
    $.ajax({
      url: `/app/packages/customer_package_list?company_package_id=${company_package_id}`,
      type: "get",
      success: function (result) {
        console.log(result);
        if (result.data.length == 0) {
          $("#customer_customer_package_attributes_package_id").empty();
          var options = $("#customer_customer_package_attributes_package_id").get(0).options;
          options[options.length] = new Option("No Package Found");
        } else {
          $("#customer_customer_package_attributes_package_id").empty();
          var options = $("#customer_customer_package_attributes_package_id").get(0).options;
          options[options.length] = new Option("Select Customer Package", "");
          options[options.length] = new Option(result.data.name, result.data.id);
          // $.each(result.data, function (key, value) {
          //   options[options.length] = new Option(value.name, value.id);
          // });
        }
      },
      error: function (data) {},
    });
  });

  // check username is unique

  $(document).on("change keyup paste", "#customer_customer_package_attributes_username", function () {
    let username = $("#customer_customer_package_attributes_username").val();
    let company_id = $("#company").val();
    console.log(company_id + "------" + username);
    $.ajax({
      url: `/app/customers/check_username?username=${username}&company_id=${company_id}`,
      type: "get",
      success: function (result) {
        if (result.data == false) {
          $("#customer_customer_package_attributes_username").css("border", "2px solid #29ed29");
          $("#username_error").html("");
          $("#submit_button").attr("disabled", false);
        } else {
          $("#customer_customer_package_attributes_username").css("border", "2px solid red").prop("required", true);
          $("#username_error").html("Username is already taken");
          $("#submit_button").attr("disabled", true);
        }
      },
      error: function (data) {},
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
