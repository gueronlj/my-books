class PlayersController < ApplicationController
   before_action :require_current_user, only: :create
   def index
      @players = Player.all
      respond_to do |format|
         format.html { render 'index'}#if request format is html show regular.
         format.json { render json: @players}#if request format is json, show as json object
      end
   end
   def create

   end

   def show
      @player = Player.includes(:bets).find(params[:id])
   end

end
