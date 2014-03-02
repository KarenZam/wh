class ContactsController < ApplicationController
  before_action :is_admin?
  before_action :get_contact, only: [ :show, :destroy ]

  def index
    @page_title = "Contacts"
    @contacts = Contact.all
  end

  def show
    @page_title = "Contact"
    @markdown = m(@contact.message)
  end

  def create
    contact = Contact.new(contact_params)
    contact.user = User.find_by(email: contact.email)

    if contact.save
      if Notifier.contact(contact, m(contact.message)).deliver
        Notifier.contact_reply(contact).deliver
        render json: { message: "", valid: true }
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

    redirect_to contacts_url
  end

  private

  def get_contact
    unless @contact = Contact.find( params[:id] )
      redirect_to contacts_url, alert: "Contact #{params[:id]} not found."
    end
  end

  def contact_params
    params.require(:contact).permit( :email, :subject, :message )
  end
end