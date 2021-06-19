class ApplicationController < ActionController::Base
  helper_method :current_user

  def authenticate_user
    if session[:user_id] == nil
      redirect_to goals_path
    end

  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
