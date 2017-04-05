class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # a user that matches the session user_id
    if session[:user_id]
      User.find(session[:user_id])
    else
      User.new(username: "GUEST")
    end
  end

end
