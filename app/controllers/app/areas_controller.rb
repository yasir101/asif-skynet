module App
  class AreasController < ApplicationController
    before_action :set_area, only: %i[edit update]
    
    def index
      @q = Area.ransack(params[:q])
      @areas = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @area = Area.new
    end
    
    def create
      @area = Area.new(area_params)
      if @area.save
        redirect_to areas_path, notice: 'Area was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @area.update(area_params)
        redirect_to areas_path, notice: 'Area was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    private
    
    def area_params
      params.require(:area).permit(:name, :city_id)
    end
    
    def set_area
      @area = Area.find_by(id: params[:id])
    end
  end
end