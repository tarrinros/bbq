class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    # .for method was changed by the .permit method for devise version >= 4
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end

  def current_user_can_edit?(event)
    user_signed_in? && event.user == current_user
  end
end
