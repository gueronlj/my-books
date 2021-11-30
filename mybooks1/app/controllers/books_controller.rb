class BooksController < ApplicationController
   before_action :require_current_user

   def index
      @books = Book.all
      respond_to do |format|
         format.html { render 'index' }
         format.json { render json: @books.to_json(include: [:user, :bets]) }
      end
   end

   def show
      @user = current_user
      @players = current_user.players
      @book = Book.find(params[:id])
      respond_to do |format|
         format.html { render 'show' }
         format.json { render json: @book.to_json(include: [:user, :bets]) }
      end
   end

   private
   def book_params
      params.require(:book).permit(:name, :balance, :user_id)
   end
end
