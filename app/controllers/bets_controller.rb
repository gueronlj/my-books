class BetsController < ApplicationController
   # before_action :require_current_user, only: [:create, :edit]
   def index
      @bets = Bet.all
         render json: @bets.to_json(include: [:user, :player, :book])
   end

   def create
      @user = User.find(bet_params[:user_id])
      @bet = @user.bets.new(bet_params)#if we create it through the user.new method, it will should have easier realtionss with user model
      if @bet.save
         @book = Book.find(bet_params[:book_id])
         render json: @book.to_json(include: [:bets => {include: [:player]}])
      else
         # flash[:message] = @bet.errors.full_messages.to_sentence
         render json: {"error": @bet.errors.full_messages.to_sentence }
      end
   end

   def show
      @bet = Bet.find(params[:id])
      render json: @bet.to_json(include: [:user, :player])
   end

   def edit
      @bet = Bet.find(params[:id])
   end

   def update
      @bet = Bet.find(params[:id])
      if @bet.update(bet_params)
         render json: @bet.to_json(include: [:user, :player])
      else
         render json:{"error":@bet.errors.full_messages.to_sentence}
      end
   end

   def destroy
      @bet = Bet.find(params[:id])
      @bet.destroy
      render json: @bet.to_json(include: [:user, :player, :book])
   end

   private
   def bet_params
      params.require(:bet).permit(:prop, :value, :juice, :player_id, :user_id, :book_id)
   end
end
