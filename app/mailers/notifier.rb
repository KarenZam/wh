class Notifier < ActionMailer::Base
  default from: "W Hub Administrator <whub.hk@gmail.com>"

  def password_reset_request(user)
    @user = user

    mail to: @user.email, subject: "[W Hub] Reset your credentials"
  end

  def password_reset(user)
    @user = user

    mail to: @user.email, subject: "[W Hub] Your password was reset"
  end

  def registration_request(registrant)
    @registrant = registrant

    mail to: @registrant.email, subject: "[W Hub] Please confirm your registration"
  end

  def registration(user)
    @user = user

    mail to: @user.email, subject: "[W Hub] Thank you for registering"
  end

  def contact(message, markdown)
    @message = message
    @markdown = markdown

    mail to: "whub.hk@gmail.com", subject: @message.subject
  end

  def contact_reply(message)
    @message = message

    mail to: @message.email, subject: "[W Hub] Thank you for contacting us"
  end
end