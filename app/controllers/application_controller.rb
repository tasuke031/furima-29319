class ApplicationController < ActionController::Base
  
  def new
    @user = User.new
  end

  def create(configure_permitted_parameters)
    @user.valid?
    if @user.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_reading, :first_reading, :birthday])
  end
end
