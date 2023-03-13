module App
  class AdditionalPaymentsController < ApplicationController
    before_action :set_customer, only: %i[new ]
    
    # def index
    #   @q = Customer.ransack(params[:q])
    #   filtered_customers(params['filter'], @q) if params['filter'].present?
    # end
    
    def new
      @additional_payment = AdditionalPayment.new
    end
    
    def create
      @additional_payment = AdditionalPayment.new(additional_payment_params)
      if @additional_payment.save!        
        redirect_to edit_customer_path(@additional_payment.customer_id), notice: 'Additional Charges was successfully created.'
      else
        render 'new', notice: 'Something went wrong'  
      end
      
    end
    
    def show; end
    
    def edit; end
     
    # def update
    #   if @customer.update!(customer_params)
    #     redirect_to edit_customer_path(@customer.id), notice: "Customer was Successfully updated"
    #   else
    #     render 'edit', notice: 'Something went wrong';
    #   end
    # end
    
    
    private
    
    def additional_payment_params
      params.require(:additional_payment).permit(:customer_id, :router_charges, :wire_charges, :installement_charges,:additional_payment)
    end
    
    def set_additional_payment
      @additional_payment = AdditionalPayment.find_by(id: params['id'])
    end

    def set_customer
      if params['customer_id'].present?
        customer = Customer.find_by(id: params['customer_id'])
        if customer
          @customer_id = customer.id
        else
          redirect_to request.referrer, alert: 'Customer Not Found' 
        end
      end
    end
    
  end
end
