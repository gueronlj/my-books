class PlayersController < ApplicationController
   before_action :find_player, only: [:edit, :show, :update, :destroy]

   def index
      @players = Player.all
      respond_to do |format|
         format.html { render 'index'}#if request format is html show regular.
         format.json { render json: @players.to_json(include: [:bets, :user])}#if request format is json, show as json object
      end
   end

   def create
      @user = User.find(player_params[:user_id])
      @player = @user.players.new(player_params)
      if @player.save
         @players = Player.where("user_id=?", player_params[:user_id])
         render json: @players.to_json(include: [:bets, :user])
      else
         flash[:message] = @player.errors.full_messages.to_sentence
         render json: {"error": @player.errors.full_messages.to_sentence }
      end
   end

   def show
   end

   def edit
   end

   def update
      @player.update(player_params)
      render json: @player.to_json(include: [:bets, :user])
   end

   def destroy
      @player.destroy
      if @players= Player.where("user_id=?", player_params[:user_id])
         render json: @players.to_json(include: [:bets, :user])
      else
         render json: {"error":@players.errors.full_messages.to_sentence}
   end

   private
   def player_params
      params.require(:player).permit(:name, :contact, :balance, :wins, :user_id)
   end

   def find_player
      @player = Player.includes(:bets).find(params[:id])#put this in a function so we dont have to write in every route. MORE DRY
   end

end
