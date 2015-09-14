class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been successfuly created."
      redirect_to @project
    else
      render :new
    end
  end

  def show
    flash.now[:error] = "Project has some invalid elements"
  end

  def edit
    end

  def update

    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.delete
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    def project_params
      params.require(:project).permit(:name, :technologies_used)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
