class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], user: current_user)

    respond_to do |format|
      format.html do
        if comment.save
          redirect_to post_path(post), notice: 'Comment was successfully created.'
        else
          flash[:alert] = 'Failed to add comment!'
          redirect_to post_path(post)
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
