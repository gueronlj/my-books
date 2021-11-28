class SessionsController < ApplicationController
  def new
  end

  def create
     @user = User.find_by(username: params[:user][:username])

     if @user.authenticate(params[:user][:password])
        session[:current_user_id] = @user.id
        redirect_to @user

     else
        flash[:message] = @user.errors.full_messages.to_sentence
        redirect_to new_session_path
     end
  end

  def destroy

  end
end
