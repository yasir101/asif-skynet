module App
  class SubAreasController < ApplicationController
    before_action :set_sub_area, only: %i[edit update]
    
    def index
      @q = SubArea.ransack(params[:q])
      @sub_areas = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @sub_area = SubArea.new
    end
    
    def create
      @sub_area = SubArea.new(sub_area_params)
      if @sub_area.save
        redirect_to sub_areas_path, notice: 'Sub Area was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @sub_area.update(sub_area_params)
        redirect_to sub_areas_path, notice: 'Sub Area was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    def get_sub_areas
      area = Area.find_by(id: params['area_id'])
      @sub_areas = area.sub_areas
      if @sub_areas
        render json: { data: @sub_areas }
      else
        render json: { data: {} }
      end
    end
    
    private
    
    def sub_area_params
      params.require(:sub_area).permit(:name, :area_id)
    end
    
    def set_sub_area
      @sub_area = SubArea.find_by(id: params[:id])
    end
  end
end
