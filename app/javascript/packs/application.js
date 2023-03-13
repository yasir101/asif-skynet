// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "@fortawesome/fontawesome-free/js/all";
import "chartkick/chart.js";


require("jquery");
require("bootstrap");
require("chartkick");
require("chart.js");
// window.Noty = require('noty');
import $ from "jquery";
window.jQuery = $;
window.$ = $;
// Add custom files here
require("../packs/theme.min.js");
require("../packs/jquery.mask.min.js");
require("../packs/custome.js");
require("../packs/customer.js");
require("../packs/receipt_book.js");
require("../packs/subscription.js");
require("../packs/staff.js");


window.Noty = require("../packs/noty.js");

var moment = require('moment')
global.moment = moment;
window.moment = moment;

$(document).on("turbolinks:load", function () {
  // Custom logic here
  $("#staff_cnic").mask("00000-0000000-0", { placeholder: "00000-0000000-0" });
  $("#staff_mobile_primary").mask("0000-0000000", {
    placeholder: "0333-1234567",
  });
  $("#staff_mobile_secondry").mask("0000-0000000", {
    placeholder: "0333-1234567",
  });
  $("#staff_official_mobile_no").mask("0000-0000000", {
    placeholder: "0333-1234567",
  });
  $("#customer_cnic").mask("00000-0000000-0", {
    placeholder: "Enter CNIC",
  });
  $("#customer_mobile_primary").mask("0000-0000000", {
    placeholder: "Enter Mobile (Primary)",
  });
  $("#customer_mobile_secondary").mask("0000-0000000", {
    placeholder: "Enter Mobile (Secondary)",
  });
  $("#additional_payment").on("click", function () {
    if ($(this).is(":checked")) {
      $(".additional_payment").removeClass("d-none");
    } else {
      $(".additional_payment").addClass("d-none");
    }
  });
  $("#router-charges").on("click", function () {
    if ($(this).is(":checked")) {
      $(".router").removeClass("d-none");
    } else {
      $(".router").addClass("d-none");
    }
  });
  $("#wire-charges").on("click", function () {
    if ($(this).is(":checked")) {
      $(".wire").removeClass("d-none");
    } else {
      $(".wire").addClass("d-none");
    }
  });
  $("#installment-charges").on("click", function () {
    if ($(this).is(":checked")) {
      $(".installments").removeClass("d-none");
    } else {
      $(".installments").addClass("d-none");
    }
  });
});

Rails.start();
Turbolinks.start();
ActiveStorage.start();

