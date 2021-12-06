class BetsController < ApplicationController
   # before_action :require_current_user, only: [:create, :edit]
   def index
      @bets = Bet.where(book_id: bet_params[:book_id])
         render json: @bets.to_json(include: [:user, :player, :book])
   end

   def create
      @user = User.find(bet_params[:user_id])
      @bet = @user.bets.new(bet_params)#if we create it through the user.new method, it will should have easier realtionss with user model
      if @bet.save
         @book = Book.find(bet_params[:book_id])
         render json: @book.to_json(include: [:bets => {include: [:player]}])
      else
         flash[:message] = @bet.errors.full_messages.to_sentence
         render json: {"error": @bet.errors.full_messages.to_sentence }
      end
   end

   def show
      @user = current_user
      @bet = Bet.find(params[:id])
      respond_to do |format|
         format.html { render 'show'}
         format.json { render json: @bet}
      end
   end

   def edit
      @bet = Bet.find(params[:id])
   end

   def update
      @bet = Bet.find(params[:id])
      if @bet.update(bet_params)
         redirect_to bet_path
      end
   end

   def destroy
      @bet = Bet.find(params[:id])
      @bet.destroy
      @bets = Bet.where(book_id: bet_params[:book_id])
      render json: @bets.to_json(include: [:user, :player, :book])
   end

   private
   def bet_params
      params.require(:bet).permit(:prop, :value, :juice, :player_id, :user_id, :book_id)
   end
end
