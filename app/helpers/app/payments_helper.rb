module App::PaymentsHelper
  def convert_amount(payment)
    if payment.purpose == 'advance_return' || payment.purpose == 'loan_return'
      "<span class='text-danger'>-#{payment.amount}</span>".html_safe
    else
      "<span class='text-success'>#{payment.amount}</span>".html_safe  
    end
  end
end
