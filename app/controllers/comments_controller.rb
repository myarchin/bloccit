class CommentsController < ApplicationController

  def new
    @post = Comment.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment added."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end