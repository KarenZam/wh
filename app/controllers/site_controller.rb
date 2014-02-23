class SiteController < ApplicationController
  before_action :set_csrf_token_header, only: [ :index ]

  def index
  end

  def privacy
  end

  def terms
  end
end