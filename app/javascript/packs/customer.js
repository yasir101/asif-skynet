  
$(document).on('turbolinks:load', function(){

  $('#additional').on('click', function(){
    var customer = $(this).data('customer-id');
    console.log(customer);
    var result = confirm("Do you want to proceed to additional payments?");
    if (result) {
      window.location.href = '/app/additional_payments/new?customer_id='+ customer;

    } else {
      window.location.href = '/app/receivings/new?customer_id=' + customer + '&term=first';
    }
  });
  
  
  
  // hide all form on page load if url includes new
  let url = window.location.pathname.split('/');
  let urlParam = url[url.length -1]
  if( urlParam == 'new'){
    $(".profile_fields").addClass('d-none');
    $(".company_package_fields").addClass('d-none');
    $(".area_fields").addClass('d-none');
    $(".device_fields").addClass('d-none');
    $(".assign_fields").addClass('d-none');
  }
  
  
  // Get service value of customer new form to show fields
  $('#customer_service_id').on('change', function(){
    service = $("#customer_service_id option:selected").text();
    if(service === 'Internet'){
      profileFields('remove', service);
      companyPackageFields('remove', service);
      area_fields('remove', service);
      device_fields('remove', service);
      assign_fields('remove', service);
    }else if(service === 'Cable'){
      profileFields('remove', service);
      area_fields('remove', service);
      assign_fields('remove', service);
      companyPackageFields('remove', service);
    }
    
  });
  
  function profileFields(val = '',service){
    val === 'remove' ? $(".profile_fields").removeClass('d-none') : $(".profile_fields").addClass('d-none') 
  };
  
  function companyPackageFields(val = '',service){
    val === 'remove' ? $(".company_package_fields").removeClass('d-none') : $(".company_package_fields").addClass('d-none')
    if(service === 'Cable'){
      $(".company_field").addClass('d-none');
      $(".username_password_field").addClass('d-none');
      $(".purchase_package_field").addClass('d-none');
    } 
  }
  
  function area_fields(val = '',service){
    val === 'remove' ? $(".area_fields").removeClass('d-none') : $(".area_fields").addClass('d-none')
    if(service === 'Cable'){
      $("#customer_pon_no").prop("readonly", true).addClass("readonly_field");
    } 
  }
  
  function device_fields(val = '',service){
    val === 'remove' ? $(".device_fields").removeClass('d-none') : $(".device_fields").addClass('d-none') 
  }
  
  function assign_fields(val = '',service){
    val === 'remove' ? $(".assign_fields").removeClass('d-none') : $(".assign_fields").addClass('d-none') 
  }
});

