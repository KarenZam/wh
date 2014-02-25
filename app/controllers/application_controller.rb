class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  before_filter :make_action_mailer_use_request_host_and_protocol

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_authenticated?
    redirect_to login_url unless current_user
  end

  def is_admin?
    current_user and @current_user.is_admin
  end

  def is_startup?
    current_user and @current_user.is_startup
  end

  def is_talent?
    current_user and not @current_user.is_startup
  end

  protected

  def m(md)
    require 'rdiscount'
    RDiscount.new(md).to_html.html_safe
  end

  def set_csrf_token_header
    response.headers['X-CSRF-Token'] = form_authenticity_token
  end

  private

  def make_action_mailer_use_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
