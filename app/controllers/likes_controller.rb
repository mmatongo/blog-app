class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = post.likes.new(user: current_user)

    respond_to do |format|
      format.html do
        if like.save
          redirect_to user_post_path(post.user.id, post.id), notice: 'You liked this post'
        else
          redirect_to user_post_path(post.user.id, post.id), alert: 'Failed to like this post'
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    post.user.delete(current_user)

    respond_to do |format|
      format.html do
        redirect_to user_post_path(post.user.id, post.id), notice: 'You unliked this post'
      end
    end
  end
end
