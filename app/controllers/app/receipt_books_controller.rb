module App
  class ReceiptBooksController < ApplicationController
    def index
      @q = ReceiptBook.ransack(params[:q])
      @receipt_books = @q.result.page(params[:page]).per(10)
    end
    
    def new
      @receipt_book = ReceiptBook.new
    end
    
    def create
      @receipt_book = ReceiptBook.new(receipt_book_params)
      if @receipt_book.save
        generate_pages(@receipt_book)
        redirect_to receipt_books_path, notice: 'City was successfully created'
      else
        render 'new', notice: 'Something went wrong'
      end
    end
    
    private
    
    def receipt_book_params
      params.require(:receipt_book).permit(:staff_id, :issue_date, :from, :total_pages, :book_number, :to, :status,
                                           receipt_book_pages_attributes: %i[id receipt_book_id page_no amount])
    end
    
    def generate_pages(book)
      ActiveRecord::Base.transaction do
       book.from.upto(book.to) do |i|
        ReceiptBookPage.create!(receipt_book_id: book.id, page_no: i, amount: nil)
       end
      end
    end
  end
end