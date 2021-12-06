class BooksController < ApplicationController
   # before_action :require_current_user
   before_action :find_book, only: [:show, :update, :destroy]

   def index
      @user = current_user
      @books = current_user.books
      render json: @books.to_json(include: [:user, :bets])
      respond_to do |format|
         format.html { render 'index' }
         format.json { render json: @books.to_json(include: [:user, :bets]) }
      end
   end

   def show
      @user = User.find_by(id: @book.user_id)
      @players = @user.players
      respond_to do |format|
         format.html { render 'show' }
         format.json { render json: @book.to_json(include: [:user,
            :bets=>{include: [:player]}
         ])}
      end
   end

   def create
      @book = Book.new(book_params)
      if @book.save
         redirect_to current_user
      else
         flash[:message] = @book.errors.full_messages.to_sentence
         redirect_to current_user
      end
   end

   def update
      if @book.update(book_params)
         redirect_to current_user
      else
         flash[:message] = @book.errors.full_messages.to_sentence
         redirect_to current_user
      end
   end

   def destroy
      @book.destroy
      redirect_to current_user
   end

   private
   def book_params
      params.require(:book).permit(:name, :balance, :user_id)
   end

   def find_book
      @book = Book.includes(:bets).find(params[:id])
   end
end
