class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been added to the historical record."
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment])
      flash[:notice] = "Reply replaced."
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:alert] = "Reply erased."
    redirect_to post_path(@comment.post)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
