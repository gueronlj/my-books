class BetsController < ApplicationController
   before_action :require_current_user, only: :create
   def index
      @bets = Bet.all
      respond_to do |format|
         format.html { render 'index'}#if request format is html show regular.
         format.json { render json: @bets}#if request format is json, show as json object
      end
   end

   def create
      @user = current_user
      @bet = @user.bets.new(bet_params)
      if @bet.save
         redirect_to @user
      else
         flash[:message] = @bet.errors.full_messages.to_sentence
         redirect_to @user
      end
   end

   def show
      @bet = Bet.find(params[:id])
      respond_to do |format|
         format.html { render 'show'}
         format.json { render json: @bet}
      end
   end

   private
   def bet_params
      params.require(:bet).permit(:prop, :value, :juice, :player_id, :user_id)
   end
end
