class SiteController < ApplicationController
  before_action :set_csrf_token_header, only: [ :index ]

  def index
    @skip_footer = false
  end

  def privacy
  end

  def terms
  end
end