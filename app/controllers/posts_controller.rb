class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = @post.name + " has been successfully saved. Your words are out in the world."
      redirect_to posts_path
    else
      flash[:alert] = "Failure. Not posted. No one can hear you. Nobody cares."
      render :new
    end
  end

end
