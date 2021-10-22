class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    return redirect_to '/login' unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
		redirect_to '/posts'
  end

  def destroy
    session.delete :user_id
    puts session.inspect
    redirect_to "/authors"
  end
end