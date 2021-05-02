class UsersController < ApplicationController

      before_action :authenticate_user!
    
      def index
        @users = User.all
      end
    
      def show
        @user = User.find(params[:id])
      end
    
      def create
        @user = User.new(user_params)
        @user.save 
        
        redirect_to home_path               
      end
    
      def update
        @user = User.find(params[:id])
        @user.update(user_params)
      end
    
      def edit
        @user = User.find(params[:id])
      end
    
      def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to home_path  
      end

      def my_portfolio
        @tracked_stocks = current_user.broker_stocks
      end

      def stock_view
        now = Time.now
        @stock_brokers = Stock.all.order(:ticker)
        @brought_stocks = current_user.transactions.order(:created_at)
        @notifications_recent = Transaction.where(user_id: current_user.id, updated_at: 10.minutes.ago..now).limit(5)
        @notifications_24hrs = Transaction.where(user_id: current_user.id, updated_at: 24.hours.ago..now).limit(6)
      end

      private 

      def user_params
        params.require(:user).permit(:name, :role)
      end

end
