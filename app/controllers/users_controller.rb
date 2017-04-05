class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new( user_params )
    if @user.save
      flash[:success] = "Succesfully logged in!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                  :email,
                                  :password,
                                  :password_confirmation)
  end

end
