class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #returns the User that is currently logged in
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  
  def require_login
    redirect_to root_path if session[:user_id] == nil
  end

  def require_correct_user
    user = User.find(current_user)
    redirect_to "/users/#{current_user.id}" if current_user != user
  end

end
