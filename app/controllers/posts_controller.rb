class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @new_posts = Post.all
    @author = Author.first
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render new_post_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render edit_path(@post)
    end

  end

  def destroy
    @post.delete
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
