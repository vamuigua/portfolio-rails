class CommentsController < ApplicationController
  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.create(params[:comment].permit(:content))
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1,2] #posts/1
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
