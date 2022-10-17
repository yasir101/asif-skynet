module App
  class CustomersController < ApplicationController
    before_action :set_customer, only: %i[edit update show]
    
    def index
      @q = Customer.ransack(params[:q])
      @customers = @q.result.page(params[:page]).per(25)  
    end
    
    def new
      @customer = Customer.new      
    end
    
    def create
      @customer = Customer.new(customer_params)
      if @customer.save!        
        redirect_to edit_customer_path(@customer.id), notice: 'Customer Profile was Successfully created'
      else
        render 'new', notice: 'Something went wrong'  
      end
    end
    
    def show; end
    
    def edit; end
     
    def update
      if @customer.update!(customer_params)
        redirect_to edit_customer_path(@customer.id), notice: "Customer was Successfully updated"
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    def check_username
      username = Customer.where(company_id: params['company_id'],
        username: params['username']).any?
      render json: { data: username }
    end
    
    private
    
    def customer_params
      params.require(:customer).permit(:old_ref_no, :name, :father_name, :cnic, :mobile_primary, :mobile_secondary, :service_id, :staff_id, :residance, :welcome_message, :first_receiving, :company_id, :purchase_package_id, :username, :password_text, :package_id, :package_discounted_price,:country_id, :city_id, :area_id, :sub_area_id, :house_no, :pon_no, :address, :remarks,:device_name, :serial_no, :model, :mac_address, :internet_type_id)
    end
    
    def set_customer
      @customer = Customer.find_by(id: params['id'])
    end
  end
end
