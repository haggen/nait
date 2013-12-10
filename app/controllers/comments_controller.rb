class CommentsController < ApplicationController
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

  def commentable_name
    name = request.path.split('/comments')[0].split('/')[-2]
    name ? name.singularize : nil
  end

  def commentable
    commentable_name && commentable_name.classify.constantize
  end

  def commentable_id
    params["#{commentable_name}_id"]
  end

  def parent_resource
    commentable && commentable.find(commentable_id)
  end

  def response_location
    next_path
  end

  def create_comment_params
    params.require(:comment).permit(:content).update(:author => current_user)
  end

  def update_comment_params
    params.require(:comment).permit(:content)
  end

  def flash_params
    {:name => resource.model_name.human}
  end
end
