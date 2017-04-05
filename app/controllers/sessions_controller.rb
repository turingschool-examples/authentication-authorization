class SessionsController < ApplicationController

  def new
  end

  def create
    # get user identifier (username)
    user = User.find_by(username: params[:session][:username] )
    # check user password
    if user && user.authenticate( params[:session][:password] )
      flash[:success] = "Log In Successful"
      # track that they are logged in
      session[:user_id] = user.id
      # if password checks out then send them to profile
      redirect_to user_path(current_user)
    else
    # otherwise tell the user the process failed
      flash.now[:danger] = "Unsuccessful Log In"
      render :new
      # and send them back to the form to try again
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
