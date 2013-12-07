class StatusesController < ApplicationController
  include Resourced
  include Scopable

  before_action :authenticate

  def index
    fetch_resource
    respond_with_resource
  end

  def show
    fetch_resource
    respond_with_resource
  end

  def new
    new_resource
    respond_with_resource
  end

  def edit
    fetch_resource
    respond_with_resource
  end

  def create
    new_resource
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

  protected

  def parent_resource
    current_project
  end
  
  def status_params
    params.require(:status).permit(:name, :color, :closing)
  end
end
