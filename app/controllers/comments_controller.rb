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

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
