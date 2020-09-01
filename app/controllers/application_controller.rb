class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters
  
  def new
    @user = User.new
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_reading, :first_reading, :birthday])
  end
end
