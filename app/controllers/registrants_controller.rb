class RegistrantsController < ApplicationController
  before_action :is_admin?
  before_action :get_registrant, except: [ :index, :new, :create ]

  def index
    @page_title = "Registrants"
    @registrants = Registrant.all
    @now = Time.now.gmtime
  end

  def destroy
    if @registrant.destroy
      flash[:notice] = "Registrant #{params[:id]} destroyed."
    else
      flash[:alert] = "Failed to destroy Registrant #{params[:id]}."
    end

    redirect_to registrants_url
  end

  private

  def get_registrant
    unless @registrant = Registrant.find( params[:id] )
      redirect_to registrants_url, alert: "Can't find Registrant #{params[:id]}."
    end
  end

  def registrant_params
    params.require(:registrant).permit( :email )
  end
end