module App
  class CitiesController < ApplicationController
    before_action :set_city, only: %i[edit update]
    
    def index
      @q = City.ransack(params[:q])
      @cities = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @city = City.new
    end
    
    def create
      @city = City.new(city_params)
      if @city.save
        redirect_to cities_path, notice: 'City was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @city.update(city_params)
        redirect_to cities_path, notice: 'City was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    private
    
    def city_params
      params.require(:city).permit(:name, :country_id)
    end
    
    def set_city
      @city = City.find_by(id: params[:id])
    end
  end
end
