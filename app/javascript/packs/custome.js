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

  // On Company select - Get Purchase packages

  $("#company").on("change", function () {
    $.ajax({
      url: "/app/purchase_packages/purchase_packages_list?company_id=" + $(this).val(),
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
            options[options.length] = new Option(value.package_name, value.id);
          });
        }
      },
      error: function (data) {
        $(".pakage_selection").text("No package found");
      },
    });
  });

  // get purchase package price

  $("#customer_purchase_package_id").on("change", function () {
    $.ajax({
      url: "/app/purchase_packages/" + $(this).val(),
      type: "get",
      success: function (result) {
        if (result.data) {
          $("#customer_purchase_price").val(result.data.purchase_price);
        }
      },
    });
  });

  // get customer package price

  $("#customer_package_id").on("change", function () {
    $.ajax({
      url: "/app/packages/" + $(this).val(),
      type: "get",
      success: function (result) {
        if (result.data) {
          $("#customer_package_price").val(result.data.price);
        }
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

  $(document).on("change keyup paste", "#customer_username", function () {
    let username = $("#customer_username").val();
    let company_id = $("#company").val();
    console.log(company_id + "------" + username);
    $.ajax({
      url: `/app/customers/check_username?username=${username}&company_id=${company_id}`,
      type: "get",
      success: function (result) {
        if (result.data == false) {
          $("#customer_username").css("border", "2px solid #29ed29");
          $("#username_error").html("");
          $("#submit_button").attr("disabled", false);
        } else {
          $("#customer_username").css("border", "2px solid red").prop("required", true);
          $("#username_error").html("Username is already taken");
          $("#submit_button").attr("disabled", true);
        }
      },
      error: function (data) {},
    });
  });

  // area

  $("#customer_country_id").on("keyup", function () {
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

  $("#receiving_amount_received").on("keyup", function () {
    let received_amount = $(this).val();
    let actual_amount = $("#receiving_amount").val();

    const prev_balance = $("#prev_balance").val();

    let balance = parseInt(actual_amount) - parseInt(received_amount) + parseInt(prev_balance);

    // console.log(prev_balance);
    if (!isNaN(balance)) {
      $("#receiving_balance").val(balance);
    }
    // window.location.href = "?customer_id=" + customer_id;
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

  // search for receiving

  $("#search_button").on("click", function () {
    let customer_id = $("#search_customer_id").val();
    if (customer_id) {
      window.location.href = "?customer_id=" + customer_id;
    } else {
      alert("Provide customer ID");
    }
  });

  // To get all pages of perticular book

  $(document).on("change keyup paste", "#receiving_receipt_book_id", function () {
    let receipt_book_id = $(this).val();
    console.log(receipt_book_id);
    $.ajax({
      url: `/app/receipt_books/book_pages?receipt_book_id=${receipt_book_id}`,
      type: "get",
      success: function (result) {
        console.log(result);
        if (result.data.length == 0) {
          $("#receiving_receipt_book_page_id").empty();
          var options = $("#receiving_receipt_book_page_id").get(0).options;
          options[options.length] = new Option("No Page Found");
        } else {
          $("#receiving_receipt_book_page_id").empty();
          var options = $("#receiving_receipt_book_page_id").get(0).options;
          options[options.length] = new Option("Select Receipt Book Package", "");
          $.each(result.data, function (key, value) {
            options[options.length] = new Option(value.page_no, value.id);
          });
        }
      },
      error: function (data) {},
    });
  });

  // Get Sub_areas according to area

  $(document).on("change", "#customer_customer_area_attributes_area_id", function () {
    let area_id = $(this).val();
    console.log(area_id);
    $.ajax({
      url: `/app/sub_areas/get_sub_areas?area_id=${area_id}`,
      type: "get",
      success: function (result) {
        console.log(result);
        if (result.data.length == 0) {
          $("#customer_customer_area_attributes_sub_area_id").empty();
          var options = $("#customer_customer_area_attributes_sub_area_id").get(0).options;
          options[options.length] = new Option("No Page Found");
        } else {
          $("#customer_customer_area_attributes_sub_area_id").empty();
          var options = $("#customer_customer_area_attributes_sub_area_id").get(0).options;
          options[options.length] = new Option("Select Sub Area", "");
          $.each(result.data, function (key, value) {
            options[options.length] = new Option(value.name, value.id);
          });
        }
      },
      error: function (data) {},
    });
  });
});
