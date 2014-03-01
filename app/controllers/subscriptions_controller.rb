class SubscriptionsController < ApplicationController

  def new
    @code = params[:code]

    render "new", layout: false
  end

  def create
    registrant = Registrant.create(subscription_params)

    if registrant.valid?
      if Notifier.registration_request(registrant).deliver
        render json: {
          message: "Thank you, #{registrant.email}. We'll be in touch.",
          valid: true
        }
      else
        render json: {
          message: "There was a problem sending a validation email. Please try again later.",
          valid: false
        }
      end
    else
      render json: {
        message: "Sorry, but we had some trouble registering '#{registrant.email}'. Is it a valid email address?",
        valid: false
      }
    end
  end

  private

  def subscription_params
    params.require(:user).permit( :email, :is_startup )
  end
end