module ProjectsHelper
  def current_project
    @current_project ||= Project.where(:id => params[:project_id]).first
  end

  def current_project_path
    project_path current_project
  end

  def edit_current_project_path
    edit_project_path current_project
  end

  def manager_html_options
    User.all
  end
end
