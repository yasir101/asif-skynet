module App
  class PackagesController < ApplicationController
    before_action :set_package, only: %i[edit update]
    
    def index
      @q = Package.ransack(params[:q])
      @packages = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @package = Package.new
    end
    
    def create
      @package = Package.new(package_params)
      if @package.save
        redirect_to packages_path, notice: 'Package was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @package.update(package_params)
        redirect_to packages_path, notice: 'Package was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    private
    
    def package_params
      params.require(:package).permit(:company_id, :company_package_id, :name, :price)
    end
    
    def set_package
      @package = Package.find_by(id: params[:id])
    end
  end
end
