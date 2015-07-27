class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:error] = "You've already signed in!"
      redirect_to groceries_path
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome back, #{user.name}!"
      session[:user_id] = user.id
      redirect_to groceries_path
    end
  end
end
