class SubscriptionsController < ApplicationController

  def new
    if subscriber = Subscriber.find_by_code(params[:code])
      subscriber.code = nil
      subscriber.expires_at = nil

      if subscriber.save
        Notifier.subscriber_validated(subscriber).deliver
        render "new"
        return
      end
    end

    redirect_to root_url, alert: "Sorry, your code has expired. Please re-submit your email.", flash: { code_expired: true }
  end

  def create
    registrant = Registrant.create(subscription_params)

    if registrant.valid?
      unless Notifier.registration_request(registrant).deliver
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
    params.require(:user).permit( :email, :user_category )
  end
end