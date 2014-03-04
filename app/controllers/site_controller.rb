class SiteController < ApplicationController
  before_action :set_csrf_token_header, only: [ :index ]

  def index
  end

  def privacy
    render layout: 'layouts/blog'
  end

  def terms
    render layout: 'layouts/blog'
  end
end