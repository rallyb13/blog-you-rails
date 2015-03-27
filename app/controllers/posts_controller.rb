class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = @post.name + " has been successfully saved. Your words are out in the world."
      redirect_to posts_path
    else
      flash[:alert] = "Failure. Not posted. No one can hear you. Nobody cares."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = @post.name + " entry updated. Thank you for caring enough to edit."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Oh no! It's all gone wrong again."
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Trogdor has burninated your post."
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:name, :content)
    end

end
