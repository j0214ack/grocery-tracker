class SessionsController < ApplicationController

  before_action :require_singed_out

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome back, #{user.name}!"
      session[:user_id] = user.id
      redirect_to groceries_path
    else
      flash[:error] = "Wrong email or password."
      render :new
    end
  end

  def require_singed_out
    if logged_in?
      flash[:error] = "You've already signed in!"
      redirect_to groceries_path
    end
  end
end
