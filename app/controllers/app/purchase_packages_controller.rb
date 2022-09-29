module App
  class PurchasePackagesController < ApplicationController
    before_action :set_purchase_package, only: %i[edit update]
    
    def index
      @q = PurchasePackage.ransack(params[:q])
      @purchase_packages = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @purchase_package = PurchasePackage.new
    end
    
    def create
      @purchase_package = PurchasePackage.new(purchase_package_params)
      if @purchase_package.save
        redirect_to purchase_packages_path, notice: 'Purchase Package was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def show; end
    
    def edit; end
    
    def update
      if @purchase_package.update(purchase_package_params)
        redirect_to purchase_packages_path, notice: 'Purchase Package was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    private
    
    def set_purchase_package
      @purchase_package = PurchasePackage.find_by(id: params[:id])
    end
    
    def purchase_package_params
      params.require(:purchase_package).permit(:company_id, :package_name, :purchase_price)
    end
  end
end
