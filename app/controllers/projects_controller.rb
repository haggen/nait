class ProjectsController < ApplicationController
  include Resourced
  include Scopable

  before_action :authenticate

  scope :by_user, :default => true do |_, _, controller|
    controller.current_user.projects
  end

  def index
    fetch_resource
    respond_with_resource
  end

  def show
    fetch_resource
    @current_project = @project
    respond_with_resource
  end

  def new
    new_resource
    @project.members.push current_user
    respond_with_resource
  end

  def edit
    fetch_resource
    respond_with_resource
  end

  def create
    new_resource
    @project.members.push current_user
    @project.statuses.new(:name => 'Todo', :color => 'blue', :sort => 1)
    @project.statuses.new(:name => 'Doing', :color => 'yellow', :sort => 2)
    @project.statuses.new(:name => 'Done', :color => 'green', :closing => true, :sort => 3)
    flash_notice :create if save_resource
    respond_with_resource
  end

  def update
    fetch_resource
    flash_notice :update if save_resource
    respond_with_resource
  end

  def destroy
    fetch_resource
    flash_notice :destroy if destroy_resource
    respond_with_resource
  end

  def comments
    @project = Project.find(params[:project_id])
    @comments = @project.comments
    respond_with_resource
  end

  protected

  def project_params
    params.require(:project).permit(:name, :manager_id, :options)
  end
end
