class SessionsController < ApplicationController
  def new
  end

  def show
     render json: {current_user: current_user}
  end

  def create
     @user = User.find_by(username: user_params[:username])
     if @user.authenticate(user_params[:password])
        login!(@user)      
     else
        flash[:message] = @user.errors.full_messages.to_sentence
        redirect_to new_session_path
     end
  end

  def destroy
     logout!
     redirect_to new_session_path
  end

  private

  def user_params
     params.require(:user).permit(:username, :password)
  end
end
