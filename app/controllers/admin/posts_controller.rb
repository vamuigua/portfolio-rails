class Admin::PostsController < AdminController
	before_action :find_post, only:[:show,:edit,:update,:destroy]

	def index
    @posts = Post.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
  end

  def new
    #create a new post in the form
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice:"Article was successfully saved!"
    else
      render 'new',alert:"Unable to save your post."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice:"Article was successfully saved!"
    else
      render 'edit', alert:"Unable to save your article."
    end
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path,alert:"Successfully deleted post"
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:postimage,:slug)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end