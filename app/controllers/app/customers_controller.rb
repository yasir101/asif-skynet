module App
  class CustomersController < ApplicationController
    before_action :set_customer, only: %i[edit update show]
    
    def index
      @q = Customer.ransack(params[:q])
      @customers = @q.result.page(params[:page]).per(10)  
    end
    
    def new
      get_current_params('new')
      @customer = Customer.new      
    end
    
    def create
      @customer = Customer.new(customer_params)
      if @customer.save!
        # sms_service = SMSService.new(@customer.id, @customer.name, @customer.mobile_primary)
        # sms_service.send_message
        
        redirect_to "#{edit_customer_path(@customer.id)}?step=profile", notice: 'Customer Profile was Successfully created'
      else
        render 'new', notice: 'Something went wrong'  
      end
    end
    
    def show; end
    
    def edit
      session[:step] = nil
      session[:step] = params['step']
      get_current_params('edit', @customer.id)
      # @customer.staff.build
    end
     
    def update
      if @customer.update!(customer_params)
        redirect_to "#{edit_customer_path(@customer.id)}?step=#{session[:step]}", notice: "Customer #{session[:step].capitalize} was Successfully updated"
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    def check_username
      username = CustomerPackage.where(company_id: params['company_id'],
        username: params['username']).any?
      render json: { data: username }
    end
    
    private
    
    def customer_params
      params.require(:customer).permit(:old_ref_no, :name, :father_name, :cnic, :mobile_primary, :mobile_secondary, :service_id, :staff_id,
                                        customer_area_attributes: %i[id country_id city_id area_id sub_area_id house_no pon_no address remarks],
                                        customer_package_attributes: %i[id package_id username password company_id company_package_id],
                                        customer_subscription_attributes: %i[id customer_package_id start_date expiry_date status renew],
                                        customer_device_info_attributes: %i[id device_name serial_no model mac_address],
                                      )
    end
    
    def set_customer
      @customer = Customer.find_by(id: params['id'])
    end
    
    def get_current_params(key, id=nil)
      if key == 'new'
        redirect_to "#{new_customer_path}?step=profile" if request.fullpath.include?(key) && !params['step'].present?
      elsif key == 'edit'
        redirect_to "#{edit_customer_path(id)}?step=profile" if request.fullpath.include?(key) && !params['step'].present?
      end
    end
  end
end
