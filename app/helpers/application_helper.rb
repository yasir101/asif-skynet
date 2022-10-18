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
end
