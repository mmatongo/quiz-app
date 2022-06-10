class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  # after sign in, redirect to the quizzes page
  def after_sign_in_path_for(resource)
    quizzes_path
  end


  protected
    
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
