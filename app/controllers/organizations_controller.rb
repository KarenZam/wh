class OrganizationsController < ApplicationController
  before_action :is_admin?
  before_action :get_organization, except: [ :index, :new, :create ]

  def index
    @page_title = "Startups"
    @organizations = Organization.all
  end

  def show
    @page_title = "Startup"
  end

  def new
    @page_title = "Add a Startup"
    @organization = Organization.new
  end

  def create
  end

  def edit
    @page_title = "Edit a Startup"
  end

  def update
  end

  def destroy
    if @organization.destroy
      flash[:notice] = "Organization #{params[:id]} destroyed."
    else
      flash[:alert] = "Failed to destroy Organization #{params[:id]}."
    end

    redirect_to organizations_url
  end

  private

  def get_organization
    unless @organization = Organization.find( params[:id] )
      redirect_to organizations_url, alert: "Can't find Organization #{params[:id]}."
    end
  end

  def organization_params
    params.require(:organization).permit(
      :name,
      :description,
      :pitch,
      :logo,
      :founded_on,
      :home_page,
      :is_active
    )
  end
end
