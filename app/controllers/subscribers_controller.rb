class SubscribersController < ApplicationController
  def create
    subscriber = Subscriber.create(subscriber_params)
    render json: { message: "Thank you, #{subscriber.email}. Please look for a verification email." }
  end

  def destroy
    
  end

  private

  def subscriber_params
    params.require(:subscriber).permit :email, :is_startup
  end

end