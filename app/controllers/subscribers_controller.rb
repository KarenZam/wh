class SubscribersController < ApplicationController
  before_action :is_admin?
  before_action :get_subscriber, except: [ :index ]

  def index
    @page_title = "Subscribers"
    @subscribers = Subscriber.all
    @now = Time.now.gmtime
  end

  def destroy
    if @subscriber.destroy
      flash[:notice] = "Subscriber #{params[:id]} destroyed."
    else
      flash[:alert] = "Failed to destroy Subscriber #{params[:id]}."
    end

    redirect_to subscribers_url
  end

  private

  def get_subscriber
    unless @subscriber = Subscriber.find( params[:id] )
      redirect_to subscribers_url, alert: "Can't find Subscriber #{params[:id]}."
    end
  end

  def subscriber_params
    params.require(:subscriber).permit( :email )
  end
end