class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: :create

  def index
    @liked_posts = current_user.liked_posts
  end

  def create
    like = Like.new user: current_user, post: @post

    if cannot? :like, @post
      redirect_to @post, alert: 'Can\'t like your own post!'
    elsif like.save
      redirect_to @post, notice: 'Liked this post 💖'
    else
      redirect_to @post, alert: like.errors.full_messages.join(', ')
    end
  end

  def destroy
    like = Like.find params[:id]

    if like.destroy
      redirect_to post_path(like.post), notice: 'Unliked this post 💔'
    else
      redirect_to post_path(like.post), alert: like.errors.full_messages.join(', ')
    end
  end

  private

  def find_post
    @post ||= Post.find params[:post_id]
  end

end
