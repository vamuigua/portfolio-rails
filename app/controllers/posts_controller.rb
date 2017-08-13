class PostsController < ApplicationController

	def index
	end

	def new
		#create a new post in the form
		@posts = Post.new
	end

	def create
		@posts = Post.new(post_params)

		if @post.save
			redirect_to @post, notice:"Article was successfully saved!"
		else
			render 'new',notice:"Unable to save your post."
		end
	end

	private

	def post_params
		params.require(:post).permit(:title,:content)
	end
end
