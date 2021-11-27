class BetsController < ApplicationController
  def index
     @bets = Bet.all
  end

  def show
     @bets = Bet.find(params[:id])
  end

  def new
     @bets = Bet.new
  end

  def create
   bet = Bet.create(bet_params)
   redirect_to bets_path
  end


  def edit
     @bets = Bet.find(params[:id])
  end


  def update
     bet = Bet.find(params[:id])
     @bets.update

     redirect_to bets_path
  end

  def delete
     bet = Bet.find(params[:id])
     bet.destroy

     redirect_to bet_path
  end


  private

  def bet_params
     params.require(:bet).permit(:player, :prop, :value, :win)
  end
end
