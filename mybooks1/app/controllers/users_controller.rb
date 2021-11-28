class UsersController < ApplicationController
   before_action :find_user, only: [:edit, :show, :update]#use teh find_user function before hitting these select routes
   before_action :find_current_user

   def index
      @users = User.all

      respond_to do |format|
         format.html { render 'index'}#if request format is html show regular.
         format.json { render json:  @users}#if request format is json, show as json object
      end
   end

   def create
      @user = User.new(user_params)

      if @user.save
         redirect_to users_path
      else
         flash[:message] = @user.errors.full_messages.to_sentence
         redirect_to new_user_path
      end
   end

   def show
   end

   private

   def user_params
      params.require(:user).permit(:username, :password)
   end

   def find_user
      @user = User.find(params[:id])#put this in a function so we dont have to write in every route. MORE DRY
   end

   def find_current_user
      @current_user = User.find(session[:current_user_id]) if
      session[:current_user_id]#If something is stored in current_user_id, use it to look up a user
   end
end
