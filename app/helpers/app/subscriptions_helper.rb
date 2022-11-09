module App::SubscriptionsHelper
  def get_profit(customer)
    profit = calculate_profit(customer.package.price, customer.purchase_package.purchase_price)
    !customer.package_discounted_price.nil? ? profit - customer.package_discounted_price : profit
  end
  
  def calculate_profit(pp, pppp)
    pp.to_i - pppp.to_i
  end
end
