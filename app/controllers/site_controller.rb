class SiteController < ApplicationController
  before_action :set_csrf_token_header, only: [ :index ]

  def index
    render layout: 'layouts/home'
  end

  def privacy
  end

  def terms
  end
end