module App
  class MessagesController < ApplicationController
    def new
      @message = Message.new
      sms = SMSService.new('','','')
      @balance = sms.get_balance  
    end
    
    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to :new, notice: 'Sms was sent successfully'
      end
    end
    
    private
    
    def message_params
      params.require(:message).permit(:message_template_id, :number, :message_text)
    end
  end
end
