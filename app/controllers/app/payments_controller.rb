module App
  class PaymentsController < ApplicationController
    before_action :set_payment, only: %i[edit update]
    
    def index
      @q = Payment.ransack(params[:q])
      @payments = @q.result.page(params[:page]).per(20)
    end
    
    def new
      @payment = Payment.new
    end
    
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        redirect_to payments_path, notice: "Payment was successfully added"
      else
        render "new", alert: "Somethings went wrong"
      end
    end
    
    def edit; end
    
    def update
      if @payment.update(payment_params)
        redirect_to payments_path, notice: "Payment was successfully updated"
      else
        render "edit", alert: "Somethings went wrong"
      end
    end
    
    private
    
    def payment_params
      params.require(:payment).permit(:staff_id, :amount, :date, :payment_mode, :purpose, :reason)
    end
    
    def set_payment
      @payment = Payment.find_by(id: params[:id])
    end
  end
end