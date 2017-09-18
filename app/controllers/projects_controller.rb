class ProjectsController < ApplicationController

  before_action :find_project, only:[:show]
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @projects = Project.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
  end

  def show
  end

  private

  def project_params
    params.require(:project).permit(:title,:description,:link,:slug)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
