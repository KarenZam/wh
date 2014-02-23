class MessagesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    message = Message.create(message_params)

    if message.valid?
      if Notifier.contact(message).deliver
        Notifier.contact_reply(message).deliver
        render json: {
          message: "Thank you, #{message.email}. We'll be in touch soon.",
          valid: true
        }
      else
        render json: {
          message: "Sorry, there was an error sending your message. Please try again later.",
          valid: false
        }
      end
    else
      render json: {
        message: "Sorry! " + message.errors.messages.map {|k,v| "#{k.to_s} #{v.join(', ')}"}.join('; ').humanize,
        valid: false
      }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit( :email, :subject, :body )
  end
end