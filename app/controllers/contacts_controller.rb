class ContactsController < ApplicationController
  before_action :is_admin?
  before_action :get_contact, only: [ :show, :destroy ]

  def index
    @contacts = Contact.all
  end

  def show
    @markdown = m(@contact.message)
  end

  def create
    contact = Contact.create(contact_params)

    if contact.valid?
      contact.user = User.find_by(email: contact.email)

      if Notifier.contact(contact, m(contact.message)).deliver
        Notifier.contact_reply(contact).deliver
      else
        render json: {
          contact: "Sorry, there was an error sending your contact. Please try again later.",
          valid: false
        }
      end
    else
      render json: {
        contact: "Sorry! " + contact.errors.contacts.map {|k,v| "#{k.to_s} #{v.join(', ')}"}.join('; ').humanize,
        valid: false
      }
    end
  end

  def destroy
    if @contact.destroy
      flash[:notice] = "Contact #{params[:id]} destroyed."
    else
      flash[:alert] = "Failed to destroy Contact #{params[:id]}."
    end

    redirect_to "index"
  end

  private

  def get_contact
    redirect_to( "index", alert: "Contact #{params[:id]} not found." ) unless @contact = Contact.find( params[:id] )
  end

  def contact_params
    params.require(:contact).permit( :email, :subject, :message )
  end
end