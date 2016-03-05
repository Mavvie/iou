class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  respond_to :html
  rescue_from CanCan::AccessDenied do
    flash[:danger] = 'You are not authorized to view this page'
    redirect_to root_path
  end
  layout :layout_by_resource

protected
  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
