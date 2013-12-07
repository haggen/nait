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

  %w(comment entry log membership status).each do |name|
    define_method "current_project_#{name}_path" do |resource|
      url_for [current_project, resource]
    end

    define_method "current_project_#{name.pluralize}_path" do
      url_for [current_project, name.pluralize]
    end

    define_method "new_current_project_#{name}_path" do
      url_for [:new, current_project, name]
    end

    define_method "edit_current_project_#{name}_path" do |resource|
      url_for [:edit, current_project, resource]
    end
  end
end
