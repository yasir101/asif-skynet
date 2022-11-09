module App::CustomersHelper
  def customer_purchase_package(customer)
    customer.purchase_package.purchase_price if request.url.include?('edit')
  end
  
  def customer_package(customer)
    customer.package.price if request.url.include?('edit')
  end
  
  def field_required(customer)
    return true if request.url.include?('new')
  end
  
  def get_subscription_bg(customer)
    if customer&.subscriptions&.count&.zero?
      'transparent_subscription'
    elsif customer&.subscriptions&.last&.status == true
      'active_subscription'
    elsif customer&.subscriptions&.last&.status == false
      'expire_subscription'    
    end
  end
end
