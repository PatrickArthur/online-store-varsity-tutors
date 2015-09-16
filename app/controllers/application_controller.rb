class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?



  def after_sign_in_path_for(user)
    user.present? ? products_path : new_user_path
  end

  layout Proc.new { |controller| controller.devise_controller? ? 'devise' : 'application' }


  protected

   def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end
end
