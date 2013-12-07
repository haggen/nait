module AuthenticationHelper
  def authenticate
    if request.headers['HTTP_AUTHORIZATION']
      authenticate_with_http_basic do |email, password|
        authorize! User.authenticate(email, password)
      end
    end

    unless current_user
      respond_to do |format|
        format.html do
          redirect_to new_session_path(:next => request.path)
        end

        format.any do
          render :text => '', :status => :unauthorized
        end
      end
    end
  end

  def authorize!(user)
    session[:current_user] = user.id if user
  end

  def current_user
    @current_user ||= User.find_by :id => session[:current_user]
  end
end
