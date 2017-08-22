class PostsController < ApplicationController
  before_action :find_post, only:[:show]
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @posts = Post.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
