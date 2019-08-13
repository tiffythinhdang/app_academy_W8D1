class UsersController < ApplicationController
  before_action :require_login, only: [:update, :edit, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to subs_url
    else 
      flash.now[:errors] = @user.errors.full_messsages
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else 
      flash.now[:errors] = @user.errors.full_messsages
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    logout
    redirect_to new_user_url
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
