class ApplicationController < ActionController::Base
   skip_before_action :verify_authenticity_token
   helper_method :current_user

   private

   def login!(user)
      session[:current_user_id] = user.id
   end

   def logout!
      session[:current_user_id] = nil
   end

   def current_user
      @current_user ||= User.find_by(id: session[:current_user_id])
   end

   def require_current_user
      redirect_to new_session_path unless current_user
   end

   private
   def player_params
      params.require(:player).permit(:name, :contact, :balance)
   end
end
