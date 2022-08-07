module App
  class ReceivingsController < ApplicationController
    def index
      @q = Receiving.ransack(params[:q])
      @receivings = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @receiving = Receiving.new
      if params['customer_id'].present?
        @customer = Customer.find_by(id: params['customer_id'])
      end
      if params['staff_id'].present?
        @staff = Staff.find_by(id: params['staff_id'])
      end
      if params['receipt_book_id'].present?
        book = ReceiptBook.find_by(id: params['receipt_book_id'])
        @receipt_book_pages = book&.receipt_book_pages
      end
    end
    
    def create
      @receiving = Receiving.new(receiving_params)
      if @receiving.save!
        redirect_to receivings_path, notice: 'Receivng was Successfully created'
      else
        render 'new', notice: 'Something went wrong'  
      end
    end
    
    private
    
    def receiving_params
      params.require(:receiving).permit(:customer_id, :staff_id, :amount, :service, :receipt_book_id, :receipt_book_page_id, :receiving_date, :balance)
    end
  end
end
