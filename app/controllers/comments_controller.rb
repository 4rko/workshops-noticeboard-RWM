class CommentsController < ApplicationController
  before_filter :get_post
  before_filter :authenticate_user!, only: [:new, :create]

  respond_to :html, :js

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.new(params[:comment])
    flash.notice = 'Comment added :-)' if @comment.save
  end

private
  def get_post
    @post = Post.find(params[:post_id])
  end
end
