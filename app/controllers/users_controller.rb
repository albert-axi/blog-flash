class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to '/posts'
    else 
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
