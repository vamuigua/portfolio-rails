class Admin::ProjectsController < AdminController
  before_action :find_project, only:[:show,:edit,:update,:destroy]

  def index
    @projects = Project.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
  end

  def new
    #create a new project in the form
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_path(@project), notice:"Project was successfully saved!"
    else
      render 'new',alert:"Unable to save your project."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice:"Project was successfully saved!"
    else
      render 'edit', alert:"Unable to save your project."
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path,alert:"Successfully deleted project"
  end

  private

  def project_params
    params.require(:project).permit(:title,:description,:link,:projectimage,:slug)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
