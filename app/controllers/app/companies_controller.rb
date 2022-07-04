module App
  class CompaniesController < ApplicationController
    before_action :set_company, only: %i[edit update]
    
    def index
      @q = Company.ransack(params[:q])
      @companies = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @company = Company.new
    end
    
    def create
      @company = Company.new(company_params)
      if @company.save
        redirect_to companies_path, notice: 'Company was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @company.update(company_params)
        redirect_to companies_path, notice: 'Company was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    private
    
    def company_params
      params.require(:company).permit(:name)
    end
    
    def set_company
      @company = Company.find_by(id: params[:id])
    end
  end
end
