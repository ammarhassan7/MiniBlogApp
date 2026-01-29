class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    authorize! :create, @comment # Check permission

    if @comment.save
      redirect_to @post, notice: "Comment added!"
    else
      redirect_to @post, alert: "Comment could not be empty."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    # REPLACES MANUAL IF/ELSE CHECK
    authorize! :destroy, @comment

    @comment.destroy
    redirect_to post_path(@post), status: :see_other, notice: "Comment deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end