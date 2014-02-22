class SubscriberValidator < ActionMailer::Base
  default from: "W Hub Administrator <admin@whub.hk>"

  def validate(subscriber)
    @subscriber = subscriber

    mail to: @subscriber.email, subject: "[W Hub] Please validate your subscription"
  end
end