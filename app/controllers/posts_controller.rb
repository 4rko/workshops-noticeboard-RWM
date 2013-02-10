class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @tags = Post.tag_counts_on(:tags) # metoda z ActsAsTaggableOn; ... i policzy ilosc wystapien
    @posts = if params[:tag] # :tag to klucz podany w widoku index
      Post.tagged_with(params[:tag])
    else
      Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(params[:post])
    @post = current_user.posts.build(params[:post])
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end
end
