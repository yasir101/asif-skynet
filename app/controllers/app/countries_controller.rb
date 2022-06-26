module App
  class CountriesController < ApplicationController
    before_action :set_country, only: %i[edit update]
    
    def index
      @q = Country.ransack(params[:q])
      @countries = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @country = Country.new
    end
    
    def create
      @country = Country.new(country_params)
      if @country.save
        redirect_to countries_path, notice: 'Country was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @country.update(country_params)
        redirect_to countries_path, notice: 'Country was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    private
    
    def country_params
      params.require(:country).permit(:name)
    end
    
    def set_country
      @country = Country.find_by(id: params[:id])
    end
  end
end