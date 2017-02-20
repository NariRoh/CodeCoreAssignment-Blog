class CommentsController < ApplicationController

  def create
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @post = Post.find params[:post_id]
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment Created!'
    else
      flash[:alert] = 'Please fix your errors'
      render '/posts/show'
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_path(@comment.post_id), notice: 'Review deleted!'
  end

end
