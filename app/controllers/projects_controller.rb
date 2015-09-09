class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project has been successfuly created."
      redirect_to @project
    else
      render :new
    end
  end

  def show
    flash.now[:error] = "Project has some invalid elements"
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project).permit(:name, :technologies_used)
    end
end
