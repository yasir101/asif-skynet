module App
  class CustomersController < ApplicationController
    before_action :set_customer, only: %i[edit update show settings activate deactivate]
    
    def index
      @q = Customer.ransack(params[:q])
      filtered_customers(params['filter'], @q) if params['filter'].present?
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
    
    def settings; end
    
    def deactivate
      @customer.update_attribute(:status, false)
      redirect_to settings_customer_path(@customer.id), notice: 'Customer was deactivated successfully.'
    end
    
    def activate
      @customer.update_attribute(:status, true)
      redirect_to settings_customer_path(@customer.id), notice: 'Customer was activated successfully.'    
    end
    
    def export_profile
      @customer = Customer.find_by(id: params['id'])
      respond_to do |format|
        format.xlsx {
          response.headers[
            'Content-Disposition'
          ] = "attachment; filename=customer_profile.xlsx"
        }
        format.html { render :export_profile }
      end
    end
    
    def export_billings
      @customer = Customer.find_by(id: params['id'])
      respond_to do |format|
        format.xlsx {
          response.headers[
            'Content-Disposition'
          ] = "attachment; filename=customer_billings.xlsx"
        }
        format.html { render :export_billings }
      end  
    end
    
    private
    
    def customer_params
      params.require(:customer).permit(:old_ref_no, :name, :father_name, :cnic, :mobile_primary, :mobile_secondary, :service_id, :staff_id, :residance, :welcome_message, :first_receiving, :company_id, :purchase_package_id, :username, :password_text, :package_id, :package_discounted_price,:country_id, :city_id, :area_id, :sub_area_id, :house_no, :pon_no, :address, :remarks,:device_name, :serial_no, :model, :mac_address, :internet_type_id, :joining_date, :username_expiry, :status)
    end
    
    def set_customer
      @customer = Customer.find_by(id: params['id'])
    end
    
    def filtered_customers(filter, q)
      @customers = q.result.status.page(params[:page]).per(25) if filter == 'a' 
      @customers = q.result.new_customer.page(params[:page]).per(25) if filter == 'nc' 
      @customers = q.result.subscribed_customer.page(params[:page]).per(25) if filter == 'sc' 
      @customers = q.result.expired_subscriptioned_customer.page(params[:page]).per(25) if filter == 'exc' 
      @customers = q.result.deactivated.page(params[:page]).per(25) if filter == 'd' 
    end
  end
end
