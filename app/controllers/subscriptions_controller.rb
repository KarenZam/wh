class SubscriptionsController < ApplicationController

  def new
    if registrant = Registrant.find_by_code(params[:code])
      user = User.new email: registrant.email, user_category: registrant.user_category

      if user.save
        registrant.destroy
        Notifier.registration(user).deliver
        render "new", layout: false
        return
      end
    end

    redirect_to root_url, alert: "Sorry, your code has expired. Please re-submit your email.", flash: { code_expired: true }
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
    params.require(:user).permit( :email, :user_category )
  end
end