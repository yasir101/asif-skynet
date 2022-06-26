module App
  class StaffsController < ApplicationController
    before_action :set_staff, only: %i[show edit update destroy restore]
    
    def index
      @q = Staff.ransack(params[:q])
      @staffs = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @staff = Staff.new
    end
    
    def create
      @staff = Staff.new(staff_params)
      if @staff.save
        redirect_to staffs_path, notice: 'Staff was successfully created'
      else
        render 'new', alert: 'Something went wrong'
      end
    end
    
    def show; end
    
    def edit; end
    
    def update
      if @staff.update(staff_params)
        redirect_to staffs_path, notice: 'Staff was successfully updated'
      else
        render 'edit', alert: 'Something went wrong';
      end
    end
    
    def destroy
      if @staff.destroy
        redirect_to staffs_path, info: 'Staff was successfully deleted'
      end
    end
    
    def archived
      @staffs = Staff.only_deleted
    end
    
    def restore
      @staff = Staff.only_deleted.where(id: params[:id]).first
      if @staff.recover
        redirect_to staffs_path, notice: 'Staff was successfully restored'
      end
    end
    
    private
    
    def staff_params
      params.require(:staff).permit(:staff_type_id, :blood_group_id, :full_name, :father_name, :dob, :cnic, :mobile_primary, :mobile_secondary, :address, :remarks, :joining, :starting_salary, :current_salary, :official_mobile_no, :official_mobile_model, :official_moterbike_no, :others)
    end
    
    def set_staff
      @staff = Staff.find_by(id: params[:id])
    end
  end
end
