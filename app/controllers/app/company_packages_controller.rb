module App
  class CompanyPackagesController < ApplicationController
    before_action :set_company_package, only: %i[edit update]
    
    def index
      @q = CompanyPackage.ransack(params[:q])
      @company_packages = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @company_package = CompanyPackage.new
    end
    
    def create
      @company_package = CompanyPackage.new(company_params)
      if @company_package.save
        redirect_to company_packages_path, notice: 'Company Package was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @company_package.update(company_params)
        redirect_to company_packages_path, notice: 'Company was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    private
    
    def company_params
      params.require(:company_package).permit(:company_id, :name, :price)
    end
    
    def set_company_package
      @company_package = CompanyPackage.find_by(id: params[:id])
    end
  end
end
