class TransactionsController < ApplicationController
 
  def create
     stock = Stock.check_db(params[:ticker])
     if stock.present?
       stock = stock.id
     end
     @transaction = Transaction.create(user_id: current_user.id, stock_id: stock) 
     redirect_to stock_view_path
  end
  
  def destroy
    @transaction = Transaction.find(params[:id])
    if @transaction.present?
      @transaction.destroy
    end
    redirect_to stock_view_path
  end

end
