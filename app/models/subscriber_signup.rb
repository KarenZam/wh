class UserRegistration
  SUBSCRIPTION_MESSAGE = %{
    An email with instructions for completing your registration
    has been sent to you. }.squish

  def initialize(request)
    @request = request
  end

end