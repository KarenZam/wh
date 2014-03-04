class ArticlesController < ApplicationController
  before_action :is_admin?
  before_action :get_article, except: [ :index, :new, :create ]

  def index
    @page_title = "Articles"
    @articles = Article.all
  end

  def show
    @page_title = "Article"
  end

  def new
    @page_title = "Add a Article"
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.user = current_user
    article.save

    redirect_to article_url(article)
  end

  def edit
    @page_title = "Edit a Article"
  end

  def update
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article #{params[:id]} destroyed."
    else
      flash[:alert] = "Failed to destroy Article #{params[:id]}."
    end

    redirect_to articles_url
  end

  private

  def get_article
    unless @article = Article.find( params[:id] )
      redirect_to articles_url, alert: "Can't find Article #{params[:id]}."
    end
  end

  def article_params
    params.require(:article).permit(
      :title,
      :body,
      :is_archived
    )
  end
end
