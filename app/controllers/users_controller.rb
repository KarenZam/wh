class UsersController < ApplicationController
  before_action :is_admin?
  before_action :get_user, except: [ :index, :new, :create ]

  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end

  private

  def get_user
    redirect_to "index", alert: "Can't find User #{params[:id]}." unless @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :username, :email, :password, :password_confirmation )
  end
end