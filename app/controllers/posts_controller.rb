class PostsController < ApplicationController

  before_action :find_post, only:[:show,:edit,:update,:destroy]

  def index
  end

  def new
    #create a new post in the form
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice:"Article was successfully saved!"
    else
      render 'new',notice:"Unable to save your post."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice:"Article was successfully saved!"
    else
      render 'edit', notice:"Unable to save your article."
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
