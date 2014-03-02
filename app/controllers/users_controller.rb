class UsersController < ApplicationController
  before_action :is_admin?
  before_action :get_user, except: [ :index, :new, :create ]

  def index
    @page_title = "Users"
    @users = User.all
  end

  def show
    @page_title = "User"
  end

  def new
    @page_title = "Add a User"
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def edit
    @page_title = "Edit a User"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
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