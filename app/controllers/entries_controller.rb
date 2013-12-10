class EntriesController < ApplicationController
  include Resourced
  include Scopable

  before_action :authenticate

  scope :by_status, :default => true do |resource, _, _|
    resource.by_status
  end

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

  def create_entry_params
    params.require(:entry).permit(:title, :description, :estimate, :status_id).update(:author => current_user)
  end

  def update_entry_params
    params.require(:entry).permit(:title, :description, :estimate, :status_id)
  end
end
