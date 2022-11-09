$(document).on('turbolinks:load', function(){
  
  let last_book_id = $('#receipt_book_is_book_number').val();
  if(last_book_id != ""){
    $('#receipt_book_book_number').attr('readonly', true).addClass('readonly_field')    
  }
});