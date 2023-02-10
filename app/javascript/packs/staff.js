$(document).on("turbolinks:load", function () {
  $(document).on("change keyup paste", "#staff_username", function () {
    let username = $("#staff_username").val();
    console.log(username);
    $.ajax({
      url: `/app/staffs/check_username?username=${username}`,
      type: "get",
      success: function (result) {
        if (result.data == false) {
          $("#staff_username").css("border", "2px solid #29ed29");
          $("#username_error").html("");
          $("#submit_button").attr("disabled", false);
        } else {
          $("#staff_username").css("border", "2px solid red").prop("required", true);
          $("#username_error").html("Username is already taken");
          $("#submit_button").attr("disabled", true);
        }
      },
      error: function (data) {},
    });
  });
});
