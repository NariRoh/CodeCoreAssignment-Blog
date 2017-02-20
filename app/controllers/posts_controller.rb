class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.order(created_at: :desc)
    @feature_post = Post.find 2
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to post_path(@post), notice: 'Post Created!'
    else
      render :new
      flash.now[:alert] = 'Please fix errors'
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
      flash.now[:alert] = 'Please fix errors'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    post_params = params.require(:post).permit(:title, :body, :category_id)
  end

  def find_post
    @post = Post.find params[:id]
  end

end
