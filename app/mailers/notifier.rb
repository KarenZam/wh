class Notifier < ActionMailer::Base
  default from: "W Hub Administrator <whub.hk@gmail.com>"

  @@ADMIN_EMAIL = "charles.munat@gmail.com" # "whub.hk@gmail.com"

  def subscription_request(subscriber)
    @subscriber = subscriber

    mail to: @subscriber.email, subject: "[W Hub] Please confirm your subscription"
  end

  def subscription_validated(subscriber)
    @subscriber = subscriber

    mail to: @@ADMIN_EMAIL, subject: "[W Hub] New subscriber!"
  end

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

  def contact(contact, markdown)
    @contact = contact
    @markdown = markdown

    mail to: @@ADMIN_EMAIL, subject: @contact.subject
  end

  def contact_reply(contact)
    @contact = contact

    mail to: @contact.email, subject: "[W Hub] Thank you for contacting us"
  end
end