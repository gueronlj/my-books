class UsersController < ApplicationController
   def create
      @user = User.new(user_params)

      if @user.save
         redirect_to @user
      else
         flash[:message] = @user.errors.full_messages.to_sentence
         redirect_to new_user_path
      end
   end


   private

   def user_params
      params.require(:user).permit(:username, :password, :password_confirm)
   end
end
