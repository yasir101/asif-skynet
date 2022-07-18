module App
  class CustomersController < ApplicationController
    before_action :set_customer, only: %i[edit update]
    
    def index
      @q = Customer.ransack(params[:q])
      @customers = @q.result.page(params[:page]).per(10)  
    end
    
    def new
      @customer = Customer.new
      @customer.build_customer_area
      @customer.build_customer_package
    end
    
    def create
      @customer = Customer.new(customer_params)
      raise
      if @customer.save
        redirect_to "#{edit_customer_path(@customer.id)}?step=profile", notice: 'Customer was Successfully created'
      else
        render 'new', notice: 'Something went wrong'  
      end
    end
    
    def edit; end
     
    def update
      if @customer.update(customer_params)
        redirect_to "#{edit_customer_path(@customer.id)}?step=profile", notice: 'Customer was Successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    private
    
    def customer_params
      params.require(:customer).permit(:old_ref_no, :name, :father_name, :cnic, :mobile_primary, :mobile_secondary,
                                        customer_area_attributes: %i[country_id city_id area_id sub_area_id house_no street address remarks],
                                        customer_package_attributes: %i[package_id username password expiry])
    end
    
    def set_customer
      @customer = Customer.find_by(id: params['id'])
    end
  end
end
