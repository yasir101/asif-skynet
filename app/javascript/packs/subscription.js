$(document).on('turbolinks:load', function(){
  
let url = window.location.pathname.split('/');
let urlParam = url[url.length -1]

if(urlParam === 'new'){
  hidefields();
}

// hide fields on new form
function hidefields(){
  $(".hide_no_of_days").addClass('d-none');
  $(".hide_start_date").addClass('d-none');
  $(".hide_end_date").addClass('d-none');
}

$("#subscription_subscription_type").on('change', function(){
   let subscription_type = $(this).val();
   if(subscription_type == 'Day'){
    show_day_fields();
   }else if(subscription_type == 'Month'){
    show_month_fields();
   }      
});

$("#subscription_no_of_days").on('keyup', function(){
  let days = $(this).val();
  let start_date = $("#subscription_start_date").val();
  $("#subscription_expiry_date").val(moment(start_date).add(days, 'd').format('YYYY-MM-DD'));
});

function show_day_fields(){
  $(".hide_no_of_days").removeClass('d-none');
  $(".hide_start_date").removeClass('d-none');
  $(".hide_end_date").removeClass('d-none')
  $("#subscription_end_date").attr('readonly', true).addClass('readonly_field');
}

function show_month_fields(){
  let start_date = $("#subscription_start_date").val();
  $(".hide_start_date").removeClass('d-none');
  $(".hide_end_date").removeClass('d-none');
  $("#subscription_end_date").val(moment(start_date).add(30, 'd').format('YYYY-MM-DD'));
  $("#subscription_end_date").attr('readonly', true).addClass('readonly_field');
}
});