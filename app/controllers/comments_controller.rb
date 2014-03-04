class CommentsController < ApplicationController

  def create
    if article = Article.find( params[:article_id] )
      comment = Comment.new( comment_params )
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(
      :message,
      :reply_to
    )
  end
end