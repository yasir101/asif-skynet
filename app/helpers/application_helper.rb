module ApplicationHelper
  def extract_url(val)
    val.split(/\W/).last
  end
  
  def get_service(customer)
    return 'N/A' if customer.nil?
    
    if customer&.service&.name == 'Internet'
      "#{customer&.service&.name} / #{customer&.internet_type&.name}"
    else
       "Cable"
    end
  end
  
  def subscription_status(val)
    return '<span class="text-danger">Expired</span>'.html_safe if val == 'expired'
    return '<span class="text-success">Active</span>'.html_safe if val == 'subscribed'
  end
end
