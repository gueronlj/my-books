class PlayersController < ApplicationController
   before_action :require_current_user, only: :create
   def index
      @players = Player.all
      respond_to do |format|
         format.html { render 'index'}#if request format is html show regular.
         format.json { render json: @players.to_json(include: [:bets, :user])}#if request format is json, show as json object
      end
   end
   def create
      @player = current_user.players.new(player_params)
      if @player.save
         redirect_to current_user
      else
         flash[:message] = @player.errors.full_messages.to_sentence
         redirect_to current_user
      end
   end

   def show
      @player = Player.includes(:bets).find(params[:id])
      respond_to do |format|
         format.html { render 'show'}
         format.json { render json: @player.to_json(include: [:bets, :user])}
      end
   end

end
