module App
  class SubscriptionsController < ApplicationController
    before_action :set_customer, only: %i[index new create expire]
    
    def index
      @q = @customer.subscriptions.ransack(params[:q])
      @subscriptions = @q.result.order(created_at: :desc).page(params[:page]).per(10)
    end
    
    def new
      @subscription = @customer.subscriptions.build  
    end
    
    def create
      @subscription = @customer.subscriptions.create(subscription_params)
      redirect_to customer_subscriptions_path(@customer.id), notice: 'Package was successfully Subscribed'
    end
    
    def expire
      subscription = @customer.subscriptions.last
      subscription.update_attribute(:status, 'expired')
      redirect_to settings_customer_path(@customer.id), notice: 'Subscription was expired successfully.'
    end
    
    private
    
    def set_customer
      @customer = Customer.find_by!(id: params['customer_id'])
    end
    
    def subscription_params
      params.require(:subscription).permit(:customer_id, :start_date, :expiry_date, :subscription_type, :no_of_days, :status, :renew, :profit)
    end
  end
end
