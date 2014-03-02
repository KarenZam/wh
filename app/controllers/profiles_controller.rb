class ProfilesController < ApplicationController
  before_action :is_admin?
  before_action :get_profile, except: [ :index, :new, :create ]

  def index
    @page_title = "Profiles"
    @profiles = Profile.all
  end

  def show
    @page_title = "Profile"
  end

  def new
    @page_title = "Add a Profile"
    @profile = Profile.new
  end

  def create
  end

  def edit
    @page_title = "Edit a Profile"
  end

  def update
  end

  def destroy
  end

  private

  def get_profile
    unless @profile = Profile.find( params[:id] )
      redirect_to profiles_url, alert: "Can't find Profile #{params[:id]}."
    end
  end

  def profile_params
    params.require(:profile).permit(
      :profile_name,
      :name_given,
      :name_family,
      :is_active,
      :user_id
    )
  end
end