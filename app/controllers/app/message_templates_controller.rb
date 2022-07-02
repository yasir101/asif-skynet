module App
  class MessageTemplatesController < ApplicationController
    before_action :set_message_template, only: %i[edit update destroy]
    
    def index
      @q = MessageTemplate.ransack(params[:q])
      @message_templates = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @message_template = MessageTemplate.new
    end
    
    def create
      @message_template = MessageTemplate.new(message_template_params)
      if @message_template.save
        redirect_to message_templates_path, notice: 'Template was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    def edit; end
    
    def update
      if @message_template.update(message_template_params)
        redirect_to message_templates_path, notice: 'Template was successfully updated'
      else
        render 'edit', notice: 'Something went wrong';
      end
    end
    
    def destroy
      if @message_template.destroy
        redirect_to message_templates_path, info: 'Template was successfully deleted'
      end
    end
    
    private
    
    def message_template_params
      params.require(:message_template).permit(:title, :message)
    end
    
    def set_message_template
      @message_template = MessageTemplate.find_by(id: params[:id])
    end
  end
end
