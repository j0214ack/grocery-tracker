class UsersController < ApplicationController
  before_action :require_logged_out

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Signed Up!'
      session[:user_id] = @user.id
      redirect_to groceries_path
    else
      flash[:error] = "You've provided with invalid information."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :name)
  end
end
