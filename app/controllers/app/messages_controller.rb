module App
  class MessagesController < ApplicationController
    def new
      @message = Message.new  
    end
    
    def create
      @message = Message.new(message_params)
    end
    
    private
    
    def message_params
      params.require(:message).permit(:message_template_id, :number, :message_text)
    end
  end
end
